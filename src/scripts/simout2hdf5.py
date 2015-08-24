'''
Created on 10 jan 2014

Example script for extracting Voltage and Current values from
simulation outputs

@author: fragom
'''

import timeit
import time
import sys

import classes.SignalMeasurement as signal
import classes.FormatMeasurement as parser
from modelicares import SimRes
import numpy as np
      
#===============================================================================
# class SignalMeasurement:
#     
#     def __init__(self, _dim):
#         '''
#         Constructor. Initializes sample time vector and 4 vectors for each phase of a measurement
#         '''
#         self.time= [i for i in range(_dim)]
#         ''' Dynamic creation of lists. Implementation of lists using python principles '''
#         self.phaseA= [[i for i in range(_dim)],[i for i in range(_dim)]]
#         self.phaseB= [[i for i in range(_dim)],[i for i in range(_dim)]]
#         self.phaseC= [[i for i in range(_dim)],[i for i in range(_dim)]]
#         
#     def add_Samples(self, _time):
#         ''' Add samples from sample time '''
#         self.time= [sample for sample in _time]
#         
#     def add_SignalPhaseA(self, _signalR, _signalIm):
#         ''' Add the time series for phase A to the structure '''
#         self.phaseA[0]= [r for r in _signalR]
#         self.phaseA[1]= [im for im in _signalIm]
#     
#     def add_SignalPhaseB(self, _signalR, _signalIm):
#         ''' Add the time series for phase B to the structure '''
#         self.phaseB[0]= [r for r in _signalR]
#         self.phaseB[1]= [im for im in _signalIm]
#     
#     def add_SignalPhaseC(self, _signalR, _signalIm):
#         ''' Add the time series for phase C to the structure '''
#         self.phaseC[0]= [r for r in _signalR]
#         self.phaseC[1]= [im for im in _signalIm]
#         
#     def get_Samples(self):
#         ''' Get samples from the sample time vector '''
#         return self.time
# 
#     def get_SignalPhaseA(self):
#         return self.phaseA
#     
#     def get_SignalPhaseB(self):
#         return self.phaseB
#     
#     def get_SignalPhaseC(self):
#         return self.phaseC
#===============================================================================
    
#===============================================================================
# class FormatMeasurement:
#     '''
#     Formats all the signal phases of a measurement into a file using the standard HDF5 format
#     file
#     '''
#     def __init__(self, _samples):
#         #fileName= time.strftime("%H_%M_%S")+ 'SimulationOutputs.h5'
#         fileName= 'SimulationOutputs.h5'
#         self.fitxer= h5.File(fileName, 'a')
#         self.samples= _samples
#         
#     def h5_read_Signals(self, _signalType): 
#         measurement= SignalMeasurement(self.samples)
#         
#         sampleSet= self.fitxer['/samples']
#         measurement.add_Samples(sampleSet[0,:])
#         if _signalType== 'voltage':
#             signalSet= self.fitxer['/voltage']
#             measurement.add_SignalPhaseA(signalSet[0,:], signalSet[1,:])
#             measurement.add_SignalPhaseB(signalSet[2,:], signalSet[3,:])
#             measurement.add_SignalPhaseC(signalSet[4,:], signalSet[5,:])
#         elif _signalType== 'current':
#             signalSet= self.fitxer['/current']
#             measurement.add_SignalPhaseA(signalSet[0,:], signalSet[1,:])
#             measurement.add_SignalPhaseB(signalSet[2,:], signalSet[3,:])
#             measurement.add_SignalPhaseC(signalSet[4,:], signalSet[5,:])
#                                
#         return measurement
#     
#     def h5_format_Signal(self, _measurement, _signalType):
#         if _signalType== 'samples':
#             if not "/samples" in self.fitxer:
#                 sampleSet= self.fitxer.create_dataset('samples', (1,self.samples))
#             else:
#                 sampleSet= self.fitxer['/samples']
#             sampleSet[...]= _measurement.get_Samples()
#         elif _signalType== 'voltage':
#             if not "/voltage" in self.fitxer:
#                 signalSet= self.fitxer.create_dataset('voltage', (6,self.samples))
#             else:
#                 signalSet= self.fitxer['/voltage']  
#             signalSet[0,:]= _measurement.get_SignalPhaseA()[0]
#             signalSet[1,:]= _measurement.get_SignalPhaseA()[1]
#             signalSet[2,:]= _measurement.get_SignalPhaseB()[0]
#             signalSet[3,:]= _measurement.get_SignalPhaseB()[1]
#             signalSet[4,:]= _measurement.get_SignalPhaseC()[0]
#             signalSet[5,:]= _measurement.get_SignalPhaseC()[1]             
#         elif _signalType== 'current':
#             if not "/current" in self.fitxer:
#                 signalSet= self.fitxer.create_dataset('current', (6,self.samples))
#             else:
#                 signalSet= self.fitxer['/current']
#             signalSet[0,:]= _measurement.get_SignalPhaseA()[0]
#             signalSet[1,:]= _measurement.get_SignalPhaseA()[1]
#             signalSet[2,:]= _measurement.get_SignalPhaseB()[0]
#             signalSet[3,:]= _measurement.get_SignalPhaseB()[1]
#             signalSet[4,:]= _measurement.get_SignalPhaseC()[0]
#             signalSet[5,:]= _measurement.get_SignalPhaseC()[1]
#         
#     def h5_endFormat(self):
#         self.fitxer.close()
#===============================================================================
        
