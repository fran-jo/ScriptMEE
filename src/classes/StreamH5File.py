'''
Created on 7 apr 2015

@author: fragom
'''
from modelicares import SimRes
from numpy import angle,absolute
import os
import h5py as h5
from data import signal

class StreamH5File(object):
    '''
    ch5file file object with reference to the .h5 file
    cgroup object to keep in memory a group from the .h5 file
    cdataset objet to keep in memory the dataset of signals from the .h5 file
    '''
    ch5file= None
    cgroup= None
    ndataset= None
    vdataset= None

    def __init__(self, _compiler, _params):
        '''
        Constructor
        _compiler: omc, dymola or jm
        Params 0: output dir; 
        Params 1: .h5 file path;
        Params 2: .mat file path;
        '''
        os.chdir(_params[0])
        self.cfileName= _params[1]
        if (len(_params)> 2):
            self.cmatfile= SimRes(_params[2])
#         fileName= time.strftime("%H_%M_%S")+ 'SimulationOutputs.h5'
        ''' a '''
        self.dsenyal= {}
        self.compiler= _compiler

    def get_cgroup(self):
        return self.cgroup

    def get_cdataset(self):
        return self.cdataset

    def set_cgroup(self, value):
        self.cgroup = value


    def set_cdataset(self, value):
        self.cdataset = value

    def del_cgroup(self):
        del self.cgroup
        
    def del_cdataset(self):
        del self.cdataset

        
    def get_senyal(self, _measurement):
        ''' return signal object '''
        return self.dsenyal[_measurement]

    def set_senyalRect(self, _measurement, _nameR, _nameI):
        ''' set a signal in complex form, real+imaginary '''
        if self.compiler== 'omc': 
            nameVarTime= 'time' 
        else: 
            nameVarTime= "Time"
        csenyal= signal.Signal()
        if (_nameI != []):
            csenyal.set_signalRect(self.cmatfile[nameVarTime], self.cmatfile[_nameR], self.cmatfile[_nameI])
        else:
            ''' array of 0 of the same length as samples '''
            emptyarray= [0 for x in self.cmatfile[nameVarTime]]
            csenyal.set_signalRect(self.cmatfile[nameVarTime], self.cmatfile[_nameR], emptyarray)
            
        self.dsenyal[_measurement]= csenyal
        
    def set_senyalPolar(self, _measurement, _nameM, _nameP):
        ''' set a signal in polar form, magnitude + angle '''
        if self.compiler== 'omc': 
            nameVarTime= 'time' 
        else: 
            nameVarTime= "Time"
        csenyal= signal.SignalPMU()
        if (_nameP != []):
            csenyal.set_signalPolar(self.cmatfile[nameVarTime], self.cmatfile[_nameM], self.cmatfile[_nameP])
        else:
            ''' array of 0 of the same length as samples '''
            emptyarray= [0 for x in self.cmatfile[nameVarTime]]
            csenyal.set_signalPolar(self.cmatfile[nameVarTime], self.cmatfile[_nameM], emptyarray)
        self.dsenyal[_measurement]= csenyal
        
    def del_senyal(self):
        del self.csenyal
    
    
    group = property(get_cgroup, set_cgroup, del_cgroup, "cgroup's docstring")
    dataset = property(get_cdataset, set_cdataset, del_cdataset, "cdataset's docstring")
    senyalCmp = property(get_senyal, set_senyalRect, del_senyal, "signalold's docstring")
    senyalPol = property(get_senyal, set_senyalPolar, del_senyal, "signalold's docstring")
    
    
    def pmu_from_cmp(self, a_instance):
        '''Given an instance of A, return a new instance of B.'''
        return signal.SignalPMU(a_instance.field)
    
    def calc_phasorSignal(self):
        ''' function that converts the internal complex signal into polar form '''
        magnitud= []
        fase= []
        for re,im in zip(self.csenyal.get_signalReal(), self.csenyal.get_signalReal()):
            magnitud.append(absolute(re+im))
            fase.append(angle(re+im,deg=True))
        self.csenyal.set_signalPolar(self.get_senyal().get_sampleTime(), magnitud, fase)
    
            
            
