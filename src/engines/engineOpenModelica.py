'''
Created on 5 apr 2014

@author: fragom
'''

from utilsmee import CommandOMC
from OMPython import OMCSession

# from classes import OutVariableStream as outvar

class EngineOMC(object):
    
    def __init__(self, sources= None, experiment= None, results= None):
        ''' Loading simulations resources. Parameters related to models to be simulated and libraries'''
        self.__sources= sources
        ''' Loading configuration values for the simulator solver '''
        self.__experiment= experiment
        self.__results= results
        self.__omcSession= OMCSession()
#         ''' Loading output variables of the model, their values will be stored in h5 and plotted '''
#         self.outputs= outvar.OutVariableStream(sys.argv[3])
        
    @property
    def omcSession(self):
        return self.__omcSession
    @omcSession.setter
    def omcSession(self, valor):
        self.__omcSession= valor;
        
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
            self.__results= result['SimulationResults']
            print '6) Result file', self.__results['resultFile']
        else:
            print ("Failed to load resources!")
