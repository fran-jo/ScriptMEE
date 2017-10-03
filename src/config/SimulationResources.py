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
        self.fitxer= params[0].replace('\\','/')
        self.readingMode= params[1]
        self._properties= {}
        
    def save_Properties(self):
        fle= open(self.fitxer,'w')
        for key in self._properties:
            fle.writelines(key+"="+str(self._properties[key])+'\n')
    
    def load_Properties(self):
        fle= open(self.fitxer,self.readingMode)
        for line in fle:
            options=line.split('=')
            self._properties[options[0]]= options[1]
#         print self._properties
    
    def get_Properties(self):
        '''
        This function works after storing or loading _properties into the dictionary object
        '''
        return self._properties.values()
    
class SimulationResources(StreamProperties):
    '''
    classdocs
    cimPath= ''
    modelPath=''
    libraryPath=''
    modelFile=''
    libraryFile=''
    modelName=''
    outputPath= ''
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
        StreamProperties.__init__(self, params)
        self._properties= {'cimPath':'','modelPath':'','libraryPath':'','modelFile':'',\
                          'libraryFile':'','modelName':'','outputPath':''}
    
    def load_Properties(self):
        StreamProperties.load_Properties(self)
        self.__cimfolder = self._properties['cimPath']
        self.__modelfolder= self._properties['modelPath']
        self.__libraryfolder= self._properties['libraryPath']
        self.__outputfolder= self._properties['outputPath']
        
    ''' getter/setter methods with _properties '''
    @property
    def cimFolder(self):
        self.__cimfolder= self._properties['cimPath'][:-1]
        return self.__cimfolder
    @cimFolder.setter
    def cimFolder(self, path):
        self._properties['cimPath']= path
        self.__cimfolder= path
        
    @property
    def modelFolder(self):
        self.__modelfolder= self._properties['modelPath'][:-1]
        return self.__modelfolder
    @modelFolder.setter
    def modelFolder(self, path):
        self._properties['modelPath']= path
        self.__modelfolder= path

    @property
    def modelFile(self):
        self.__modelfile= self._properties['modelFile'][:-1]
        return self.__modelfile
    @modelFile.setter
    def modelFile(self, path):
        if (path!= ''):
            self._properties['modelFile']= path
            self.__modelfile= path
        else:
            self._properties['modelFile']= 'none'
            self.__modelfile= 'none'
       
    @property
    def modelName(self):
        self.__modelname= self._properties['modelName'][:-1]
        return self.__modelname
    @modelName.setter
    def modelName(self, path):
        ''' path is the full path of the file '''
        if (path!= ''):
            nombre= path.split('/')[-2]
            print nombre
            self._properties['modelName']= nombre
            print self._properties['modelName']
            self.__modelname= nombre
        else:
            self._properties['modelName']= 'none'
            self.__modelname= 'none'
        ''' the name of the file without extension '''
        
    @property
    def libraryFolder(self):
        self.__libraryfolder= self._properties['libraryPath'][:-1]
        return self.__libraryfolder
    @libraryFolder.setter
    def libraryFolder(self, path):
        self._properties['libraryPath']= path
        self.__libraryfolder= path
    @property
    def libraryFile(self):
        self.__libraryfile= self._properties['libraryFile'][:-1]
        return self.__libraryfile
    @libraryFile.setter
    def libraryFile(self, path):
        if (path!= ''):
            self._properties['libraryFile']= path
            self.__libraryfile= path
        else:
            self._properties['libraryFile']= 'none'
            self.__libraryfile= 'none'
            
    @property
    def outputFolder(self):
        self.__outputfolder= self._properties['outputPath'][:-1]
        return self.__outputfolder
    @outputFolder.setter
    def outputFolder(self, path):
        self._properties['outputPath']= path
        self.__outputfolder= path
