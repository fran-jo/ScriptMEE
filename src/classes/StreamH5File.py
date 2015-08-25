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
    cdataset= None

    def __init__(self, params):
        '''
        Constructor
        Params 0: output dir; 
        Params 1: .h5 file path;
        Params 2: .mat file path;
        '''
        os.chdir(params[0])
        self.cfileName= params[1]
        if (len(params)> 2):
            self.cmatfile= SimRes(params[2])
#         fileName= time.strftime("%H_%M_%S")+ 'SimulationOutputs.h5'
        ''' a '''
        self.dsenyal= {}

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

        
    def get_senyal(self, _variable):
        ''' return signal object '''
        return self.dsenyal[_variable]

    def set_senyalRect(self, _variable, _nameR, _nameI):
        ''' set a signal in complex form, real+imaginary '''
        csenyal= signal.Signal()
        csenyal.set_signalRect(self.cmatfile['time'], self.cmatfile[_nameR], self.cmatfile[_nameI])
        self.dsenyal[_variable]= csenyal
        
    def set_senyalPolar(self, _variable, _nameM, _nameP):
        ''' set a signal in polar form, magnitude + angle '''
        csenyal= signal.SignalPMU()
        self.csenyal.set_signalPolar(self.cmatfile['time'], self.cmatfile[_nameM], self.cmatfile[_nameP])
        self.dsenyal[_variable]= csenyal
        
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
         
    def load_h5(self, _component, _variable):
        ''' Loads signal data from a specific variable form a specific component 
        _component is the name of the component we are working with
        _variable is the name of the variable that contains signal data, from the specified component '''
        # load data into internal dataset
        self.cgroup= self.ch5file[_component]
        self.cdataset= self.cgroup[_variable]
        if self.cdataset.attrs['coord']== 'polar':
            print 'polar'
            self.csenyal.set_signalPolar(self.cdataset[:,0], self.cdataset[:,1], self.cdataset[:,2])
        else:
            print 'complex'
            self.csenyal.set_signalRect(self.cdataset[:,0], self.cdataset[:,1], self.cdataset[:,2])
            
    def close_h5(self):
        self.ch5file.close()
        
        
class OutputH5Stream(StreamH5File):
    
    def __init__(self, params):
        super(OutputH5Stream, self).__init__(params)
        
    def open_h5(self):
        ''' Opens the h5 file in append mode '''
        self.ch5file= h5.File(self.cfileName, 'a')
        
    def save_h5(self, _component, _variable):
        ''' Creates the .h5, in append mode, with an internal structure.
        When created, the .h5 file contains a new group with the same name as the input parameter
        _component indicates the name of component where the data is collected from 
        Saves signal data from a specific variable (input parameter). It creates an 
        internal dataset into the current group of the current .h5. 
        _variable is the name of the signal to be saved '''
        uDefVar= _component+ '.'+ _variable
        # create group, for each component, with attribute
        if not _component in self.ch5file:
            self.cgroup= self.ch5file.create_group(_component)
        else:
            self.cgroup= self.ch5file[_component]
        # create datasets
        if not _variable in self.cgroup:
            self.cdataset= self.cgroup.create_dataset(_variable, (self.dsenyal[uDefVar].get_csamples(),3), chunks=(100,3))
        else:
            self.cdataset= self.cgroup[_variable]
#         attr_string= 'polar'
#         self.dataset.attrs['signalType']= attr_string
        # store datasets in file
        lasenyal= self.get_senyal(uDefVar)
        self.cdataset[:,0]= lasenyal.get_sampleTime()
        column= 1
        ''' signals can store two type of data, complex or polar, values are saved per pairs '''
        if isinstance(lasenyal, signal.SignalPMU):
            self.cdataset.attrs["unit"]= 'p.u.'
            self.cdataset.attrs['coord']= 'polar'  
            self.cdataset[:,column]= lasenyal.get_signalMag()
            column+= 1
            self.cdataset[:,column]= lasenyal.get_signalPhase()
        else:
            self.cdataset["unit"]= 'p.u.'
            self.cdataset["coord"]= 'complex'  
            self.cdataset[:,column]= lasenyal.get_signalReal()
            column+= 1
            self.cdataset[:,column]= lasenyal.get_signalImag()
        # guardar en attributes els noms de les variables dels components
        
    def close_h5(self):
        # close file
        self.ch5file.close()
