'''
Created on 4 apr 2014

@author: fragom
'''
import os, sys, timeit
from classes.SimulatorDY import SimulatorDY
import classes.SimulationConfigDY as cfg
from buildingspy.io.outputfile import Reader
import classes.SimulationProperties as sp
import matplotlib.pyplot as plt

def main(argv):
    '''Retrieve arguments'''
    obj= sp.SimulationProperties(sys.argv[1])
    moPath= obj.getModelPath()
    libPath= obj.getLibraryPath()
    moFile= obj.getModelFile()
    moModel= obj.getModelName()
    outPath= obj.getOutputPath()
    config= cfg.SimulationConfigDY(sys.argv[2])
#     simOptions= config.setSimOptions()
    tic= timeit.default_timer()
#     MODELICAPATH= r'C:\\Users\\fragom\\PhD_CIM\\Modelica\\Models\\Library'
#     print MODELICAPATH
#     sys.path.append(MODELICAPATH)
#     os.environ['PATH']+= ';'+ MODELICAPATH
    ''' Change path to model folder '''
    path = moPath
    os.environ["MODELICAPATH"] = libPath
    # Check current working directory.
#     retval = os.getcwd()
#     print "Current working directory %s" % retval
    # Now change the directory
    os.chdir(path)
    # Check current working directory.
#     retval = os.getcwd()
#     print "Directory changed successfully %s" % retval
#     print moModel.split('.')[2]
    s= SimulatorDY([moModel, moFile, moPath, outPath])
    print moModel
    print moFile
    print moPath
    print outPath
#     s.showGUI(True)
#     s.exitSimulator(False)
#     s.addParameters({'vf1': 0.2, 'pm1': 0.02})
    s.setStopTime(config.getStopTime())
    # Kill the process if it does not finish in 1 minute
    s.setTimeOut(config.getTimeOut())
    s.setSolver(config.getMethod())
    s.showProgressBar(False)
#     s.printModelAndTime()
    s.simulate()
    toc= timeit.default_timer()
#         print('Simulation time: ')
    print (toc - tic) #elapsed time in seconds
    # ---
    
    # Management of outputs
    resultFile= moModel.split('.')[-1]
#     print 'resultFile:', resultFile
    resultFile+= '.mat'
    os.chdir(outPath)
#     print 'os.getcwd():', os.getcwd()
    output= Reader(resultFile, "dymola")
    (time1, y1) = output.values("pwLine4.n.vr")
    fig = plt.figure()
#     ax = fig.add_subplot(211)
    ax = fig.add_subplot(111, axisbg='w')
    
    ax.plot(time1/3600, y1, 'r', label='$y_1$')
    ax.set_xlabel('time [s]')
    ax.set_ylabel('Voltage [$^\circ$C]')
#     ax.set_xticks(range(25))
#     ax.set_xlim([0, 24])
    ax.legend()
    ax.grid(True)
    plt.show()
    # ---
    
if __name__ == '__main__':
    main(sys.argv[1:])