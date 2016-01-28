'''
Created on 26 maj 2015

@author: fragom
'''

from __builtin__ import str

class Signal(object):
    '''
    classdocs, clase base trabaja con complejos
    '''
    
    def __init__(self):
        '''
        Constructor
        '''
        self._samples= 0
        self._signal = []
        self._component= ''

    def get_samples(self):
        ''' return the number of samples of the singal '''
        return self._samples

    def get_signal(self):
        ''' return the signal in rectangular form '''
        return self._signal
    
    def get_sampleTime(self):
        ''' returns an array with values of sample/time '''
        series= []
        for s,r,i in self._signal:
            series.append(s)
        return series 
    
    def get_signalReal(self):
        ''' returns an array with real component of the signal'''
        series= []
        for s,r,i in self._signal:
            series.append(r)
        return series    
        
    def get_signalImaginary(self):
        ''' returns an array with imaginary component of the signal '''
        series= []
        for s,r,i in self._signal:
            series.append(i)
        return series    

    def get_ccomponent(self):
        ''' returns the name of the component which the signal belongs to '''
        return self._component  


    def set_csamples(self, _value):
        ''' _value: input sample/time array '''
        self._samples = len(_value)
      
    def set_signal(self, samples, valueR, valueI):
        ''' create dictionary with real part of the complex signal
        _samples:
        _valueR: '''
        self._signal= [(s,r,i) for s,r,i in zip(samples, valueR, valueI)]
        self._samples= len(self._signal)


    def set_ccomponent(self, value):
        ''' set the name of the component which the signal belongs to '''
        self._component = value


    def del_csamples(self):
        del self._samples

    def del_signal(self):
        del self._signal

    def del_ccomponent(self):
        del self._component

    def __str__(self):
        estrin= self._component+ " "+ str(self._samples)+ " samples: "
        return estrin
    
    def __repr__(self):
        return self.__str__()
        
from math import sqrt
from numpy import arctan2, abs, sin, cos

class SignalPMU(Signal):
    '''
    classdocs
    '''

    def __init__(self):
        '''
        Constructor, clase que trabaja con representacion polar'''
        ''' oye, convierte las arrays en dictionarios, el key value siempre must be el tiempo, so
        self.signal = {(magnitude, angle)}
        '''
        Signal.__init__(self)
    
    def get_signalMag(self):
        ''' returns an array with magnitude component of the signal '''
        series= []
        for s,m,p in self._signal:
            series.append(m)
        return series    
        
    def get_signalPhase(self):
        ''' returns an array with phase component of the signal '''
        series= []
        for s,m,p in self._signal:
            series.append(p)
        return series    
    
    
    def set_signalPolar(self, sampletime, value_mag, value_ph):
        ''' create dictionary with real part of the complex signal
        _samples:
        _valueR: '''
        self._signal= zip(sampletime, value_mag, value_ph)
        self._samples= len(self._signal)


    def del_signal(self):
        del self._signal
        

    def complex2Polar(self):
        pass
    
    def polar2Complex(self):
        pass    
    
