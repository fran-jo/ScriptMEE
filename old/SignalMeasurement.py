'''
Created on 24 jan 2014

@author: fragom
'''

class SignalMeasurement:
    
    def __init__(self, _dim):
        '''
        Constructor. Initializes sample time vector and 4 vectors for each phase of a measurement
        '''
        self.time= [i for i in range(_dim)]
        ''' Dynamic creation of lists. Implementation of lists using python principles '''
        # each array is a 2D array, for voltage and current
        self.phaseA= [[i for i in range(_dim)],[i for i in range(_dim)]]
        self.phaseB= [[i for i in range(_dim)],[i for i in range(_dim)]]
        self.phaseC= [[i for i in range(_dim)],[i for i in range(_dim)]]
        
    def add_Samples(self, _time):
        ''' Add samples from sample time '''
        self.time= [sample for sample in _time]
        
    def add_SignalPhaseA(self, _signalR, _signalIm):
        ''' Add the time series for phase A to the structure '''
        self.phaseA[0]= [r for r in _signalR]
        if not _signalIm== []:
            self.phaseA[1]= [im for im in _signalIm]
    
    def add_SignalPhaseB(self, _signalR, _signalIm):
        ''' Add the time series for phase B to the structure '''
        self.phaseB[0]= [r for r in _signalR]
        if not _signalIm== []:
            self.phaseB[1]= [im for im in _signalIm]
    
    def add_SignalPhaseC(self, _signalR, _signalIm):
        ''' Add the time series for phase C to the structure '''
        self.phaseC[0]= [r for r in _signalR]
        if not _signalIm== []:
            self.phaseC[1]= [im for im in _signalIm]
        
    def get_Samples(self):
        ''' Get samples from the sample time vector '''
        return self.time

    def get_SignalPhaseA(self):
        return self.phaseA
    
    def get_SignalPhaseB(self):
        return self.phaseB
    
    def get_SignalPhaseC(self):
        return self.phaseC