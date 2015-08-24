'''
Created on 1 apr 2014
Read / Write values for the options of the different simulators we will implement in the MEE
@author: fragom
'''

class SimulationConfigJM:
    '''
    JModelica Configuration
    start_time=0
    final_time=0
    algorithm=''
    ncp=0
    solver=''
    initialize=false
    algorithm_options=0,'',...
    '''
    _configuration= {}
    #_solver_config= {}

    def __init__(self, params):
        '''
        Constructor
        '''
        fitxer= params.replace('\\','/') #name of properties file
        readingMode= 'r'
        # loading properties into memory
        properti = open(fitxer, readingMode)
        for line in properti:
            option= line.split('=')
            self._configuration[option[0]]= option[1][:-1]
    
    def getStartTime(self):
        return float(self._configuration['start_time'])
    
    def getStopTime(self):
        return float(self._configuration['final_time'])
    
    def getAlgorithm(self):
        return self._configuration['algorithm']
    
    def getNcp(self):
        return int(self._configuration['ncp'])
    
    def getSolver(self):
        return self._configuration['solver']
    
    def hasInitialization(self):
        if (self._configuration['initialize'].equals('0')):
            return False
        else:
            return True
    
    def getOptions(self):
        pass