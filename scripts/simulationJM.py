
'''
Created on 4 apr 2014

@author: fragom
'''
import sys, timeit
from pymodelica import compile_fmu
from pyfmi import load_fmu
from classes.ModelParameters import JMModelParams
import matplotlib.pyplot as plt # plot library
import classes.SignalMeasurement as signal
import classes.FormatMeasurement as fm
import classes.SimulationProperties as sp
import classes.SimulationConfigJM as cfg

def main(argv):
    ''' loading simulations resources. Parameters related to models and libraries to be simulated'''
    obj= sp.SimulationJMProperties(sys.argv[1])
    moPath= obj.getModelPath()
    libPath= obj.getLibraryPath()
    moFile= obj.getModelFile()
    moModel= obj.getModelName()
    moInput= obj.getModelValuesFile()
    outPath= obj.getOutputPath()
    ''' Loading configuration values for the simulator solver '''
    config= cfg.SimulationConfigJM(sys.argv[2])

    tic= timeit.default_timer()
    # Simulation process with JModelica
    absPathFile= moPath + moFile
#     print simRes.getModelName()
#     print absPathFile
#     print simRes.getLibraryPath()
    '''build the fmu block from the modelica model '''
    fmu_name= compile_fmu(moModel, absPathFile,
                           compiler_options = {'extra_lib_dirs':libPath})
    # Load the model
    model_fmu= load_fmu(fmu_name)
    moParams= JMModelParams(moPath, moInput)
    moParams.loadModelValues()
#     print absInputFile
    '''check if the dictionary inputs is not empty, 
    with model_fmu.set(key,value) input values are given to the model '''
    if moParams.getModelInputs()!= {}:
        for key, value in moParams.getModelInputs().iteritems():
            print key, value
            model_fmu.set(key,value)
    
    ''' Load the list of options for the JModelica compiler '''
    opts = model_fmu.simulate_options()
    opts['solver']= config.getSolver()
    opts['ncp']= config.getNcp()
#     for key,value in simOpt.getOptions().items():
#         print key,value
#         opts[key] = value
    print opts
    result = model_fmu.simulate(start_time= config.getStartTime(), 
                                final_time= config.getStopTime(), 
                                options=opts)
    
    toc= timeit.default_timer()
#         print('Simulation time: ')
    print (toc - tic) #elapsed time in seconds
    # ---
    
    # Create SignalMeasurement object with the signal outputs of the simulation
    # TODO change this according to outputs
    measurement= signal.SignalMeasurement(len(result['time']))
    #print len(x1), len(x2), len(t)
    measurement.add_Samples(result['time'])
    measurement.add_SignalPhaseA(result[moParams.getModelOutputs()[0]], [])
#     measurement.add_SignalPhaseB(result[model.outputParams[1]], [])
    # Store outputs into HDF5 format
    parser= fm.FormatMeasurement(outPath, len(result['time']))
    parser.h5_format_Signal(measurement,'samples')
    parser.h5_format_Signal(measurement,'voltage')
    parser.h5_endFormat()
    # plot the results, this will be deleted and integrated in the JAVA GUI
    plt.figure(1)
#     plt.plot(result['time'], result[model.outputParams[0]],result['time'], result[model.outputParams[1]])
    plt.plot(result['time'], result[moParams.getModelOutputs()[0]])
#     plt.plot(t, x1, t, x2)
#     plt.legend((model.outputParams[0],model.outputParams[1]))
    plt.legend(moParams.getModelOutputs()[0])
#     plt.legend(('x1','x2'))
    plt.title('SMIB 1 Generator Fault at bus 3')
    plt.ylabel('Voltage (V)')
    plt.xlabel('Time (s)')
    plt.show()
    # ---
    
if __name__ == '__main__':
    main(sys.argv[1:])