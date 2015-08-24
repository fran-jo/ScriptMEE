'''
Created on 1 apr 2014
Read/Write values 
@author: fragom
'''

class JMModelParams:
    '''
    classdocs
    '''
    inputs= {}
    outputs= {}

    def __init__(self, _path, _modelFile):
        '''
        Constructor
        '''
        self.path= _path
        self.modelfile= _modelFile
    
    def getInputsJM(self, inputsFile):
        '''
        Get inputs of the model
        '''
        with open(inputsFile,'r') as fitxer:
            for line in fitxer:
                inputVar= line.split('=')
                self.inputParams[inputVar[0]]= inputVar[1][:-1]
        
        return self.inputParams
    
    def loadModelValues(self):
        '''
        Load input values to initialize the model and loads output attributes to be plotted
        '''         
        fitxer= self.path+ self.modelfile
        fitxer= fitxer.replace('\\','/') #name of properties file
        readingMode= 'r'
        # loading properties into memory
        with open(fitxer, readingMode) as propertyFile:
            for line in propertyFile:
                option= line.split('=')
                if(option[0]== 'outputs'):
                    self.outputs= option[1][:-1].split(',')
                else:
                    self.inputs[option[0]]= option[1]
#         print self.inputs
#         print self.outputs
        
    def getModelInputs(self):
        return self.inputs
    
    def getModelOutputs(self):
        return self.outputs
    
class OMCModelParams:
    '''
    classdocs
    '''
    inputs= {}
    outputs= {}
    
    def __init__(self, _modelFile):
        '''
        Constructor
        '''
        self.modelfile= _modelFile
    
    def loadModelValues(self):
        '''
        Load input values to initialize the model and loads output attributes to be plotted
        '''         
        fitxer= self.modelfile
        fitxer= fitxer.replace('\\','/') #name of properties file
        readingMode= 'r'
        # loading properties into memory
        with open(fitxer, readingMode) as propertyFile:
            for line in propertyFile:
                option= line.split('=')
                if(option[0]== 'outputs'):
                    self.outputs= option[1][:-1].split(',')
                else:
                    self.inputs[option[0]]= option[1]
#         print self.inputs
#         print self.outputs
        
    def getModelInputs(self):
        omc_inputs= ''
        for k, v in self.inputs.iteritems():
            omc_inputs= omc_inputs+ str(k) + "=" + str(v[:-1]) + ','
        omc_inputs= omc_inputs[:-1]
        return omc_inputs
    
    def getModelOutputs(self):
        return self.outputs
    
#     def setInputParams_OM(self):
#         model_inputs = ""
#         for k, v in self.inputParams.iteritems():
#             model_inputs = model_inputs + str(k) + "=" + str(v) + ','
#         model_inputs= model_inputs[:-1]
#         
#         print model_inputs
#         return model_inputs
#     
#     def getOuptut(self, _outVarFile):
#         '''
#         Get outputs we want to plot and calibrate
#         '''
#         '''if windows... if unix...'''
#         fitxer= open(self.path + _outVarFile[:-1],'r')
#         tree = ET.parse(fitxer.name)
#         root = tree.getroot()
#         for child in root:
#             self.outputParams.append(child.attrib['name'])
#         print self.outputParams
#        
#     def getInitNames_Dymola(self, _initVFile, _numVars): 
#         with open(self.path+ _initVFile[:-1]) as dsin:
#             for num, line in enumerate(dsin, 1):
#                 if re.match("char initialName(.*)", line):
#                      print line,
#                      print num
#                     break
#         
#         dsin= open(self.path+ _initVFile[:-1],'r')
#         lines= dsin.readlines()
#         varInputNames= lines[num:num+_numVars]
#         for name in varInputNames:
#             self.inputNames.append(name[:-1])
#          print len(inputNames), inputNames
#         return self.inputNames
#     
#     def getInitValues_Dymola(self, _initVFile, _numVars):
#         '''
#         Get from a file the power flow solution as initial values for the model 
#         to be simulated
#         '''
#         with open(self.path+ _initVFile[:-1]) as dsin:
#             for num, line in enumerate(dsin, 1):
#                 if re.match("double initialValue(.*)", line):
#                      print line,
#                      print num
#                     break
#         dsin= open(self.path+ _initVFile[:-1],'r')
#         lines= dsin.readlines()
#          print lines
#         inputValues_lines= lines[num:num+_numVars]
#         for line in inputValues_lines:
#             splitLine= line.split(' ')
#              print splitLine
#             if (splitLine[2]== '0' and splitLine[3]== ''):
#                 self.inputValues.append(int(splitLine[9]))
#                  print 'a. ', int(splitLine[9])
#             elif (splitLine[2]== '0' and splitLine[3]!= ''):
#                 self.inputValues.append(float(splitLine[3]))
#                  print 'b. ',float(splitLine[3])
#             elif (splitLine[1]== '-1' or splitLine[1]== '-2'):
#                 if (splitLine[2]=='' and splitLine[8]!= ''):
#                     self.inputValues.append(int(splitLine[8]))
#                      print 'c. ',int(splitLine[8])
#                 elif (splitLine[2]=='' and splitLine[7]!= ''):
#                     self.inputValues.append(int(splitLine[7]))
#                      print 'd. ',int(splitLine[7])
#                 elif (splitLine[2]=='' and splitLine[6]!= ''):
#                     self.inputValues.append(int(splitLine[6]))
#                      print 'e. ',int(splitLine[6])
#                 elif (splitLine[2]=='' and splitLine[3]!= ''):
#                     self.inputValues.append(int(splitLine[3]))
#                      print 'e. ',int(splitLine[3])
#                 elif (splitLine[2]=='' and splitLine[4]!= ''):
#                     self.inputValues.append(int(splitLine[4]))
#                      print 'e. ',int(splitLine[4])
#                 else:
#                     self.inputValues.append(float(splitLine[2]))
#                      print 'f. ', float(splitLine[2])
#          print len(inputValues), inputValues
#         return self.inputValues
#     
#     def setInitValues_OM(self):
#         '''
#         Initialize all the parameters of the model with the initial values
#         from the import power flow
#         '''
#         initialParams = dict(zip(self.inputNames, self.inputValues))
#         model_parameters = ""
#         for k, v in initialParams.iteritems():
#             model_parameters = model_parameters + str(k) + "=" + str(v) + ','
#         model_parameters= model_parameters[:-1]
#         
#         print model_parameters
#         return model_parameters