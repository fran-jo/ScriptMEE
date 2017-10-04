'''
Created on 4 apr 2014

@author: fragom
'''
import os, sys

from config import SimulationResources
from config import SimulationConfigDY
from modelicares import SimRes
from engines.engineDymola import EngineDY
from utils import ViewData

    
def load_Sources(__filesource):
    __sources= SimulationResources([__filesource,'r'])
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
    __solverconfig= SimulationConfigDY([__fileconfig,'r'])
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
    ''' add library path to MODELICAPATH, to recognize folder where library is available '''
    os.environ["MODELICAPATH"] = __sources.libraryFolder
    ''' Change path to model folder '''
    os.chdir(__sources.modelFolder)
    
    simCity= EngineDY(__sources, __solverconfig)
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
    print SimRes(simulationResult)

#     def saveOutputs(self):
#         '''
#         The structure of the saving format takes into account format measurements from PMU, form v/i, anglev/anglei 
#         '''
#         resultmat= self.moModel.split('.')[-1]
#         resultmat+= '.mat'
#         os.chdir(self.outPath)
#         h5Name=  self.moModel+ '_&'+ 'dymola'+ '.h5'
#         resulth5= self.outPath+ '/'+ h5Name
#         h5pmu= OutputH5Stream([self.outPath, resulth5, resultmat], 'dymola')
#         h5pmu.open_h5(self.moModel) 
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