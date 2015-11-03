'''
Created on 6 aug 2014
@author: fragom
'''
import datetime
import os
import platform
import shutil
import subprocess
import sys
import time


class SimulatorDY(object):
    '''
    classdocs
    '''
    def createDirectory(self, directoryName):
        ''' Creates the directory *directoryName*
        :param directoryName: The name of the directory
        This method validates the directory *directoryName* and if the
        argument is valid and write permissions exists, it creates the
        directory. Otherwise, a *ValueError* is raised.
        '''
        if directoryName != '.':
            if len(directoryName) == 0:
                raise ValueError("Specified directory is not valid. Set to '.' for current directory.")
            # Try to create directory
            if not os.path.exists(directoryName):
                os.makedirs(directoryName)
            # Check write permission
            if not os.access(directoryName, os.W_OK):
                raise ValueError("Write permission to '" + directoryName + "' denied.")
           
    def __init__(self, params):
        '''
        params[0] = model name
        params[1] = model file name 
        params[2] = working directory
        params[3] = output directory
        '''
        self._modelName = params[0]
#         print 'self._modelName: ', self._modelName
        self._modelFile = params[1]
        self._workingDir = params[2]
        separateValues= params[3].split(os.sep)
        self._outputDir = '/'.join(separateValues)
        separateValues= self._modelName.split('.')
        self._resultFile= separateValues[-1]
        self._resultFile= self._resultFile
        
        self.createDirectory(self._outputDir)
        
        self._parameters = {}
        self._simulator = {}
        self.setStartTime(0)
        self.setStopTime(1)
        self.setTolerance(1E-6)
        self.setTimeOut(-1)
        self._MODELICA_EXE= 'Dymola'
        self._exitSimulator = True
        self._showGUI= False
    
    ## Preparing simulation command
    def deleteOutputFiles(self, outputDir):
        ''' Deletes the output files of the simulator.
        '''
        #change to output path 
        if (outputDir):
            currDir= os.getcwd()
            os.chdir(self._outputDir)
        fileList=['buildlog.txt', 'dsfinal.txt', 'dsin.txt', 'dslog.txt',
                'dsmodel*', 'dymosim', 'dymosim.exe','simulator.log',
                self._resultFile,
                'request.', 'status', 'failure', 'stop']
        for fil in fileList:
            try:
                if os.path.exists(fil):
                    os.remove(fil)
            except OSError as e:
                print "Failed to delete '" + fil + "' : " + e.strerror
        if (outputDir):
            os.chdir(currDir)
            
    def copyOutputFiles(self):
        ''' Copy the output files of the simulator to the output folder
        '''
        self._resultFile+= '.mat'