class InputH5Stream(StreamH5File):
    def __init__(self, params):
        super(InputH5Stream, self).__init__(params)

    def open_h5(self):
        ''' Opens and existing .h5 file in reading mode '''
        self.ch5file= h5.File(self.cfileName, 'r')
         
    def load_h5(self, _network, _component, _variable):
        ''' 
        Loads signal data from a specific variable form a specific component 
        _network name of the entire network model or area inside the model
        _component is the name of the component we are working with
        _variable is the name of the variable that contains signal data, from the specified component 
        '''
        # load data into internal dataset
        self.cgroup= self.ch5file[_network]
        self.vdataset= self.cgroup[_component+'_values']
        self.ndataset= self.cgroup[_component+'_names']
        idx= 1
        for item in self.ndataset:
            print idx, item
            if (item == _variable):
                if self.vdataset.attrs['coord']== 'polar':
                    print 'polar'
                    csenyal= signal.SignalPMU()
                    csenyal.set_signalPolar(self.vdataset[:,0], self.vdataset[:,idx], self.vdataset[:,idx+1])
                else:
                    print 'complex'
                    csenyal= signal.Signal()
                    csenyal.set_signalRect(self.vdataset[:,0], self.vdataset[:,idx], self.vdataset[:,idx+1])
                self.dsenyal[_component]= csenyal
            idx+= 1
            
    def close_h5(self):
        self.ch5file.close()
        
        
class OutputH5Stream(StreamH5File):
    
    def __init__(self, params):
        super(OutputH5Stream, self).__init__(params)
        
    def open_h5(self):
        ''' Opens the h5 file in append mode '''
        self.ch5file= h5.File(self.cfileName, 'a')
        
    def save_h5(self, _network, _component, _variable):
        ''' Creates the .h5, in append mode, with an internal structure.
        When created, the .h5 file contains a new group with the same name as the input parameter
        _network name of the entire network model or area inside the model
        _component indicates the name of component where the data is collected from 
        _variable is the name of the signal to be saved '''
        # create group, for each component, with attribute
        if not _component in self.ch5file:
            self.cgroup= self.ch5file.create_group(_network)
        else:
            self.cgroup= self.ch5file[_network]
        # create datasets
        ds_names= _component+ '_names'
        ds_values= _component+ '_values'
        if not ds_names in self.cgroup:
            self.ndataset= self.cgroup.create_dataset(ds_names, (1,))
        else:
            self.ndataset= self.cgroup[ds_names]
        column= -1
        self.ndataset[1,column]= _variable
        # store datasets in file
        lasenyal= self.get_senyal(_component)
        if not ds_values in self.cgroup:
            self.vdataset= self.cgroup.create_dataset(ds_values, 
                        (self.dsenyal[_component].get_csamples(),), chunks=(1000,3))
            self.vdataset[:,0]= lasenyal.get_sampleTime()
        else:
            self.vdataset= self.cgroup[ds_values]
#         attr_string= 'polar'
#         self.dataset.attrs['signalType']= attr_string
        '''TODO: instead of 1, the last column index Dataset.len()???'''
        column= -2
        ''' signals can store two type of data, complex or polar, values are saved per pairs '''
        if isinstance(lasenyal, signal.SignalPMU):
            self.vdataset.attrs["unit"]= 'p.u.'
            self.vdataset.attrs['coord']= 'polar'  
            self.vdataset[:,column]= lasenyal.get_signalMag()
            column+= 1
            self.vdataset[:,column]= lasenyal.get_signalPhase()
        else:
            self.vdataset.attrs["unit"]= 'p.u.'
            self.vdataset.attrs["coord"]= 'complex'  
            self.vdataset[:,column]= lasenyal.get_signalReal()
            column+= 1
            self.vdataset[:,column]= lasenyal.get_signalImag()
        # guardar en attributes els noms de les variables dels components
        
    def close_h5(self):
        # close file
        self.ch5file.close()
