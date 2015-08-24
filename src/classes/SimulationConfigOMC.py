'''
Created on 4 apr 2014

@author: fragom
'''

class SimulationConfigOMC:
    '''
    startTime=0 
    stopTime=0
    numberOfIntervals=0
    fixedStepSize=false
    tolerance=0 
    method=''  
    outputFormat=''
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
        return float(self._configuration['startTime'])
    
    def getStopTime(self):
        return float(self._configuration['stopTime'])
    
    def getNumberOfIntervals(self):
        return self._configuration['numberOfIntervals']
    
    def isFixedStepSize(self):
        return int(self._configuration['fixedStepSize'])
    
    def getTolerance(self):
        return self._configuration['tolerance']
    
    def getMethod(self):
        return self._configuration['method']
    
    def getOutputFormat(self):
        return self._configuration['outputFormat']
    
    def setSimOptions(self):
        ''' creates a command string with simulation configuration values '''
        simulate_options = ""
        for k, v in self._configuration.iteritems():
#             if k in self.set_sim_options:
#                 i = self.set_sim_options.index(k)
#                 if v != None and v != "":
#                     if k == "algorithmName":
#                         v = "\"" + str(v).lower() + '\"'
#                     elif k == "outputFormat":
#                         v = "\"" + str(v).lower() + '\"'
                    simulate_options = simulate_options + "," + str(k) + "=" + str(v)
        print simulate_options
        return simulate_options