'''
Created on 9 nov 2015

@author: fragom
'''
from modelicares import SimRes
from data import signal
import sys

class StreamMATFile(object):
    '''
    classdocs
    '''
    _resultFile= None

    def __init__(self, matfile):
        '''
        Constructor
        '''
        self._resultFile= SimRes(matfile)
    
class InputMATStream(StreamMATFile):
    '''
    classdocs
    '''
    __components= []
    __variables= []
    __signalData= {}
    
    def __init__(self, matfile):
        super(InputMATStream, self).__init__(matfile)

    def get_signalData(self):
        return self.__signalData


    def set_signalData(self, value):
        self.__signalData = value


    def del_signalData(self):
        del self.__signalData


    def get_variables(self):
        return self.__variables


    def set_variables(self, value):
        self.__variables = value


    def del_variables(self):
        del self.__variables


    def get_components(self):
        return self.__components


    def set_components(self, value):
        self.__components = value


    def del_components(self):
        del self.__components

        
    def load_components(self):
        ''' from the object file, loads the name of the components of the network '''
        self.__components= sorted(self._resultFile.nametree().keys())
    
    def load_variables(self, component):
        '''
        components
        '''
        self.__variables= self._resultFile.nametree()[component].keys()
        
    def load_signals(self, component, variable):
        if self.compiler== 'omc': 
            nameVarTime= 'time' 
        else: 
            nameVarTime= "Time"
        ''' array of 0 of the same length as samples '''
        # TODO re-implement Signal class considering only (sampleTime, signal)
        emptyarray= [0 for x in self._resultFile[nameVarTime]]
        for var in variable:
            senyal= signal.Signal()
            fullname= component+ '.'+ var
            senyal.set_signal(self._resultFile[nameVarTime], self._resultFile[fullname], emptyarray)
            self.__signals[fullname]= senyal
            
        print self.__signals
            
    components = property(get_components, set_components, del_components, "components's docstring")
    variables = property(get_variables, set_variables, del_variables, "variables's docstring")
    signalData = property(get_signalData, set_signalData, del_signalData, "signalData's docstring")
        
    
if __name__ == "__main__":
    puta= InputMATStream(sys.argv[1])
    
    puta.load_components()
    
    count= 0
    indexMapping={}
    for i, meas in enumerate(puta.components):
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
        values.append(puta.components[indexMapping[idx]])

    print values
    
    for component in values:
        puta.load_variables(component)
        count= 0
        indexMapping={}
        for i, meas in enumerate(puta.variables):
            print '[%d] %s' % (i, meas)
            indexMapping[count]= i
            count+= 1
        try:
            value= raw_input("Select which variable do you want to plot: ")
            lindex = value.split()
        except ValueError:
            print "Mal! Mal! Mal! Verdadera mal! Por no decir borchenoso!" 
        variables= []
        for idx in lindex:  
            idx= int(idx)
            variables.append(puta.variables[indexMapping[idx]])
    
        print variables
        puta.load_signals(component, variables)
        