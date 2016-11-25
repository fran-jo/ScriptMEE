within ;
package IEEENetworks "Different networks from IEEE"
  model IEEE_9Bus

    OpenIPSL.Electrical.Branches.PwLine line(
      G=0,
      R=0.0119,
      X=0.1008,
      B=0.209) annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=180,
          origin={22,50})));
    OpenIPSL.Electrical.Branches.PwLine line1(
      G=0,
      R=0.0085,
      X=0.072,
      B=0.149) annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=0,
          origin={-29,50})));
    OpenIPSL.Electrical.Buses.Bus B2 annotation (Placement(transformation(extent={{-108,37},{-82,63}})));
    OpenIPSL.Electrical.Buses.Bus B7 annotation (Placement(transformation(extent={{-68,38},{-42,64}})));
    OpenIPSL.Electrical.Buses.Bus B9 annotation (Placement(transformation(extent={{31,37},{58,64}})));
    OpenIPSL.Electrical.Buses.Bus B3 annotation (Placement(transformation(extent={{69,37},{95,63}})));
    OpenIPSL.Electrical.Branches.PwLine line2(
      G=0,
      R=0.039,
      X=0.170,
      B=0.358) annotation (Placement(visible=true, transformation(
          origin={40,20},
          extent={{-10,-10},{10,10}},
          rotation=90)));
    OpenIPSL.Electrical.Branches.PwLine line3(
      G=0,
      R=0.032,
      X=0.161,
      B=0.306) annotation (Placement(visible=true, transformation(
          origin={-60,20},
          extent={{-10,-10},{10,10}},
          rotation=90)));
    OpenIPSL.Electrical.Buses.Bus B8 annotation (Placement(visible=true, transformation(
          origin={-1,51},
          extent={{-13,-13},{13,13}},
          rotation=180)));
    OpenIPSL.Electrical.Buses.Bus B6 annotation (Placement(visible=true, transformation(
          origin={41,-12},
          extent={{-14,-14},{14,14}},
          rotation=-90)));
    OpenIPSL.Electrical.Buses.Bus B5 annotation (Placement(visible=true, transformation(
          origin={-48,-13},
          extent={{-14,-14},{14,14}},
          rotation=-90)));
    OpenIPSL.Electrical.Branches.PwLine line5(
      R=0.017,
      X=0.092,
      G=0,
      B=0.158) annotation (Placement(visible=true, transformation(
          origin={40,-31},
          extent={{-10,-10},{10,10}},
          rotation=90)));
    OpenIPSL.Electrical.Branches.PwLine line4(
      G=0,
      R=0.01,
      X=0.085,
      B=0.176) annotation (Placement(visible=true, transformation(
          origin={-48,-32},
          extent={{-10,-10},{10,10}},
          rotation=90)));
    OpenIPSL.Electrical.Buses.Bus B4 annotation (Placement(visible=true, transformation(
          origin={-1,-48},
          extent={{-13,-13},{13,13}},
          rotation=-90)));
    OpenIPSL.Electrical.Buses.Bus B1 annotation (Placement(visible=true, transformation(
          origin={0,-86},
          extent={{-13,-13},{13,13}},
          rotation=-90)));
    OpenIPSL.Electrical.Machines.PSSE.GENROU GenB2(
      Tppd0=0.05,
      S10=1.01,
      S12=1.02,
      S_b=100,
      Tpd0=6,
      Tpq0=0.5350,
      Tppq0=0.05,
      D=0.67,
      Xd=1.72,
      Xq=1.66,
      Xpd=0.2300,
      Xpq=0.3700,
      Xppd=0.2100,
      Xppq=0.2100,
      Xl=0.1,
      H=3.330,
      M_b=320,
      V_b=18,
      V_0=1.030107,
      angle_0=-82.52,
      P_0=177.2101,
      Q_0=12.9778) annotation (Placement(visible=true, transformation(
          origin={-120,50},
          extent={{-10,-10},{10,10}},
          rotation=0)));
    OpenIPSL.Electrical.Machines.PSSE.GENROU GenB3(
      Tpd0=5.89,
      Tppd0=0.05,
      Tpq0=0.6,
      Tppq0=0.05,
      H=2.35,
      D=0.47,
      Xd=1.68,
      Xq=1.61,
      Xpd=0.2321,
      Xpq=0.32,
      Xppd=0.21,
      Xppq=0.21,
      Xl=0.1536,
      S10=1.01,
      S12=1.02,
      S_b=100,
      M_b=300,
      V_b=13,
      V_0=1.022927,
      angle_0=-87.72,
      P_0=89.5591,
      Q_0=-12.1352) annotation (Placement(visible=true, transformation(
          origin={110,50},
          extent={{-10,-10},{10,10}},
          rotation=180)));
    OpenIPSL.Electrical.Loads.PSSE.Load constantLoad(
      a(re=1, im=0),
      b(re=0, im=1),
      PQBRAK=0.7,
      S_i(re=0, im=0),
      S_y(re=0, im=0),
      S_p(re=1.25, im=0.50),
      V_b=230,
      V_0=0.9937046,
      angle_0=-97.19762) annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=-90,
          origin={-90,-13})));
    OpenIPSL.Electrical.Loads.PSSE.Load constantLoad1(
      a(re=1, im=0),
      b(re=0, im=1),
      S_i(re=0, im=0),
      S_y(re=0, im=0),
      S_p(re=0.90, im=0.3),
      PQBRAK=0.7,
      V_b=230,
      V_0=1.010052,
      angle_0=-96.99864) annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={87,-12})));
    OpenIPSL.Electrical.Loads.PSSE.Load constantLoad2(
      a(re=1, im=0),
      b(re=0, im=1),
      PQBRAK=0.7,
      S_i(re=0, im=0),
      S_y(re=0, im=0),
      S_p(re=1, im=0.35),
      V_b=230,
      V_0=1.016652,
      angle_0=-91.63186) annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=180,
          origin={0,93})));
    OpenIPSL.Electrical.Events.PwFault pwFault(
      R=0,
      t1=0.9,
      t2=1.2,
      X=0.01) annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={0,13})));
    OpenIPSL.Electrical.Branches.PSSE.TwoWindingTransformer twoWindingTransformer3(
      R=0,
      G=0,
      B=0,
      X=0.0625,
      t1=1,
      t2=1,
      PrimaryOnFromSide=true) annotation (Placement(transformation(extent={{-87,40},{-67,60}})));
    OpenIPSL.Electrical.Branches.PSSE.TwoWindingTransformer twoWindingTransformer2(
      R=0,
      X=0.0576,
      G=0,
      B=0,
      t1=1,
      t2=1,
      PrimaryOnFromSide=true) annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={1,-67})));
    OpenIPSL.Electrical.Branches.PSSE.TwoWindingTransformer twoWindingTransformer1(
      R=0,
      G=0,
      B=0,
      X=0.0586,
      t1=1,
      t2=1,
      PrimaryOnFromSide=true) annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=180,
          origin={63,51})));
    OpenIPSL.Electrical.Machines.PSSE.GENSAL GenB1(
      Tpd0=8.96,
      Tppd0=0.05,
      Tppq0=0.05,
      H=9.55,
      D=1.6,
      Xd=0.3615,
      Xq=0.24,
      Xpd=0.1508,
      Xppd=0.1,
      Xppq=0.1,
      Xl=0.06,
      S10=1.01,
      S12=1.02,
      S_b=100,
      M_b=275,
      V_b=16.5,
      V_0=1.038143,
      angle_0=-94.30,
      P_0=52.7845,
      Q_0=27.5115) annotation (Placement(visible=true, transformation(origin={-39,-100}, extent={{-10,-10},{10,10}})));
    OpenIPSL.Electrical.Controls.PSSE.ES.IEEET1 IEEET1_Gen2(
      T_R=0,
      K_A=20,
      T_A=0.2,
      V_RMAX=3,
      V_RMIN=-3,
      K_E=1,
      T_E=0.3140,
      K_F=0.0630,
      T_F=0.35,
      E_1=2.8,
      S_EE_1=0.3034,
      S_EE_2=1.2884,
      V_0=1.030107,
      E_2=3.73) annotation (Placement(transformation(extent={{-164,35},{-138,55}})));
    Modelica.Blocks.Sources.Constant const(k=0) annotation (Placement(visible=true, transformation(
          origin={-189,49},
          extent={{-10,-10},{10,10}},
          rotation=0)));
    Modelica.Blocks.Sources.Constant const1(k=0) annotation (Placement(visible=true, transformation(
          origin={187,55},
          extent={{-10,-10},{10,10}},
          rotation=180)));
    Modelica.Blocks.Sources.Constant const2(k=0) annotation (Placement(visible=true, transformation(
          origin={-110,-105},
          extent={{-10,-10},{10,10}},
          rotation=0)));
    OpenIPSL.Electrical.Controls.PSSE.ES.IEEET1 IEEET1_Gen3(
      T_R=0,
      K_A=20,
      T_A=0.2,
      V_RMAX=3,
      V_RMIN=-3,
      K_E=1,
      T_E=0.3140,
      K_F=0.0630,
      T_F=0.35,
      E_1=2.8,
      S_EE_1=0.3034,
      S_EE_2=1.2884,
      V_0=1.022927,
      E_2=3.73) annotation (Placement(transformation(
          extent={{-13,-10},{13,10}},
          rotation=180,
          origin={145,55})));
    OpenIPSL.Electrical.Controls.PSSE.ES.IEEET1 IEEET1_Gen1(
      T_R=0,
      K_A=20,
      T_A=0.2,
      V_RMAX=3,
      V_RMIN=-3,
      K_E=1,
      T_E=0.3140,
      K_F=0.0630,
      T_F=0.35,
      E_1=2.8,
      S_EE_1=0.3034,
      S_EE_2=1.2884,
      V_0=1.038143,
      E_2=3.73) annotation (Placement(transformation(extent={{-86,-115},{-60,-95}})));
  equation
    connect(GenB2.p, B2.p) annotation (Line(points={{-109,50},{-95,50}}, color={0,0,255}));
    connect(B4.p, line5.p) annotation (Line(points={{-1,-48},{-1,-48},{-1,-40},{-1,-42.6667},{40,-42.6667}}, color={0,0,255}));
    connect(B4.p, line4.p) annotation (Line(points={{-1,-48},{-1,-43.6667},{-48,-43.6667}}, color={0,0,255}));
    connect(line5.n, B6.p) annotation (Line(points={{40,-19.3333},{40,-12},{41,-12}}, color={0,0,255}));
    connect(line4.n, B5.p) annotation (Line(points={{-48,-20.3333},{-47,-20.3333},{-47,-13},{-48,-13}}, color={0,0,255}));
    connect(constantLoad.p, B5.p) annotation (Line(points={{-79,-13},{-74,-13},{-67,-13},{-49,-13},{-48,-13}}, color={0,0,255}));
    connect(B6.p, constantLoad1.p) annotation (Line(points={{41,-12},{42,-12},{76,-12}}, color={0,0,255}));
    connect(B6.p, line2.p) annotation (Line(points={{41,-12},{41,-12},{41,8.33333},{40,8.33333}}, color={0,0,255}));
    connect(B5.p, line3.p) annotation (Line(points={{-48,-13},{-47,-13},{-47,3},{-57,3},{-57,8.33333},{-60,8.33333}}, color={0,0,255}));
    connect(B7.p, line3.n) annotation (Line(points={{-55,51},{-53,51},{-53,50},{-49,50},{-49,31.6667},{-60,31.6667}}, color={0,0,255}));
    connect(line2.n, B9.p) annotation (Line(points={{40,31.6667},{37,31.6667},{37,50.5},{44.5,50.5}}, color={0,0,255}));
    connect(B8.p, line.n) annotation (Line(points={{-1,51},{7,51},{7,50},{10.3333,50}}, color={0,0,255}));
    connect(line.p, B9.p) annotation (Line(points={{33.6667,50},{37,50},{37,50.5},{44.5,50.5}}, color={0,0,255}));
    connect(B7.p, line1.p) annotation (Line(points={{-55,51},{-42,51},{-42,50},{-40.6667,50}}, color={0,0,255}));
    connect(line1.n, B8.p) annotation (Line(points={{-17.3333,50},{-12,50},{-12,51},{-1,51}}, color={0,0,255}));
    connect(B8.p, constantLoad2.p) annotation (Line(points={{-1,51},{-5,51},{-5,57},{-9,57},{-9,79},{-1.33227e-015,79},{-1.33227e-015,82}}, color={0,0,255}));
    connect(GenB3.p, B3.p) annotation (Line(points={{99,50},{82,50}}, color={0,0,255}));
    connect(B8.p, pwFault.p) annotation (Line(points={{-1,51},{-1,38},{-1,24.6667},{2.22045e-015,24.6667}}, color={0,0,255}));
    connect(B7.p, twoWindingTransformer3.n) annotation (Line(points={{-55,51},{-63,51},{-63,50},{-65.3333,50}}, color={0,0,255}));
    connect(B2.p, twoWindingTransformer3.p) annotation (Line(points={{-95,50},{-89.5,50},{-89.5,50},{-88.6667,50}}, color={0,0,255}));
    connect(twoWindingTransformer2.n, B4.p) annotation (Line(points={{1,-55.3333},{-1,-55.3333},{-1,-48}}, color={0,0,255}));
    connect(twoWindingTransformer1.p, B3.p) annotation (Line(points={{74.6667,51},{76,51},{76,50},{82,50}}, color={0,0,255}));
    connect(twoWindingTransformer1.n, B9.p) annotation (Line(points={{51.3333,51},{51.5,51},{51.5,50.5},{44.5,50.5}}, color={0,0,255}));
    connect(B1.p, twoWindingTransformer2.p) annotation (Line(points={{0,-86},{0,-78.6667},{1,-78.6667}}, color={0,0,255}));
    connect(GenB1.p, B1.p) annotation (Line(points={{-28,-100},{0,-100},{0,-86}}, color={0,0,255}));
    connect(GenB2.PMECH0, GenB2.PMECH) annotation (Line(points={{-109.2,47},{-107,47},{-107,62},{-132,62},{-132,55},{-129.8,55}}, color={0,0,127}));
    connect(GenB3.PMECH0, GenB3.PMECH) annotation (Line(points={{99.2,53},{97,53},{97,38},{122,38},{122,45},{119.8,45}}, color={0,0,127}));
    connect(GenB1.PMECH0, GenB1.PMECH) annotation (Line(points={{-28.2,-103},{-26,-103},{-26,-88},{-51,-88},{-51,-95},{-48.8,-95}}, color={0,0,127}));
    connect(IEEET1_Gen2.EFD, GenB2.EFD) annotation (Line(points={{-137.35,46.1111},{-134,46.1111},{-134,45},{-129.8,45}}, color={0,0,127}));
    connect(GenB2.EFD0, IEEET1_Gen2.EFD0) annotation (Line(points={{-109.2,43},{-107,43},{-107,32},{-167,32},{-167,38.8889},{-164,38.8889}}, color={0,0,127}));
    connect(GenB2.ETERM, IEEET1_Gen2.EC) annotation (Line(points={{-109.2,55},{-106,55},{-106,30},{-168,30},{-168,41},{-163.6,41}}, color={0,0,127}));
    connect(const.y, IEEET1_Gen2.VOEL) annotation (Line(points={{-178,49},{-155.55,49},{-155.55,35}}, color={0,0,127}));
    connect(const.y, IEEET1_Gen2.VOTHSG) annotation (Line(points={{-178,49},{-176,49},{-176,51.1111},{-164,51.1111}}, color={0,0,127}));
    connect(const.y, IEEET1_Gen2.VUEL) annotation (Line(points={{-178,49},{-176,49},{-176,35},{-159.45,35}},color={0,0,127}));
    connect(IEEET1_Gen3.EFD, GenB3.EFD) annotation (Line(points={{131.35,56.1111},{126,56.1111},{126,55},{119.8,55}}, color={0,0,127}));
    connect(GenB3.EFD0, IEEET1_Gen3.EFD0) annotation (Line(points={{99.2,57},{98,57},{98,58},{98,66},{162,66},{162,63.3333},{158,63.3333}}, color={0,0,127}));
    connect(const1.y, IEEET1_Gen3.VUEL) annotation (Line(points={{176,55},{165,55},{165,67.2222},{153.45,67.2222}}, color={0,0,127}));
    connect(const1.y, IEEET1_Gen3.VOEL) annotation (Line(points={{176,55},{168,55},{168,67.2222},{149.55,67.2222}}, color={0,0,127}));
    connect(const1.y, IEEET1_Gen3.VOTHSG) annotation (Line(points={{176,55},{168,55},{168,51.1111},{158,51.1111}}, color={0,0,127}));
    connect(GenB3.ETERM, IEEET1_Gen3.EC) annotation (Line(points={{99.2,45},{96,45},{96,68},{164,68},{164,59},{159.6,59}}, color={0,0,127}));
    connect(const2.y, IEEET1_Gen1.VUEL) annotation (Line(points={{-99,-105},{-90,-105},{-90,-115},{-81.45,-115}}, color={0,0,127}));
    connect(const2.y, IEEET1_Gen1.VOEL) annotation (Line(points={{-99,-105},{-93,-105},{-93,-115},{-77.55,-115}},color={0,0,127}));
    connect(const2.y, IEEET1_Gen1.VOTHSG) annotation (Line(points={{-99,-105},{-93,-105},{-93,-98.8889},{-86,-98.8889}}, color={0,0,127}));
    connect(IEEET1_Gen1.EFD, GenB1.EFD) annotation (Line(points={{-59.35,-103.889},{-54,-103.889},{-54,-105},{-48.8,-105}}, color={0,0,127}));
    connect(GenB1.EFD0, IEEET1_Gen1.EFD0) annotation (Line(points={{-28.2,-107},{-26,-107},{-26,-117},{-89,-117},{-89,-111.111},{-86,-111.111}}, color={0,0,127}));
    connect(GenB1.ETERM, IEEET1_Gen1.EC) annotation (Line(points={{-28.2,-95},{-24,-95},{-24,-120},{-90,-120},{-90,-109},{-85.6,-109}}, color={0,0,127}));
    annotation (Diagram(coordinateSystem(
          extent={{-160,-120},{150,100}},
          preserveAspectRatio=false,
          initialScale=0.1,
          grid={1,1})), Icon(coordinateSystem(
          extent={{-160,-120},{150,100}},
          preserveAspectRatio=false,
          initialScale=0.1,
          grid={1,1})));
  end IEEE_9Bus;

  model IEEE_9Bus_iPSLnov15
    PowerSystems.Electrical.Branches.PwLine line(
      G=0,
      R=0.0119,
      X=0.1008,
      B=0.1045) annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=180,
          origin={22,50})));
    PowerSystems.Electrical.Branches.PwLine line1(
      G=0,
      R=0.0085,
      X=0.072,
      B=0.0745) annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=0,
          origin={-29,50})));
    PowerSystems.Electrical.Buses.Bus B2 annotation (Placement(transformation(extent={{-108,37},{-82,63}})));
    PowerSystems.Electrical.Buses.Bus B7 annotation (Placement(transformation(extent={{-68,38},{-42,64}})));
    PowerSystems.Electrical.Buses.Bus B9 annotation (Placement(transformation(extent={{31,37},{58,64}})));
    PowerSystems.Electrical.Buses.Bus B3 annotation (Placement(transformation(extent={{69,37},{95,63}})));
    PowerSystems.Electrical.Branches.PwLine line2(
      G=0,
      R=0.039,
      X=0.170,
      B=0.179) annotation (Placement(visible=true, transformation(
          origin={40,20},
          extent={{-10,-10},{10,10}},
          rotation=90)));
    PowerSystems.Electrical.Branches.PwLine line3(
      G=0,
      R=0.032,
      X=0.161,
      B=0.153) annotation (Placement(visible=true, transformation(
          origin={-60,20},
          extent={{-10,-10},{10,10}},
          rotation=90)));
    PowerSystems.Electrical.Buses.Bus B8 annotation (Placement(visible=true, transformation(
          origin={-1,51},
          extent={{-13,-13},{13,13}},
          rotation=180)));
    PowerSystems.Electrical.Buses.Bus B6 annotation (Placement(visible=true, transformation(
          origin={41,-12},
          extent={{-14,-14},{14,14}},
          rotation=-90)));
    PowerSystems.Electrical.Buses.Bus B5 annotation (Placement(visible=true, transformation(
          origin={-48,-13},
          extent={{-14,-14},{14,14}},
          rotation=-90)));
    PowerSystems.Electrical.Branches.PwLine line5(
      R=0.017,
      X=0.092,
      G=0,
      B=0.079) annotation (Placement(visible=true, transformation(
          origin={40,-31},
          extent={{-10,-10},{10,10}},
          rotation=90)));
    PowerSystems.Electrical.Branches.PwLine line4(
      G=0,
      R=0.01,
      X=0.085,
      B=0.088) annotation (Placement(visible=true, transformation(
          origin={-48,-32},
          extent={{-10,-10},{10,10}},
          rotation=90)));
    PowerSystems.Electrical.Buses.Bus B4 annotation (Placement(visible=true, transformation(
          origin={-1,-48},
          extent={{-13,-13},{13,13}},
          rotation=-90)));
    PowerSystems.Electrical.Buses.Bus B1 annotation (Placement(visible=true, transformation(
          origin={0,-86},
          extent={{-13,-13},{13,13}},
          rotation=-90)));
    UserDefinedwoRegulator.ieee9bus_configBus2 ieee9bus_configbus21 annotation (Placement(visible=true, transformation(
          origin={-120,50},
          extent={{-10,-10},{10,10}},
          rotation=0)));
    UserDefinedwoRegulator.ieee9bus_configBus3 ieee9bus_configbus31 annotation (Placement(visible=true, transformation(
          origin={110,50},
          extent={{-10,-10},{10,10}},
          rotation=180)));
    PowerSystems.Electrical.Loads.PSSE.ConstantLoad constantLoad(
      a(re=1, im=0),
      b(re=0, im=1),
      PQBRAK=0.7,
      S_i(re=0, im=0),
      S_y(re=0, im=0),
      S_p(re=1.25, im=0.50),
      v0=0.9975267,
      anglev0=-3.984869) annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=-90,
          origin={-72,-21})));
    PowerSystems.Electrical.Loads.PSSE.ConstantLoad constantLoad1(
      a(re=1, im=0),
      b(re=0, im=1),
      S_i(re=0, im=0),
      S_y(re=0, im=0),
      v0=1.013555,
      anglev0=-3.685885,
      S_p(re=0.90, im=0.3),
      PQBRAK=0.7) annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=-90,
          origin={73,-17})));
    PowerSystems.Electrical.Loads.PSSE.ConstantLoad constantLoad2(
      a(re=1, im=0),
      b(re=0, im=1),
      PQBRAK=0.7,
      S_i(re=0, im=0),
      S_y(re=0, im=0),
      v0=1.018439,
      anglev0=0.7034081,
      S_p(re=1, im=0.35)) annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=-90,
          origin={15,65})));
    PowerSystems.Electrical.Events.PwFault pwFault(
      t1=0.1,
      t2=0.2,
      R=0,
      X=0,
      ground=0) annotation (Placement(transformation(extent={{5,1},{25,21}})));
    PowerSystems.Electrical.Branches.PSSE.TwoWindingTransformer twoWindingTransformer3(
      R=0,
      G=0,
      B=0,
      X=0.0625,
      t1=1,
      t2=1,
      PrimaryOnFromSide=true) annotation (Placement(transformation(extent={{-87,40},{-67,60}})));
    PowerSystems.Electrical.Branches.PSSE.TwoWindingTransformer twoWindingTransformer2(
      R=0,
      X=0.0576,
      G=0,
      B=0,
      t1=1,
      t2=1,
      PrimaryOnFromSide=true) annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={1,-67})));
    PowerSystems.Electrical.Branches.PSSE.TwoWindingTransformer twoWindingTransformer1(
      R=0,
      G=0,
      B=0,
      X=0.0586,
      t1=1,
      t2=1,
      PrimaryOnFromSide=true) annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=180,
          origin={63,51})));
    UserDefinedwoRegulator.ieee9bus_configBus1_2 ieee9bus_configBus1_2_1 annotation (Placement(transformation(extent={{-57,-113},{-17,-91}})));
  equation
    connect(ieee9bus_configbus21.pwpin1, B2.p) annotation (Line(points={{-110,50},{-95,50}}, color={0,0,255}));
    connect(B4.p, line5.p) annotation (Line(points={{-1,-48},{-1,-48},{-1,-40},{-1,-38},{40,-38}}, color={0,0,255}));
    connect(B4.p, line4.p) annotation (Line(points={{-1,-48},{-1,-39},{-48,-39}}, color={0,0,255}));
    connect(line5.n, B6.p) annotation (Line(points={{40,-24},{40,-12},{41,-12}}, color={0,0,255}));
    connect(line4.n, B5.p) annotation (Line(points={{-48,-25},{-47,-25},{-47,-13},{-48,-13}}, color={0,0,255}));
    connect(constantLoad.p, B5.p) annotation (Line(points={{-71,-14},{-71,-14},{-71,-7},{-49,-7},{-49,-13},{-48,-13}}, color={0,0,255}));
    connect(B6.p, constantLoad1.p) annotation (Line(points={{41,-12},{42,-12},{42,-7},{74,-7},{74,-10}}, color={0,0,255}));
    connect(B6.p, line2.p) annotation (Line(points={{41,-12},{41,-12},{41,13},{40,13}}, color={0,0,255}));
    connect(B5.p, line3.p) annotation (Line(points={{-48,-13},{-47,-13},{-47,3},{-57,3},{-57,13},{-60,13}}, color={0,0,255}));
    connect(B7.p, line3.n) annotation (Line(points={{-55,51},{-53,51},{-53,50},{-49,50},{-49,27},{-60,27}}, color={0,0,255}));
    connect(line2.n, B9.p) annotation (Line(points={{40,27},{37,27},{37,50.5},{44.5,50.5}}, color={0,0,255}));
    connect(B8.p, line.n) annotation (Line(points={{-1,51},{7,51},{7,50},{15,50}}, color={0,0,255}));
    connect(line.p, B9.p) annotation (Line(points={{29,50},{37,50},{37,50.5},{44.5,50.5}}, color={0,0,255}));
    connect(B7.p, line1.p) annotation (Line(points={{-55,51},{-42,51},{-42,50},{-36,50}}, color={0,0,255}));
    connect(line1.n, B8.p) annotation (Line(points={{-22,50},{-12,50},{-12,51},{-1,51}}, color={0,0,255}));
    connect(B8.p, constantLoad2.p) annotation (Line(points={{-1,51},{-5,51},{-5,57},{-9,57},{-9,79},{16,79},{16,72}}, color={0,0,255}));
    connect(B3.p, ieee9bus_configbus31.pwpin1) annotation (Line(points={{82,50},{105.714,50},{105.714,50}}, color={0,0,255}));
    connect(B8.p, pwFault.p) annotation (Line(points={{-1,51},{-1,32},{8,32},{8,12}}, color={0,0,255}));
    connect(B7.p, twoWindingTransformer3.n) annotation (Line(points={{-55,51},{-63,51},{-63,50.2},{-70,50.2}}, color={0,0,255}));
    connect(B2.p, twoWindingTransformer3.p) annotation (Line(points={{-95,50},{-89.5,50},{-89.5,50.2},{-84,50.2}}, color={0,0,255}));
    connect(twoWindingTransformer2.n, B4.p) annotation (Line(points={{0.8,-60},{-1,-60},{-1,-48}}, color={0,0,255}));
    connect(twoWindingTransformer1.p, B3.p) annotation (Line(points={{70,50.8},{76,50.8},{76,50},{82,50}}, color={0,0,255}));
    connect(twoWindingTransformer1.n, B9.p) annotation (Line(points={{56,50.8},{51.5,50.8},{51.5,50.5},{44.5,50.5}}, color={0,0,255}));
    connect(B1.p, twoWindingTransformer2.p) annotation (Line(points={{0,-86},{0,-74},{0.8,-74}}, color={0,0,255}));
    connect(ieee9bus_configBus1_2_1.pwpin1, B1.p) annotation (Line(points={{-20,-103},{0,-103},{0,-86}}, color={0,0,255}));
    annotation (Diagram(coordinateSystem(
          extent={{-160,-120},{150,100}},
          preserveAspectRatio=false,
          initialScale=0.1,
          grid={1,1})), Icon(coordinateSystem(
          extent={{-160,-120},{150,100}},
          preserveAspectRatio=false,
          initialScale=0.1,
          grid={1,1})));
  end IEEE_9Bus_iPSLnov15;

  model CIM_IEEE_9Bus
    OpenIPSL.Electrical.Branches.PwLine Ln46(
      R=0.017000000923871994,
      X=0.09200000017881393,
      G=0,
      B=0.07900000363588333) "annotation()";
    OpenIPSL.Electrical.Buses.Bus BUS4 "annotation()";
    OpenIPSL.Electrical.Buses.Bus BUS2 "annotation()";
    OpenIPSL.Electrical.Buses.Bus BUS7 "annotation()";
    OpenIPSL.Electrical.Buses.Bus BUS6 "annotation()";
    OpenIPSL.Electrical.Loads.PSSE.Load Ld8(
      angle_0=14.38232,
      V_0=1.016395,
      P_0=1,
      Q_0=0,
      V_b=230) "something here" annotation ();
    OpenIPSL.Electrical.Buses.Bus BUS8 "annotation()";
    OpenIPSL.Electrical.Machines.PSSE.GENROU Gn2(
      S_b=100,
      M_b=320,
      V_b=18,
      V_0=1.030107021331787,
      angle_0=22.88218,
      P_0=162.7303,
      Q_0=8.689249,
      R_a=0.00001,
      Xl=0.10000000149011612,
      H=3.3299999237060547,
      D=0.6700000166893005,
      S10=1.0099999904632568,
      S12=1.0199999809265137,
      Tpd0=6,
      Tpq0=0.5350000262260437,
      Tppd0=0.05000000074505806,
      Tppq0=0.05000000074505806,
      Xd=1.7200000286102295,
      Xpd=0.23000000417232513,
      Xppd=0.20999999344348907,
      Xq=1.659999966621399,
      Xpq=0.3700000047683716,
      Xppq=0.20999999344348907) "something here" annotation ();
    OpenIPSL.Electrical.Branches.PwLine Ln57(
      R=0.03200000151991844,
      X=0.16099999845027924,
      G=0,
      B=0.15299999713897705) "annotation()";
    OpenIPSL.Electrical.Buses.Bus BUS5 "annotation()";
    OpenIPSL.Electrical.Loads.PSSE.Load Ld6(
      angle_0=9.977392,
      V_0=1.01181,
      P_0=1,
      Q_0=0,
      V_b=230) "something here" annotation ();
    OpenIPSL.Electrical.Branches.PwLine Ln45(
      R=0.009999999776482582,
      X=0.08500000089406967,
      G=0,
      B=0.08799999952316284) "annotation()";
    OpenIPSL.Electrical.Loads.PSSE.Load Ld5(
      angle_0=9.677315,
      V_0=0.995745,
      P_0=1,
      Q_0=0,
      V_b=230) "something here" annotation ();
    OpenIPSL.Electrical.Branches.PwLine Ln89(
      R=0.011900000274181366,
      X=0.10080000013113022,
      G=0,
      B=0.10450000315904617) "annotation()";
    OpenIPSL.Electrical.Buses.Bus BUS9 "annotation()";
    OpenIPSL.Electrical.Branches.PSSE.TwoWindingTransformer T3(
      R=0,
      X=0.0625,
      G=0,
      B=0,
      ANG1=1,
      S_n=1,
      CW=1,
      CZ=1,
      t2=1,
      VB2=230,
      VNOM2=230,
      t1=1,
      VB1=13,
      VNOM1=13) "something here" annotation ();
    OpenIPSL.Electrical.Branches.PSSE.TwoWindingTransformer T1(
      R=0,
      X=0.05860000103712082,
      G=0,
      B=0,
      ANG1=1,
      S_n=1,
      CW=1,
      CZ=1,
      t2=1,
      VB2=230,
      VNOM2=230,
      t1=1,
      VB1=16.5,
      VNOM1=16.5) "something here" annotation ();
    OpenIPSL.Electrical.Branches.PSSE.TwoWindingTransformer T2(
      R=0,
      X=0.0575999990105629,
      G=0,
      B=0,
      ANG1=1,
      S_n=1,
      CW=1,
      CZ=1,
      t1=1,
      VB1=18,
      VNOM1=18,
      t2=1,
      VB2=230,
      VNOM2=230) "something here" annotation ();
    OpenIPSL.Electrical.Buses.Bus BUS3 "annotation()";
    OpenIPSL.Electrical.Machines.PSSE.GENSAL Gn1(
      S_b=100,
      M_b=275,
      V_b=16.5,
      V_0=1.0381430387496948,
      angle_0=13.66273,
      P_0=71.41698,
      Q_0=25.93099,
      R_a=0.00001,
      Xl=0.05999999865889549,
      H=9.550000190734863,
      D=1.600000023841858,
      S10=1.0099999904632568,
      S12=1.0199999809265137,
      Tpd0=8.960000038146973,
      Tppd0=0.05000000074505806,
      Tppq0=0.05000000074505806,
      Xd=0.36149999499320984,
      Xpd=0.15080000460147858,
      Xppd=0.10000000149011612,
      Xq=0.23999999463558197,
      Xppq=0.10000000149011612) "something here" annotation ();
    OpenIPSL.Electrical.Buses.Bus BUS1 "annotation()";
    OpenIPSL.Electrical.Events.PwFault f_BUS8(
      R=0.1,
      X=0.001,
      t1=2,
      t2=2.15) "annotation()";
    OpenIPSL.Electrical.Branches.PwLine Ln78(
      R=0.008500000461935997,
      X=0.07199999690055847,
      G=0,
      B=0.07450000196695328) "annotation()";
    OpenIPSL.Electrical.Machines.PSSE.GENROU Gn3(
      S_b=100,
      M_b=300,
      V_b=13,
      V_0=1.0229270458221436,
      angle_0=18.3354,
      P_0=84.89243,
      Q_0=-12.45501,
      R_a=0.00001,
      Xl=0.15360000729560852,
      H=2.3499999046325684,
      D=0.4699999988079071,
      S10=1.0099999904632568,
      S12=1.0199999809265137,
      Tpd0=5.889999866485596,
      Tpq0=0.6000000238418579,
      Tppd0=0.05000000074505806,
      Tppq0=0.05000000074505806,
      Xd=1.6799999475479126,
      Xpd=0.2320999950170517,
      Xppd=0.20999999344348907,
      Xq=1.6100000143051147,
      Xpq=0.3199999928474426,
      Xppq=0.20999999344348907) "something here" annotation ();
    OpenIPSL.Electrical.Branches.PwLine Ln69(
      R=0.039000000804662704,
      X=0.17000000178813934,
      G=0,
      B=0.17900000512599945) "annotation()";
  equation
    connect(Ln46.p, BUS4.p);
    connect(T2.n, BUS7.p);
    connect(T2.p, BUS2.p);
    connect(Ld8.p, BUS8.p);
    connect(Gn2.p, BUS2.p);
    connect(Ln57.p, BUS5.p);
    connect(Ld6.p, BUS6.p);
    connect(Ln45.n, BUS5.p);
    connect(Ld5.p, BUS5.p);
    connect(Ln89.n, BUS9.p);
    connect(T3.n, BUS3.p);
    connect(T1.n, BUS4.p);
    connect(Ln89.p, BUS8.p);
    connect(Ln45.p, BUS4.p);
    connect(Ln57.n, BUS7.p);
    connect(T1.p, BUS1.p);
    connect(Gn1.p, BUS1.p);
    connect(Ln78.n, BUS8.p);
    connect(Ln46.n, BUS6.p);
    connect(Gn3.p, BUS3.p);
    connect(Ln69.p, BUS6.p);
    connect(Ln69.n, BUS9.p);
    connect(Ln78.p, BUS7.p);
    connect(T3.p, BUS9.p);
    connect(f_BUS8.p, BUS8.p);
    connect(Gn1.PMECH0, Gn1.PMECH);
    connect(Gn1.EFD0, Gn1.EFD);
    connect(Gn2.PMECH0, Gn2.PMECH);
    connect(Gn2.EFD0, Gn2.EFD);
    connect(Gn3.PMECH0, Gn3.PMECH);
    connect(Gn3.EFD0, Gn3.EFD);
  end CIM_IEEE_9Bus;

  model IEEE_9Bus_Basic

    OpenIPSL.Electrical.Branches.PwLine line(
      G=0,
      R=0.0119,
      X=0.1008,
      B=0.209) annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=180,
          origin={22,50})));
    OpenIPSL.Electrical.Branches.PwLine line1(
      G=0,
      R=0.0085,
      X=0.072,
      B=0.149) annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=0,
          origin={-29,50})));
    OpenIPSL.Electrical.Buses.Bus B2 annotation (Placement(transformation(extent={{-108,37},{-82,63}})));
    OpenIPSL.Electrical.Buses.Bus B7 annotation (Placement(transformation(extent={{-68,38},{-42,64}})));
    OpenIPSL.Electrical.Buses.Bus B9 annotation (Placement(transformation(extent={{31,37},{58,64}})));
    OpenIPSL.Electrical.Buses.Bus B3 annotation (Placement(transformation(extent={{69,37},{95,63}})));
    OpenIPSL.Electrical.Branches.PwLine line2(
      G=0,
      R=0.039,
      X=0.170,
      B=0.358) annotation (Placement(visible=true, transformation(
          origin={40,20},
          extent={{-10,-10},{10,10}},
          rotation=90)));
    OpenIPSL.Electrical.Branches.PwLine line3(
      G=0,
      R=0.032,
      X=0.161,
      B=0.306) annotation (Placement(visible=true, transformation(
          origin={-60,20},
          extent={{-10,-10},{10,10}},
          rotation=90)));
    OpenIPSL.Electrical.Buses.Bus B8 annotation (Placement(visible=true, transformation(
          origin={-1,51},
          extent={{-13,-13},{13,13}},
          rotation=180)));
    OpenIPSL.Electrical.Buses.Bus B6 annotation (Placement(visible=true, transformation(
          origin={41,-12},
          extent={{-14,-14},{14,14}},
          rotation=-90)));
    OpenIPSL.Electrical.Buses.Bus B5 annotation (Placement(visible=true, transformation(
          origin={-48,-13},
          extent={{-14,-14},{14,14}},
          rotation=-90)));
    OpenIPSL.Electrical.Branches.PwLine line5(
      R=0.017,
      X=0.092,
      G=0,
      B=0.158) annotation (Placement(visible=true, transformation(
          origin={40,-31},
          extent={{-10,-10},{10,10}},
          rotation=90)));
    OpenIPSL.Electrical.Branches.PwLine line4(
      G=0,
      R=0.01,
      X=0.085,
      B=0.176) annotation (Placement(visible=true, transformation(
          origin={-48,-32},
          extent={{-10,-10},{10,10}},
          rotation=90)));
    OpenIPSL.Electrical.Buses.Bus B4 annotation (Placement(visible=true, transformation(
          origin={-1,-48},
          extent={{-13,-13},{13,13}},
          rotation=-90)));
    OpenIPSL.Electrical.Buses.Bus B1 annotation (Placement(visible=true, transformation(
          origin={0,-86},
          extent={{-13,-13},{13,13}},
          rotation=-90)));
    OpenIPSL.Electrical.Machines.PSSE.GENROU GenB2(
      Tppd0=0.05,
      S10=1.01,
      S12=1.02,
      S_b=100,
      Tpd0=6,
      Tpq0=0.5350,
      Tppq0=0.05,
      D=0.67,
      Xd=1.72,
      Xq=1.66,
      Xpd=0.2300,
      Xpq=0.3700,
      Xppd=0.2100,
      Xppq=0.2100,
      Xl=0.1,
      H=3.330,
      M_b=320,
      V_b=18,
      V_0=1.030107,
      angle_0=-82.52,
      P_0=177.2101,
      Q_0=12.9778) annotation (Placement(visible=true, transformation(
          origin={-120,50},
          extent={{-10,-10},{10,10}},
          rotation=0)));
    OpenIPSL.Electrical.Machines.PSSE.GENROU GenB3(
      Tpd0=5.89,
      Tppd0=0.05,
      Tpq0=0.6,
      Tppq0=0.05,
      H=2.35,
      D=0.47,
      Xd=1.68,
      Xq=1.61,
      Xpd=0.2321,
      Xpq=0.32,
      Xppd=0.21,
      Xppq=0.21,
      Xl=0.1536,
      S10=1.01,
      S12=1.02,
      S_b=100,
      M_b=300,
      V_b=13,
      V_0=1.022927,
      angle_0=-87.72,
      P_0=89.5591,
      Q_0=-12.1352) annotation (Placement(visible=true, transformation(
          origin={110,50},
          extent={{-10,-10},{10,10}},
          rotation=180)));
    OpenIPSL.Electrical.Loads.PSSE.Load constantLoad(
      a(re=1, im=0),
      b(re=0, im=1),
      PQBRAK=0.7,
      S_i(re=0, im=0),
      S_y(re=0, im=0),
      S_p(re=1.25, im=0.50),
      V_b=230,
      V_0=0.9937046,
      angle_0=-97.19762) annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=-90,
          origin={-90,-13})));
    OpenIPSL.Electrical.Loads.PSSE.Load constantLoad1(
      a(re=1, im=0),
      b(re=0, im=1),
      S_i(re=0, im=0),
      S_y(re=0, im=0),
      S_p(re=0.90, im=0.3),
      PQBRAK=0.7,
      V_b=230,
      V_0=1.010052,
      angle_0=-96.99864) annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={87,-12})));
    OpenIPSL.Electrical.Loads.PSSE.Load constantLoad2(
      a(re=1, im=0),
      b(re=0, im=1),
      PQBRAK=0.7,
      S_i(re=0, im=0),
      S_y(re=0, im=0),
      S_p(re=1, im=0.35),
      V_b=230,
      V_0=1.016652,
      angle_0=-91.63186) annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=180,
          origin={0,93})));
    OpenIPSL.Electrical.Events.PwFault pwFault(
      t1=0.9,
      t2=1.2,
      X=0.01,
      R=0) annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={0,13})));
    OpenIPSL.Electrical.Branches.PSSE.TwoWindingTransformer twoWindingTransformer3(
      R=0,
      G=0,
      B=0,
      X=0.0625,
      t1=1,
      t2=1,
      VNOM1=13.8,
      VNOM2=230,
      VB2=237.44,
      VB1=13.03) annotation (Placement(transformation(extent={{53,40},{73,60}})));
    OpenIPSL.Electrical.Branches.PSSE.TwoWindingTransformer twoWindingTransformer2(
      R=0,
      X=0.0576,
      G=0,
      B=0,
      t1=1,
      t2=1,
      CZ=1,
      VNOM1=18,
      VNOM2=230,
      VB2=235.93,
      VB1=18.03) annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=0,
          origin={-77,50})));
    OpenIPSL.Electrical.Branches.PSSE.TwoWindingTransformer twoWindingTransformer1(
      R=0,
      G=0,
      B=0,
      X=0.0586,
      t1=1,
      t2=1,
      VNOM1=16.5,
      VNOM2=230,
      VB2=235.93,
      VB1=16.04) annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={1,-68})));
    OpenIPSL.Electrical.Machines.PSSE.GENSAL GenB1(
      Tpd0=8.96,
      Tppd0=0.05,
      Tppq0=0.05,
      H=9.55,
      D=1.6,
      Xd=0.3615,
      Xq=0.24,
      Xpd=0.1508,
      Xppd=0.1,
      Xppq=0.1,
      Xl=0.06,
      S10=1.01,
      S12=1.02,
      S_b=100,
      M_b=275,
      V_b=16.5,
      V_0=1.038143,
      angle_0=-94.30,
      P_0=52.7845,
      Q_0=27.5115) annotation (Placement(visible=true, transformation(origin={-39,-100}, extent={{-10,-10},{10,10}})));
  equation
    connect(GenB2.p, B2.p) annotation (Line(points={{-109,50},{-95,50}}, color={0,0,255}));
    connect(B4.p, line5.p) annotation (Line(points={{-1,-48},{-1,-48},{-1,-40},{-1,-42.6667},{40,-42.6667}}, color={0,0,255}));
    connect(B4.p, line4.p) annotation (Line(points={{-1,-48},{-1,-43.6667},{-48,-43.6667}}, color={0,0,255}));
    connect(line5.n, B6.p) annotation (Line(points={{40,-19.3333},{40,-12},{41,-12}}, color={0,0,255}));
    connect(line4.n, B5.p) annotation (Line(points={{-48,-20.3333},{-47,-20.3333},{-47,-13},{-48,-13}}, color={0,0,255}));
    connect(constantLoad.p, B5.p) annotation (Line(points={{-79,-13},{-74,-13},{-67,-13},{-49,-13},{-48,-13}}, color={0,0,255}));
    connect(B6.p, constantLoad1.p) annotation (Line(points={{41,-12},{42,-12},{76,-12}}, color={0,0,255}));
    connect(B6.p, line2.p) annotation (Line(points={{41,-12},{41,-12},{41,8.33333},{40,8.33333}}, color={0,0,255}));
    connect(B5.p, line3.p) annotation (Line(points={{-48,-13},{-47,-13},{-47,3},{-57,3},{-57,8.33333},{-60,8.33333}}, color={0,0,255}));
    connect(B7.p, line3.n) annotation (Line(points={{-55,51},{-53,51},{-53,50},{-49,50},{-49,31.6667},{-60,31.6667}}, color={0,0,255}));
    connect(line2.n, B9.p) annotation (Line(points={{40,31.6667},{37,31.6667},{37,50.5},{44.5,50.5}}, color={0,0,255}));
    connect(B8.p, line.n) annotation (Line(points={{-1,51},{7,51},{7,50},{10.3333,50}}, color={0,0,255}));
    connect(line.p, B9.p) annotation (Line(points={{33.6667,50},{37,50},{37,50.5},{44.5,50.5}}, color={0,0,255}));
    connect(B7.p, line1.p) annotation (Line(points={{-55,51},{-42,51},{-42,50},{-40.6667,50}}, color={0,0,255}));
    connect(line1.n, B8.p) annotation (Line(points={{-17.3333,50},{-12,50},{-12,51},{-1,51}}, color={0,0,255}));
    connect(B8.p, constantLoad2.p) annotation (Line(points={{-1,51},{-5,51},{-5,57},{-9,57},{-9,79},{-1.33227e-015,79},{-1.33227e-015,82}}, color={0,0,255}));
    connect(GenB3.p, B3.p) annotation (Line(points={{99,50},{82,50}}, color={0,0,255}));
    connect(GenB1.p, B1.p) annotation (Line(points={{-28,-100},{0,-100},{0,-86}}, color={0,0,255}));
    connect(GenB2.PMECH0, GenB2.PMECH) annotation (Line(points={{-109.2,47},{-107,47},{-107,62},{-132,62},{-132,55},{-129.8,55}}, color={0,0,127}));
    connect(GenB3.PMECH0, GenB3.PMECH) annotation (Line(points={{99.2,53},{97,53},{97,38},{122,38},{122,45},{119.8,45}}, color={0,0,127}));
    connect(GenB1.PMECH0, GenB1.PMECH) annotation (Line(points={{-28.2,-103},{-26,-103},{-26,-88},{-51,-88},{-51,-95},{-48.8,-95}}, color={0,0,127}));
    connect(GenB2.EFD0, GenB2.EFD) annotation (Line(points={{-109.2,43},{-107,43},{-107,38},{-133,38},{-133,45},{-129.8,45}}, color={0,0,127}));
    connect(GenB1.EFD0, GenB1.EFD) annotation (Line(points={{-28.2,-107},{-26,-107},{-26,-113},{-53,-113},{-53,-105},{-48.8,-105}}, color={0,0,127}));
    connect(GenB3.EFD0, GenB3.EFD) annotation (Line(points={{99.2,57},{98,57},{98,58},{98,62},{123,62},{123,55},{119.8,55}}, color={0,0,127}));
    connect(twoWindingTransformer2.n, B7.p) annotation (Line(points={{-65.3333,50},{-63,50},{-63,51},{-55,51}}, color={0,0,255}));
    connect(twoWindingTransformer2.p, B2.p) annotation (Line(points={{-88.6667,50},{-88.6667,50},{-95,50}}, color={0,0,255}));
    connect(twoWindingTransformer3.p, B9.p) annotation (Line(points={{51.3333,50},{50,50},{50,50.5},{44.5,50.5}}, color={0,0,255}));
    connect(twoWindingTransformer3.n, B3.p) annotation (Line(points={{74.6667,50},{74.6667,50},{82,50}}, color={0,0,255}));
    connect(twoWindingTransformer1.p, B1.p) annotation (Line(points={{1,-79.6667},{0,-79.6667},{0,-86}}, color={0,0,255}));
    connect(twoWindingTransformer1.n, B4.p) annotation (Line(points={{1,-56.3333},{-1,-56.3333},{-1,-48}}, color={0,0,255}));
    connect(pwFault.p, B8.p) annotation (Line(points={{0,24.6667},{1,24.6667},{1,35},{1,51},{-1,51}}, color={0,0,255}));
    annotation (Diagram(coordinateSystem(
          extent={{-160,-120},{150,100}},
          preserveAspectRatio=false,
          initialScale=0.1,
          grid={1,1})), Icon(coordinateSystem(
          extent={{-160,-120},{150,100}},
          preserveAspectRatio=false,
          initialScale=0.1,
          grid={1,1})));
  end IEEE_9Bus_Basic;

  model IEEE_14Bus
    iPSL.Electrical.Buses.Bus B1 annotation (Placement(transformation(
          extent={{-15,-15},{15,15}},
          rotation=90,
          origin={-135,-31})));
    iPSL.Electrical.Buses.Bus B2 annotation (Placement(transformation(
          extent={{-15,-15},{15,15}},
          rotation=90,
          origin={-60,-128})));
    iPSL.Electrical.Buses.Bus B3 annotation (Placement(transformation(
          extent={{-15,-15},{15,15}},
          rotation=90,
          origin={44,-122})));
    iPSL.Electrical.Buses.Bus B4 annotation (Placement(transformation(
          extent={{-15,-15},{15,15}},
          rotation=90,
          origin={32,-32})));
    iPSL.Electrical.Buses.Bus B5 annotation (Placement(transformation(
          extent={{-15,-15},{15,15}},
          rotation=90,
          origin={-24,-40})));
    iPSL.Electrical.Buses.Bus B6 annotation (Placement(transformation(
          extent={{-15,-15},{15,15}},
          rotation=90,
          origin={-47,19})));
    iPSL.Electrical.Buses.Bus B7 annotation (Placement(transformation(
          extent={{-15,-15},{15,15}},
          rotation=90,
          origin={91,1})));
    iPSL.Electrical.Buses.Bus B8 annotation (Placement(transformation(
          extent={{-15,-15},{15,15}},
          rotation=180,
          origin={149,-37})));
    iPSL.Electrical.Buses.Bus B9 annotation (Placement(transformation(
          extent={{-15,-15},{15,15}},
          rotation=90,
          origin={86,44})));
    iPSL.Electrical.Buses.Bus B10 annotation (Placement(transformation(
          extent={{-15,-15},{15,15}},
          rotation=90,
          origin={16,110})));
    iPSL.Electrical.Buses.Bus B11 annotation (Placement(transformation(
          extent={{-15,-15},{15,15}},
          rotation=90,
          origin={16,40})));
    iPSL.Electrical.Buses.Bus B12 annotation (Placement(transformation(
          extent={{-15,-15},{15,15}},
          rotation=90,
          origin={-128,68})));
    iPSL.Electrical.Buses.Bus B13 annotation (Placement(transformation(
          extent={{-15,-15},{15,15}},
          rotation=90,
          origin={-64,110})));
    iPSL.Electrical.Buses.Bus B14 annotation (Placement(transformation(
          extent={{-15,-15},{15,15}},
          rotation=90,
          origin={104,108})));
    iPSL.Electrical.Branches.PwLine L1(
      R=0.05695,
      X=0.17388,
      G=0,
      B=0.034/2) annotation (Placement(transformation(
          extent={{-14,-11},{14,11}},
          rotation=90,
          origin={-35,-82})));
    iPSL.Electrical.Branches.PwLine L7(
      G=0,
      R=0.05403,
      X=0.22304,
      B=0.0492/2) annotation (Placement(transformation(
          extent={{-14,-11},{14,11}},
          rotation=0,
          origin={-70,-53})));
    iPSL.Electrical.Branches.PwLine L3(
      G=0,
      R=0.01938,
      X=0.05917,
      B=0.0528/2) annotation (Placement(transformation(
          extent={{-14,-11},{14,11}},
          rotation=270,
          origin={-73,-88})));
    iPSL.Electrical.Branches.PwLine L6(
      G=0,
      R=0.06701,
      X=0.17103,
      B=0.0346/2) annotation (Placement(transformation(
          extent={{-14,-11},{14,11}},
          rotation=90,
          origin={51,-60})));
    iPSL.Electrical.Branches.PwLine L8(
      G=0,
      R=0.01335,
      X=0.04211,
      B=0.0128/2) annotation (Placement(transformation(
          extent={{-14,-11},{14,11}},
          rotation=0,
          origin={6,-50})));
    iPSL.Electrical.Branches.PwLine L13(
      G=0,
      R=0.09498,
      X=0.1989,
      B=0) annotation (Placement(transformation(
          extent={{-14,-11},{14,11}},
          rotation=0,
          origin={-1,22})));
    iPSL.Electrical.Branches.PwLine L10(
      G=0,
      R=0.12291,
      X=0.25581,
      B=0) annotation (Placement(transformation(
          extent={{-14,-11},{14,11}},
          rotation=90,
          origin={-128,42})));
    iPSL.Electrical.Branches.PwLine L12(
      G=0,
      R=0.06615,
      X=0.13027,
      B=0) annotation (Placement(transformation(
          extent={{-14,-11},{14,11}},
          rotation=90,
          origin={-55,68})));
    iPSL.Electrical.Branches.PwLine L14(
      G=0,
      B=0,
      R=0.08205,
      X=0.19207) annotation (Placement(transformation(
          extent={{-14,-11},{14,11}},
          rotation=90,
          origin={1,69})));
    iPSL.Electrical.Branches.PwLine L15(
      G=0,
      B=0,
      R=0.03181,
      X=0.0845) annotation (Placement(transformation(
          extent={{-14,-11},{14,11}},
          rotation=90,
          origin={63,72})));
    iPSL.Electrical.Branches.PwLine L16(
      G=0,
      B=0,
      R=0.12711,
      X=0.27038) annotation (Placement(transformation(
          extent={{-14,-11},{14,11}},
          rotation=90,
          origin={103,71})));
    iPSL.Electrical.Branches.PwLine L17(
      G=0,
      B=0,
      R=0.17093,
      X=0.34802) annotation (Placement(transformation(
          extent={{-14,-11},{14,11}},
          rotation=180,
          origin={53,103})));
    iPSL.Electrical.Branches.PwLine L2(
      G=0,
      B=0,
      R=0,
      X=0.11001) annotation (Placement(transformation(
          extent={{-14,-11},{14,11}},
          rotation=90,
          origin={90,23})));
    iPSL.Electrical.Branches.PwLine L5(
      G=0,
      R=0.04699,
      X=0.19797,
      B=0.0438/2) annotation (Placement(transformation(
          extent={{-14,-11},{14,11}},
          rotation=180,
          origin={16,-93})));
    iPSL.Electrical.Branches.PwLine L11(
      G=0,
      B=0,
      R=0.22092,
      X=0.19988) annotation (Placement(transformation(
          extent={{-14,-11},{14,11}},
          rotation=90,
          origin={-91,82})));
    iPSL.Electrical.Loads.PSAT.VoltDependant lPQ2(
      P_0=1.4*0.076,
      Q_0=1.4*0.016,
      V_0=1.002918521543744,
      V_b=69,
      angle_0=-0.226950235044097) annotation (Placement(transformation(
          extent={{-6,-6},{6,6}},
          rotation=180,
          origin={-41,-15})));
    iPSL.Electrical.Loads.PSAT.VoltDependant lPQ3(
      P_0=1.4*0.217,
      Q_0=1.4*0.127,
      V_0=1.045,
      V_b=69,
      angle_0=-0.135677901384789) annotation (Placement(transformation(
          extent={{-6,-6},{6,6}},
          rotation=180,
          origin={-28,-118})));
    iPSL.Electrical.Loads.PSAT.VoltDependant lPQ12(
      P_0=1.4*0.942,
      Q_0=1.4*0.19,
      V_0=1.01,
      V_b=69,
      angle_0=-0.332124297307116) annotation (Placement(transformation(
          extent={{-6,-6},{6,6}},
          rotation=180,
          origin={71,-101})));
    iPSL.Electrical.Loads.PSAT.VoltDependant lPQ9(
      P_0=1.4*0.295,
      Q_0=1.4*0.166,
      V_0=1.012902425305420,
      V_b=13.8,
      angle_0=-0.379076293864958) annotation (Placement(transformation(
          extent={{-6,-6},{6,6}},
          rotation=180,
          origin={138,62})));
    iPSL.Electrical.Loads.PSAT.VoltDependant lPQ6(
      P_0=1.4*0.149,
      Q_0=1.4*0.05,
      V_0=0.996954035152595,
      V_b=13.8,
      angle_0=-0.410560994783472) annotation (Placement(transformation(
          extent={{-6,-6},{6,6}},
          rotation=180,
          origin={106,132})));
    iPSL.Electrical.Loads.PSAT.VoltDependant lPQ8(
      P_0=1.4*0.09,
      Q_0=1.4*0.058,
      V_0=1.012187694288416,
      V_b=13.8,
      angle_0=-0.384463531221708) annotation (Placement(transformation(
          extent={{-6,-6},{6,6}},
          rotation=180,
          origin={17,131})));
    iPSL.Electrical.Loads.PSAT.VoltDependant lPQ11(
      P_0=1.4*0.135,
      Q_0=1.4*0.058,
      V_0=1.036593776863207,
      V_b=13.8,
      angle_0=-0.391472739421350) annotation (Placement(transformation(
          extent={{-6,-6},{6,6}},
          rotation=180,
          origin={-62,132})));
    iPSL.Electrical.Loads.PSAT.VoltDependant lPQ7(
      Q_0=1.4*0.016,
      P_0=1.4*0.061,
      V_0=1.046151564164931,
      V_b=13.8,
      angle_0=-0.390590184761169) annotation (Placement(transformation(
          extent={{-6,-6},{6,6}},
          rotation=180,
          origin={-143,101})));
    iPSL.Electrical.Loads.PSAT.VoltDependant lPQ10(
      P_0=1.4*0.035,
      Q_0=1.4*0.018,
      V_0=1.035651856727375,
      V_b=13.8,
      angle_0=-0.379841137315380) annotation (Placement(transformation(
          extent={{-6,-6},{6,6}},
          rotation=180,
          origin={36,58})));
    iPSL.Electrical.Loads.PSAT.VoltDependant lPQ4(
      P_0=1.4*0.112,
      Q_0=1.4*0.075,
      V_0=1.07,
      V_b=13.8,
      angle_0=-0.369562610674901) annotation (Placement(transformation(
          extent={{-6,-6},{6,6}},
          rotation=180,
          origin={-39,73})));
    iPSL.Electrical.Loads.PSAT.VoltDependant lPQ5(
      P_0=1.4*0.478,
      Q_0=1.4*0.04,
      V_0=0.997818344821604,
      V_b=69,
      angle_0=-0.264411509112328) annotation (Placement(transformation(
          extent={{-6,-6},{6,6}},
          rotation=180,
          origin={7,-11})));
    iPSL.Electrical.Branches.PSAT.TwoWindingTransformer twoWindingTransformer(
      V_b=18000,
      Vn=18000,
      fn=60,
      kT=18/13.8,
      x=0.17615,
      r=0) annotation (Placement(transformation(
          extent={{-14,-14},{14,14}},
          rotation=180,
          origin={119,-38})));
    iPSL.Electrical.Branches.PSAT.TWTransformerWithFixedTapRatio tWTransformerWithFixedTapRatio(
      Vbus=69000,
      Vn1=69000,
      fn=60,
      kT=69/13.8,
      R=0,
      m=0.932,
      X=0.25202) annotation (Placement(transformation(
          extent={{-14,-14},{14,14}},
          rotation=90,
          origin={-18,-6})));
    iPSL.Electrical.Branches.PSAT.TWTransformerWithFixedTapRatio tWTransformerWithFixedTapRatio1(
      Vbus=69000,
      Vn1=69000,
      fn=60,
      kT=69/13.8,
      R=0,
      X=0.55618,
      m=0.969) annotation (Placement(transformation(
          extent={{-14,-14},{14,14}},
          rotation=90,
          origin={42,16})));
    iPSL.Electrical.Branches.PSAT.TWTransformerWithFixedTapRatio tWTransformerWithFixedTapRatio2(
      Vbus=69000,
      Vn1=69000,
      fn=60,
      kT=69/13.8,
      R=0,
      X=0.20912,
      m=0.978) annotation (Placement(transformation(
          extent={{-14,-14},{14,14}},
          rotation=0,
          origin={62,-18})));
    IEEE_14_GenerationGroups.GroupBus1 groupBus1_1 annotation (Placement(transformation(extent={{-160,-24},{-140,-4}})));
    IEEE_14_GenerationGroups.GroupBus2 groupBus2_1 annotation (Placement(transformation(extent={{-84,-160},{-64,-140}})));
    IEEE_14_GenerationGroups.GroupBus3 groupBus3_1 annotation (Placement(transformation(extent={{10,-162},{32,-142}})));
    IEEE_14_GenerationGroups.GroupBus6 groupBus6_1 annotation (Placement(transformation(extent={{-96,-10},{-76,10}})));
    IEEE_14_GenerationGroups.GroupBus8 groupBus8_1 annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=180,
          origin={172,-36})));
    iPSL.Electrical.Branches.PwLinewithOpeningSending pwLinewithOpeningSending(
      R=0.05811,
      X=0.17632,
      G=0,
      B=0.0374/2,
      t2=25,
      t1=11) annotation (Placement(transformation(extent={{-20,-89},{8,-67}})));
    iPSL.Electrical.Events.PwFault pwFault(
      ground=1,
      R=0.01,
      X=0.001,
      t1=1,
      t2=1.2) annotation (Placement(transformation(extent={{68,-40},{78,-30}})));
    inner iPSL.Electrical.SystemBase SysData(S_b=100, fn=60) annotation (Placement(transformation(extent={{-194,126},{-128,154}})));
  equation
    connect(B12.p, L11.p) annotation (Line(
        points={{-128,68},{-128,65.6667},{-91,65.6667}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(L10.p, B6.p) annotation (Line(
        points={{-128,25.6667},{-128,26},{-47,26},{-47,19}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(B3.p, L6.p) annotation (Line(
        points={{44,-122},{44,-70},{51,-70},{51,-76.3333}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(B1.p, L3.p) annotation (Line(
        points={{-135,-31},{-135,-74},{-73,-74},{-73,-71.6667}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(B4.p, L6.n) annotation (Line(
        points={{32,-32},{32,-42},{51,-42},{51,-43.6667}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(B4.p, L8.n) annotation (Line(
        points={{32,-32},{32,-42},{18,-42},{18,-50},{22.3333,-50}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(B5.p, lPQ2.p) annotation (Line(
        points={{-24,-40},{-24,-21.6},{-41,-21.6}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(lPQ5.p, B4.p) annotation (Line(
        points={{7,-17.6},{7,-24},{32,-24},{32,-32}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(lPQ11.p, B13.p) annotation (Line(
        points={{-62,125.4},{-62,118},{-64,118},{-64,110}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(B10.p, L15.n) annotation (Line(
        points={{16,110},{16,84},{63,84},{63,88.3333}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(B10.p, L14.n) annotation (Line(
        points={{16,110},{16,82},{1,82},{1,85.3333}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(B13.p, L12.n) annotation (Line(
        points={{-64,110},{-64,80},{-55,80},{-55,84.3333}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(L16.n, B14.p) annotation (Line(points={{103,87.3333},{103,88.05},{104,88.05},{104,108}}, color={0,0,255}));
    connect(B9.p, lPQ9.p) annotation (Line(points={{86,44},{86,44},{86,50},{138,50},{138,55.4}}, color={0,0,255}));
    connect(B11.p, lPQ10.p) annotation (Line(points={{16,40},{16,40},{16,51.4},{36,51.4}}, color={0,0,255}));
    connect(B11.p, L14.p) annotation (Line(points={{16,40},{16,40},{16,52.6667},{1,52.6667}}, color={0,0,255}));
    connect(lPQ4.p, B6.p) annotation (Line(points={{-39,66.4},{-39,44.75},{-47,44.75},{-47,19}}, color={0,0,255}));
    connect(B6.p, L12.p) annotation (Line(points={{-47,19},{-47,40.5},{-55,40.5},{-55,51.6667}}, color={0,0,255}));
    connect(lPQ7.p, B12.p) annotation (Line(points={{-143,94.4},{-143,82},{-128,82},{-128,68}}, color={0,0,255}));
    connect(B13.p, L11.n) annotation (Line(points={{-64,110},{-64,98},{-91,98},{-91,98.3333}}, color={0,0,255}));
    connect(L10.n, B12.p) annotation (Line(points={{-128,58.3333},{-128,68}}, color={0,0,255}));
    connect(B3.p, lPQ12.p) annotation (Line(points={{44,-122},{44,-122},{44,-106},{44,-107.6},{71,-107.6}}, color={0,0,255}));
    connect(B3.p, L5.p) annotation (Line(points={{44,-122},{44,-93},{32.3333,-93}}, color={0,0,255}));
    connect(B7.p, L2.p) annotation (Line(points={{91,1},{91,9.5},{90,9.5},{90,6.66667}}, color={0,0,255}));
    connect(B9.p, L2.n) annotation (Line(points={{86,44},{90,44},{90,39.3333}}, color={0,0,255}));
    connect(B2.p, lPQ3.p) annotation (Line(points={{-60,-128},{-60,-124.6},{-28,-124.6}}, color={0,0,255}));
    connect(B2.p, L1.p) annotation (Line(points={{-60,-128},{-60,-98.3333},{-35,-98.3333}}, color={0,0,255}));
    connect(L1.n, B5.p) annotation (Line(points={{-35,-65.6667},{-35,-59.8},{-24,-59.8},{-24,-40}}, color={0,0,255}));
    connect(B2.p, L3.n) annotation (Line(points={{-60,-128},{-60,-104.333},{-73,-104.333}}, color={0,0,255}));
    connect(B1.p, L7.p) annotation (Line(points={{-135,-31},{-135,-53},{-86.3333,-53}}, color={0,0,255}));
    connect(B5.p, L7.n) annotation (Line(points={{-24,-40},{-24,-53},{-53.6667,-53}}, color={0,0,255}));
    connect(B7.p, twoWindingTransformer.n) annotation (Line(points={{91,1},{91,-38},{103.6,-38}}, color={0,0,255}));
    connect(twoWindingTransformer.p, B8.p) annotation (Line(points={{134.4,-38},{149,-38},{149,-37}}, color={0,0,255}));
    connect(B4.p, tWTransformerWithFixedTapRatio1.p) annotation (Line(points={{32,-32},{32,-32},{32,-4},{32,0.6},{42,0.6}}, color={0,0,255}));
    connect(B5.p, tWTransformerWithFixedTapRatio.p) annotation (Line(points={{-24,-40},{-22,-40},{-22,-21.4},{-18,-21.4}}, color={0,0,255}));
    connect(B6.p, tWTransformerWithFixedTapRatio.n) annotation (Line(points={{-47,19},{-47,12},{-18,12},{-18,9.4}}, color={0,0,255}));
    connect(groupBus2_1.pwPin, B2.p) annotation (Line(points={{-63,-150},{-60,-150},{-60,-128}}, color={0,0,255}));
    connect(groupBus3_1.pwPin, B3.p) annotation (Line(points={{33,-152.2},{44,-152.2},{44,-122}}, color={0,0,255}));
    connect(groupBus6_1.pwPin, B6.p) annotation (Line(points={{-75,0},{-47,0},{-47,19}}, color={0,0,255}));
    connect(B4.p, tWTransformerWithFixedTapRatio2.p) annotation (Line(points={{32,-32},{36,-32},{36,-18},{46.6,-18}}, color={0,0,255}));
    connect(B7.p, tWTransformerWithFixedTapRatio2.n) annotation (Line(points={{91,1},{91,-8.5},{77.4,-8.5},{77.4,-18}}, color={0,0,255}));
    connect(B9.p, tWTransformerWithFixedTapRatio1.n) annotation (Line(points={{86,44},{86,44},{86,36},{86,34},{42,34},{42,31.4}}, color={0,0,255}));
    connect(B6.p, L13.p) annotation (Line(points={{-47,19},{-47,28},{-14,28},{-14,22},{-17.3333,22}}, color={0,0,255}));
    connect(L13.n, B11.p) annotation (Line(points={{15.3333,22},{16,22},{16,40}}, color={0,0,255}));
    connect(B5.p, L8.p) annotation (Line(points={{-24,-40},{-24,-40},{-24,-32},{-6,-32},{-6,-50},{-10.3333,-50}}, color={0,0,255}));
    connect(groupBus1_1.pwPin, B1.p) annotation (Line(points={{-139,-14.2},{-135,-14.2},{-135,-31}}, color={0,0,255}));
    connect(B8.p, groupBus8_1.pwPin) annotation (Line(points={{149,-37},{159.5,-37},{159.5,-36.2},{160.8,-36.2}}, color={0,0,255}));
    connect(L15.p, B9.p) annotation (Line(points={{63,55.6667},{86,55.6667},{86,44}}, color={0,0,255}));
    connect(B9.p, L16.p) annotation (Line(points={{86,44},{86,44},{86,64},{86,54.6667},{103,54.6667}}, color={0,0,255}));
    connect(B14.p, L17.p) annotation (Line(points={{104,108},{104,118},{74,118},{74,103},{69.3333,103}}, color={0,0,255}));
    connect(B13.p, L17.n) annotation (Line(points={{-64,110},{-64,103},{36.6667,103}}, color={0,0,255}));
    connect(lPQ8.p, B10.p) annotation (Line(points={{17,124.4},{17,114.65},{16,114.65},{16,110}}, color={0,0,255}));
    connect(lPQ6.p, L17.p) annotation (Line(points={{106,125.4},{106,118},{74,118},{74,103},{69.3333,103}}, color={0,0,255}));
    connect(B2.p, pwLinewithOpeningSending.p) annotation (Line(points={{-60,-128},{-60,-128},{-60,-100},{-60,-102},{-15.8,-102},{-15.8,-78}}, color={0,0,255}));
    connect(B4.p, pwLinewithOpeningSending.n) annotation (Line(points={{32,-32},{32,-32},{32,-76},{3.8,-76},{3.8,-78}}, color={0,0,255}));
    connect(L5.n, B2.p) annotation (Line(points={{-0.333333,-93},{-6,-93},{-6,-134},{-60,-134},{-60,-128}}, color={0,0,255}));
    connect(B4.p, pwFault.p) annotation (Line(points={{32,-32},{32,-26},{67.1667,-26},{67.1667,-35}}, color={0,0,255}));
    annotation (
      Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-200,-180},{200,160}})),
      Icon(coordinateSystem(extent={{-200,-180},{200,160}})),
      Documentation(info="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td>PSAT Manual 2.1.8</td>
</tr>
<tr>
<td><p>Last update</p></td>
<td>13/07/2015</td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>MAA Murad,SmarTS Lab, KTH Royal Institute of Technology</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p><a href=\"mailto:luigiv@kth.se\">luigiv@kth.se</a></p></td>
</tr>
</table>
<p><br><span style=\"font-family: MS Shell Dlg 2;\">&LT;iPSL: iTesla Power System Library&GT;</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Copyright 2015 RTE (France), AIA (Spain), KTH (Sweden) and DTU (Denmark)</span></p>
<ul>
<li><span style=\"font-family: MS Shell Dlg 2;\">RTE: http://www.rte-france.com/ </span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">AIA: http://www.aia.es/en/energy/</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">KTH: https://www.kth.se/en</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">DTU:http://www.dtu.dk/english</span></li>
</ul>
<p><span style=\"font-family: MS Shell Dlg 2;\">The authors can be contacted by email: info at itesla-ipsl dot org</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">This package is part of the iTesla Power System Library (&QUOT;iPSL&QUOT;) .</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">You should have received a copy of the GNU Lesser General Public License along with the iPSL. If not, see &LT;http://www.gnu.org/licenses/&GT;.</span></p>
</html>"));
  end IEEE_14Bus;

  package IEEE_14_GenerationGroups
    model GroupBus1
      import PowerSystems = iPSL;
      PowerSystems.Electrical.Controls.PSAT.AVR.AVRTypeII AVR1(
        Ka=200,
        Ta=0.02,
        Kf=0.002,
        Tf=1,
        Ke=1,
        Te=0.2,
        Tr=0.001,
        v0=1.06,
        vrmin=0,
        vrmax=7.32,
        vref0=1.065622531687790,
        vf0=1.122656195484140) annotation (Placement(transformation(extent={{-52,-6},{0,42}})));
      iPSL.Electrical.Machines.PSAT.FifthOrder.Order5_Type2 Syn1(
        Sn=615,
        Vn=69000,
        V_b=69000,
        fn=60,
        ra=0,
        xd=0.8979,
        xq=0.646,
        xd1=0.2998,
        xd2=0.23,
        xq2=0.4,
        Td10=7.4,
        Td20=0.03,
        Tq20=0.033,
        M=2*5.148,
        D=2,
        V_0=1.06,
        angle_0=0,
        P_0=3.520304175896800,
        Q_0=-0.281968127428243,
        Taa=0.002) annotation (Placement(transformation(extent={{34,-32},{88,30}})));
      Modelica.Blocks.Sources.Constant const5(k=1.065622531687790) annotation (Placement(transformation(
            extent={{-12,-12},{12,12}},
            rotation=0,
            origin={-72,28})));
      PowerSystems.Connectors.PwPin pwPin annotation (Placement(transformation(extent={{100,-12},{120,8}}), iconTransformation(extent={{100,-12},{120,8}})));
    equation
      connect(AVR1.vf, Syn1.vf) annotation (Line(points={{-3.9,24.24},{12,24.24},{12,14.5},{34,14.5}}, color={0,0,127}));
      connect(Syn1.v, AVR1.v) annotation (Line(points={{90.7,8.3},{96,8.3},{96,-56},{-82,-56},{-82,4},{-46.8,4},{-46.8,15.6}}, color={0,0,127}));
      connect(const5.y, AVR1.vref) annotation (Line(points={{-58.8,28},{-54,28},{-54,30},{-54,30.96},{-46.8,30.96}}, color={0,0,127}));
      connect(Syn1.pm0, Syn1.pm) annotation (Line(points={{39.4,-35.1},{98,-35.1},{98,-30},{98,-44},{4,-44},{4,-16.5},{34,-16.5}}, color={0,0,127}));
      connect(Syn1.p, pwPin) annotation (Line(points={{90.7,-0.846116},{100.35,-0.846116},{100.35,-2},{110,-2}}, color={0,0,255}));
      annotation (
        Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}})),
        Icon(coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=false), graphics={Text(
                  extent={{-93,6},{-24,-12}},
                  lineColor={0,0,255},
                  textStyle={TextStyle.Italic},
                  textString=""),Ellipse(extent={{-94,68},{98,-84}}, lineColor={28,108,200}),Line(points={{-28,-8},{-12,16}}, color={28,108,200}),Line(points={{-12,16},{14,-16},{32,10}}, color={28,
              108,200}),Text(
                  extent={{-18,-32},{20,-64}},
                  lineColor={28,108,200},
                  textString="Gen1 5.2")}),
        Documentation(info="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td>PSAT Manual 2.1.8</td>
</tr>
<tr>
<td><p>Last update</p></td>
<td>13/07/2015</td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>MAA Murad,SmarTS Lab, KTH Royal Institute of Technology</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p><a href=\"mailto:luigiv@kth.se\">luigiv@kth.se</a></p></td>
</tr>
</table>
<p><br><span style=\"font-family: MS Shell Dlg 2;\">&LT;iPSL: iTesla Power System Library&GT;</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Copyright 2015 RTE (France), AIA (Spain), KTH (Sweden) and DTU (Denmark)</span></p>
<ul>
<li><span style=\"font-family: MS Shell Dlg 2;\">RTE: http://www.rte-france.com/ </span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">AIA: http://www.aia.es/en/energy/</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">KTH: https://www.kth.se/en</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">DTU:http://www.dtu.dk/english</span></li>
</ul>
<p><span style=\"font-family: MS Shell Dlg 2;\">The authors can be contacted by email: info at itesla-ipsl dot org</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">This package is part of the iTesla Power System Library (&QUOT;iPSL&QUOT;) .</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">You should have received a copy of the GNU Lesser General Public License along with the iPSL. If not, see &LT;http://www.gnu.org/licenses/&GT;.</span></p>
</html>"));
    end GroupBus1;

    model GroupBus2
      import PowerSystems = iPSL;
      PowerSystems.Electrical.Controls.PSAT.AVR.AVRTypeII aVR1TypeII1(
        Ta=0.02,
        Tf=1,
        Ke=1,
        Tr=0.001,
        Ka=20,
        Kf=0.001,
        Te=1.98,
        v0=1.045,
        vrmin=0,
        vrmax=4.38,
        vf0=2.718126892405428,
        vref0=1.181847826013889) annotation (Placement(transformation(extent={{-52,0},{-2,38}})));
      Modelica.Blocks.Sources.Constant const1(k=1.181847826013889) annotation (Placement(transformation(extent={{-94,24},{-68,50}})));
      iPSL.Electrical.Machines.PSAT.SixthOrder.Order6 Syn3(
        Sn=60,
        Vn=69000,
        V_b=69000,
        fn=60,
        ra=0.0031,
        xq=0.98,
        xd1=0.1850,
        xq1=0.36,
        xd2=0.13,
        xq2=0.13,
        Td10=6.1,
        Tq10=0.3,
        Tq20=0.099,
        M=2*6.54,
        D=2,
        V_0=1.045,
        xd=1.05,
        angle_0=-0.135677901384789,
        P_0=0.399999999999999,
        Q_0=0.948601533828266) annotation (Placement(transformation(extent={{20,-36},{86,34}})));
      PowerSystems.Connectors.PwPin pwPin annotation (Placement(transformation(extent={{122,-10},{142,10}}), iconTransformation(extent={{122,-10},{142,10}})));
    equation
      connect(aVR1TypeII1.vf, Syn3.vf) annotation (Line(points={{-5.75,23.94},{-2.65,23.94},{-2.65,16.5},{20,16.5}}, color={0,0,127}));
      connect(Syn3.v, aVR1TypeII1.v) annotation (Line(points={{89.3,9.5},{116,9.5},{116,-88},{-82,-88},{-82,-84},{-82,14},{-82,17.1},{-47,17.1}}, color={0,0,127}));
      connect(const1.y, aVR1TypeII1.vref) annotation (Line(points={{-66.7,37},{-54,37},{-54,29.26},{-47,29.26}}, color={0,0,127}));
      connect(Syn3.p, pwPin) annotation (Line(points={{89.3,-0.82626},{110.65,-0.82626},{110.65,0},{132,0}}, color={0,0,255}));
      connect(Syn3.pm0, Syn3.pm) annotation (Line(points={{26.6,-39.5},{110,-39.5},{110,-60},{-32,-60},{-32,-18.5},{20,-18.5}}, color={0,0,127}));
      annotation (
        Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-120,-100},{120,100}})),
        Icon(coordinateSystem(extent={{-120,-100},{120,100}}, preserveAspectRatio=false), graphics={Ellipse(extent={{-72,78},{120,-74}}, lineColor={28,108,200}),Line(points={{0,26},{26,-6},{44,20}},
              color={28,108,200}),Line(points={{-16,2},{0,26}}, color={28,108,200}),Text(
                  extent={{-6,-22},{32,-54}},
                  lineColor={28,108,200},
                  textString="Gen2 6")}),
        Documentation(info="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td>PSAT Manual 2.1.8</td>
</tr>
<tr>
<td><p>Last update</p></td>
<td>13/07/2015</td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>MAA Murad,SmarTS Lab, KTH Royal Institute of Technology</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p><a href=\"mailto:luigiv@kth.se\">luigiv@kth.se</a></p></td>
</tr>
</table>
<p><br><span style=\"font-family: MS Shell Dlg 2;\">&LT;iPSL: iTesla Power System Library&GT;</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Copyright 2015 RTE (France), AIA (Spain), KTH (Sweden) and DTU (Denmark)</span></p>
<ul>
<li><span style=\"font-family: MS Shell Dlg 2;\">RTE: http://www.rte-france.com/ </span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">AIA: http://www.aia.es/en/energy/</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">KTH: https://www.kth.se/en</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">DTU:http://www.dtu.dk/english</span></li>
</ul>
<p><span style=\"font-family: MS Shell Dlg 2;\">The authors can be contacted by email: info at itesla-ipsl dot org</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">This package is part of the iTesla Power System Library (&QUOT;iPSL&QUOT;) .</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">You should have received a copy of the GNU Lesser General Public License along with the iPSL. If not, see &LT;http://www.gnu.org/licenses/&GT;.</span></p>
</html>"));
    end GroupBus2;

    model GroupBus3
      import PowerSystems = iPSL;
      PowerSystems.Electrical.Controls.PSAT.AVR.AVRTypeII aVR2TypeII2(
        Ta=0.02,
        Tf=1,
        Ke=1,
        Tr=0.001,
        Ka=20,
        Kf=0.001,
        Te=1.98,
        v0=1.01,
        vrmin=0,
        vrmax=4.38,
        vref0=1.112638137121514,
        vf0=2.045032675265062) annotation (Placement(transformation(
            extent={{-30,-32},{30,32}},
            rotation=0,
            origin={-28,-2})));
      Modelica.Blocks.Sources.Constant const2(k=1.112638137121514) annotation (Placement(transformation(
            extent={{-12,-12},{12,12}},
            rotation=0,
            origin={-78,18})));
      iPSL.Electrical.Machines.PSAT.SixthOrder.Order6 Syn2(
        Sn=60,
        Vn=69000,
        V_b=69000,
        fn=60,
        ra=0.0031,
        xq=0.98,
        xd1=0.1850,
        xq1=0.36,
        xd2=0.13,
        xq2=0.13,
        Td10=6.1,
        Tq10=0.3,
        Tq20=0.099,
        M=2*6.54,
        D=2,
        V_0=1.01,
        xd=1.05,
        angle_0=-0.332124297307116,
        P_0=0.000000000000001,
        Q_0=0.597360399382518) annotation (Placement(transformation(
            extent={{-28,-25},{28,25}},
            rotation=0,
            origin={66,1})));
      PowerSystems.Connectors.PwPin pwPin annotation (Placement(transformation(extent={{120,-12},{140,8}}), iconTransformation(extent={{120,-12},{140,8}})));
    equation
      connect(aVR2TypeII2.vf, Syn2.vf) annotation (Line(points={{-2.5,6.32},{12,6.32},{12,13.5},{38,13.5}}, color={0,0,127}));
      connect(Syn2.v, aVR2TypeII2.v) annotation (Line(points={{96.8,8.5},{112,8.5},{112,-48},{-82,-48},{-82,-5.2},{-52,-5.2}}, color={0,0,127}));
      connect(Syn2.pm0, Syn2.pm) annotation (Line(points={{43.6,-26.5},{122,-26.5},{122,-36},{16,-36},{16,-11.5},{38,-11.5}}, color={0,0,127}));
      connect(Syn2.p, pwPin) annotation (Line(points={{96.8,1.1241},{115.4,1.1241},{115.4,-2},{130,-2}}, color={0,0,255}));
      connect(const2.y, aVR2TypeII2.vref) annotation (Line(points={{-64.8,18},{-52,18},{-52,15.28}}, color={0,0,127}));
      annotation (
        Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{120,100}})),
        Icon(coordinateSystem(extent={{-100,-100},{120,100}}, preserveAspectRatio=false), graphics={Ellipse(extent={{-80,78},{112,-74}}, lineColor={28,108,200}),Line(points={{-8,26},{18,-6},{36,20}},
              color={28,108,200}),Line(points={{-24,2},{-8,26}}, color={28,108,200}),Text(
                  extent={{-14,-24},{24,-56}},
                  lineColor={28,108,200},
                  textString="Gen3 6")}),
        Documentation(info="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td>PSAT Manual 2.1.8</td>
</tr>
<tr>
<td><p>Last update</p></td>
<td>13/07/2015</td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>MAA Murad,SmarTS Lab, KTH Royal Institute of Technology</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p><a href=\"mailto:luigiv@kth.se\">luigiv@kth.se</a></p></td>
</tr>
</table>
<p><br><span style=\"font-family: MS Shell Dlg 2;\">&LT;iPSL: iTesla Power System Library&GT;</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Copyright 2015 RTE (France), AIA (Spain), KTH (Sweden) and DTU (Denmark)</span></p>
<ul>
<li><span style=\"font-family: MS Shell Dlg 2;\">RTE: http://www.rte-france.com/ </span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">AIA: http://www.aia.es/en/energy/</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">KTH: https://www.kth.se/en</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">DTU:http://www.dtu.dk/english</span></li>
</ul>
<p><span style=\"font-family: MS Shell Dlg 2;\">The authors can be contacted by email: info at itesla-ipsl dot org</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">This package is part of the iTesla Power System Library (&QUOT;iPSL&QUOT;) .</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">You should have received a copy of the GNU Lesser General Public License along with the iPSL. If not, see &LT;http://www.gnu.org/licenses/&GT;.</span></p>
</html>"));
    end GroupBus3;

    model GroupBus6
      import PowerSystems = iPSL;
      PowerSystems.Electrical.Controls.PSAT.AVR.AVRTypeII aVR4TypeII1(
        Ta=0.02,
        Tf=1,
        Ke=1,
        Tr=0.001,
        Ka=20,
        Kf=0.001,
        Te=0.7,
        v0=1.07,
        vrmin=1.395,
        vrmax=6.81,
        vf0=3.146313160164691,
        vref0=1.228917822125829) annotation (Placement(transformation(
            extent={{-23,-17},{23,17}},
            rotation=0,
            origin={7,27})));
      Modelica.Blocks.Sources.Constant const4(k=1.228917822125829) annotation (Placement(transformation(
            extent={{-16,-16},{16,16}},
            rotation=0,
            origin={-60,40})));
      iPSL.Electrical.Machines.PSAT.SixthOrder.Order6 Syn5(
        fn=60,
        D=2,
        Sn=25,
        xd=1.25,
        xq=1.22,
        xd1=0.232,
        xq1=0.715,
        xd2=0.12,
        xq2=0.12,
        Td10=4.75,
        Tq10=1.5,
        Td20=0.06,
        Tq20=0.21,
        M=2*5.06,
        Vn=13800,
        V_b=13800,
        V_0=1.07,
        angle_0=-0.369562610674901,
        P_0=-0.000000000000000,
        Q_0=0.444329439389710,
        ra=0.0041) annotation (Placement(transformation(
            extent={{-23,-20},{23,20}},
            rotation=0,
            origin={69,2})));
      PowerSystems.Connectors.PwPin pwPin annotation (Placement(transformation(extent={{100,-10},{120,10}}), iconTransformation(extent={{100,-10},{120,10}})));
    equation
      connect(const4.y, aVR4TypeII1.vref) annotation (Line(points={{-42.4,40},{-26,40},{-26,36.18},{-11.4,36.18}}, color={0,0,127}));
      connect(aVR4TypeII1.vf, Syn5.vf) annotation (Line(points={{26.55,31.42},{32,31.42},{32,12},{46,12}}, color={0,0,127}));
      connect(Syn5.v, aVR4TypeII1.v) annotation (Line(points={{94.3,8},{98,8},{98,-66},{-28,-66},{-28,25.3},{-11.4,25.3}}, color={0,0,127}));
      connect(Syn5.pm0, Syn5.pm) annotation (Line(points={{50.6,-20},{122,-20},{122,-38},{20,-38},{20,-8},{46,-8}}, color={0,0,127}));
      connect(Syn5.p, pwPin) annotation (Line(points={{94.3,2.09928},{113.15,2.09928},{113.15,0},{110,0}}, color={0,0,255}));
      annotation (
        Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}})),
        Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics={Ellipse(extent={{-92,78},{100,-74}}, lineColor={28,108,200}),Line(points={{-20,26},{6,-6},{24,20}},
              color={28,108,200}),Line(points={{-36,2},{-20,26}}, color={28,108,200}),Text(
                  extent={{-24,-22},{14,-54}},
                  lineColor={28,108,200},
                  textString="Gen4 6")}),
        Documentation(info="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td>PSAT Manual 2.1.8</td>
</tr>
<tr>
<td><p>Last update</p></td>
<td>13/07/2015</td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>MAA Murad,SmarTS Lab, KTH Royal Institute of Technology</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p><a href=\"mailto:luigiv@kth.se\">luigiv@kth.se</a></p></td>
</tr>
</table>
<p><br><span style=\"font-family: MS Shell Dlg 2;\">&LT;iPSL: iTesla Power System Library&GT;</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Copyright 2015 RTE (France), AIA (Spain), KTH (Sweden) and DTU (Denmark)</span></p>
<ul>
<li><span style=\"font-family: MS Shell Dlg 2;\">RTE: http://www.rte-france.com/ </span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">AIA: http://www.aia.es/en/energy/</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">KTH: https://www.kth.se/en</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">DTU:http://www.dtu.dk/english</span></li>
</ul>
<p><span style=\"font-family: MS Shell Dlg 2;\">The authors can be contacted by email: info at itesla-ipsl dot org</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">This package is part of the iTesla Power System Library (&QUOT;iPSL&QUOT;) .</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">You should have received a copy of the GNU Lesser General Public License along with the iPSL. If not, see &LT;http://www.gnu.org/licenses/&GT;.</span></p>
</html>"));
    end GroupBus6;

    model GroupBus8
      import PowerSystems = iPSL;
      PowerSystems.Electrical.Controls.PSAT.AVR.AVRTypeII aVR3TypeII2(
        Ta=0.02,
        Tf=1,
        Ke=1,
        Tr=0.001,
        Ka=20,
        Kf=0.001,
        Te=0.7,
        v0=1.09,
        vrmin=1.395,
        vrmax=6.81,
        vf0=2.622215878949932,
        vref0=1.221943942023239) annotation (Placement(transformation(
            extent={{-20,-21},{20,21}},
            rotation=0,
            origin={-12,11})));
      Modelica.Blocks.Sources.Constant const3(k=1.221943942023239) annotation (Placement(transformation(
            extent={{-9,-9},{9,9}},
            rotation=0,
            origin={-67,19})));
      iPSL.Electrical.Machines.PSAT.SixthOrder.Order6 Syn4(
        fn=60,
        D=2,
        Sn=25,
        Vn=18000,
        V_b=18000,
        xd=1.25,
        xq=1.22,
        xd1=0.232,
        xq1=0.715,
        xd2=0.12,
        xq2=0.12,
        Td10=4.75,
        Tq10=1.5,
        Td20=0.06,
        Tq20=0.21,
        M=2*5.06,
        V_0=1.09,
        angle_0=-0.339378947160109,
        P_0=-0.000000000000000,
        Q_0=0.334022011934611,
        ra=0.0041) annotation (Placement(transformation(
            extent={{-17,-17},{17,17}},
            rotation=0,
            origin={55,1})));
      PowerSystems.Connectors.PwPin pwPin annotation (Placement(transformation(extent={{102,-8},{122,12}}), iconTransformation(extent={{102,-8},{122,12}})));
    equation
      connect(aVR3TypeII2.vf, Syn4.vf) annotation (Line(points={{5,16.46},{20.5,16.46},{20.5,9.5},{38,9.5}}, color={0,0,127}));
      connect(Syn4.v, aVR3TypeII2.v) annotation (Line(points={{73.7,6.1},{98,6.1},{98,-34},{-36,-34},{-36,8.9},{-28,8.9}}, color={0,0,127}));
      connect(Syn4.pm0, Syn4.pm) annotation (Line(points={{41.4,-17.7},{88,-17.7},{88,-28},{-6,-28},{-6,-7.5},{38,-7.5}}, color={0,0,127}));
      connect(Syn4.p, pwPin) annotation (Line(points={{73.7,1.08439},{103.85,1.08439},{103.85,2},{112,2}}, color={0,0,255}));
      connect(const3.y, aVR3TypeII2.vref) annotation (Line(points={{-57.1,19},{-45.55,19},{-45.55,22.34},{-28,22.34}}, color={0,0,127}));
      annotation (
        Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}})),
        Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics={Ellipse(extent={{-92,78},{100,-74}}, lineColor={28,108,200}),Line(points={{-20,26},{6,-6},{24,20}},
              color={28,108,200}),Line(points={{-36,2},{-20,26}}, color={28,108,200}),Text(
                  extent={{-26,-22},{12,-54}},
                  lineColor={28,108,200},
                  textString="Gen2 6")}),
        Documentation(info="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td>PSAT Manual 2.1.8</td>
</tr>
<tr>
<td><p>Last update</p></td>
<td>13/07/2015</td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>MAA Murad,SmarTS Lab, KTH Royal Institute of Technology</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p><a href=\"mailto:luigiv@kth.se\">luigiv@kth.se</a></p></td>
</tr>
</table>
<p><br><span style=\"font-family: MS Shell Dlg 2;\">&LT;iPSL: iTesla Power System Library&GT;</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Copyright 2015 RTE (France), AIA (Spain), KTH (Sweden) and DTU (Denmark)</span></p>
<ul>
<li><span style=\"font-family: MS Shell Dlg 2;\">RTE: http://www.rte-france.com/ </span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">AIA: http://www.aia.es/en/energy/</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">KTH: https://www.kth.se/en</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">DTU:http://www.dtu.dk/english</span></li>
</ul>
<p><span style=\"font-family: MS Shell Dlg 2;\">The authors can be contacted by email: info at itesla-ipsl dot org</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">This package is part of the iTesla Power System Library (&QUOT;iPSL&QUOT;) .</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">You should have received a copy of the GNU Lesser General Public License along with the iPSL. If not, see &LT;http://www.gnu.org/licenses/&GT;.</span></p>
</html>"));
    end GroupBus8;
  end IEEE_14_GenerationGroups;

  package IEEE_9_GenerationGroups "Component models with different configuration each"
    model ieee9bus_configBus1

      iPSL.Connectors.PwPin pwpin1 annotation (Placement(
          visible=true,
          transformation(
            origin={100,0},
            extent={{-5,-5},{5,5}},
            rotation=0),
          iconTransformation(
            origin={100,0},
            extent={{-10,-10},{10,10}},
            rotation=0)));
      iPSL.Electrical.Machines.PSSE.GENSAL.GENSAL gensal1(
        Mbase=275,
        Tpd0=8.96,
        Tppd0=0.05,
        Tppq0=0.05,
        H=9.55,
        D=1.6,
        Xd=0.3615,
        Xq=0.24,
        Xpd=0.1508,
        Xppd=0.1,
        Xppq=0.1,
        Xl=0.06,
        s10=1.01,
        s12=1.02,
        Sbase=100,
        eterm=1.04,
        anglev0=0,
        pelec=71.61309,
        qelec=25.59159) annotation (Placement(visible=true, transformation(
            origin={14,-0.5},
            extent={{-53,-44.5},{53,44.5}},
            rotation=0)));
      iPSL.Electrical.Controls.PSSE.ES.IEEET1.IEEET1 ieeet11(
        TR=0.0,
        KA=20.0,
        TA=0.2,
        VRMAX=3.0,
        VRMIN=-3.0,
        KE=1.0,
        TE=0.314,
        KF=0.063,
        TF=0.35,
        E1=2.8,
        SE1=0.3034,
        E2=3.73,
        SE2=1.2884,
        Ec0=1.04) annotation (Placement(visible=true, transformation(
            origin={-83.0746,15.5},
            extent={{-54.9254,-54.5},{47.0746,54.5}},
            rotation=0)));
      iPSL.Electrical.Controls.PSSE.TG.IEESGO ieesgo1(
        T1=25,
        T2=0.0,
        T3=1.0,
        T4=1.0,
        T5=12.5,
        T6=0.0,
        K1=5.0,
        K2=3.0,
        K3=0.5,
        PMAX=1.0,
        PMIN=0.0) annotation (Placement(visible=true, transformation(
            origin={-115.5,87.5},
            extent={{-68.5,-35.5},{68.5,35.5}},
            rotation=0)));
      iPSL.Electrical.Controls.PSSE.PSS.PSS2A.PSS2A pss2a1(
        T_w1=2,
        T_w2=2,
        T_6=0,
        T_w3=2,
        T_w4=4,
        T_7=2,
        K_S2=0.250,
        K_S3=1,
        T_8=0.5,
        T_9=0.1,
        K_S1=30,
        T_1=0.150,
        T_2=0.03,
        T_3=0.15,
        T_4=0.03,
        M=0,
        N=0) annotation (Placement(visible=true, transformation(
            origin={-219.998,23.7145},
            extent={{-31.0017,-11.7145},{61.9962,29.2857}},
            rotation=0)));
      Modelica.Blocks.Sources.Constant const(k=0) annotation (Placement(visible=true, transformation(
            origin={-217,-8},
            extent={{-10,-10},{10,10}},
            rotation=0)));
    equation
      connect(gensal1.p, pwpin1) annotation (Line(points={{72.3,-0.5},{80.0753,-0.5},{80.0753,0},{100,0}}, color={0,0,255}));
      connect(gensal1.EFD0, ieeet11.EFD0) annotation (Line(points={{71.24,-31.65},{56,-31.65},{56,-60},{-159,-60},{-159,-28.1},{-136.431,-28.1}}, color={0,0,127}));
      connect(gensal1.ETERM, ieeet11.EC) annotation (Line(points={{71.24,21.75},{87,21.75},{87,-71},{-175,-71},{-175,-6.3},{-136.431,-6.3}}, color={0,0,127}));
      connect(ieesgo1.PMECH, gensal1.PMECH) annotation (Line(points={{-42.7188,92.5714},{-49,92.5714},{-49,21.75},{-37.94,21.75}},color={0,0,127}));
      connect(gensal1.PMECH0, ieesgo1.PMECH0) annotation (Line(points={{71.24,-13.85},{87,-13.85},{87,59},{-170,59},{-170,72.2857},{-180.575,72.2857}}, color={0,0,127}));
      connect(gensal1.SPEED, ieesgo1.SPEED) annotation (Line(points={{71.24,39.55},{83,39.55},{83,108},{-175,108},{-175,107.786},{-180.575,107.786}}, color={0,0,127}));
      connect(ieeet11.EFD, gensal1.EFD) annotation (Line(points={{-34.0385,15.5},{-35.3396,15.5},{-35.3396,-22.75},{-37.94,-22.75}}, color={0,0,127}));
      connect(pss2a1.VOTHSG, ieeet11.VOTHSG) annotation (Line(points={{-156.533,32.5001},{-133,32.5001},{-133,59.1},{-136.431,59.1}}, color={0,0,127}));
      connect(gensal1.PELEC, pss2a1.V_S2) annotation (Line(points={{71.24,-22.75},{71,-22.75},{71,-82},{-262,-82},{-262,22.2501},{-251,22.2501}}, color={0,0,127}));
      connect(gensal1.SPEED, pss2a1.V_S1) annotation (Line(points={{71.24,39.55},{55,39.55},{55,112},{-267,112},{-267,42.7502},{-251,42.7502}}, color={0,0,127}));
      connect(const.y, ieeet11.VOEL) annotation (Line(points={{-206,-8},{-198,-8},{-185,-8},{-185,10},{-136.431,10},{-136.431,37.3}}, color={0,0,127}));
      connect(const.y, ieeet11.VUEL) annotation (Line(points={{-206,-8},{-172,-8},{-172,15.5},{-136.431,15.5}}, color={0,0,127}));
      annotation (Diagram(coordinateSystem(
            extent={{-270,-100},{130,120}},
            preserveAspectRatio=false,
            initialScale=0.1,
            grid={1,1})), Icon(coordinateSystem(
            extent={{-270,-100},{130,120}},
            preserveAspectRatio=true,
            initialScale=0.1,
            grid={1,1}), graphics={Ellipse(
                  origin={0,49.3056},
                  extent={{-99.2063,-148.512},{99.2063,49.9008}},
                  endAngle=360),Ellipse(
                  origin={14.9802,-0.198413},
                  extent={{-34.4246,-39.2857},{64.3849,39.6825}},
                  endAngle=360),Line(origin={30.1605,0.00179934}, points={{-29.9621,-20.0415},{-10.3193,20.0379},{9.91884,-20.0415},{29.9585,20.0379},{29.9585,20.0379}}),Text(
                  origin={-61.71,12.1},
                  extent={{-17.66,27.38},{31.15,-51.59}},
                  textString="GENSAL &\n IEEET1 &\n IEESGO &\n PSS2A",
                  fontName="Andalus",
                  textStyle={TextStyle.Italic})}));
    end ieee9bus_configBus1;

    model ieee9bus_configBus2

      iPSL.Connectors.PwPin pwpin1 annotation (Placement(
          visible=true,
          transformation(
            origin={100,0},
            extent={{-5,-5},{5,5}},
            rotation=0),
          iconTransformation(
            origin={100,0},
            extent={{-10,-10},{10,10}},
            rotation=0)));
      iPSL.Electrical.Machines.PSSE.GENROU.GENROU genrou1(
        Tppd0=0.05,
        s10=1.01,
        s12=1.02,
        eterm=1.03,
        Sbase=100,
        Tpd0=6,
        Tpq0=0.5350,
        Tppq0=0.05,
        D=0.67,
        Xd=1.72,
        Xq=1.66,
        Xpd=0.2300,
        Xpq=0.3700,
        Xppd=0.2100,
        Xppq=0.2100,
        Xl=0.1,
        anglev0=9.182196,
        pelec=163,
        qelec=8.925101,
        H=3.330,
        Mbase=320) annotation (Placement(visible=true, transformation(
            origin={31,9.5},
            extent={{-49,-45.5},{49,45.5}},
            rotation=0)));
    equation
      connect(genrou1.p, pwpin1) annotation (Line(points={{84.9,9.5},{77.175,9.5},{77.175,0},{100,0}}, color={0,0,255}));
      connect(genrou1.PMECH0, genrou1.PMECH) annotation (Line(points={{83.92,-4.15},{88,-4.15},{88,61},{-20,61},{-20,36},{-17.02,36},{-17.02,32.25}}, color={0,0,127}));
      connect(genrou1.EFD0, genrou1.EFD) annotation (Line(points={{83.92,-22.35},{75,-22.35},{75,-50},{-35,-50},{-35,-13.25},{-17.02,-13.25}}, color={0,0,127}));
      annotation (Diagram(coordinateSystem(
            extent={{-180,-100},{100,100}},
            preserveAspectRatio=false,
            initialScale=0.1,
            grid={1,1})), Icon(coordinateSystem(
            extent={{-180,-100},{100,100}},
            preserveAspectRatio=true,
            initialScale=0.1,
            grid={1,1}), graphics={Ellipse(
                  origin={0,0.0992063},
                  extent={{-99.2063,-99.504},{99.4048,99.1071}},
                  endAngle=360),Ellipse(
                  origin={29.9603,-0.0992063},
                  extent={{-49.2063,-39.3849},{49.2063,39.3849}},
                  endAngle=360),Line(origin={30.0604,0.100096}, points={{-29.862,-19.9414},{-10.0207,19.9396},{9.82054,-19.9414},{29.8602,19.9396},{29.8602,19.9396}}),Text(
                  origin={-54.86,-0.2},
                  extent={{-24.3,39.48},{24.11,-39.09}},
                  textString="GENROU &\n IEEET1 &\n IEESGO &\n PSS2A",
                  fontName="Andalus",
                  textStyle={TextStyle.Italic})}));
    end ieee9bus_configBus2;

    model ieee9bus_configBus3

      iPSL.Electrical.Machines.PSSE.GENROU.GENROU genrou1(
        Tpd0=5.89,
        Tppd0=0.05,
        Tpq0=0.6,
        Tppq0=0.05,
        H=2.35,
        D=0.47,
        Xd=1.68,
        Xq=1.61,
        Xpd=0.2321,
        Xpq=0.32,
        Xppd=0.21,
        Xl=0.1536,
        s10=1.01,
        s12=1.02,
        eterm=1.025,
        Sbase=100,
        anglev0=4.647661,
        pelec=85,
        qelec=-12.50314,
        Mbase=300) annotation (Placement(visible=true, transformation(
            origin={-2.5,14.5},
            extent={{-62.5,-44.5},{62.5,44.5}},
            rotation=0)));
      iPSL.Connectors.PwPin pwpin1 annotation (Placement(
          visible=true,
          transformation(
            origin={100,0},
            extent={{-5,-5},{5,5}},
            rotation=0),
          iconTransformation(
            origin={100,0},
            extent={{-10,-10},{10,10}},
            rotation=0)));
    equation
      connect(genrou1.p, pwpin1) annotation (Line(points={{66.25,14.5},{79.7928,14.5},{79.7928,0.141226},{100,0.141226},{100,0}}, color={0,0,255}));
      connect(genrou1.PMECH0, genrou1.PMECH) annotation (Line(points={{65,1.15},{68,1.15},{68,72},{-60,72},{-60,36.75},{-63.75,36.75}}, color={0,0,127}));
      connect(genrou1.EFD0, genrou1.EFD) annotation (Line(points={{65,-16.65},{61,-16.65},{61,-45},{-82,-45},{-82,-7.75},{-63.75,-7.75}}, color={0,0,127}));
      annotation (Diagram(coordinateSystem(
            extent={{-180,-100},{100,100}},
            preserveAspectRatio=false,
            initialScale=0.1,
            grid={1,1})), Icon(coordinateSystem(
            extent={{-180,-100},{100,100}},
            preserveAspectRatio=true,
            initialScale=0.1,
            grid={1,1}), graphics={Ellipse(
                  origin={0,0.0992063},
                  extent={{-99.2063,-99.504},{99.2063,99.3056}},
                  endAngle=360),Ellipse(
                  origin={30.0595,-0.0992063},
                  extent={{-49.504,-39.1865},{49.3056,39.5833}},
                  endAngle=360),Line(origin={29.9884,-0.170374}, points={{-29.7899,-19.8693},{-9.94867,20.0116},{9.8926,-19.8693},{29.9323,20.2101},{30.1307,20.2101}}),Text(
                  origin={-60.02,0.2},
                  extent={{-19.94,39.88},{29.4638,-39.4832}},
                  textString="GENROU &\n IEEET1 &\n IEESGO &\n PSS2A",
                  fontName="Andalus",
                  textStyle={TextStyle.Italic})}));
    end ieee9bus_configBus3;

    model ieee9bus_configBus1_2

      iPSL.Connectors.PwPin pwpin1 annotation (Placement(
          visible=true,
          transformation(
            origin={100,0},
            extent={{-5,-5},{5,5}},
            rotation=0),
          iconTransformation(
            origin={100,0},
            extent={{-10,-10},{10,10}},
            rotation=0)));
      iPSL.Electrical.Machines.PSSE.GENSAL.GENSAL gensal1(
        Tpd0=8.96,
        Tppd0=0.05,
        Tppq0=0.05,
        H=9.55,
        D=1.6,
        Xd=0.3615,
        Xq=0.24,
        Xpd=0.1508,
        Xppd=0.1,
        Xppq=0.1,
        Xl=0.06,
        s10=1.01,
        s12=1.02,
        Sbase=100,
        eterm=1.04,
        anglev0=0,
        pelec=71.61309,
        qelec=25.59159,
        Mbase=275) annotation (Placement(visible=true, transformation(
            origin={14,-0.5},
            extent={{-53,-44.5},{53,44.5}},
            rotation=0)));
    equation
      connect(gensal1.p, pwpin1) annotation (Line(points={{72.3,-0.5},{80.0753,-0.5},{80.0753,0},{100,0}}, color={0,0,255}));
      connect(gensal1.PMECH0, gensal1.PMECH) annotation (Line(points={{71.24,-13.85},{81,-13.85},{81,75},{-66,75},{-66,21.75},{-37.94,21.75}}, color={0,0,127}));
      connect(gensal1.EFD0, gensal1.EFD) annotation (Line(points={{71.24,-31.65},{60,-31.65},{60,-62},{-57,-62},{-57,-22.75},{-37.94,-22.75}}, color={0,0,127}));
      annotation (Diagram(coordinateSystem(
            extent={{-270,-100},{130,120}},
            preserveAspectRatio=false,
            initialScale=0.1,
            grid={1,1})), Icon(coordinateSystem(
            extent={{-270,-100},{130,120}},
            preserveAspectRatio=true,
            initialScale=0.1,
            grid={1,1}), graphics={Ellipse(
                  origin={0,49.3056},
                  extent={{-99.2063,-148.512},{99.2063,49.9008}},
                  endAngle=360),Ellipse(
                  origin={14.9802,-0.198413},
                  extent={{-34.4246,-39.2857},{64.3849,39.6825}},
                  endAngle=360),Line(origin={30.1605,0.00179934}, points={{-29.9621,-20.0415},{-10.3193,20.0379},{9.91884,-20.0415},{29.9585,20.0379},{29.9585,20.0379}}),Text(
                  origin={-61.71,12.1},
                  extent={{-17.66,27.38},{31.15,-51.59}},
                  textString="GENSAL &\n IEEET1 &\n IEESGO &\n PSS2A",
                  fontName="Andalus",
                  textStyle={TextStyle.Italic})}));
    end ieee9bus_configBus1_2;
  end IEEE_9_GenerationGroups;

  model IEEE_9Bus_ESCD1A

    iPSL.Electrical.Branches.PwLine line(
      G=0,
      R=0.0119,
      X=0.1008,
      B=0.209) annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=180,
          origin={22,50})));
    iPSL.Electrical.Branches.PwLine line1(
      G=0,
      R=0.0085,
      X=0.072,
      B=0.149) annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=0,
          origin={-29,50})));
    iPSL.Electrical.Buses.Bus B2 annotation (Placement(transformation(extent={{-108,37},{-82,63}})));
    iPSL.Electrical.Buses.Bus B7 annotation (Placement(transformation(extent={{-68,38},{-42,64}})));
    iPSL.Electrical.Buses.Bus B9 annotation (Placement(transformation(extent={{31,37},{58,64}})));
    iPSL.Electrical.Buses.Bus B3 annotation (Placement(transformation(extent={{69,37},{95,63}})));
    iPSL.Electrical.Branches.PwLine line2(
      G=0,
      R=0.039,
      X=0.170,
      B=0.358) annotation (Placement(visible=true, transformation(
          origin={40,20},
          extent={{-10,-10},{10,10}},
          rotation=90)));
    iPSL.Electrical.Branches.PwLine line3(
      G=0,
      R=0.032,
      X=0.161,
      B=0.306) annotation (Placement(visible=true, transformation(
          origin={-60,20},
          extent={{-10,-10},{10,10}},
          rotation=90)));
    iPSL.Electrical.Buses.Bus B8 annotation (Placement(visible=true, transformation(
          origin={-1,51},
          extent={{-13,-13},{13,13}},
          rotation=180)));
    iPSL.Electrical.Buses.Bus B6 annotation (Placement(visible=true, transformation(
          origin={41,-12},
          extent={{-14,-14},{14,14}},
          rotation=-90)));
    iPSL.Electrical.Buses.Bus B5 annotation (Placement(visible=true, transformation(
          origin={-48,-13},
          extent={{-14,-14},{14,14}},
          rotation=-90)));
    iPSL.Electrical.Branches.PwLine line5(
      R=0.017,
      X=0.092,
      G=0,
      B=0.158) annotation (Placement(visible=true, transformation(
          origin={40,-31},
          extent={{-10,-10},{10,10}},
          rotation=90)));
    iPSL.Electrical.Branches.PwLine line4(
      G=0,
      R=0.01,
      X=0.085,
      B=0.176) annotation (Placement(visible=true, transformation(
          origin={-48,-32},
          extent={{-10,-10},{10,10}},
          rotation=90)));
    iPSL.Electrical.Buses.Bus B4 annotation (Placement(visible=true, transformation(
          origin={-1,-48},
          extent={{-13,-13},{13,13}},
          rotation=-90)));
    iPSL.Electrical.Buses.Bus B1 annotation (Placement(visible=true, transformation(
          origin={0,-86},
          extent={{-13,-13},{13,13}},
          rotation=-90)));
    iPSL.Electrical.Machines.PSSE.GENROU.GENROU GenB2(
      Tppd0=0.05,
      S10=1.01,
      S12=1.02,
      S_b=100,
      Tpd0=6,
      Tpq0=0.5350,
      Tppq0=0.05,
      D=0.67,
      Xd=1.72,
      Xq=1.66,
      Xpd=0.2300,
      Xpq=0.3700,
      Xppd=0.2100,
      Xppq=0.2100,
      Xl=0.1,
      H=3.330,
      M_b=320,
      V_b=18,
      V_0=1.030107,
      angle_0=-82.52,
      P_0=177.2101,
      Q_0=12.9778) annotation (Placement(visible=true, transformation(
          origin={-120,50},
          extent={{-10,-10},{10,10}},
          rotation=0)));
    iPSL.Electrical.Machines.PSSE.GENROU.GENROU GenB3(
      Tpd0=5.89,
      Tppd0=0.05,
      Tpq0=0.6,
      Tppq0=0.05,
      H=2.35,
      D=0.47,
      Xd=1.68,
      Xq=1.61,
      Xpd=0.2321,
      Xpq=0.32,
      Xppd=0.21,
      Xppq=0.21,
      Xl=0.1536,
      S10=1.01,
      S12=1.02,
      S_b=100,
      M_b=300,
      V_b=13,
      V_0=1.022927,
      angle_0=-87.72,
      P_0=89.5591,
      Q_0=-12.1352) annotation (Placement(visible=true, transformation(
          origin={110,50},
          extent={{-10,-10},{10,10}},
          rotation=180)));
    iPSL.Electrical.Loads.PSSE.Load constantLoad(
      a(re=1, im=0),
      b(re=0, im=1),
      PQBRAK=0.7,
      S_i(re=0, im=0),
      S_y(re=0, im=0),
      S_p(re=1.25, im=0.50),
      V_b=230,
      V_0=0.9937046,
      angle_0=-97.19762) annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=-90,
          origin={-90,-13})));
    iPSL.Electrical.Loads.PSSE.Load constantLoad1(
      a(re=1, im=0),
      b(re=0, im=1),
      S_i(re=0, im=0),
      S_y(re=0, im=0),
      S_p(re=0.90, im=0.3),
      PQBRAK=0.7,
      V_b=230,
      V_0=1.010052,
      angle_0=-96.99864) annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={87,-12})));
    iPSL.Electrical.Loads.PSSE.Load constantLoad2(
      a(re=1, im=0),
      b(re=0, im=1),
      PQBRAK=0.7,
      S_i(re=0, im=0),
      S_y(re=0, im=0),
      S_p(re=1, im=0.35),
      V_b=230,
      V_0=1.016652,
      angle_0=-91.63186) annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=180,
          origin={0,93})));
    iPSL.Electrical.Events.PwFault pwFault(
      R=0,
      t1=0.9,
      t2=1.2,
      X=0.01) annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={0,13})));
    iPSL.Electrical.Branches.PSSE.TwoWindingTransformer twoWindingTransformer3(
      R=0,
      G=0,
      B=0,
      X=0.0625,
      t1=1,
      t2=1) annotation (Placement(transformation(extent={{-87,40},{-67,60}})));
    iPSL.Electrical.Branches.PSSE.TwoWindingTransformer twoWindingTransformer2(
      R=0,
      X=0.0576,
      G=0,
      B=0,
      t1=1,
      t2=1) annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={1,-67})));
    iPSL.Electrical.Branches.PSSE.TwoWindingTransformer twoWindingTransformer1(
      R=0,
      G=0,
      B=0,
      X=0.0586,
      t1=1,
      t2=1) annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=180,
          origin={63,51})));
    iPSL.Electrical.Machines.PSSE.GENSAL.GENSAL GenB1(
      Tpd0=8.96,
      Tppd0=0.05,
      Tppq0=0.05,
      H=9.55,
      D=1.6,
      Xd=0.3615,
      Xq=0.24,
      Xpd=0.1508,
      Xppd=0.1,
      Xppq=0.1,
      Xl=0.06,
      S10=1.01,
      S12=1.02,
      S_b=100,
      M_b=275,
      V_b=16.5,
      V_0=1.038143,
      angle_0=-94.30,
      P_0=52.7845,
      Q_0=27.5115) annotation (Placement(visible=true, transformation(origin={-39,-100}, extent={{-10,-10},{10,10}})));
    Modelica.Blocks.Sources.Constant const(k=0) annotation (Placement(visible=true, transformation(
          origin={-187,47},
          extent={{-10,-10},{10,10}},
          rotation=0)));
    Modelica.Blocks.Sources.Constant const1(k=0) annotation (Placement(visible=true, transformation(
          origin={170,54},
          extent={{-10,-10},{10,10}},
          rotation=180)));
    Modelica.Blocks.Sources.Constant const2(k=0) annotation (Placement(visible=true, transformation(
          origin={-102,-104},
          extent={{-10,-10},{10,10}},
          rotation=0)));
    iPSL.Electrical.Controls.PSSE.ES.ESDC1A.ESDC1A eSDC1A annotation (Placement(transformation(extent={{-162,40},{-140,50}})));
    iPSL.Electrical.Controls.PSSE.ES.ESDC1A.ESDC1A eSDC1A1 annotation (Placement(transformation(extent={{-83,-110},{-60,-100}})));
    iPSL.Electrical.Controls.PSSE.ES.ESDC1A.ESDC1A eSDC1A2 annotation (Placement(transformation(
          extent={{-11,-5},{11,5}},
          rotation=180,
          origin={143,55})));
  equation
    connect(GenB2.p, B2.p) annotation (Line(points={{-109,50},{-95,50}}, color={0,0,255}));
    connect(B4.p, line5.p) annotation (Line(points={{-1,-48},{-1,-48},{-1,-40},{-1,-42.6667},{40,-42.6667}}, color={0,0,255}));
    connect(B4.p, line4.p) annotation (Line(points={{-1,-48},{-1,-43.6667},{-48,-43.6667}}, color={0,0,255}));
    connect(line5.n, B6.p) annotation (Line(points={{40,-19.3333},{40,-12},{41,-12}}, color={0,0,255}));
    connect(line4.n, B5.p) annotation (Line(points={{-48,-20.3333},{-47,-20.3333},{-47,-13},{-48,-13}}, color={0,0,255}));
    connect(constantLoad.p, B5.p) annotation (Line(points={{-79,-13},{-74,-13},{-67,-13},{-49,-13},{-48,-13}}, color={0,0,255}));
    connect(B6.p, constantLoad1.p) annotation (Line(points={{41,-12},{42,-12},{76,-12}}, color={0,0,255}));
    connect(B6.p, line2.p) annotation (Line(points={{41,-12},{41,-12},{41,8.33333},{40,8.33333}}, color={0,0,255}));
    connect(B5.p, line3.p) annotation (Line(points={{-48,-13},{-47,-13},{-47,3},{-57,3},{-57,8.33333},{-60,8.33333}}, color={0,0,255}));
    connect(B7.p, line3.n) annotation (Line(points={{-55,51},{-53,51},{-53,50},{-49,50},{-49,31.6667},{-60,31.6667}}, color={0,0,255}));
    connect(line2.n, B9.p) annotation (Line(points={{40,31.6667},{37,31.6667},{37,50.5},{44.5,50.5}}, color={0,0,255}));
    connect(B8.p, line.n) annotation (Line(points={{-1,51},{7,51},{7,50},{10.3333,50}}, color={0,0,255}));
    connect(line.p, B9.p) annotation (Line(points={{33.6667,50},{37,50},{37,50.5},{44.5,50.5}}, color={0,0,255}));
    connect(B7.p, line1.p) annotation (Line(points={{-55,51},{-42,51},{-42,50},{-40.6667,50}}, color={0,0,255}));
    connect(line1.n, B8.p) annotation (Line(points={{-17.3333,50},{-12,50},{-12,51},{-1,51}}, color={0,0,255}));
    connect(B8.p, constantLoad2.p) annotation (Line(points={{-1,51},{-5,51},{-5,57},{-9,57},{-9,79},{-1.33227e-015,79},{-1.33227e-015,82}}, color={0,0,255}));
    connect(GenB3.p, B3.p) annotation (Line(points={{99,50},{82,50}}, color={0,0,255}));
    connect(B8.p, pwFault.p) annotation (Line(points={{-1,51},{-1,38},{-1,24.6667},{2.22045e-015,24.6667}}, color={0,0,255}));
    connect(B7.p, twoWindingTransformer3.n) annotation (Line(points={{-55,51},{-63,51},{-63,50},{-65.3333,50}}, color={0,0,255}));
    connect(B2.p, twoWindingTransformer3.p) annotation (Line(points={{-95,50},{-89.5,50},{-89.5,50},{-88.6667,50}}, color={0,0,255}));
    connect(twoWindingTransformer2.n, B4.p) annotation (Line(points={{1,-55.3333},{-1,-55.3333},{-1,-48}}, color={0,0,255}));
    connect(twoWindingTransformer1.p, B3.p) annotation (Line(points={{74.6667,51},{76,51},{76,50},{82,50}}, color={0,0,255}));
    connect(twoWindingTransformer1.n, B9.p) annotation (Line(points={{51.3333,51},{51.5,51},{51.5,50.5},{44.5,50.5}}, color={0,0,255}));
    connect(B1.p, twoWindingTransformer2.p) annotation (Line(points={{0,-86},{0,-78.6667},{1,-78.6667}}, color={0,0,255}));
    connect(GenB1.p, B1.p) annotation (Line(points={{-28,-100},{0,-100},{0,-86}}, color={0,0,255}));
    connect(GenB2.PMECH0, GenB2.PMECH) annotation (Line(points={{-109.2,47},{-107,47},{-107,62},{-132,62},{-132,55},{-129.8,55}}, color={0,0,127}));
    connect(GenB3.PMECH0, GenB3.PMECH) annotation (Line(points={{99.2,53},{97,53},{97,38},{122,38},{122,45},{119.8,45}}, color={0,0,127}));
    connect(GenB1.PMECH0, GenB1.PMECH) annotation (Line(points={{-28.2,-103},{-26,-103},{-26,-88},{-51,-88},{-51,-95},{-48.8,-95}}, color={0,0,127}));
    connect(eSDC1A.EFD, GenB2.EFD) annotation (Line(points={{-139.389,45},{-139.389,45},{-129.8,45}}, color={0,0,127}));
    connect(GenB2.EFD0, eSDC1A.EFD0) annotation (Line(points={{-109.2,43},{-107,43},{-107,36},{-153.444,36},{-153.444,40.75}}, color={0,0,127}));
    connect(GenB2.PELEC, eSDC1A.ECOMP) annotation (Line(points={{-109.2,45},{-105,45},{-105,64},{-166,64},{-166,48.625},{-161.389,48.625}}, color={0,0,127}));
    connect(const.y, eSDC1A.VOTHSG) annotation (Line(points={{-176,47},{-161.389,47},{-161.389,46.25}}, color={0,0,127}));
    connect(const.y, eSDC1A.VOEL) annotation (Line(points={{-176,47},{-170,47},{-170,43.75},{-161.389,43.75}}, color={0,0,127}));
    connect(const.y, eSDC1A.VUEL) annotation (Line(points={{-176,47},{-170,47},{-170,41.25},{-161.389,41.25}}, color={0,0,127}));
    connect(eSDC1A1.EFD, GenB1.EFD) annotation (Line(points={{-59.3611,-105},{-59.3611,-105},{-48.8,-105}}, color={0,0,127}));
    connect(GenB1.EFD0, eSDC1A1.EFD0) annotation (Line(points={{-28.2,-107},{-26,-107},{-26,-114},{-74.0556,-114},{-74.0556,-109.25}}, color={0,0,127}));
    connect(const2.y, eSDC1A1.VOTHSG) annotation (Line(points={{-91,-104},{-82.3611,-104},{-82.3611,-103.75}}, color={0,0,127}));
    connect(const2.y, eSDC1A1.VOEL) annotation (Line(points={{-91,-104},{-88,-104},{-88,-106.25},{-82.3611,-106.25}}, color={0,0,127}));
    connect(const2.y, eSDC1A1.VUEL) annotation (Line(points={{-91,-104},{-88,-104},{-88,-108.75},{-82.3611,-108.75}}, color={0,0,127}));
    connect(GenB1.PELEC, eSDC1A1.ECOMP) annotation (Line(points={{-28.2,-105},{-24,-105},{-24,-86},{-85,-86},{-85,-101.375},{-82.3611,-101.375}}, color={0,0,127}));
    connect(eSDC1A2.EFD, GenB3.EFD) annotation (Line(points={{128.944,55},{128.944,55},{119.8,55}}, color={0,0,127}));
    connect(GenB3.EFD0, eSDC1A2.EFD0) annotation (Line(points={{99.2,57},{97,57},{97,63},{143,63},{143,59.25}}, color={0,0,127}));
    connect(GenB3.PELEC, eSDC1A2.ECOMP) annotation (Line(points={{99.2,55},{95,55},{95,36},{154,36},{154,51.375},{150.944,51.375}}, color={0,0,127}));
    connect(const1.y, eSDC1A2.VOTHSG) annotation (Line(points={{159,54},{150.944,54},{150.944,53.75}}, color={0,0,127}));
    connect(const1.y, eSDC1A2.VOEL) annotation (Line(points={{159,54},{155,54},{155,56.25},{150.944,56.25}}, color={0,0,127}));
    connect(const1.y, eSDC1A2.VUEL) annotation (Line(points={{159,54},{155,54},{155,58.75},{150.944,58.75}}, color={0,0,127}));
    annotation (Diagram(coordinateSystem(
          extent={{-160,-120},{150,100}},
          preserveAspectRatio=false,
          initialScale=0.1,
          grid={1,1})), Icon(coordinateSystem(
          extent={{-160,-120},{150,100}},
          preserveAspectRatio=false,
          initialScale=0.1,
          grid={1,1})));
  end IEEE_9Bus_ESCD1A;
  annotation (uses(
      Modelica(version="3.2.1"),
      PowerSystems(version="0.5"),
      iPSL(version="0.8.1")));
end IEEENetworks;
