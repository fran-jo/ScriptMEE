Script running with Python 2.7.x
Dependencies
	- matplolib
	- numpy
	- h5
	- ompython

Structure of the project
1. ROOT_FOLDER/
2. ROOT_FOLDER/config/
3. ROOT_FOLDER/models/
4. ROOT_FOLDER/src/classes/
5. ROOT_FOLDER/src/data/
6. ROOT_FOLDER/src/script/

Folder 2) stores .properties files with information about:
	a) the models to simulate,
	b) basic configuration for compilers

Folder 3) contains .properties files with the names of variables that need to be stored and plotted
	i.e. smib2lwfault_varList.properties

Folder 6) contains the three main scripts of the project
	simulationDY.py for simulations using Dymola compiler
	simulationJM.py for simulations using JModelica compiler (does not work - in development)
	simulationOMC.py for simulations using OpenModelica compiler
	
Each script need three input files, in this order:
	simParametersXX.properties
	simConfigurationXX.properties	
	<nameModel>_varList.properties