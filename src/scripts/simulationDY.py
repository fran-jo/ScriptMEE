'''
Created on 4 apr 2014

@author: fragom
'''
import os, sys, timeit
from classes.SimulatorDY import SimulatorDY
import classes.SimulationConfigDY as simconfig
from buildingspy.io.outputfile import Reader
import classes.SimulationResources as simsource
import matplotlib.pyplot as plt
from classes.StreamH5File import OutputH5Stream
from classes.OutputModelVar import OutputModelVar

class Simulation():
    
    def __init__(self, argv):
        ''' sys.argv is array of parameters 
        sys.argv[1]: file with simulation resources, a.k.a. model file, library file, output folder 
        sys.argv[2]: file with configuration of the simulator compiler
        sys.argv[3]: file containing the name of outputs of the model to be saved in h5 and plotted
        '''
        ''' Loading simulations resources. Parameters related to models to be simulated and libraries'''
        self.sources= simsource.SimulationResources(sys.argv[1])
        ''' Loading configuration values for the simulator solver '''
        self.config= simconfig.SimulationConfigDY(sys.argv[2])
        ''' Loading output variables of the model, their values will be stored in h5 and plotted '''
        self.outputs= OutputModelVar(sys.argv[3])
        
    def loadSources(self):
        self.moPath= self.sources.getModelPath()
        self.moFile= self.sources.getModelFile()
        self.libPath= self.sources.getLibraryPath()
        self.moModel= self.sources.getModelName()
        self.outPath= self.sources.getOutputPath()
        self.outputs.load_varList()
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
        '''TODO: Store simulations results into h5 file '''
        resultmat= self.moModel.split('.')[-1]
    #     print 'resultFile:', resultFile
        resultmat+= '.mat'
        os.chdir(self.outPath)
        resulth5= self.outPath+ '/'+ 'SimulationOutputs.h5'
    #     print 'os.getcwd():', os.getcwd()
#         output= Reader(resultFile, "dymola")
#         ''' TODO: parametrizar las variables que queremos guardar, OutputModelVar '''
#         varNames= output.varNames('bus*.v')
        h5pmu= OutputH5Stream('dymola', [self.outPath, resulth5, resultmat])
        h5pmu.open_h5()    
        for meas, name in self.outputs.get_varList():
            modelSignal= name.split(',')
            nameComponent= meas.split('.')[0]
            nameMeasurement= meas.split('.')[1]
            if len(modelSignal)> 1:
                h5pmu.set_senyalRect(meas, modelSignal[0], modelSignal[1])
            else:
                h5pmu.set_senyalRect(meas, modelSignal[0], [])
            h5pmu.save_h5(nameComponent, nameMeasurement) 
        h5pmu.close_h5()
        ''' object h5 file with result data'''
        return h5pmu
    
    def plotOutputs(self, _h5data):
        count= 0
        indexMapping={}
        for i, meas in enumerate(self.outputs.get_varNames()):
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
            values.append(self.outputs.get_varNames()[indexMapping[idx]])
        
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