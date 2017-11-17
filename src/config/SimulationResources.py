'''
Created on 13 apr 2014
Access to the names and paths for the simulation resources. This resources are the 
names and path of the models to be simulated, and libraries supporting this models.
This information is stored in the correspondence .properties file 
@author: Francis Gomez
'''
class StreamProperties(object):
    '''
    classdocs
    '''

    def __init__(self, params):
        '''
        Constructor
        params[0]: .properties file
        params[1]: reading mode
        '''
        self.__fitxer= params[0].replace('\\','/')
        self.__readingMode= params[1]
        self._properties= {}
        
    def save_Properties(self):
        fle= open(self.__fitxer,'w')
        for key in self._properties:
            print key+"="+str(self._properties[key])+'\n'
            fle.write(key+"="+str(self._properties[key])+'\n')
    
    def load_Properties(self):
        fle= open(self.__fitxer,self.__readingMode)
        for line in fle:
            options=line.split('=')
            self._properties[options[0]]= options[1]
#         print self._properties
    
    def get_Properties(self):
        '''
        This function works after storing or loading _properties into the dictionary object
        '''
        return self._properties.values()
    
class CompilerResources(StreamProperties):
    '''
    classdocs
    cimPath= ''
    modelPath=''
    libraryPath=''
    modelFile=''
    libraryFile=''
    modelName=''
    outputPath= ''
    outputFile= ''
    '''
    
    def __init__(self, params):
        '''
        Constructor
        '''
        self.__cimfolder = ''
        self.__modelfolder= ''
        self.__libraryfolder= ''
        self.__outputfolder= ''
        self.__modelfile= ''
        self.__libraryfile= ''
        self.__modelname= ''
        self.__outputfile= ''
        StreamProperties.__init__(self, params)
        self._properties= {'cimPath':'','modelPath':'','libraryPath':'','modelFile':'',\
                          'libraryFile':'','modelName':'','outputPath':'', 'outputFile':''}
    
    def load_Properties(self):
        StreamProperties.load_Properties(self)
        self.__cimfolder = self._properties['cimPath'][:-1] if '\n' in self._properties['cimPath'] else self._properties['cimPath']
        self.__modelfolder= self._properties['modelPath'][:-1] if '\n' in self._properties['modelPath'] else self._properties['modelPath']
        self.__modelfile= self._properties['modelFile'][:-1] if '\n' in self._properties['modelFile'] else self._properties['modelFile']
        self.__modelname= self._properties['modelName'][:-1] if '\n' in self._properties['modelName'] else self._properties['modelName']
        self.__libraryfolder= self._properties['libraryPath'][:-1] if '\n' in self._properties['libraryPath'] else self._properties['libraryPath']
        self.__libraryfile= self._properties['libraryFile'][:-1] if '\n' in self._properties['libraryFile'] else self._properties['libraryFile']
        self.__outputfolder= self._properties['outputPath'][:-1] if '\n' in self._properties['outputPath'] else self._properties['outputPath']
        self.__outputfile= self._properties['outputFile'][:-1] if '\n' in self._properties['outputFile'] else self._properties['outputFile']
        self._properties= {'cimPath':'','modelPath':'','libraryPath':'','modelFile':'',\
                          'libraryFile':'','modelName':'','outputPath':'', 'outputFile':''}
        
    ''' getter/setter methods with _properties '''
    @property
    def cimFolder(self):
        return self.__cimfolder
    @cimFolder.setter
    def cimFolder(self, value):
        self.__cimfolder= value.rstrip('\n') if '\n' in value else value
        self._properties['cimPath']= self.__cimfolder
        
    @property
    def modelFolder(self):
        return self.__modelfolder
    @modelFolder.setter
    def modelFolder(self, value):
        self.__modelfolder= value.rstrip('\n') if '\n' in value else value
        self._properties['modelPath']= self.__modelfolder
        
    @property
    def modelFile(self):
        return self.__modelfile
    @modelFile.setter
    def modelFile(self, value):
        self.__modelfile= value.rstrip('\n') if '\n' in value else value
        self._properties['modelFile']= self.__modelfile
       
    @property
    def modelName(self):
        return self.__modelname
    @modelName.setter
    def modelName(self, value):
        ''' path is the full path of the file '''
        self.__modelname= value.rstrip('\n') if '\n' in value else value
        self._properties['modelName']= self.__modelname
        
    @property
    def libraryFolder(self):
        return self.__libraryfolder
    @libraryFolder.setter
    def libraryFolder(self, value):
        self.__libraryfolder= value.rstrip('\n') if '\n' in value else value
        self._properties['libraryPath']= self.__libraryfolder
        
    @property
    def libraryFile(self):
        return self.__libraryfile
    @libraryFile.setter
    def libraryFile(self, value):
        self.__libraryfile = value.rstrip('\n') if '\n' in value else value
        self._properties['libraryFile']= self.__libraryfile
            
    @property
    def outputFolder(self):
        return self.__outputfolder
    @outputFolder.setter
    def outputFolder(self, value):
        self.__outputfolder= value.rstrip('\n') if '\n' in value else value
        self._properties['outputPath']= self.__outputfolder
        
    @property
    def outputFile(self):
        return self.__outputfile
    @outputFile.setter
    def outputFile(self, value):
        self.__outputfile= value.rstrip('\n') if '\n' in value else value
        self._properties['outputFile']= self.__outputfile
        
