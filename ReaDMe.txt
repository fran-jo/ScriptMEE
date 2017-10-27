
Dependencies
	- Python 2.7.8
	- matplolib 1.2
	- numpy 1.9.2
	- h5py 2.3
	- ompython 2.0
	- modelicares 0.8.2

Structure of the Eclipse project
1) ROOT_FOLDER/
2) ROOT_FOLDER/config/
3) ROOT_FOLDER/models/
4) ROOT_FOLDER/src/config/
5) ROOT_FOLDER/src/engines/
6) ROOT_FOLDER/src/script/
7) ROOT_FOLDER/src/utilsmee/

Folder 2) stores .properties files with information about:
	a) the models to simulate,
	b) basic configuration for compilers

Folder 3) contains the models to be simulated

Folder 6) contains the three main scripts of the project
	simulationDY.py for simulations using Dymola compiler
	simulationJM.py for simulations using JModelica compiler (does not work - in development)
	simulationOMC.py for simulations using OpenModelica compiler
	
Each script need three input files, in this order:
	simParametersXX.properties
	simConfigurationXX.properties	
	<nameModel>_varList.properties
	
Selection of signals from h5 (h5 files organized information within groups of data and data sets
The structure of the resulting files are
1. modelname as name of the group
2. two dataset per component (_items, _values)
2.1. component_items contains the names of the variables which have been selected, from the component
2.2. component_values contains the values of the variables which have been selected, from the component

