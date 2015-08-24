'''
Created on 11 apr 2014

@author: fragom
'''
import shutil

class CommandOMC:
    '''
    classdocs
    '''


    def __init__(self):
        '''
        Constructor
        '''
    
    def loadFile(self, _path, _model):
        strcommand = []
        strcommand.append('loadFile(')
        strcommand.append('"')
        strcommand.append(_path)
        strcommand.append(_model)
        strcommand.append('"')
        strcommand.append(')')
        command = ''.join(strcommand)
        command = command.replace('\\','/') 
        return command
    
    def simulate(self, _model, _simOptions, _modelParams):
        strcommand= []
        strcommand.append('simulate(')
        strcommand.append(_model)
        strcommand.append(_simOptions)
        if (_modelParams):
            strcommand.append(',simflags="-override ')
            strcommand.append(_modelParams)
            strcommand.append('"')
        strcommand.append(')')
        command = ''.join(strcommand) 
        command= command.replace('\\','/')
        return command
    
    def saveResult(self, filename, outPath):
        absFileName= ''.join(filename.split('"'))
        shutil.copy(absFileName, outPath)
        onlyFileName = absFileName.split('/')
        return onlyFileName[6]
        
    def getResult(self, filename):
        filesplit= filename.split('/')
        strcommand= []
        strcommand.append('readSimulationResultVars(')
        strcommand.append('"')
        strcommand.append(filesplit[6])
        strcommand.append(', false')
        strcommand.append(')')
        command= ''.join(strcommand)
        return command
    
    def plot(self, _simOutputs):
        strcommand= []
        strcommand.append('plot({')
        for value in _simOutputs:
            strcommand.append(value)
            strcommand.append(',')
        strcommand= strcommand[:-1]
        strcommand.append('})')
        command = ''.join(strcommand) 
        return command
    
    def getClassNames(self, _model):
        ''' _model: name of the package containing the networks or the models to be simulated '''
        strcommand= []
        strcommand.append('getClassNames(')
        strcommand.append(_model)
        strcommand.append(')')
        command= ''.join(strcommand)
        return command