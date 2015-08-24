'''
Created on 26 maj 2015

@author: fragom
'''
import itertools

class Signal(object):
    '''
    classdocs, clase base trabaja con complejos
    '''
    
    def __init__(self):
        '''
        Constructor
        '''
        self.csamples= 0
        self.csignal_cmp = []
        self.ccomponent= ''

    def get_csamples(self):
        ''' return the number of samples of the singal '''
        return self.csamples

    
    def get_signal(self):
        ''' return the signal in rectangular form '''
        return self.csignal_cmp
    
    def get_sampleTime(self):
        ''' returns an array with values of sample/time '''
        series= []
        for s,r,i in self.csignal_cmp:
            series.append(s)
        return series 
    
    def get_signalReal(self):
        ''' returns an array with real component of the signal'''
        series= []
        for s,r,i in self.csignal_cmp:
            series.append(r)
        return series    
        
    def get_signalImag(self):
        ''' returns an array with imaginary component of the signal '''
        series= []
        for s,r,i in self.csignal_cmp:
            series.append(i)
        return series    

    def get_ccomponent(self):
        ''' returns the name of the component which the signal belongs to '''
        return self.ccomponent  


    def set_csamples(self, _value):
        ''' _value: input sample/time array '''
        self.csamples = len(_value)
       
    def set_signalRect(self, _samples, _valueR, _valueI):
        ''' create dictionary with real part of the complex signal
        _samples:
        _valueR: '''
        self.csignal_cmp= [(s,r,i) for s,r,i in zip(_samples, _valueR, _valueI)]
        self.csamples= len(self.csignal_cmp)


    def set_ccomponent(self, value):
        ''' set the name of the component which the signal belongs to '''
        self.ccomponent = value


    def del_csamples(self):
        del self.csamples


    def del_signal(self):
        del self.csignal_cmp


    def del_ccomponent(self):
        del self.ccomponent

    samples = property(get_csamples, set_csamples, del_csamples, "csamples's docstring")
    signalCmp = property(get_signal, set_signalRect, del_signal, "csignal_a's docstring")
    component = property(get_ccomponent, set_ccomponent, del_ccomponent, "ccomponent's docstring")

        
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

    
    def get_signal(self):
        ''' return the signal in rectangular form '''
        return self.csignal_cmp
    
    def get_signalMag(self):
        ''' returns an array with magnitude component of the signal '''
        series= []
        for s,m,p in self.csignal_cmp:
            series.append(m)
        return series    
        
    def get_signalPhase(self):
        ''' returns an array with phase component of the signal '''
        series= []
        for s,m,p in self.csignal_cmp:
            series.append(p)
        return series    
    
    
    def set_signalPolar(self, _samples, _valueM, _valueP):
        ''' create dictionary with real part of the complex signal
        _samples:
        _valueR: '''
        self.csignal_cmp= [(s,r,i) for s,r,i in zip(_samples, _valueM, _valueP)]
        self.csamples= len(self.csignal_cmp)


    def del_signal(self):
        del self.csignal_cmp
        
        
    signalPolar = property(get_signal, set_signalPolar, del_signal, "csignal_pol's docstring")


    def complex2Polar(self):
        pass
    
    def polar2Complex(self):
        pass    
    
