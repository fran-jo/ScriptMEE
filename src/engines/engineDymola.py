'''
Created on 4 apr 2014

@author: fragom
'''
import os

# from classes import OutVariableStream as outvar  
from classes.SimulatorDY import SimulatorDY 


class EngineDY(object):
    
    def __init__(self, sources= None, experiment= None):
        ''' Loading simulations resources. Parameters related to models to be simulated and libraries'''
        self.__sources= sources
        ''' Loading configuration values for the simulator solver '''
        self.__experiment= experiment
#         ''' Loading output variables of the model, their values will be stored in h5 and plotted '''
#         self.outputs= outvar.OutVariableStream(sys.argv[3])
        
    def simulate(self):
#         tic= timeit.default_timer()
        ''' add library path to MODELICAPATH, to recognize folder where library is available '''
        os.environ["MODELICAPATH"] = self.__sources.libraryFolder
        ''' Change path to model folder '''
        os.chdir(self.__sources.modelFolder)
        
        s= SimulatorDY([self.__sources.modelName, self.__sources.modelFile,
                        self.__sources.libraryFile, self.__sources.modelFolder,
                        self.__sources.outputFolder])
    #     s.showGUI(True)
    #     s.exitSimulator(False)
    #     s.addParameters({'vf1': 0.2, 'pm1': 0.02})
        s.setStopTime(self.__experiment.stopTime)
        s.setNumberOfIntervals(self.__experiment.numberOfIntervals)
        s.setTolerance(self.__experiment.tolerance)
        ''' setTimeOut kill the process if it does not finish in specific time'''
        s.setTimeOut('60')
        s.setSolver(self.__experiment.method)
        s.showProgressBar(False)
    #     s.printModelAndTime()
        s.simulate()
#         toc= timeit.default_timer()
#         print 'Simulation time ', toc- tic
    
#     def saveOutputs(self):
#         '''
#         TODO: This has to change, after using ModelicaRes
#         The structure of the saving format takes into account format measurements from PMU, form v/i, anglev/anglei 
#         '''
#         resultmat= self.__sources.modelName.split('.')[-1]
#         resultmat+= '.mat'
#         os.chdir(self.__sources.outputFolder)
#         h5Name=  self.__sources.modelName+ '_&'+ 'dymola'+ '.h5'
#         resulth5= self.__sources.outputFolder+ '/'+ h5Name
#         h5pmu= OutputH5Stream([self.__sources.outputFolder, resulth5, resultmat], 'dymola')
#         h5pmu.open_h5(h5Name) 
# #         print 'self.outputs.get_varList()', self.outputs.get_varList()
#         for compo, signalname in self.outputs.get_varList():
#             l_signals= signalname.split(',')
#             h5pmu.set_senyalRect(compo, l_signals[0], l_signals[1])
# #             print 'l_signals', l_signals
#             h5pmu.save_h5Names(compo, l_signals) 
#             h5pmu.save_h5Values(compo) 
#         h5pmu.close_h5()
#         ''' object h5 file with result data'''
#         return h5pmu
#     
#     def selectData(self, arrayQualquiera):
#         count= 0
#         indexMapping={}
#         for i, meas in enumerate(arrayQualquiera):
#             print '[%d] %s' % (i, meas)
#             indexMapping[count]= i
#             count+= 1
#         try:
#             value= raw_input("Select which variable do you want to plot: ")
#             lindex = value.split()
#         except ValueError:
#             print "Wrong choice..." 
#         values= []
#         for idx in lindex:  
#             idx= int(idx)
#             values.append(arrayQualquiera[indexMapping[idx]])
#         return values
#             
#     def plotOutputs(self, _h5data):
#         ''' TODO: This has to change, after using ModelicaRes'''
#         values= self.selectData(self.outputs.get_varNames())
#         plt.figure(1)
#         for meas in values: 
#             lasenyal= _h5data.get_senyal(meas) 
#             plt.plot(lasenyal.sampletime, lasenyal.magnitude)
#         plt.legend(values)
#         plt.ylabel(lasenyal.component)
#         plt.xlabel('Time (s)')
#         plt.grid(b=True, which='both')
#         plt.show()
