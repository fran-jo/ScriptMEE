'''
Created on 28 aug 2015

@author: fragom
'''

from classes.StreamH5File import OutputH5Stream
from classes.OutputModelVar import OutputModelVar
import matplotlib.pyplot as plt
import numpy

if __name__ == '__main__':
    moOutputs= OutputModelVar('./models/smib2lwfault_varList.properties')
    moOutputs.load_varList()
    
    outPath= 'C:/Users/fragom/PhD_CIM/Modelica/Models/Results/OpenModelica/'
    resultmat= 'C:/Users/fragom/PhD_CIM/Modelica/Models/Results/OpenModelica/SmarTSLab.Models.smibwbuseswfault_res.mat'
    resulth5= 'C:/Users/fragom/PhD_CIM/Modelica/Models/Results/OpenModelica/SimulationOutputs.h5'
    # create .h5 for writing
    h5pmu= OutputH5Stream([outPath,resulth5,resultmat])
    h5pmu.open_h5()
    ''' TODO: try these algorithm with one variable name, multiple variable name in properties '''
    for meas, var in moOutputs.get_varList():
#         print 'meas ', meas
#         print 'var ', var
        modelSignal= var.split(',')
#         print 'modelSignal ', modelSignal
        nameComponent= meas.split('.')[0]
#         print 'nameComponent ', nameComponent
        nameMeasurement= meas.split('.')[1]
#         print 'nameMeasurement ', nameMeasurement
        if len(modelSignal)> 1:
            h5pmu.set_senyalRect(meas, modelSignal[0], modelSignal[1])
        else:
            h5pmu.set_senyalRect(meas, modelSignal[0], [])
        h5pmu.save_h5(nameComponent, nameMeasurement) 
    h5pmu.close_h5()
    
    count= 0
    indexMapping={}
    for i, meas in enumerate(moOutputs.get_nameVarList()):
        print '[%d] %s' % (i, meas)
        indexMapping[count]= i
        count+= 1
    try:
        value= raw_input("Select which variable do you want to plot: ")
        lindex = value.split()
        print 'idx ', lindex
    except ValueError:
        print "Mal! Mal! Mal! Verdadera mal! Por no decir borchenoso!" 
    values= []
    for idx in lindex:  
        idx= int(idx)
        values.append(moOutputs.get_nameVarList()[indexMapping[idx]])
    print 'option ', values
    
    ''' TODO: be sure to print the signals we have selected '''
    # plot the results, this will be deleted and integrated in the JAVA GUI
    fig= plt.figure(1)
    ax = fig.gca()
#     plt.plot(result['time'], result[model.outputParams[0]],result['time'], result[model.outputParams[1]])
    ''' TODO: change API to get multiple signals '''
    for meas in values: 
        lasenyal= h5pmu.get_senyal(meas) 
        plt.plot(lasenyal.get_sampleTime(), lasenyal.get_signalReal())
#     plt.plot(t, x1, t, x2)
#     plt.legend((model.outputParams[0],model.outputParams[1]))
#     ax.set_xticks(numpy.arange(0,len(lasenyal.get_sampleTime()),1))
#     ax.set_yticks(numpy.arange(0,len(lasenyal.get_signalReal()),10))
    plt.legend(values)
#     plt.legend(('x1','x2'))
    plt.ylabel('Voltage (V)')
    plt.xlabel('Time (s)')
    plt.grid(b=True, which='both')
    plt.show()