'''
Created on 4 apr 2014

@author: fragom
'''
import os, sys, timeit

from classes import OutVariableStream as outvar
import inout.SimulationResources as simsource 
import inout.SimulationConfigDY as simconfig  
from classes.SimulatorDY import SimulatorDY 
from inout.StreamH5File import OutputH5Stream 
import matplotlib.pyplot as plt


class Simulation():
    
    def __init__(self, argv):
        ''' sys.argv is array of parameters 
        sys.argv[1]: file with simulation resources, a.k.a. model file, library file, output folder 
        sys.argv[2]: file with configuration of the simulator compiler
        sys.argv[3]: file containing the name of outputs of the model to be saved in h5 and plotted
        '''
        ''' Loading simulations resources. Parameters related to models to be simulated and libraries'''
        self.sources= simsource.SimulationResources([sys.argv[1],'r'])
        ''' Loading configuration values for the simulator solver '''
        self.config= simconfig.SimulationConfigDY(sys.argv[2])
        ''' Loading output variables of the model, their values will be stored in h5 and plotted '''
        self.outputs= outvar.OutVariableStream(sys.argv[3])
        
    def loadSources(self):
        self.sources.load_Properties()
        self.moPath= self.sources.get_modelPath()
        self.moFile= self.sources.get_modelFile()
        self.libPath= self.sources.get_libraryPath()
        self.libFile= self.sources.get_libraryFile()
        self.moModel= self.sources.get_modelName()
        self.outPath= self.sources.get_outputPath()
        self.outputs.load_varList()
        print self.outputs.get_varList()
        print self.outputs.get_varNames()
        print '1'
        self.simOptions= self.config.setSimOptions()
        
    def simulate(self):
        ''' TODO: LOG all command dymola '''
        tic= timeit.default_timer()
        ''' add library path to MODELICAPATH, to recognize folder where library is available '''
        os.environ["MODELICAPATH"] = self.libPath
        ''' Change path to model folder '''
        os.chdir(self.moPath)
        
        s= SimulatorDY([self.moModel, self.moFile, self.moPath, self.outPath])
    #     s.showGUI(True)
    #     s.exitSimulator(False)
    #     s.addParameters({'vf1': 0.2, 'pm1': 0.02})
        s.setStopTime(self.config.getStopTime())
        ''' setTimeOut kill the process if it does not finish in specific time'''
        s.setTimeOut(self.config.getTimeOut())
        s.setSolver(self.config.getMethod())
        s.showProgressBar(False)
    #     s.printModelAndTime()
        s.simulate()
        toc= timeit.default_timer()
        print 'Simulation time ', toc- tic
        '''TODO: study the units of elapsed time '''
    
    def saveOutputs(self):
        resultmat= self.moModel.split('.')[-1]
        resultmat+= '.mat'
        os.chdir(self.outPath)
        h5Name=  self.moModel+ '_&'+ 'dymola'+ '.h5'
        resulth5= self.outPath+ '/'+ h5Name
        h5pmu= OutputH5Stream([self.outPath, resulth5, resultmat], 'dymola')
        h5pmu.open_h5(self.moModel)   
        ''' Saving variables thinking with measurements from PMU, form v/i, anglev/anglev ''' 
        for compo, signal_names in self.outputs.get_varList():
            l_signals= signal_names.split(',')
            h5pmu.set_senyalRect(compo, l_signals[0], l_signals[1])
            print h5pmu.get_senyal(compo).get_sampleTime()
            h5pmu.save_h5Names(compo, l_signals) 
            h5pmu.save_h5Values(compo, 'null') 
        h5pmu.close_h5()
        ''' object h5 file with result data'''
        return h5pmu
    
    def selectData(self, arrayQualquiera):
        count= 0
        indexMapping={}
        for i, meas in enumerate(arrayQualquiera):
            print '[%d] %s' % (i, meas)
            indexMapping[count]= i
            count+= 1
        try:
            value= raw_input("Select which variable do you want to plot: ")
            lindex = value.split()
        except ValueError:
            print "Mal! Mal! Mal! Verdadera mal! Por no decir borchenoso!" 
        values= []
        for idx in lindex:  
            idx= int(idx)
            values.append(arrayQualquiera[indexMapping[idx]])
        return values
            
    def plotOutputs(self, _h5data):
        values= self.selectData(self.outputs.get_varNames())
        plt.figure(1)
        for meas in values: 
            lasenyal= _h5data.get_senyal(meas) 
            plt.plot(lasenyal.get_sampleTime(), lasenyal.get_signalReal())
        plt.legend(values)
        plt.ylabel(lasenyal.component)
        plt.xlabel('Time (s)')
        plt.grid(b=True, which='both')
        plt.show()
#         (time1, y1) = _h5data.values("pwLine4.n.vr")
#         fig = plt.figure()
#     #     ax = fig.add_subplot(211)
#         ax = fig.add_subplot(111, axisbg='w')
#         
#         ax.plot(time1/3600, y1, 'r', label='$y_1$')
#         ax.set_xlabel('time [s]')
#         ax.set_ylabel('Voltage [$^\circ$C]')
#     #     ax.set_xticks(range(25))
#     #     ax.set_xlim([0, 24])
#         ax.legend()
#         ax.grid(True)
#         plt.show()

def main(argv):
    simCity= Simulation(argv)
    simCity.loadSources()
    simCity.simulate()
    h5data= simCity.saveOutputs()
    simCity.plotOutputs(h5data)
    
if __name__ == '__main__':
    main(sys.argv[1:])