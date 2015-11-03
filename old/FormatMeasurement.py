'''
Created on 24 jan 2014

@author: fragom
'''
import os, time

import classes.SignalMeasurement as signal
import h5py as h5


class FormatMeasurement:
    '''
    Formats all the signal phases of a measurement into a file using the standard HDF5 format
    file
    '''
    outPath= ''
    
    def __init__(self, _outPath, _samples):
        '''
        _outPath - inidicate the folder where output files should be stored
        '''
        self.outPath= _outPath.replace('\\','/')
        os.chdir(self.outPath)
        fileName= time.strftime("%H_%M_%S")+ 'SimulationOutputs.h5'
#         fileName= 'SimulationOutputs.h5'
        self.fitxer= h5.File(fileName, 'a')
        self.samples= _samples
        
    def h5_read_Signals(self, _signalType): 
        measurement= signal.SignalMeasurement(self.samples)
        
        sampleSet= self.fitxer['/samples']
        measurement.add_Samples(sampleSet[0,:])
        if _signalType== 'voltage':
            signalSet= self.fitxer['/voltage']
            measurement.add_SignalPhaseA(signalSet[0,:], signalSet[1,:])
            measurement.add_SignalPhaseB(signalSet[2,:], signalSet[3,:])
            measurement.add_SignalPhaseC(signalSet[4,:], signalSet[5,:])
        elif _signalType== 'current':
            signalSet= self.fitxer['/current']
            measurement.add_SignalPhaseA(signalSet[0,:], signalSet[1,:])
            measurement.add_SignalPhaseB(signalSet[2,:], signalSet[3,:])
            measurement.add_SignalPhaseC(signalSet[4,:], signalSet[5,:])
                               
        return measurement
    
    def h5_format_Signal(self, _measurement, _signalType):
        if _signalType== 'samples':
            if not "/samples" in self.fitxer:
                sampleSet= self.fitxer.create_dataset('samples', (1,self.samples))
            else:
                sampleSet= self.fitxer['/samples']
#             self.samples= len(_measurement.get_Samples())
            sampleSet[...]= _measurement.get_Samples()
        elif _signalType== 'voltage':
            if not "/voltage" in self.fitxer:
                signalSet= self.fitxer.create_dataset('voltage', (6,self.samples))
            else:
                signalSet= self.fitxer['/voltage']  
            signalSet[0,:]= _measurement.get_SignalPhaseA()[0]
            signalSet[1,:]= _measurement.get_SignalPhaseA()[1]
            signalSet[2,:]= _measurement.get_SignalPhaseB()[0]
            signalSet[3,:]= _measurement.get_SignalPhaseB()[1]
            signalSet[4,:]= _measurement.get_SignalPhaseC()[0]
            signalSet[5,:]= _measurement.get_SignalPhaseC()[1]             
        elif _signalType== 'current':
            if not "/current" in self.fitxer:
                signalSet= self.fitxer.create_dataset('current', (6,self.samples))
            else:
                signalSet= self.fitxer['/current']
            signalSet[0,:]= _measurement.get_SignalPhaseA()[0]
            signalSet[1,:]= _measurement.get_SignalPhaseA()[1]
            signalSet[2,:]= _measurement.get_SignalPhaseB()[0]
            signalSet[3,:]= _measurement.get_SignalPhaseB()[1]
            signalSet[4,:]= _measurement.get_SignalPhaseC()[0]
            signalSet[5,:]= _measurement.get_SignalPhaseC()[1]
        
    def h5_endFormat(self):
        self.fitxer.close()