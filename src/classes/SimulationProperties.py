'''
Created on 13 apr 2014
Access to the names and paths for the simulation resources. This resources are the 
names and path of the models to be simulated, and libraries supporting this models.
This information is stored in the correspondence .properties file 
@author: Francis Gomez
'''

import os

class SimulationProperties(object):
    '''
    modelPath=''
    libraryPath=''
    modelFile=''
    libraryFile=''
    modelName=''
    outputPath= ''
    '''
    fitxer= ''
    readingMode= ''
    properties= {}

    def __init__(self, params):
        '''
        Constructor
        '''
        self.fitxer= params.replace('\\','/') #name of properties file
        self.readingMode= 'r'
        # loading properties into memory
        properti = open(self.fitxer, self.readingMode)
        for line in properti:
            option= line.split('=')
            self.properties[option[0]]= option[1]
        
    def getModelPath(self):
        modelPath= self.properties['modelPath'][:-1]
        separateValues= modelPath.split(os.sep)
        modelPath = '/'.join(separateValues)
        return modelPath
    
    def getLibraryPath(self):
        libPath= self.properties['libraryPath'][:-1]
        separateValues= libPath.split(os.sep)
        libPath = '/'.join(separateValues)
        return libPath
    
    def getModelFile(self):
        return self.properties['modelFile'][:-1]
    
    def getLibraryFile(self):
        return self.properties['libraryFile'][:-1]
    
    def getModelName(self):
        return self.properties['modelName'][:-1]
    
    def getSimulationOptions(self):
        return self.properties['simulationOptions']
    
    def getOutputPath(self):
        outputDir= self.properties['outputPath'][:-1]
        separateValues= outputDir.split(os.sep)
        outputDir = '/'.join(separateValues)
        return outputDir
    
    
class SimulationJMProperties(SimulationProperties):
    '''
    modelInputs=''
    modelOutputs=''
    '''
    def getModelValuesFile(self):
        return self.properties['modelValues'][:-1]
    
class SimulationOMCProperties(SimulationProperties):
    '''
    modelInputs=''
    modelOutputs=''
    '''
    def getModelValuesFile(self):
        return self.properties['modelValues'][:-1]
