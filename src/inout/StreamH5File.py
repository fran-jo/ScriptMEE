'''
Created on 7 apr 2015

@author: fragom
'''
import os
from modelicares import SimRes
from data import signal
import h5py as h5


class StreamH5File(object):
    '''
    _h5file file object with reference to the .h5 file
    cgroup object to keep in memory a group from the .h5 file
    cdataset objet to keep in memory the dataset of signals from the .h5 file
    '''
    _fileName= ''
    _matfile= None
    _h5file= None
    _group= None
    _dsetnames= None
    _dsetvalues= None
    _compiler= ''
    _signals= {}
    
    def __init__(self, params, compiler='omc'):
        '''
        Constructor
        _compiler: omc, dymola or jm
        Params 0: output dir; 
        Params 1: .h5 file path;
        Params 2: .mat file path;
        '''
        if (params[0]!= ''):
            os.chdir(params[0])
        self._fileName= params[1]
        if (len(params)> 2):
            self._matfile= SimRes(params[2])
#         fileName= time.strftime("%H_%M_%S")+ 'SimulationOutputs.h5'
        ''' a '''
        self._signals= {}
        self._compiler= compiler

    def get_group(self):
        return self.__group

    def get_dsetvalues(self):
        return self.__dsetvalues

    def get_dsetnames(self):
        return self.__dsetnames

    def set_group(self, value):
        self.__group = value

    def set_dsetvalues(self, value):
        self.__dsetvalues = value

    def set_dsetnames(self, value):
        self.__dsetnames = value

    def del_group(self):
        del self.__group

    def del_dsetvalues(self):
        del self.__dsetvalues

    def del_dsetnames(self):
        del self.__dsetnames
    
    group = property(get_group, set_group, del_group, "group's docstring")
    dsetvalues = property(get_dsetvalues, set_dsetvalues, del_dsetvalues, "dsetvalues's docstring")
    dsetnames = property(get_dsetnames, set_dsetnames, del_dsetnames, "dsetnames's docstring")

        
    def get_senyal(self, _measurement):
        ''' return signal object '''
        return self._signals[_measurement]

    def set_senyalRect(self, _measurement, _nameR, _nameI):
        ''' set a signal in complex form, real+imaginary '''
        if self._compiler== 'omc': 
            nameVarTime= 'time' 
        else: 
            nameVarTime= "Time"
        senyal= signal.Signal()
        if (_nameI != []):
            senyal.set_signal(self._matfile[nameVarTime], self._matfile[_nameR], self._matfile[_nameI])
#             print self._matfile[nameVarTime]
#             print self._matfile[_nameR]
#             print self._matfile[_nameI]
        else:
            ''' array of 0 of the same length as samples '''
            emptyarray= [0 for x in self._matfile[nameVarTime]]
            senyal.set_signalRect(self._matfile[nameVarTime], self._matfile[_nameR], emptyarray)
            
        self._signals[_measurement]= senyal
    
                   
class InputH5Stream(StreamH5File):
    def __init__(self, params):
        super(InputH5Stream, self).__init__(params)

    def open_h5(self):
        ''' Opens and existing .h5 file in reading mode '''
        self._h5file= h5.File(self.cfileName, 'r')
         
    def load_h5(self, network, component, variable):
        ''' 
        Loads signal data from a specific variable form a specific component 
        _network name of the entire network model or area inside the model
        _component is the name of the component we are working with
        _variable is the name of the variable that contains signal data, from the specified component 
        '''
        # load data into internal dataset
        self._group= self._h5file[network]
        self._dsetvalues= self._group[component+'_items']
        self._dsetnames= self._group[component+'_names']
        idx= 1
        for item in self._dsetnames:
            #print idx, item
            if (item == variable):
#                 if self.cdataset.attrs['coord']== 'polar':
#                     print 'polar'
#                     csenyal= signal.SignalPMU()
#                     csenyal.set_signalPolar(self.cdataset[:,0], self.cdataset[:,idx], self.cdataset[:,idx+1])
#                 else:
#                     print 'complex'
                senyal= signal.Signal()
                senyal.set_signalRect(self._dsetvalues[:,0], self._dsetvalues[:,idx], self._dsetvalues[:,idx+1])
                self._signals[component]= senyal
            idx+= 1
            
    def close_h5(self):
        self._h5file.close()
        
        
class OutputH5Stream(StreamH5File):
    '''
    Writes data into a hdf5 file. The structure must have 
    1) dataset to store signal names
    2) dataset to store signal values, per pairs, column 1: re/mag; column2: im/pol 
    '''
    def __init__(self, params, compiler):
        super(OutputH5Stream, self).__init__(params, compiler)
        
    def open_h5(self, network):
        ''' Opens the h5 file in append mode 
        _network is the name of the model simulated. Is used to create the main group of this .h5'''
        self._h5file= h5.File(self._fileName, 'a')
        if not network in self._h5file:
            self._group= self._h5file.create_group(network)
        else:
            self._group= self._h5file[network]
            
    def save_h5Values(self, component):
        ''' Creates the .h5, in append mode, with an internal structure for signal values.
        Saves signal data from a specific model. It creates an internal dataset, into the current 
        group of the current .h5, with the name of the component parameter
        _component indicates the name of component where the data is collected from 
        _variable is the name of the signal to be saved '''
        # create datasets
        if not component+'_values' in self._group:
#             self._dsetvalues= self._group.create_dataset(_component+'_values', 
#                                                       (self._signals[_component].get_csamples(),len(self._signals)*2+1),
#                                                       chunks=(100,3))
            self._dsetvalues= self._group.create_dataset(component+'_values', (self._signals[component].samples,3),
                                                      chunks=(100,3))
        else:
            self._dsetvalues= self._group[component+'_values']
        ''' signals can store two type of data, complex or polar, values are saved per pairs '''
        lasenyal= self._signals[component]
        self._dsetvalues[:,0]= lasenyal.sampletime
        self._dsetvalues[:,1]= lasenyal.magnitude
        self._dsetvalues[:,2]= lasenyal.phase
    
    
    def save_h5Names(self, component, signalnames):
        ''' Creates the .h5, in append mode, with an internal structure for signal names.
        Saves signal names from a specific model. It creates an internal dataset into the current
        group of the current .h5. 
        component indicates the name of component where the data is collected from 
        signalnames list of signal names from the component
        '''
        dt = h5.special_dtype(vlen=unicode)
        if not component+'_items' in self._group:
            self._dsetnames= self._group.create_dataset(component+'_items', (1,len(signalnames)+1), dtype=dt)
        else:
            self._dsetnames= self._group[component+'_items']
#         metaSignal= [u"sampletime", u"s", u"int"]
        self._dsetnames[:,0]= u"sampletime"
        row= 1
        for senya in signalnames:
            self._dsetnames[:,row]= str(senya)
            row+= 1
            
    def close_h5(self):
        self._h5file.close()