#         print self._resultFile
        fileList=['buildlog.txt', 'dsfinal.txt', 'dsin.txt', 'dslog.txt',
                'dsmodel*', 'dymosim', 'dymosim.exe','simulator.log',
                self._resultFile,
                'request.', 'status', 'failure', 'stop']
        for fil in fileList:
            try:
                if os.path.exists(fil):
                    shutil.copy(fil,self._outputDir)
            except OSError as e:
                print "Failed to delete '" + fil + "' : " + e.strerror
    
    def addParameters(self, dictionary):
        '''Adds parameter declarations to the simulator.
        :param dictionary: A dictionary with the parameter values
        Usage: Type
           >>> from buildingspy.simulate.Simulator import Simulator
           >>> s=Simulator("myPackage.myModel", "dymola", packagePath="buildingspy/tests/MyModelicaLibrary")
           >>> s.addParameters({'PID.k': 1.0, 'valve.m_flow_nominal' : 0.1})
           >>> s.addParameters({'PID.t': 10.0})
        This will add the three parameters ``PID.k``, ``valve.m_flow_nominal``
        and ``PID.t`` to the list of model parameters.

        For parameters that are arrays, use a syntax such as
           >>> from buildingspy.simulate.Simulator import Simulator
           >>> s = Simulator("MyModelicaLibrary.Examples.Constants", "dymola", packagePath="buildingspy/tests/MyModelicaLibrary")
           >>> s.addParameters({'const1.k' : [2, 3]})
           >>> s.addParameters({'const2.k' : [[1.1, 1.2], [2.1, 2.2], [3.1, 3.2]]})
        Do not use curly brackets for the values of parameters, such as
        ``s.addParameters({'const1.k' : {2, 3}})``
        as Python converts this entry to ``{'const1.k': set([2, 3])}``.
        '''
        self._parameters.update(dictionary)
        return
    
    def getParameters(self):
        '''Returns a list of parameters as (key, value)-tuples.
        :return: A list of parameters as (key, value)-tuples.
        Usage: Type
           >>> from buildingspy.simulate.Simulator import Simulator
           >>> s=Simulator("myPackage.myModel", "dymola", packagePath="buildingspy/tests/MyModelicaLibrary")
           >>> s.addParameters({'PID.k': 1.0, 'valve.m_flow_nominal' : 0.1})
           >>> s.getParameters()
           [('valve.m_flow_nominal', 0.1), ('PID.k', 1.0)]
        '''
        return self._parameters.items()
    
    def setStartTime(self, t0):
        '''Sets the start time.
        :param t0: The start time of the simulation in seconds.
        The default stop time is 1.
        '''
        self._simulator.update(t0=t0)
        return

    def setStopTime(self, t1):
        '''Sets the start time.
        :param t0: The start time of the simulation in seconds.
        The default start time is 0.
        '''
        self._simulator.update(t1=t1)
        return

    def setTimeOut(self, sec):
        '''Sets the time out after which the simulation will be killed.
        :param sec: The time out after which the simulation will be killed.
        The default value is -1, which means that the simulation will
        never be killed.
        '''
        self._simulator.update(timeout=sec)
        return

    def setTolerance(self, eps):
        '''Sets the solver tolerance.
        :param eps: The solver tolerance.
        The default solver tolerance is 1E-6.
        '''
        self._simulator.update(eps=eps)
        return

    def setSolver(self, solver):
        '''Sets the solver.
        :param solver: The name of the solver.
        The default solver is *radau*.
        '''
        self._simulator.update(solver=solver)
        return

    def setNumberOfIntervals(self, n):
        '''Sets the number of output intervals.
        :param n: The number of output intervals.
        The default is unspecified, which defaults by Dymola to 500.
        '''
        self._simulator.update(numberOfIntervals=n)
        return

    def setResultFile(self, resultFile):
        '''Sets the name of the result file (without extension).
        :param resultFile: The name of the result file (without extension).
        '''
        # If resultFile=aa.bb.cc, then split returns [aa, bb, cc]
        # This is needed to get the short model name
        rs=resultFile.split(".")
        self._simulator.update(resultFile=rs[len(rs)-1])
        return
    
    def exitSimulator(self, exitAfterSimulation=True):
        ''' This function allows avoiding that the simulator terminates.

        :param exit: Set to ``False`` to avoid the simulator from terminating
                     after the simulation.

        This function is useful during debugging, as it allows to
        keep the simulator open after the simulation in order to
        inspect results or log messages.

        '''
        self._exitSimulator = exitAfterSimulation
        return  
            
    def simulate(self):
        '''Simulates the model.

        This method
          1. Deletes dymola output files
          2. Copies the current directory to a temporary directory.
          3. Writes a Modelica script to the temporary directory.
          4. Starts the Modelica simulation environment from the temporary directory.
          5. Translates and simulates the model.
          6. Closes the Modelica simulation environment.
          7. Copies output files and deletes the temporary directory.

        This method requires that the directory that contains the executable *dymola*
        is on the system PATH variable. If it is not found, the function returns with
        an error message.

        '''

        def to_modelica(arg):
            """ Convert to Modelica array.
            """
            if isinstance(arg, str):
                return repr(arg)
            try:
                return '{' + ", ".join(to_modelica(x) for x in arg) + '}'
            except TypeError:
                return repr(arg)      

        # Delete dymola output files
        self.deleteOutputFiles(True)
        # Construct the model instance with all parameter values and package redeclarations
        dec = list()
        for k, v in self._parameters.items():
            # Dymola requires vectors of parameters to be set in the format, p = {1, 2, 3}.
            # Hence, we convert the value of the parameter if required.
            s = to_modelica(v)
            dec.append('{param}={value}'.format(param=k, value=s))

        mi = '"{mn}{dec}"'.format(mn=self._modelName, dec=','.join(dec))
        try:
            # Write the Modelica script
            runScriptName = os.path.join(self._workingDir, "run.mos")
            fil= open(runScriptName, "w")
            fil.write("// File autogenerated, do not edit.\n")
            fil.write('cd("' + self._workingDir + '");\n')
            fil.write("Modelica.Utilities.Files.remove(\"simulator.log\");\n")
            fil.write('openModel(\"PowerSystems.mo\");\n')
            fil.write('openModel("'+ self._modelFile+ '");\n')
            fil.write('OutputCPUtime:=true;\n')
            
            fil.write('modelInstance=' + mi + ';\n')
            fil.write('simulateModel(modelInstance, ')
            fil.write('startTime=' + str(self._simulator.get('t0')) + \
                          ', stopTime='  + str(self._simulator.get('t1')) + \
                          ', method="' + self._simulator.get('solver') + '"' + \
                          ', tolerance=' + str(self._simulator.get('eps')) + \
                          ', resultFile="' + self._resultFile+ '"')
            if self._simulator.has_key('numberOfIntervals'):
                fil.write(', numberOfIntervals=' +
                          str(self._simulator.get('numberOfIntervals')))
            fil.write(');\n')
            
            fil.write("savelog(\"simulator.log\");\n")
            if self._exitSimulator:
                fil.write("Modelica.Utilities.System.exit();\n")
            fil.close()
            # Run simulation
            self.runSimulation(runScriptName,self._simulator.get('timeout'),
                                 self._workingDir)
            self.copyOutputFiles()
            # Delete dymola output files
            self.deleteOutputFiles(False)
        except: # Catch all possible exceptions
            sys.exc_info()[1]
            print "Simulation failed in '" + self._workingDir + "'\n"
            raise
        
    ## Execute simulation command
    def runSimulation(self, mosFile, timeout, directory):
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
            
    def isExecutable(self, program):

        def is_exe(fpath):
            return os.path.exists(fpath) and os.access(fpath, os.X_OK)

        # Add .exe, which is needed on Windows 7 to test existence
        # of the program
        if platform.system() == "Windows":
            program=program + ".exe"

        if is_exe(program):
            return True
        else:
            for path in os.environ["PATH"].split(os.pathsep):
                exe_file = os.path.join(path, program)
                if is_exe(exe_file):
                    return True
        return False
    
    def showProgressBar(self, show=True):
        ''' Enables or disables the progress bar.
        :param show: Set to *false* to disable the progress bar.
        If this function is not called, then a progress bar will be shown as the simulation runs.
        '''
        self._showProgressBar = show
        return

    def _printProgressBar(self, fractionComplete):
        '''Prints a progress bar to the console.
        :param fractionComplete: The fraction of the time that is completed.
        '''
        nInc = 50
        count=int(nInc*fractionComplete)
        proBar = "|"
        for i in range(nInc):
            if i < count:
                proBar += "-"
            else:
                proBar += " "
        proBar += "|"
        print proBar, int(fractionComplete*100), "%\r",
        sys.stdout.flush()
        