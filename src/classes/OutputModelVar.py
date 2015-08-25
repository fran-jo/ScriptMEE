'''
Created on 1 apr 2014
Read/Write values 
@author: fragom
'''

class OutputModelVar(object):
    '''
    classdocs
    '''
    
    def __init__(self, _params):
        '''
        Constructor
        _params[0] folder of files
        _params[1] file with variable list 
        '''
        self.modelfile= _params
#         self.modelfile= self.modelfile.replace('\\','/') 
        '''list of variables to be plotted, structure is a dictionary with 
        name of variable , (value1,value2) '''
        self.outputs= {}  
        
    def load_varList(self):
        with open(self.modelfile,'r') as fvarList:
            for line in fvarList:
                namevar= line.split('=')
                self.outputs[namevar[0]]= namevar[1][:-1]
    
    def get_nameVarList(self):
        ''' returns the variable name from the component.
        This name corresponds to a readable name for the user, it is not the variable name '''
        return self.outputs.keys()
    
    def get_varList(self):
        ''' returns the variable name from the component. 
        This name is the same name implemented in the model '''
        return self.outputs.items()
    