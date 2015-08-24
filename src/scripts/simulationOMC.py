'''
Created on 5 apr 2014

@author: fragom
'''
import sys,timeit
import classes.SimulationProperties as sp
from classes.ModelParameters import OMCModelParams
import classes.SimulationConfigOMC as cfg
import classes.CommandOMC as comc
import OMPython
# from modelicares import SimRes
# import classes.SignalMeasurement as signal
# import classes.FormatMeasurement as fm
import matplotlib.pyplot as plt # plot library
from classes import PhasorMeasH5

def main(argv):
    ''' Loading simulations resources. Parameters related to models to be simulated and libraries'''
    obj= sp.SimulationOMCProperties(sys.argv[1])
    moPath= obj.getModelPath()
    libPath= obj.getLibraryPath()
    moFile= obj.getModelFile()
    libFile= obj.getLibraryFile()
    moModel= obj.getModelName()
    moInput= obj.getModelValuesFile()
    ''' loading the path to store the results '''
    outPath= obj.getOutputPath()
    ''' Loading configuration values for the simulator solver '''
    config= cfg.SimulationConfigOMC(sys.argv[2])
    simOptions= config.setSimOptions()
    ''' Loading input and output attributes values for the model '''
    moParams= OMCModelParams( moInput)
    moParams.loadModelValues()
    
    # routine to initialize values from power flow solution
#     model.getInitNames_Dymola(moInputFile, 186)
#     model.getInitValues_Dymola(moInputFile, 186)
#     initParams= model.setInitValues_OM()

    tic= timeit.default_timer()
    objCOMC= comc.CommandOMC()
    # Load and execute model
    '''Load Modelica library'''
    OMPython.execute("loadModel(Modelica)") 
    '''loading the model we want to simulate'''
    '''extract model name from path'''
    command= objCOMC.loadFile(libPath, libFile)
    print '1) Command', command
    OMPython.execute(command)
    command= objCOMC.loadFile(moPath, moFile)
    print '2) Command', command
    success= OMPython.execute(command)
    if (success):
        command= objCOMC.simulate(moModel, simOptions, moParams.getModelInputs())
#         command= objCOMC.simulate(moModel, simOptions, False)
        print '3) Command', command
        result= OMPython.execute(command)
        print '1) Result', result
    filename = OMPython.get(result,'SimulationResults.resultFile')
    print '2) Result file ', filename
    resultfile= objCOMC.saveResult(filename, outPath)
#     print '4) Command', command
#     result= OMPython.execute(command)
#     print '3) Result file', result
    toc= timeit.default_timer()
    print('Simulation')
    print (toc - tic) #elapsed time in seconds
    
    # build file path with outputpath, using the ModelicaRes to read the .mat file
    resultmat= outPath+ '/'+ resultfile
    resulth5= outPath+ '/'+ 'SimulationOutputs.h5'
    h5pmu= PhasorMeasH5.PhasorMeasH5([outPath,resulth5,resultmat])
    h5pmu.set_senyalRect("bus4.p.vr","bus4.p.vi")
    # save meas to h5 file   
    h5pmu.create_h5('bus4')
    h5pmu.save_h5('V')
   
    # plot the results, this will be deleted and integrated in the JAVA GUI
    plt.figure(1)
#     plt.plot(result['time'], result[model.outputParams[0]],result['time'], result[model.outputParams[1]])
    plt.plot(h5pmu.get_senyal().get_sampleTime(), h5pmu.get_senyal().get_signalReal())
#     plt.plot(t, x1, t, x2)
#     plt.legend((model.outputParams[0],model.outputParams[1]))
    plt.legend('bus4.p.vr')
#     plt.legend(('x1','x2'))
    plt.title('SMIB 1 Generator Fault at bus 4')
    plt.ylabel('Voltage (V)')
    plt.xlabel('Time (s)')
    plt.show()
    
#     command= objCOMC.plot(['bus4.p.vr'])
#     OMPython.execute(command)
#     print command
    
if __name__ == '__main__':
    main(sys.argv[1:])