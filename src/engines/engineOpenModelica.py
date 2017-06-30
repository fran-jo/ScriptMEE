'''
Created on 5 apr 2014

@author: fragom
'''

from classes import CommandOMC
# from classes import OutVariableStream as outvar
from inout.StreamH5File import OutputH5Stream
import matplotlib.pyplot as plt

class EngineOMC(object):
    
    def __init__(self, sources= None, experiment= None, omcConnection= None):
        ''' Loading simulations resources. Parameters related to models to be simulated and libraries'''
        self.__sources= sources
        ''' Loading configuration values for the simulator solver '''
        self.__experiment= experiment
        self.__omcSession= omcConnection
#         ''' Loading output variables of the model, their values will be stored in h5 and plotted '''
#         self.outputs= outvar.OutVariableStream(sys.argv[3])
        
    def simulate(self):
        objCOMC= CommandOMC()
        '''Load Modelica library'''
        self.__omcSession.execute("loadModel(Modelica)")
        command= objCOMC.loadFile(self.__sources.libraryFile)
        print '1) Command', command
        self.__omcSession.execute(command)
        '''loading the model we want to simulate'''
        command= objCOMC.loadFile(self.__sources.modelFile)
        print '2) Command', command
        # here, show the list of parameters we can modify, (variability= parameter)
        print self.__sources.modelName 
        success= self.__omcSession.execute(command)
        result= None
        if (success):
            #command= objCOMC.simulate(self.moModel, self.simOptions, 'vf1=0.1,pm1=0.001')
            command= objCOMC.simulate(self.__experiment.modelName, self.__experiment, False)
            print '3) Command', command
            result= self.__omcSession.execute(command)
            print '4) Result', result
        # TODO: Handle when simulation fails, no result file
#         inMemoryResultFile= OMPython.get(result, 'SimulationResults.resultFile')
#         print '5) Result file ', inMemoryResultFile
#         resultfile= objCOMC.saveResult(inMemoryResultFile, self.outPath)
            print '5) Simulation Results', result['SimulationResults']
            simulationResults= result['SimulationResults']
            print '6) Result file', simulationResults['resultFile']
        # TODO: visualization of the resulting variables, selection and plot
            resultfile= objCOMC.saveResult(simulationResults['resultFile'], self.__sources.outputFolder)
#         toc= timeit.default_timer()
#         print 'Simulation time ', toc- tic
        # TODO: study the units of elapsed time 
        else:
            print ("Failed to load resources!")
        return resultfile
    
    def saveOutputs(self, _resultfile):
        '''
        TODO: This has to change, after using ModelicaRes
        build file path with outputpath, using the ModelicaRes to read the .mat file 
        The structure of the saving format takes into account format measurements from PMU, form v/i, anglev/anglei 
        '''
        resultmat= self.__sources.outputFolder+ '/'+ _resultfile
        h5Name=  self.__sources.modelName+ '_&'+ 'openmodelica'+ '.h5'
        resulth5= self.__sources.outputFolder+ '/'+ h5Name
        # create .h5 for writing
        h5pmu= OutputH5Stream([self.__sources.outputFolder,resulth5,resultmat], 'openmodelica')
        h5pmu.open_h5(h5Name)    
        '''This loop to store output signals, for analysis and plotting, into memory'''
        for meas, signalname in self.outputs.get_varList():
            modelSignal= signalname.split(',')
            nameComponent= meas.split('.')[0]
#             nameMeasurement= meas.split('.')[1]
            if len(modelSignal)> 1:
                h5pmu.set_senyalRect(meas, modelSignal[0], modelSignal[1])
            else:
                h5pmu.set_senyalRect(meas, modelSignal[0], [])
            h5pmu.save_h5Names(nameComponent, meas) 
            h5pmu.save_h5Values(nameComponent) 
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
        ''' TODO: This has to change, after using ModelicaRes'''
        values= self.selectData(self.outputs.get_varNames())
        plt.figure(1)
        for meas in values: 
            lasenyal= _h5data.get_senyal(meas) 
            plt.plot(lasenyal.sampletime, lasenyal.magnitude)
        plt.legend(values)
        plt.ylabel(lasenyal.component)
        plt.xlabel('Time (s)')
        plt.grid(b=True, which='both')
        plt.show()
