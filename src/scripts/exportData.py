'''
Created on 19 sep. 2017

@author: fragom
'''
from modelicares import SimRes
from modelicares.simres import SimResList

def selectData(self, arrayQualquiera, mensaje):
    count= 0
    indexMapping={}
    for i, meas in enumerate(arrayQualquiera):
        print '[%d] %s' % (i, meas)
        indexMapping[count]= i
        count+= 1
    try:
        value= raw_input(mensaje)
        lindex = value.split()
    except ValueError:
        print "Wrong choice ...!" 
    values= []
    for idx in lindex:  
        idx= int(idx)
        values.append(arrayQualquiera[indexMapping[idx]])
    return values
    
def displayVariables(resultFile):
    ''' result file from either Dymola or OpenModelica '''
    moResults= SimRes(resultFile)
    for key in moResults.iterkeys():
        print key
    return moResults

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
        
    
        
# def export_toH5(namelist, resObject):
#     ''' namelist: list of component complete names, ex: bus2.V'''
#     dbh5api= StreamCIMH5('./db/simulation', resObject.fbase)
#     dbh5api.open(resObject.fbase, mode= 'a')
#     if not dbh5api.exist_PowerSystemResource(str(parentName)):
#         dbh5api.add_PowerSystemResource(str(parentName))
#     else:
#         dbh5api.update_PowerSystemResource(str(parentName), str(parentName))
#     
#     if not dbh5api.exist_AnalogMeasurement(str(childName)):
#         dbh5api.add_AnalogMeasurement(str(childName),
#                                   self.__results[str(paramName)].unit, 
#                                  'unitMultiplier')
#         dbh5api.add_AnalogValue(self.__results[str(paramName)].times().tolist(),
#                             self.__results[str(paramName)].values().tolist())
#     else:
#         dbh5api.select_AnalogMeasurement()
#         dbh5api.update_AnalogMeasurement(str(childName), self.__results[str(paramName)].unit, 
#                                  'unitMultiplier')
#         dbh5api.update_AnalogValue(str(childName),
#                                    self.__results[str(paramName)].times().tolist(),
#                                    self.__results[str(paramName)].values().tolist())
#     dbh5api.close() 

if __name__ == '__main__':
    import sys
    print sys.argv[1]
    simulationResults= displayVariables(sys.argv[1])
#     signalSelection= selectData(arrayQualquiera, "mensaje")
#     export_toH5(signalSelection, simulationResults)