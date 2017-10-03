'''
Created on 4 apr 2014

@author: fragom
'''
import os, sys
import datetime, subprocess, time

# from classes import OutVariableStream as outvar  
from classes.SimulatorDY import SimulatorDY 
from modelicares.exps.simulators import dymola_script
from modelicares.simres import SimRes
from buildingspy.io import outputfile

class EngineDY(object):
    __experiment= {}
    
    def __init__(self, sources= None, config= None):
        ''' Loading simulations resources. Parameters related to models to be simulated and libraries'''
        self.__sources= sources
        ''' Loading configuration values for the simulator solver '''
        self.__configuration= config
#         ''' Loading output variables of the model, their values will be stored in h5 and plotted '''
#         self.outputs= outvar.OutVariableStream(sys.argv[3])
        
    @property
    def startTime(self):
        return self.__experiment["startTime"]
    @startTime.setter
    def startTime(self, value):
        self.__experiment["startTime"]= value
        
    @property
    def stopTime(self):
        return self.__experiment["stopTime"]
    @stopTime.setter
    def stopTime(self, value):
        self.__experiment["stopTime"]= value
        
    @property
    def solver(self):
        return self.__experiment["solver"]
    @solver.setter
    def solver(self, value):
        self.__experiment["solver"]= value
        
    @property
    def tolerance(self):
        return self.__experiment["tolerance"]
    @tolerance.setter
    def tolerance(self, value):
        self.__experiment["tolerance"]= value
        
    @property
    def numberOfIntervals(self):
        return self.__experiment["numberOfIntervals"]
    @numberOfIntervals.setter
    def numberOfIntervals(self, value):
        self.__experiment["numberOfIntervals"]= value
        
    @property
    def resultFile(self):
        return self.__experiment["resultFile"]
    @resultFile.setter
    def resultFile(self, value):
        self.__experiment["resultFile"]= value
        
    @property
    def timeout(self):
        return self.__experiment["timeout"]
    @timeout.setter
    def timeout(self, value):
        self.__experiment["timeout"]= value
        
    def simulate(self):
#         tic= timeit.default_timer()
        ''' add library path to MODELICAPATH, to recognize folder where library is available '''
        os.environ["MODELICAPATH"] = self.__sources.libraryFolder
        ''' Change path to model folder '''
        os.chdir(self.__sources.modelFolder)
        
        s= SimulatorDY([self.__sources.modelName, self.__sources.modelFile,
                        self.__sources.libraryFolder+ '/'+ self.__sources.libraryFile, 
                        self.__sources.modelFolder, self.__sources.outputFolder])
    #     s.showGUI(True)
    #     s.exitSimulator(False)
    #     s.addParameters({'vf1': 0.2, 'pm1': 0.02})
        s.setStopTime(self.__configuration.stopTime)
        s.setNumberOfIntervals(self.__configuration.numberOfIntervals)
        s.setTolerance(self.__configuration.tolerance)
        ''' setTimeOut kill the process if it does not finish in specific time'''
        s.setTimeOut('60')
        s.setSolver(self.__configuration.method)
        s.showProgressBar(False)
    #     s.printModelAndTime()
        s.simulate()
        print os.getcwd()
        os.chdir(self.__sources.outputFolder)
        outputFile= self.__sources.modelName+'.mat'
        try:
            if os.path.exists(outputFile):
                self.__experiment["resultFile"]= outputFile
        except OSError as e:
            print "Result file not found '" + outputFile + "' : " + e.strerror
        
