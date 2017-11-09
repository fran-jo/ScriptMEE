'''
Created on 5 apr 2014

@author: fragom
'''
import sys, os
from config import CompilerResources
from config import SimulationConfigOMC
from engines.engineOpenModelica import EngineOMC
from modelicares import SimRes
from utilsmee import ViewData

         
def load_Sources(__filesource):
    __sources= CompilerResources([__filesource,'r'])
    __sources.load_Properties()
    print "Model Folder: "+ __sources.modelFolder
    print "Model File: "+ __sources.modelFile
    print "Model Name: "+ __sources.modelName
    print "Library Folder: "+ __sources.libraryFolder
    print "Library File: "+ __sources.libraryFile
    print "Output Folder: "+ __sources.outputFolder
    valuechange= raw_input("Do you want to change any value (y/n) ?: ")
    if valuechange== 'y' or valuechange=='Y':
        valueconfig= raw_input("Model Folder: ")
        __sources.modelFolder= valueconfig if valueconfig!= '' else __sources.modelFolder
        valueconfig= raw_input("Model File: ")
        __sources.modelFile= valueconfig if valueconfig!= '' else __sources.modelFile
        valueconfig= raw_input("Model Name: ")
        __sources.modelName= valueconfig if valueconfig!= '' else __sources.modelName
        valueconfig= raw_input("Library Folder: ")
        __sources.libraryFolder= valueconfig if valueconfig!= '' else __sources.libraryFolder
        valueconfig= raw_input("Output Folder: ")
        __sources.outputFolder= valueconfig if valueconfig!= '' else __sources.outputFolder
    return __sources
        
def load_configuration(__fileconfig):
    __solverconfig= SimulationConfigOMC([__fileconfig,'r'])
    __solverconfig.load_Properties()
    print "Start Time: "+ __solverconfig.startTime
    print "Stop File: "+ __solverconfig.stopTime
    print "Number of Intervals: "+ __solverconfig.numberOfIntervals
    print "Solver: "+ __solverconfig.method
    print "Tolerance: "+ __solverconfig.tolerance
    print "Output Format: "+ __solverconfig.outputFormat 
    valuechange= raw_input("Do you want to change any value (y/n) ?: ")
    if valuechange== 'y' or valuechange=='Y':
        valueconfig= raw_input("Start Time: ")
        __solverconfig.startTime= valueconfig if valueconfig!= '' else __solverconfig.startTime
        valueconfig= raw_input("Stop File: ")
        __solverconfig.stopTime= valueconfig if valueconfig!= '' else __solverconfig.stopTime
        valueconfig= raw_input("Number of Intervals: ")
        __solverconfig.numberOfIntervals= valueconfig if valueconfig!= '' else __solverconfig.numberOfIntervals
        valueconfig= raw_input("Solver: ")
        __solverconfig.method= valueconfig if valueconfig!= '' else __solverconfig.method
        valueconfig= raw_input("Tolerance: ")
        __solverconfig.tolerance= valueconfig if valueconfig!= '' else __solverconfig.tolerance
    return __solverconfig

def simulate(__sources, __solverconfig):
    simCity= EngineOMC(__sources, __solverconfig)
    simCity.numberOfIntervals= __solverconfig.numberOfIntervals
    simCity.solver= __solverconfig.method
    simCity.startTime= __solverconfig.startTime
    simCity.stopTime= __solverconfig.stopTime
    simCity.tolerance= __solverconfig.tolerance
    simCity.resultFile= __sources.modelName
    simCity.simulate()
    ''' TODO get the result file '''
#     print 'simCity.resultFile ', simCity.resultFile
    simulationResult= __sources.outputFolder+ os.sep+ simCity.resultFile
#     print simulationResult
    return SimRes(simulationResult)
    
#     def saveOutputs(self, _resultfile):
#         ''' build file path with outputpath, using the ModelicaRes to read the .mat file 
#         The structure of the saving format takes into account format measurements from PMU, form v/i, anglev/anglei 
#         '''
#         resultmat= self.outPath+ '/'+ _resultfile
#         h5Name=  self.moModel+ '_&'+ 'openmodelica'+ '.h5'
#         resulth5= self.outPath+ '/'+ h5Name
#         # create .h5 for writing
#         h5pmu= OutputH5Stream([self.outPath,resulth5,resultmat], 'openmodelica')
#         h5pmu.open_h5(self.moModel)    
#         '''This loop to store output signals, for analysis and plotting, into memory'''
#         for meas, signalname in self.outputs.get_varList():
#             modelSignal= signalname.split(',')
#             nameComponent= meas.split('.')[0]
# #             nameMeasurement= meas.split('.')[1]
#             if len(modelSignal)> 1:
#                 h5pmu.set_senyalRect(meas, modelSignal[0], modelSignal[1])
#             else:
#                 h5pmu.set_senyalRect(meas, modelSignal[0], [])
#             h5pmu.save_h5Names(nameComponent, meas) 
#             h5pmu.save_h5Values(nameComponent) 
#         h5pmu.close_h5()
#         ''' object h5 file with result data'''
#         return h5pmu
    
if __name__ == '__main__':
    sources= load_Sources(sys.argv[1])
    solverconfig= load_configuration(sys.argv[2])
    "simulate and return a ModelicaRes.SimRes object"
    resData= simulate(sources, solverconfig)
    while (True):
        ViewData.plotOutputs(resData)
        value= raw_input("Plot another signal (y/n) ?: ")
        if (value[0]== 'n'):
            break