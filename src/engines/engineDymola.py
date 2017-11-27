'''
Created on 4 apr 2014

@author: fragom
'''
import os, sys
import datetime, subprocess, time
 
from classes.SimulatorDY import SimulatorDY 
from modelicares.simres import SimRes

class EngineDY(object):
    __experiment= {}
    
    def __init__(self, sources= None, config= None):
        ''' Loading simulations resources. Parameters related to models to be simulated and libraries'''
        self.__sources= sources
        ''' Loading configuration values for the simulator solver '''
        self.__configuration= config
#         ''' Loading output variables of the model, their values will be stored in h5 and plotted '''
#         self.outputs= outvar.OutVariableStream(sys.argv[3])
        
    @property
    def startTime(self):
        return self.__experiment["startTime"].rstrip('\n')
    @startTime.setter
    def startTime(self, value):
        self.__experiment["startTime"]= value.rstrip('\n') if '\n' in value else value
        
    @property
    def stopTime(self):
        return self.__experiment["stopTime"].rstrip('\n')
    @stopTime.setter
    def stopTime(self, value):
        self.__experiment["stopTime"]= value.rstrip('\n') if '\n' in value else value
        
    @property
    def solver(self):
        return self.__experiment["solver"].rstrip('\n')
    @solver.setter
    def solver(self, value):
        self.__experiment["solver"]= value.rstrip('\n') if '\n' in value else value
        
    @property
    def tolerance(self):
        return self.__experiment["tolerance"].rstrip('\n')
    @tolerance.setter
    def tolerance(self, value):
        self.__experiment["tolerance"]= value.rstrip('\n') if '\n' in value else value
        
    @property
    def numberOfIntervals(self):
        return self.__experiment["numberOfIntervals"].rstrip('\n')
    @numberOfIntervals.setter
    def numberOfIntervals(self, value):
        self.__experiment["numberOfIntervals"]= value.rstrip('\n') if '\n' in value else value
        
    @property
    def resultFile(self):
        return self.__experiment["resultFile"].rstrip('\n')
    @resultFile.setter
    def resultFile(self, value):
        self.__experiment["resultFile"]= value.rstrip('\n') if '\n' in value else value
        
    @property
    def timeout(self):
        return self.__experiment["timeout"].rstrip('\n')
    @timeout.setter
    def timeout(self, value):
        self.__experiment["timeout"]= value.rstrip('\n') if '\n' in value else value
        
    def updateModelicaPath(self, sources, linearlibPath= ''):
        os.environ["MODELICAPATH"]= sources.modelFolder
        for carpeta in os.walk(sources.modelFolder):
            os.environ["MODELICAPATH"] += os.pathsep + str(carpeta[0]) 
        os.environ["MODELICAPATH"]+= os.pathsep + sources.libraryFolder
        if linearlibPath!= '':
            os.environ["MODELICAPATH"]+= os.pathsep+ linearlibPath
        print os.environ["MODELICAPATH"]
    
    def updateSolverConfiguration(self, solverConfig):
        self.__configuration= solverConfig
    
    def simulate(self):
#         tic= timeit.default_timer()
        os.chdir(self.__sources.modelFolder)
        
        s= SimulatorDY([self.__sources.modelName, self.__sources.modelFile,
                        self.__sources.libraryFolder+ '/'+ self.__sources.libraryFile, 
                        self.__sources.modelFolder, self.__sources.outputFolder])
    #     s.showGUI(True)
    #     s.exitSimulator(False)
    #     s.addParameters({'vf1': 0.2, 'pm1': 0.02})
        s.setStopTime(self.__configuration.stopTime)
        s.setNumberOfIntervals(self.__configuration.numberOfIntervals)
        s.setTolerance(self.__configuration.tolerance)
        ''' setTimeOut kill the process if it does not finish in specific time'''
        s.setTimeOut('60')
        s.setSolver(self.__configuration.method)
        s.showProgressBar(False)
    #     s.printModelAndTime()
        s.simulate()
#         print os.getcwd()
        os.chdir(self.__sources.outputFolder)
        outputFile= self.__sources.modelName+'.mat'
        try:
            if os.path.exists(outputFile):
                self.__experiment["resultFile"]= outputFile
        except OSError as e:
            print "Result file not found '" + outputFile + "' : " + e.strerror
        
#         toc= timeit.default_timer()
#         print 'Simulation time ', toc- tic

#     def simulate_MoRes(self):
#         """ create modelica script """
#         runScriptName = self.__sources.modelFolder+ '/run.mos'
#         extra_lib= self.__sources.libraryFolder+ '/'+ self.__sources.libraryFile
#         with dymola_script(runScriptName, working_dir=self.__sources.modelFolder,
#                            packages=[self.__sources.modelFile,self.__sources.libraryFolder]) as simulator:
#             simulator.startTime= self.__experiment["startTime"]
#             simulator.stopTime = self.__experiment["stopTime"]
#             simulator.numberOfIntervals= self.__experiment["numberOfIntervals"]
#             simulator.method= self.__experiment["solver"]
#             simulator.tolerance= self.__experiment["tolerance"]
#             simulator.resultFile= self.__experiment["resultFile"]
#             simulator.run(self.__sources.modelName)
#         result= SimRes(self.__sources.modelName+'.mat')
#         return result

    def linearize(self):
        os.chdir(self.__sources.modelFolder)
        s= SimulatorDY([self.__sources.modelName, self.__sources.modelFile,
                        self.__sources.libraryFolder+ '/'+ self.__sources.libraryFile, 
                        self.__sources.modelFolder, self.__sources.outputFolder])
        s.setStopTime(self.__configuration.stopTime)
        s.setNumberOfIntervals(self.__configuration.numberOfIntervals)
        s.setTolerance(self.__configuration.tolerance)
        ''' setTimeOut kill the process if it does not finish in specific time'''
        s.setTimeOut('60')
        s.setSolver(self.__configuration.method)
        s.showProgressBar(False)
        s.linearize()
#         print os.getcwd()
        os.chdir(self.__sources.outputFolder)
        outputFile= 'dslin.mat'
        try:
            if os.path.exists(outputFile):
                self.__experiment["resultFile"]= outputFile
        except OSError as e:
            print "Result file not found '" + outputFile + "' : " + e.strerror
        
#         toc= timeit.default_timer()
#         print 'Simulation time ', toc- tic
        
   