#         toc= timeit.default_timer()
#         print 'Simulation time ', toc- tic

    def simulate_MoRes(self):
        """ create modelica script """
        runScriptName = self.__sources.modelFolder+ '/run.mos'
        extra_lib= self.__sources.libraryFolder+ '/'+ self.__sources.libraryFile
        with dymola_script(runScriptName, working_dir=self.__sources.modelFolder,
                           packages=[self.__sources.modelFile,self.__sources.libraryFolder]) as simulator:
            simulator.startTime= self.__experiment["startTime"]
            simulator.stopTime = self.__experiment["stopTime"]
            simulator.numberOfIntervals= self.__experiment["numberOfIntervals"]
            simulator.method= self.__experiment["solver"]
            simulator.tolerance= self.__experiment["tolerance"]
            simulator.resultFile= self.__experiment["resultFile"]
            simulator.run(self.__sources.modelName)
        result= SimRes(self.__sources.modelName+'.mat')
        return result

    def linearize(self, metodo):
        pathModelicaLinearize= "C:\Program Files (x86)\Dymola 2017 FD01\Modelica\Library\Modelica_LinearSystems2 2.3.4"
        try:
            runScriptName = self._workingDir+ '/run_linearization.mos'
            scriptFile= open(runScriptName, "w")
            scriptFile.write("// File autogenerated, do not edit.\n")
            scriptFile.write("Modelica.Utilities.Files.remove(\"simulator.log\");\n")
            scriptFile.write('"'+ pathModelicaLinearize+ os.sep+ 'package.mo");\n')
            scriptFile.write('openModel("'+ self._libFile+ '");\n')
            scriptFile.write('cd("' + self._workingDir + '");\n')
            scriptFile.write('openModel("'+ self._modelFile+ '");\n')
            scriptFile.write('OutputCPUtime:=true;\n')
            scriptFile.write('modelInstance=' + self.__sources.modelName + ';\n')
            scriptFile.write('Modelica_LinearSystems2.ModelAnalysis.Poles(modelInstance);\n')
            scriptFile.write(');\n')
            scriptFile.write("savelog(\"simulator.log\");\n")
            if self._exitSimulator:
                scriptFile.write("Modelica.Utilities.System.exit();\n")
            scriptFile.close()
            # Run simulation
            self.__run_mos_linearization(runScriptName,self._simulator.get('timeout'),
                                 self._workingDir)
            self.copyOutputFiles()
            # Delete dymola output files
            self.deleteOutputFiles(False)
        except: # Catch all possible exceptions
            sys.exc_info()[1]
            print "Linearization method failed in '" + self._workingDir + "'\n"
            raise
        
    def __run_mos_linearization(self, mosFile, timeout, directory):
        '''Runs the simulation.
        :param mosFile: The Modelica *mos* file name, including extension
        :param timeout: Time out in seconds
        :param directory: The working directory
        '''
        # List of command and arguments
        if self._showGUI:
            cmd=[self._MODELICA_EXE, mosFile]
        else:
            cmd=[self._MODELICA_EXE, mosFile, "/nowindow"]

        # Check if executable is on the path
        if not self.isExecutable(cmd[0]):
            print "Error: Did not find executable '", cmd[0], "'."
            print " Make sure it is on the PATH variable of your operating system."
            exit(3)
        # Run command
        try:
            staTim = datetime.datetime.now()
            print "Starting simulation in '"+ directory+ "' at "+ str(staTim)
            pro = subprocess.Popen(args=cmd,
                                   stdout=subprocess.PIPE,
                                   stderr=subprocess.PIPE,
                                   shell=False,
                                   cwd=directory)
            killedProcess=False
            if timeout > 0:
                while pro.poll() is None:
                    time.sleep(0.01)
                    elapsedTime = (datetime.datetime.now() - staTim).seconds
                    if elapsedTime > timeout:
                        # First, terminate the process. Then, if it is still
                        # running, kill the process
                        if killedProcess == False:
                            killedProcess=True
                            # This output needed because of the progress bar
                            sys.stdout.write("\n")
                            print "Terminating simulation in "+ directory + "."
                            pro.terminate()
                        else:
                            print "Killing simulation in "+ directory + "."
                            pro.kill()
                    else:
                        if self._showProgressBar:
                            fractionComplete = float(elapsedTime)/float(timeout)
                            self._printProgressBar(fractionComplete)
            else:
                pro.wait()
            # This output is needed because of the progress bar
            if not killedProcess:
                sys.stdout.write("\n")

            if not killedProcess:
                print "*** Standard output stream from simulation:\n" + pro.stdout.read()
                print "Standard error stream from simulation:\n" + pro.stderr.read()
            else:
                print "Killed process as it computed longer than " + str(timeout) + " seconds."
        except OSError as e:
            print "Execution of ", cmd, " failed:", e   
    