def main(argv):
    tic= timeit.default_timer()
    
    simulationOutput = SimRes(sys.argv[1])
    voltage = signal.SignalMeasurement(len(simulationOutput.get_values('time')))
    current = signal.SignalMeasurement(len(simulationOutput.get_values('time')))
    voltage.add_Samples(simulationOutput.get_values('time'))
    current.add_Samples(simulationOutput.get_values('time'))
    #=========================================================================== 
    # print(signals.get_Samples())
    # print(len(signals.get_Samples()))'''
    #===========================================================================
    '''TODO: must select the variables from a property file '''
    bus2_vi= 'bus2.p.vi'
    bus2_vr= 'bus2.p.vr'
    bus2_ii= 'bus2.p.ii'
    bus2_ir= 'bus2.p.ir'
    #=========================================================================== 
    # print(simulationOutput.get_values(bus2_vi))
    # print(len(signals.get_Signal(0)))
    #=========================================================================== 
    voltage.add_SignalPhaseA(simulationOutput.get_values(bus2_vr),
                        simulationOutput.get_values(bus2_vi))
    current.add_SignalPhaseA(simulationOutput.get_values(bus2_ir),
                        simulationOutput.get_values(bus2_ii))
    #=========================================================================== 
    # print(signals.get_Samples())
    # print(signals.get_Voltage('R'))
    # print(signals.get_Voltage('I'))
    #===========================================================================
    
    h5db= parser.FormatMeasurement(len(voltage.get_Samples()))
    h5db.h5_format_Signal(voltage, 'samples')
    h5db.h5_format_Signal(voltage, 'voltage')
    h5db.h5_format_Signal(current, 'current')
    h5db.h5_endFormat()
    
    toc= timeit.default_timer()
    print (toc - tic) #elapsed time in seconds
   
    tic= timeit.default_timer()
    
    h5db= parser.FormatMeasurement(1)
    new_voltage= h5db.h5_read_Signals('voltage')
    print('Voltage')
    print(new_voltage.get_Samples())
    print(new_voltage.get_SignalPhaseA())
    new_current= h5db.h5_read_Signals('current')
    print('Current')
    print(new_current.get_Samples())
    print(new_current.get_SignalPhaseA())
    
    toc= timeit.default_timer()
    print (toc - tic) #elapsed time in seconds
    #===========================================================================
    # if sys.argv[3]== 'V'
    #    signals.add_Signals(sim.get_values(varName)) 
    #===========================================================================
    #===========================================================================
    # print(sim.names())  
    # print(sim.get_values('Time\x00'))
    # signals= list()
    # signals.append(sim.get_values('Time\x00'))
    #===========================================================================
    
if __name__ == '__main__':
    main(sys.argv[1:])