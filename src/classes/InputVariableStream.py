'''
Created on 1 apr 2014
Read/Write values 
@author: fragom
'''

class InputVariableStream(object):
    '''
    classdocs
    '''
    
    def __init__(self, _params):
        '''
        Constructor
        _params[0] folder of files
        _params[1] file with variable list 
        '''
        self.modelfile= _params[0]+ _params[1]
        self.modelfile= self.modelfile.replace('\\','/') #name of properties file
        self.inputs= {}
        
    def load_varList(self):
        pass
    