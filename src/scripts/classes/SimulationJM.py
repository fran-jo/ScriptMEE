
'''
Created on 4 apr 2014

@author: fragom
'''
from pyfmi import load_fmu
from pymodelica import compile_fmu
import sys, timeit

from classes.OutputModelVar import OutputModelVar
import classes.SimulationConfigJM as simconfig
import classes.SimulationResources as simsource
from classes.StreamH5File import OutputH5Stream
import matplotlib.pyplot as plt  # plot library


# import classes.SignalMeasurement as signal
# import classes.FormatMeasurement as fm
class SimulationJM():
    
    def __init__(self, argv):
        '''TODO: LOG parameters '''
        ''' sys.argv is array of parameters 
        sys.argv[1]: file with simulation resources, a.k.a. model file, library file, output folder,
        sys.argv[2]: file with configuration of the simulator compiler
        sys.argv[3]: file containing the name of outputs of the model to be saved in h5 and plotted
        '''
        ''' Loading simulations resources. Parameters related to models to be simulated and libraries'''
        self.sources= simsource.SimulationResources([sys.argv[1],'r'])
        ''' Loading configuration values for the simulator solver '''
        self.config= simconfig.SimulationConfigJM(sys.argv[2])
        ''' Loading output variables of the model, their values will be stored in h5 and plotted '''
        self.outputs= OutputModelVar(sys.argv[3])
        
        
    def loadSources(self):
        ''' TODO: LOG sources files and models '''
        self.sources.load_Properties()
        self.moPath= self.sources.get_modelPath()
        self.moFile= self.sources.get_modelFile()
        self.libPath= self.sources.get_libraryPath()
        self.libFile= self.sources.get_libraryFile()
        self.moModel= self.sources.get_modelName()
        self.outPath= self.sources.get_outputPath()
        self.outputs.load_varList()
        ''' TODO: LOG configuration '''
        
    def simulate(self):
        ''' TODO: LOG all command omc '''
        tic= timeit.default_timer()
        # Simulation process with JModelica
        absolutePath= self.moPath + self.moFile
        '''build the fmu block from the modelica model '''
        fmu_name= compile_fmu(self.moModel, absolutePath,
                               compiler_options = {'extra_lib_dirs':self.libPath})
        ''' Load the model '''
        model_fmu= load_fmu(fmu_name)
    
        ''' Load the list of options for the JModelica compiler '''
        opts = model_fmu.simulate_options()
        opts['solver']= self.config.getSolver()
        opts['ncp']= self.config.getNcp()
    #     for key,value in simOpt.getOptions().items():
    #         print key,value
    #         opts[key] = value
        print opts
        result = model_fmu.simulate(start_time= self.config.getStartTime(), 
                                    final_time= self.config.getStopTime(), 
                                    options=opts)
    
        toc= timeit.default_timer()
        print 'Simulation time ', toc- tic
        '''TODO: study the units of elapsed time '''
        
        return result
    
    def saveOutputs(self, _resultfile):
        ''' build file path with outputpath, using the ModelicaRes to read the .mat file '''
        resultmat= self.outPath+ '/'+ _resultfile
        h5Name=  self.moModel+ '_&'+ 'jmodelica'+ '.h5'
        resulth5= self.outPath+ '/'+ h5Name
        # create .h5 for writing
        h5pmu= OutputH5Stream([self.outPath,resulth5,resultmat], 'omc')
        h5pmu.open_h5(self.moModel)    
        '''This loop to store output signals, for analysis and plotting, into memory'''
        for meas, var in self.outputs.get_varList():
            modelSignal= var.split(',')
            nameComponent= meas.split('.')[0]
#             nameMeasurement= meas.split('.')[1]
            if len(modelSignal)> 1:
                h5pmu.set_senyalRect(meas, modelSignal[0], modelSignal[1])
            else:
                h5pmu.set_senyalRect(meas, modelSignal[0], [])
        h5pmu.save_h5Names(nameComponent, meas) 
        h5pmu.save_h5Values(nameComponent, meas) 
        
        h5pmu.close_h5()
        ''' object h5 file with result data'''
        return h5pmu
    
    def plotOutputs(self, _h5data):
        count= 0
        indexMapping={}
        for i, meas in enumerate(self.outputs.get_varNames()):
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
            values.append(self.outputs.get_varNames()[indexMapping[idx]])
        plt.figure(1)
        for meas in values: 
            lasenyal= _h5data.get_senyal(meas) 
            plt.plot(lasenyal.get_sampleTime(), lasenyal.get_signalReal())
        plt.legend(values)
        plt.ylabel(lasenyal.component)
        plt.xlabel('Time (s)')
        plt.grid(b=True, which='both')
        plt.show()
         
    #     command= objCOMC.plot(['bus4.p.vr'])
    #     OMPython.execute(command)
    #     print command
    