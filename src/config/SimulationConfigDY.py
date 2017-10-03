'''
Created on 4 apr 2014

@author: fragom
'''

class StreamConfiguration(object):
    '''
    classdocs
    '''

    def __init__(self, params):
        '''
        Constructor
        params[0]: .properties file
        params[1]: reading mode
        '''
        self.fitxer= params[0].replace('\\','/')
        self.readingMode= params[1]
        self._properties= {}
        self._compiler= 'openmodelica'

    def save_Properties(self):
        fle= open(self.fitxer,'w')
        for key in self._properties:
            fle.writelines(key+"="+str(self._properties[key])+"\n")
    
    def load_Properties(self):
        fle= open(self.fitxer,self.readingMode)
        self._properties= {}
        for line in fle:
            options=line.split('=')
            self._properties[options[0]]= options[1]

    @property
    def compiler(self):
        return self._compiler
    @compiler.setter
    def compiler(self, valor):
        self._compiler= valor;
        
    @property
    def configuration(self):
        return self._properties
    
class SimulationConfigDY(StreamConfiguration):
    '''
    startTime=0 
    stopTime=0
    timeOut= 60
    numberOfIntervals=0
    fixedStepSize=false
    tolerance=0 
    method=''  
    outputFormat=''
    '''    
    #_solver_config= {}
    
    def __init__(self, params):
        ''' 
        Constructor
        '''
        self.__startTime = ''
        self.__stopTime= ''
        self.__numberOfIntervals= ''
        self.__tolerance= ''
        self.__method= ''
        self.__outputFormat= ''
        self.__modelName= ''
        StreamConfiguration.__init__(self, params)
        self._properties= {'startTime':'','stopTime':'','numberOfIntervals':'',\
                          'tolerance':'','method':'','outputFormat':''}
        
    def load_Properties(self):
        StreamConfiguration.load_Properties(self)
        self.__startTime = self._properties['startTime'].rstrip('\n')
        self.__stopTime= self._properties['stopTime'].rstrip('\n')
        self.__numberOfIntervals= self._properties['numberOfIntervals'].rstrip('\n')
        self.__tolerance= self._properties['tolerance'].rstrip('\n')
        self.__method= self._properties['method'].rstrip('\n')
        self.__outputFormat= self._properties['outputFormat'].rstrip('\n')

    @property
    def startTime(self):
        self.__startTime= self._properties['startTime'].rstrip('\n')
        return self.__startTime
    @startTime.setter
    def startTime(self, valor):
        self._properties['startTime']= valor
        self.__startTime= valor;
        
    @property
    def stopTime(self):
        self.__stopTime= self._properties['stopTime'].rstrip('\n')
        return self.__stopTime
    @stopTime.setter
    def stopTime(self, valor):
        self._properties['stopTime']= valor
        self.__stopTime= valor;
    
    @property
    def timeOut(self):
        self.__timeOut= self._properties['timeOut'].rstrip('\n')
        return self.__timeOut
    @timeOut.setter
    def timeOut(self, valor):
        self._properties['timeOut']= valor
        self.__timeOut= valor;
        
    @property
    def numberOfIntervals(self):
        self.__numberOfIntervals= self._properties['numberOfIntervals'].rstrip('\n')
        return self.__numberOfIntervals
    @numberOfIntervals.setter
    def numberOfIntervals(self, valor):
        self._properties['numberOfIntervals']= valor
        self.__numberOfIntervals= valor;
    
    @property
    def tolerance(self):
        self.__tolerance= self._properties['tolerance'].rstrip('\n')
        return self.__tolerance
    @tolerance.setter
    def tolerance(self, valor):
        self._properties['tolerance']= valor
        self.__tolerance= valor
    
    @property
    def method(self):
        self.__method= self._properties['method'].rstrip('\n') #without char \n
        return self.__method
    @method.setter
    def method(self, valor):
        self._properties['method']= valor
        self.__method= valor
    
    @property
    def outputFormat(self):
        self.__outputFormat= self._properties['outputFormat'].rstrip('\n') #without char \n
        return self.__outputFormat
    @outputFormat.setter
    def outputFormat(self, valor):
        self._properties['outputFormat']= valor
        self.__outputFormat= valor
        
    @property
    def modelName(self):
        self.__modelname= self._properties['modelName']
        return self.__modelname
    @modelName.setter
    def modelName(self, name):
        self._properties['modelName']= name
        self.__modelname= name;
        
    def isFixedStepSize(self):
        return int(self._properties['fixedStepSize'])
    
    def getOutputFormat(self):
        return self._properties['outputFormat']
    
    def setSimOptions(self):
        ''' creates a command string with simulation configuration values '''
        simulate_options = ""
        for k, v in self._properties.iteritems():
#             if k in self.set_sim_options:
#                 i = self.set_sim_options.index(k)
#                 if v != None and v != "":
#                     if k == "algorithmName":
#                         v = "\"" + str(v).lower() + '\"'
#                     elif k == "outputFormat":
#                         v = "\"" + str(v).lower() + '\"'
                    simulate_options = simulate_options + "," + str(k) + "=" + str(v)
        return simulate_options
