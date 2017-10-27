'''
Created on 4 okt. 2017

@author: fragom
'''

from modelicares import SimRes
from matplotlib import pyplot as mplt

class ViewData(object):
    '''
    classdocs
    '''


    def __init__(self):
        '''
        Constructor
        '''
    
    @staticmethod
    def selectData(self, arrayQualquiera, message):
        count= 0
        indexMapping={}
        for i, meas in enumerate(arrayQualquiera):
            print '[%d] %s' % (i, meas)
            indexMapping[count]= i
            count+= 1
        try:
            value= raw_input(message)
            lindex = value.split()
        except ValueError:
            print "Wrong choice..." 
        values= []
        for idx in lindex:  
            idx= int(idx)
            values.append(arrayQualquiera[indexMapping[idx]])
        return values  
        
    @staticmethod
    def plotOutputs(self, resData):
        values= self.selectData(resData.names)
        mplt.figure(1)
        for senyal in values: 
            signal_magnitude= resData[senyal]
            signal_sampletime= resData["time"]
            mplt.plot(signal_sampletime, signal_magnitude)
        mplt.legend(values)
        mplt.ylabel("Units (p.u.)")
        mplt.xlabel('Time (s)')
        mplt.grid(b=True, which='both')
        mplt.show()