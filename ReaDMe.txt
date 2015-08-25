Loading files into OMC
loadModel(Modelica)
loadFile("C:/Users/fragom/PhD_CIM/Modelica/Models/Library/PowerSystems.mo")
loadFile("C:/Users/fragom/PhD_CIM/Modelica/Models/SmarTSLab.mo")
readSimulationResultVars("C:/Users/fragom/PhD_CIM/Modelica/Models/Results/OpenModelica/SmarTSLab.Models.smibwbuseswfault_res.mat")
readSimulationResultVars("SmarTSLab.Models.smibwbuseswfault_res.mat")
val(pwLine4.p.vi,0.2) - variable y tiempo / para plot solo el nombre de la variable

Resources for simulation ieee9_bus
modelPath=C:\Users\fragom\PhD_CIM\Modelica\ieee_9bus\
libraryPath=C:\Users\fragom\PhD_CIM\Modelica\Models\Library\
modelFile=IEEENetworks.mo
modelName=IEEENetworks.IEEE_9Bus
libraryFile=PowerSystems.mo
outputPath=C:\Users\fragom\PhD_CIM\Modelica\Models\Results\OpenModelica

Resources for simulation smibwbuseswfault
modelPath=C:\Users\fragom\PhD_CIM\Modelica\Models\
libraryPath=C:\Users\fragom\PhD_CIM\Modelica\Models\Library\
modelFile=SmarTSLab.mo
modelName=SmarTSLab.Models.smibwbuseswfault
libraryFile=PowerSystems.mo
outputPath=C:\Users\fragom\PhD_CIM\Modelica\Models\Results\OpenModelica
modelValues=smibwbuseswfault.properties

More examples
C:\Users\fragom\iTESLA\itesla-modelica-smarts_lab\NetworksKTH\System SMIB\Modelica
System_SMIB.mo
Works with PowerSystems library
C:\Users\fragom\iTESLA\itesla_modelica\PowerSystems_Lib
PowerSystems.mo

Building executable 
Directory of scripts - C:\Users\fragom\PhD_CIM\PYTHON\ScriptMEE\src\scripts
Directory of python engine - C:\IDE\Python27