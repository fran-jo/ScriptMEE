'''
Created on 11 apr 2014

@author: fragom
'''
import shutil


class CommandOMC(object):
    '''
    classdocs
    '''

    def __init__(self):
        '''
        Constructor
        '''
    
    def loadModelica(self):
        return 'loadModel(Modelica)'
    
    def loadFile(self, fichero= ''):
        strcommand = []
        strcommand.append('loadFile(')
        strcommand.append('"')
        strcommand.append(fichero)
        strcommand.append('"')
        strcommand.append(')')
        command = ''.join(strcommand)
        command = command.replace('\\','/') 
        return command
    
    def simulate(self, model, simConfig, modelParams):
        strcommand= []
        strcommand.append('simulate(')
        strcommand.append(model)
        strcommand.append(self.__setExperimentConfig(simConfig))
        if (modelParams):
            strcommand.append(',simflags="-override ')
            strcommand.append(modelParams)
            strcommand.append('"')
        strcommand.append(')')
        command = ''.join(strcommand) 
        command= command.replace('\\','/')
        return command
    
    def __setExperimentConfig(self, simConfig):
        ''' creates a command string with simulation configuration values '''
        simulate_options = ""
        for k, v in simConfig.configuration.iteritems():
            simulate_options = simulate_options + "," + str(k) + "=" + str(v)
        return simulate_options
    
    def saveResult(self, filename, outPath):
        '''TODO: Handle when simulation fails, no result file '''
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
        strcommand.append(', recursive= true')
        strcommand.append(')')
        command= ''.join(strcommand)
        return command