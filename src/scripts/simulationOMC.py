'''
Created on 5 apr 2014

@author: fragom
'''
import sys,timeit
import classes.SimulationResources as sp
from classes.OutputModelVar import OutputModelVar
import classes.SimulationConfigOMC as cfg
import classes.CommandOMC as comc
import OMPython
import matplotlib.pyplot as plt
from classes.StreamH5File import OutputH5Stream

def main(argv):
    ''' Loading simulations resources. Parameters related to models to be simulated and libraries'''
    obj= sp.SimulationResourcesOMC(sys.argv[1])
    moPath= obj.getModelPath()
    libPath= obj.getLibraryPath()
    moFile= obj.getModelFile()
    libFile= obj.getLibraryFile()
    moModel= obj.getModelName()
#     moInput= obj.getModelValuesFile()
    ''' loading the path to store the results '''
    outPath= obj.getOutputPath()
    ''' Loading configuration values for the simulator solver '''
    config= cfg.SimulationConfigOMC(sys.argv[2])
    simOptions= config.setSimOptions()
    ''' Loading output variables of the model, their values will be stored in h5 and plotted '''
    moOutputs= OutputModelVar(sys.argv[3])
    moOutputs.load_varList()

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
        ''' TODO: parametrized the input values, in case they are needed for the model '''
        command= objCOMC.simulate(moModel, simOptions, 'vf1=0.1,pm1=0.001')
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
    # create .h5 for writing
    h5pmu= OutputH5Stream([outPath,resulth5,resultmat])
    h5pmu.open_h5()
    print moOutputs.get_varList()
    for n,v in moOutputs.get_varList():
        modelSignal= v.split(',')
        nameComponent= n.split('.')[0]
        nameMeasurement= n.split('.')[1]
        h5pmu.set_senyalRect(n, modelSignal[0],modelSignal[1])
        h5pmu.save_h5(nameComponent, nameMeasurement) 
    h5pmu.close_h5()
    
    ''' TODO: parameterize these part of the script, allow user select which variable/s to plot '''
    # plot the results, this will be deleted and integrated in the JAVA GUI
    plt.figure(1)
#     plt.plot(result['time'], result[model.outputParams[0]],result['time'], result[model.outputParams[1]])
    plt.plot(h5pmu.get_senyal('bus3.V').get_sampleTime(), h5pmu.get_senyal('bus3.V').get_signalReal())
#     plt.plot(t, x1, t, x2)
#     plt.legend((model.outputParams[0],model.outputParams[1]))
    plt.legend('bus3.V')
#     plt.legend(('x1','x2'))
    plt.title('SMIB 1 Generator Fault at bus 3')
    plt.ylabel('Voltage (V)')
    plt.xlabel('Time (s)')
    plt.show()
    
#     command= objCOMC.plot(['bus4.p.vr'])
#     OMPython.execute(command)
#     print command
    
if __name__ == '__main__':
    main(sys.argv[1:])