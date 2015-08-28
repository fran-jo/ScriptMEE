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
    ''' TODO: organize code in functions '''
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
    for meas, var in moOutputs.get_varList():
        modelSignal= var.split(',')
        nameComponent= meas.split('.')[0]
        nameMeasurement= meas.split('.')[1]
        h5pmu.set_senyalRect(meas, modelSignal[0], modelSignal[1])
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
    except ValueError:
        print "Mal! Mal! Mal! Verdadera mal! Por no decir borchenoso!" 
    values= []
    for idx in lindex:  
        idx= int(idx)
        values.append(moOutputs.get_nameVarList()[indexMapping[idx]])
    
    plt.figure(1)
    for meas in values: 
        lasenyal= h5pmu.get_senyal(meas) 
        plt.plot(lasenyal.get_sampleTime(), lasenyal.get_signalReal())
    plt.legend(values)
    plt.ylabel('Voltage (V)')
    plt.xlabel('Time (s)')
    plt.grid(b=True, which='both')
    plt.show()
    
#     command= objCOMC.plot(['bus4.p.vr'])
#     OMPython.execute(command)
#     print command
    
if __name__ == '__main__':
    main(sys.argv[1:])