package SmarTSLab "Translated from PSAT"
  package Networks
    model test_SMIB_Dean
      Modelica.Blocks.Sources.Step Vfld(startTime = 10, height = 0.2) annotation(Placement(transformation(extent = {{-80, 50}, {-60, 70}})));
      Modelica.Blocks.Sources.Step Pm(height = 0) annotation(Placement(transformation(extent = {{-80, 18}, {-60, 38}})));
      Models.smibwbuseswfault smibwbuseswfault annotation(Placement(transformation(extent = {{-40, 40}, {-20, 60}})));
    equation
      connect(Vfld.y, smibwbuseswfault.vf1) annotation(Line(points = {{-59, 60}, {-50, 60}, {-50, 53.7}, {-43, 53.7}}, color = {0, 0, 127}, smooth = Smooth.None));
      connect(Pm.y, smibwbuseswfault.pm1) annotation(Line(points = {{-59, 28}, {-50, 28}, {-50, 49}, {-43, 49}}, color = {0, 0, 127}, smooth = Smooth.None));
      annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics));
    end test_SMIB_Dean;

    model test_newBus
      annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})));
    end test_newBus;

    package OMCCourse
      model DCMotor
        Modelica.Electrical.Analog.Basic.Resistor r1(R = 10);
        Modelica.Electrical.Analog.Basic.Inductor i1;
        Modelica.Electrical.Analog.Basic.EMF emf1;
        Modelica.Mechanics.Rotational.Inertia load;
        Modelica.Electrical.Analog.Basic.Ground g;
        Modelica.Electrical.Analog.Sources.ConstantVoltage v;
      equation
        connect(v.p, r1.p);
        connect(v.n, g.p);
        connect(r1.n, i1.p);
        connect(i1.n, emf1.p);
        connect(emf1.n, g.p);
        connect(emf1.flange_b, load.flange_a);
        annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})));
      end DCMotor;

      model BouncingBall
        parameter Real e = 0.7 "coefficient of restitution";
        parameter Real g = 9.81 "gravity acceleration";
        Real h(start = 1) "height of ball";
        Real v "velocity of ball";
        Boolean flying(start = true) "true, if ball is flying";
        Boolean impact;
        Real v_new;
      equation
        impact = h <= 0.0;
        der(v) = if flying then -g else 0;
        der(h) = v;
        when {h <= 0.0 and v <= 0.0, impact} then
          v_new = if edge(impact) then -e * pre(v) else 0;
          flying = v_new > 0;
          reinit(v, v_new);
        end when;
        annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})));
      end BouncingBall;
      annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})));
    end OMCCourse;

    model test_smibwbuseswfault "smib_test_Dean_noAVR_inputs"
      PowerSystems.Electrical.Branches.PwLine pwLine1(G = 0, R = 0.01, X = 0.45, B = 0.001 / 4) annotation(Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
      PowerSystems.Electrical.Branches.PwLine pwLine2(G = 0, R = 0.02, X = 0.9, B = 0.001 / 2) annotation(Placement(visible = true, transformation(origin = {20, 20}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
      PowerSystems.Electrical.Loads.PwLoadPQ pwLoadPQ2(P = 0.4, Q = 0.3) annotation(Placement(visible = true, transformation(origin = {30, -25}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 270)));
      PowerSystems.Electrical.Buses.Bus bus1(Vo_real = 1, Vo_img = 0) annotation(Placement(visible = true, transformation(origin = {-57.542, 10}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
      PowerSystems.Electrical.Buses.Bus bus2(Vo_real = 1, Vo_img = 0) annotation(Placement(visible = true, transformation(origin = {-21.7243, 11.8063}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
      PowerSystems.Electrical.Buses.Bus bus3(Vo_real = 1, Vo_img = 0) annotation(Placement(visible = true, transformation(origin = {20, 2.1033}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
      PowerSystems.Electrical.Buses.Bus bus4(Vo_real = 1, Vo_img = 0) annotation(Placement(visible = true, transformation(origin = {71.6888, 10}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
      PowerSystems.Electrical.Branches.PwLine pwLine6(G = 0, R = 0, X = 0.15, B = 0) annotation(Placement(visible = true, transformation(origin = {-40, 10}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
      PowerSystems.Electrical.Events.PwFault pwFault(t1 = 40, t2 = 40.6, R = 5, X = 2.5) annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 270, origin = {10, -25})));
      PowerSystems.Electrical.Branches.PwLine pwLine4(G = 0, R = 0.01, X = 0.45, B = 0.001 / 4) annotation(Placement(visible = true, transformation(origin = {45, 0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
      PowerSystems.Electrical.Machines.PSAT.SecondOrder.Order2 G2(Sn = 100000.0, p0 = 0.00194, q0 = 0.2078, ra0 = 0, x1d0 = 0.01, M0 = 60000, D0 = 5) annotation(Placement(transformation(extent = {{120, 0}, {100, 20}})));
      PowerSystems.Electrical.Machines.PSAT.ThirdOrder.Order3_Inputs_Outputs G1(v0 = 0.853147, anglev0 = -0.105796, p0 = 0.0001, q0 = 0.0001, D0 = 2.5) annotation(Placement(transformation(extent = {{-95, 0}, {-75, 20}})));
      Modelica.Blocks.Sources.Step Vfld(height = 0.2, startTime = 0.5) annotation(Placement(transformation(extent = {{-140, 20}, {-120, 40}})));
      Modelica.Blocks.Sources.Step Pm(height = 0) annotation(Placement(transformation(extent = {{-140, -20}, {-120, 0}})));
    equation
      connect(pwLine2.p, bus2.p) annotation(Line(points = {{13, 20}, {-15, 20}, {-15, 11.8063}, {-21.7243, 11.8063}}, color = {0, 0, 255}, smooth = Smooth.None));
      connect(bus1.p, pwLine6.p) annotation(Line(points = {{-57.542, 10}, {-47, 10}}, color = {0, 0, 255}, smooth = Smooth.None));
      connect(pwLine6.n, bus2.p) annotation(Line(points = {{-33, 10}, {-30, 10}, {-30, 11.8063}, {-21.7243, 11.8063}}, color = {0, 0, 255}, smooth = Smooth.None));
      connect(pwLine2.n, bus4.p) annotation(Line(points = {{27, 20}, {55, 20}, {55, 10}, {71.6888, 10}}, color = {0, 0, 255}, smooth = Smooth.None));
      connect(pwLine1.n, bus3.p) annotation(Line(points = {{7, 0}, {10, 0}, {10, 2.1033}, {20, 2.1033}}, color = {0, 0, 255}, smooth = Smooth.None));
      connect(bus3.p, pwLine4.p) annotation(Line(points = {{20, 2.1033}, {31, 2.1033}, {31, 0}, {38, 0}}, color = {0, 0, 255}, smooth = Smooth.None));
      connect(pwLine4.n, bus4.p) annotation(Line(points = {{52, 0}, {55, 0}, {55, 10}, {71.6888, 10}}, color = {0, 0, 255}, smooth = Smooth.None));
      connect(pwLoadPQ2.p, bus3.p) annotation(Line(points = {{31, -18}, {31, -17}, {20, -17}, {20, 2.1033}}, color = {0, 0, 255}, smooth = Smooth.None));
      connect(pwFault.p, bus3.p) annotation(Line(points = {{11, -18}, {20, -18}, {20, 2.1033}}, color = {0, 0, 255}, smooth = Smooth.None));
      connect(G2.p, bus4.p) annotation(Line(points = {{99, 9.84964}, {71.6888, 9.84964}, {71.6888, 10}}, color = {0, 0, 255}, smooth = Smooth.None));
      connect(G1.p, bus1.p) annotation(Line(points = {{-74, 9.84964}, {-64.5, 9.84964}, {-64.5, 10}, {-57.542, 10}}, color = {0, 0, 255}, smooth = Smooth.None));
      connect(bus2.p, pwLine1.p) annotation(Line(points = {{-21.7243, 11.8063}, {-15.8622, 11.8063}, {-15.8622, 0}, {-7, 0}}, color = {0, 0, 255}, smooth = Smooth.None));
      connect(Vfld.y, G1.vf) annotation(Line(points = {{-119, 30}, {-110, 30}, {-110, 15.6555}, {-97, 15.6555}}, color = {0, 0, 127}, smooth = Smooth.None));
      connect(Pm.y, G1.pm) annotation(Line(points = {{-119, -10}, {-105, -10}, {-105, 6}, {-97, 6}}, color = {0, 0, 127}, smooth = Smooth.None));
      annotation(Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = false, initialScale = 0.1, grid = {5, 5}), graphics = {Text(visible = true, origin = {-70, 69.1417}, fillPattern = FillPattern.Solid, extent = {{-35.0, -5.8583}, {35.0, 5.8583}}, textString = "SystemSbase=100 MVA", fontName = "Arial")}), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = false, initialScale = 0.1, grid = {2, 2}), graphics = {Text(origin = {-84.0681, 70.1403}, extent = {{181.463, -105.01}, {-13.5271, 4.80962}}, textString = "SMIB w. Dean's values", textStyle = {TextStyle.Bold, TextStyle.Italic, TextStyle.UnderLine}), Rectangle(extent = {{-100, 100}, {100, -100}}, lineColor = {0, 0, 255})}));
    end test_smibwbuseswfault;

    package SMIB2L
      model SMIB2L
        SmarTSLab.Machines.GENROU.GENROU genrou(eterm = data.genrou.V, pelec = data.genrou.V2, qelec = data.genrou.V3, wbase = data.genrou.V4, mbase = data.genrou.V5, Ra = data.genrou.V6, Tpd0 = data.genrou.J, Tppd0 = data.genrou.J1, Tpq0 = data.genrou.J2, Tppq0 = data.genrou.J3, H = data.genrou.J4, D = data.genrou.J5, Xd = data.genrou.J6, Xq = data.genrou.J7, Xpd = data.genrou.J8, Xpq = data.genrou.J9, Xppd = data.genrou.J10, Xppq = data.genrou.J10, Xpp = data.genrou.J10, Xl = data.genrou.J11, s10 = data.genrou.J12, s12 = data.genrou.J13, anglev0 = data.genrou.V1) annotation(Placement(transformation(extent = {{-76, -4}, {-48, 22}})));
        SmarTSLab.Lines.MediumLine pwLine(R = data.line1.R, X = data.line1.X, G = data.line1.G, B = data.line1.B) annotation(Placement(transformation(extent = {{-44, 0}, {-24, 20}})));
        SmarTSLab.Lines.MediumLine pwLine1(R = data.line1.R, X = data.line1.X, G = data.line1.G, B = data.line1.B) annotation(Placement(transformation(extent = {{4, 14}, {24, 34}})));
        SmarTSLab.Lines.MediumLine pwLine3(R = data.line2.R, X = data.line2.X, G = data.line2.G, B = data.line2.B) annotation(Placement(transformation(extent = {{-10, -20}, {10, 0}})));
        SmarTSLab.Lines.MediumLine pwLine4(R = data.line2.R, X = data.line2.X, G = data.line2.G, B = data.line2.B) annotation(Placement(transformation(extent = {{22, -20}, {42, 0}})));
        SmarTSLab.Machines.GENCLS.GENCLS gENCLS(v0 = data.gencls.V, anglev0 = data.gencls.V1, p0 = data.gencls.V2, q0 = data.gencls.V3, wbase = data.gencls.V4, mbase = data.gencls.V5, ra = data.gencls.V6, x1d = data.gencls.V7, H = data.gencls.J, D = data.gencls.J1) annotation(Placement(transformation(extent = {{86, 0}, {64, 22}})));
        SmarTSLab.Networks.SMIB2L.DATA.SMIB2L data annotation(Placement(transformation(extent = {{-42, 48}, {-22, 68}})));
        SmarTSLab.Loads.ConstantLoad constantLoad(anglev0 = -0.57627, S_p(re = 0.5, im = 0.1), S_i(im = 0, re = 0), S_y(re = 0, im = 0), a(re = 1, im = 0), b(re = 0, im = 1), PQBRAK = 0.7, v0 = 0.991992) annotation(Placement(transformation(extent = {{4, -56}, {24, -36}})));
        Modelica.Blocks.Sources.Constant Pmech(k = 0.02) annotation(Placement(transformation(extent = {{-120, 20}, {-100, 40}})));
        Modelica.Blocks.Sources.Constant Efld(k = 0.25) annotation(Placement(transformation(extent = {{-120, -20}, {-100, 0}})));
      equation
        connect(genrou.p, pwLine.p) annotation(Line(points = {{-49.4, 8.74}, {-50.6, 8.74}, {-50.6, 10}, {-41, 10}}, color = {0, 0, 255}, smooth = Smooth.None));
        connect(pwLine.n, pwLine1.p) annotation(Line(points = {{-27, 10}, {-18.5, 10}, {-18.5, 24}, {7, 24}}, color = {0, 0, 255}, smooth = Smooth.None));
        connect(pwLine1.n, gENCLS.p) annotation(Line(points = {{21, 24}, {52, 24}, {52, 10.8346}, {62.9, 10.8346}}, color = {0, 0, 255}, smooth = Smooth.None));
        connect(pwLine3.p, pwLine.n) annotation(Line(points = {{-7, -10}, {-17.5, -10}, {-17.5, 10}, {-27, 10}}, color = {0, 0, 255}, smooth = Smooth.None));
        connect(pwLine3.n, pwLine4.p) annotation(Line(points = {{7, -10}, {25, -10}}, color = {0, 0, 255}, smooth = Smooth.None));
        connect(pwLine4.n, gENCLS.p) annotation(Line(points = {{39, -10}, {52, -10}, {52, 10.8346}, {62.9, 10.8346}}, color = {0, 0, 255}, smooth = Smooth.None));
        connect(constantLoad.p, pwLine3.p) annotation(Line(points = {{7, -45}, {7, -45.5}, {-7, -45.5}, {-7, -10}}, color = {0, 0, 255}, smooth = Smooth.None));
        connect(Efld.y, genrou.E_fd) annotation(Line(points = {{-99, -10}, {-88, -10}, {-88, 0.68}, {-75.16, 0.68}}, color = {0, 0, 127}, smooth = Smooth.None));
        connect(Pmech.y, genrou.Pm) annotation(Line(points = {{-99, 30}, {-88, 30}, {-88, 16.8}, {-75.16, 16.8}}, color = {0, 0, 127}, smooth = Smooth.None));
        annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics));
      end SMIB2L;

      package DATA
        record SMIB2L
          //import DATA;
          extends Modelica.Icons.Record;
          replaceable record Genrou = SmarTSLab.Machines.GENROU.GENROU_D constrainedby SmarTSLab.Machines.GENROU.GENROU_D annotation(choicesAllMatching);
          Genrou genrou;
          replaceable record Gencls = SmarTSLab.Machines.GENCLS.GENCLS_D constrainedby SmarTSLab.Machines.GENCLS.GENCLS_D annotation(choicesAllMatching);
          Gencls gencls;
          replaceable record Line1 = SmarTSLab.Lines.Data.PiLine constrainedby SmarTSLab.Lines.Data.PiLine annotation(choicesAllMatching);
          Line1 line1;
          replaceable record Line2 = SmarTSLab.Lines.Data.PiLine constrainedby SmarTSLab.Lines.Data.PiLine annotation(choicesAllMatching);
          Line2 line2;
        end SMIB2L;
      end DATA;
    end SMIB2L;

    model Order4test2
      PowerSystems.Electrical.Loads.PwLoadPQ pwLoadPQ2(P = 0.08, Q = 0.06) annotation(Placement(visible = true, transformation(origin = {-22.5, 67.5}, extent = {{-12.5, -12.5}, {12.5, 12.5}}, rotation = 0)));
      PowerSystems.Electrical.Branches.PwLinewithOpeningReceiving pwLinewithOpening1(B = 0.001 / 2, G = 0, R = 0.01, X = 0.1, t2 = 3.15, t1 = 3.12) annotation(Placement(visible = true, transformation(origin = {-45, 55}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
      PowerSystems.Electrical.Branches.PwLine pwLine4(B = 0.001 / 2, G = 0, R = 0.01, X = 0.1) annotation(Placement(visible = true, transformation(origin = {-45, 70}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
      PowerSystems.Electrical.Branches.PwLine pwLine3(B = 0.001 / 2, G = 0, R = 0.01, X = 0.1) annotation(Placement(visible = true, transformation(origin = {-45, 35}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
      PowerSystems.Electrical.Loads.PwLoadPQ pwLoadPQ1(P = 0.08, Q = 0.06) annotation(Placement(visible = true, transformation(origin = {-22.5, 42.5}, extent = {{-12.5, -12.5}, {12.5, 12.5}}, rotation = 0)));
      PowerSystems.Electrical.Branches.PwLine pwLine2(B = 0.001 / 2, G = 0, R = 0.01, X = 0.1) annotation(Placement(visible = true, transformation(origin = {-70, 60}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
      PowerSystems.Electrical.Branches.PwLine pwLine1(B = 0.001 / 2, G = 0, R = 0.01, X = 0.1) annotation(Placement(visible = true, transformation(origin = {-70, 45}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
      PowerSystems.Electrical.Events.PwFault pwFault(t1 = 3.1, t2 = 3.2, R = 0.5, X = 10) annotation(Placement(transformation(extent = {{-35, 15}, {-10, 40}})));
      PowerSystems.Electrical.Machines.PSAT.FourthOrder.Order4 Generator(Sn = 100, p0 = 0.160352698692006, q0 = 0.11859436505981, Vn = 20000, Vbus = 400000) annotation(Placement(transformation(extent = {{-120, 40}, {-90, 70}})));
    equation
      connect(pwLinewithOpening1.n, pwLine4.n) annotation(Line(visible = true, origin = {-38, 62.5}, points = {{0, -7.5}, {0, 7.5}}));
      connect(pwLine4.p, pwLinewithOpening1.p) annotation(Line(visible = true, origin = {-52, 62.5}, points = {{0, 7.5}, {0, -7.5}}));
      connect(pwLine1.n, pwLine2.n) annotation(Line(points = {{-63, 45}, {-63, 60}}, color = {0, 0, 255}, smooth = Smooth.None));
      connect(pwLine2.n, pwLine4.p) annotation(Line(points = {{-63, 60}, {-60, 60}, {-60, 70}, {-52, 70}}, color = {0, 0, 255}, smooth = Smooth.None));
      connect(pwLine1.n, pwLine3.p) annotation(Line(points = {{-63, 45}, {-60, 45}, {-60, 35}, {-52, 35}}, color = {0, 0, 255}, smooth = Smooth.None));
      connect(Generator.p, pwLine2.p) annotation(Line(points = {{-88.5, 54.7745}, {-80, 54.7745}, {-80, 60}, {-77, 60}}, color = {0, 0, 255}, smooth = Smooth.None));
      connect(Generator.p, pwLine1.p) annotation(Line(points = {{-88.5, 54.7745}, {-80, 54.7745}, {-80, 45}, {-77, 45}}, color = {0, 0, 255}, smooth = Smooth.None));
      connect(pwLine3.n, pwLoadPQ1.p) annotation(Line(points = {{-38, 35}, {-31.25, 35}, {-31.25, 43.75}}, color = {0, 0, 255}, smooth = Smooth.None));
      connect(pwLine4.n, pwLoadPQ2.p) annotation(Line(points = {{-38, 70}, {-32.125, 70}, {-32.125, 68.75}, {-31.25, 68.75}}, color = {0, 0, 255}, smooth = Smooth.None));
      connect(pwLine3.n, pwFault.p) annotation(Line(points = {{-38, 35}, {-35, 35}, {-35, 28.75}, {-31.25, 28.75}}, color = {0, 0, 255}, smooth = Smooth.None));
      annotation(Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = false, initialScale = 0.1, grid = {5, 5}), graphics = {Text(visible = true, origin = {-92.5, 21.6417}, fillPattern = FillPattern.Solid, extent = {{-27.5, -3.3583}, {27.5, 3.3583}}, textString = "SystemSbase=100 MVA", fontName = "Arial"), Text(extent = {{-120, 85}, {-20, 80}}, lineColor = {0, 0, 255}, textString = "GenOrder4: LineOpening and Line-to-Ground Fault")}), experiment(StopTime = 20), __Dymola_experimentSetupOutput);
    end Order4test2;

    model SMIB1L
      PowerSystems.Electrical.Machines.PSSE.GENROU gENROU annotation(Placement(transformation(extent = {{-56, 10}, {-36, 30}})));
      PowerSystems.Electrical.Buses.Bus bus_gen annotation(Placement(transformation(extent = {{-30, 10}, {-10, 30}})));
      PowerSystems.Electrical.Buses.Bus bus_load annotation(Placement(transformation(extent = {{10, 10}, {30, 30}})));
      PowerSystems.Electrical.Loads.PwLoad pwLoad annotation(Placement(transformation(extent = {{32, 9}, {52, 29}})));
      PowerSystems.Electrical.Branches.PwLine pwLine annotation(Placement(transformation(extent = {{-12, 10}, {8, 30}})));
      Modelica.Blocks.Sources.Constant pm(k = 0.02) annotation(Placement(transformation(extent = {{-80, 22}, {-72, 30}})));
      Modelica.Blocks.Sources.Constant Efd(k = 0.2) annotation(Placement(transformation(extent = {{-80, 10}, {-72, 18}})));
    equation
      connect(gENROU.p, bus_gen.p) annotation(Line(points = {{-37, 19.8}, {-30.5, 19.8}, {-30.5, 20}, {-20, 20}}, color = {0, 0, 255}, smooth = Smooth.None));
      connect(bus_gen.p, pwLine.p) annotation(Line(points = {{-20, 20}, {-9, 20}}, color = {0, 0, 255}, smooth = Smooth.None));
      connect(pwLine.n, bus_load.p) annotation(Line(points = {{5, 20}, {20, 20}}, color = {0, 0, 255}, smooth = Smooth.None));
      connect(bus_load.p, pwLoad.p) annotation(Line(points = {{20, 20}, {35, 20}}, color = {0, 0, 255}, smooth = Smooth.None));
      connect(Efd.y, gENROU.E_fd) annotation(Line(points = {{-71.6, 14}, {-66, 14}, {-66, 13.6}, {-55.4, 13.6}}, color = {0, 0, 127}, smooth = Smooth.None));
      connect(pm.y, gENROU.Pm) annotation(Line(points = {{-71.6, 26}, {-55.4, 26}}, color = {0, 0, 127}, smooth = Smooth.None));
      annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Text(extent = {{-56, 36}, {-34, 30}}, lineColor = {0, 0, 255}, textString = "SynchronousMachine"), Text(extent = {{-28, 10}, {-10, 4}}, lineColor = {0, 0, 255}, textString = "Topological Node"), Text(extent = {{-12, 28}, {8, 24}}, lineColor = {0, 0, 255}, textString = "ACLineSegment"), Text(extent = {{32, 30}, {52, 26}}, lineColor = {0, 0, 255}, textString = "EnergyConsumer"), Text(extent = {{12, 10}, {30, 4}}, lineColor = {0, 0, 255}, textString = "Topological Node")}));
    end SMIB1L;

    model IEEE_9Bus
      PowerSystems.Electrical.Machines.PSAT.FourthOrder.Order4_Inputs_Outputs gen3(Sn = 100, ra0 = 0, xd0 = 0.1460, xq0 = 0.0969, x1d0 = 0.0608, x1q0 = 0.0969, T1d0 = 8.96, T1q0 = 0.310, fn = 60, Vn = 16500, Vbus = 16500, v0 = 1.040000000000000, p0 = 0.715870954698345, q0 = 0.248141030193284, M0 = 47.28) annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = -90, origin = {2, -38})));
      SmarTSLab.Transformer.TwoWindingTransformer twoWindingTransformer(Vbus = 16500, Vn1 = 16500, kT = 16.5 / 230, X = 0.0576, R = 0, fn = 60) annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = -90, origin = {2, -80})));
      PowerSystems.Electrical.Branches.PwLine line5(R = 0.017, X = 0.092, G = 0, B = 0.079) annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 90, origin = {38, -74})));
      PowerSystems.Electrical.Branches.PwLine line4(G = 0, R = 0.01, X = 0.085, B = 0.088) annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 90, origin = {-40, -72})));
      PowerSystems.Electrical.Loads.PSAT.LOADPQ lOADPQ(P0 = 1.25, Q0 = 0.50) annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = -90, origin = {-66, -68})));
      PowerSystems.Electrical.Loads.PSAT.LOADPQ PQ1(P0 = 0.90, Q0 = 0.30) annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = -90, origin = {58, -66})));
      PowerSystems.Electrical.Branches.PwLine line2(G = 0, R = 0.039, X = 0.170, B = 0.179) annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 90, origin = {40, -8})));
      PowerSystems.Electrical.Branches.PwLine line3(G = 0, R = 0.032, X = 0.161, B = 0.153) annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 90, origin = {-40, -8})));
      PowerSystems.Electrical.Branches.PwLine line(G = 0, R = 0.0119, X = 0.1008, B = 0.1045) annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 180, origin = {24, 48})));
      SmarTSLab.Transformer.TwoWindingTransformer twoWindingTransformer1(R = 0, Vbus = 13800, Vn1 = 13800, fn = 60, kT = 13.8 / 230, X = 0.0586) annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 180, origin = {58, 48})));
      PowerSystems.Electrical.Branches.PwLine line1(G = 0, R = 0.0085, X = 0.072, B = 0.0745) annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 0, origin = {-42, 48})));
      SmarTSLab.Transformer.TwoWindingTransformer twoWindingTransformer2(R = 0, fn = 60, Vbus = 18000, Vn1 = 18000, kT = 18 / 230, X = 0.0625) annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 0, origin = {-74, 48})));
      PowerSystems.Electrical.Machines.PSAT.FourthOrder.Order4_Inputs_Outputs gen1(Sn = 100, ra0 = 0, fn = 60, Vn = 18000, Vbus = 18000, xd0 = 0.8958, xq0 = 0.8645, x1d0 = 0.1198, x1q0 = 0.1969, T1d0 = 6, T1q0 = 0.5350, v0 = 1.025000000000000, anglev0 = 0.160490018910725, p0 = 1.630000000000000, q0 = 0.001552891584958, M0 = 12.8) annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 0, origin = {-112, 48})));
      PowerSystems.Electrical.Machines.PSAT.FourthOrder.Order4_Inputs_Outputs gen2(Sn = 100, ra0 = 0, fn = 60, Vn = 13800, Vbus = 13800, xd0 = 1.3125, xq0 = 1.2578, x1d0 = 0.1813, x1q0 = 0.2500, T1d0 = 5.89, T1q0 = 0.6, v0 = 1.025000000000000, anglev0 = 0.080629575357894, p0 = 0.850000000000000, q0 = -0.163501111031896, M0 = 6.02) annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 180, origin = {104, 48})));
      PowerSystems.Electrical.Controls.PSAT.AVR.AVRTypeII avr3(vrmin = -5, vrmax = 5, Ka = 20, Ta = 0.2, Kf = 0.063, Tf = 0.35, Ke = 1, Te = 0.314, Tr = 0.001, Ae = 0.0039, Be = 1.555, v0 = 1.04, vf0 = 1.079018784709528, vref0 = 1.095077501312303) annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = -90, origin = {0, -2})));
      PowerSystems.Electrical.Controls.PSAT.AVR.AVRTypeII AVR2(vrmin = -5, vrmax = 5, Ka = 20, Ta = 0.2, Kf = 0.063, Tf = 0.35, Ke = 1, Te = 0.314, Tr = 0.001, Ae = 0.0039, Be = 1.555, v0 = 1.025000000000000, vf0 = 1.755517086537914, vref0 = 1.118023800520641) annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 0, origin = {-146, 44})));
      PowerSystems.Electrical.Controls.PSAT.AVR.AVRTypeII AVR1(vrmin = -5, vrmax = 5, Ka = 20, Ta = 0.2, Kf = 0.063, Tf = 0.35, Ke = 1, Te = 0.314, Tr = 0.001, Ae = 0.0039, Be = 1.555, v0 = 1.025000000000000, vref0 = 1.095179545801796, vf0 = 1.359665419632471) annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 180, origin = {144, 48})));
      PowerSystems.Electrical.Loads.PSAT.LOADPQ lOADPQ1(P0 = 1, Q0 = 0.35) annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = -90, origin = {-20, 24})));
      Modelica.Blocks.Sources.Constant const(k = 1.118023800520641) annotation(Placement(transformation(extent = {{-188, 52}, {-168, 72}})));
      Modelica.Blocks.Sources.Constant const3(k = 1.095179545801796) annotation(Placement(transformation(extent = {{138, 14}, {158, 34}})));
      PowerSystems.Electrical.Buses.Bus bus2 annotation(Placement(transformation(extent = {{-100, 38}, {-80, 58}})));
      PowerSystems.Electrical.Buses.Bus bus7 annotation(Placement(transformation(extent = {{-68, 38}, {-48, 58}})));
      PowerSystems.Electrical.Buses.Bus bus8 annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = -90, origin = {-20, 44})));
      PowerSystems.Electrical.Buses.Bus bus9 annotation(Placement(transformation(extent = {{30, 38}, {50, 58}})));
      PowerSystems.Electrical.Buses.Bus bus3 annotation(Placement(transformation(extent = {{68, 38}, {88, 58}})));
      PowerSystems.Electrical.Buses.Bus bus6 annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = -90, origin = {40, -36})));
      PowerSystems.Electrical.Buses.Bus bus5 annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 90, origin = {-42, -34})));
      PowerSystems.Electrical.Buses.Bus bus4 annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = -90, origin = {0, -98})));
      PowerSystems.Electrical.Buses.Bus bus1 annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = -90, origin = {2, -62})));
      PowerSystems.Electrical.Events.PwFaultPQ pwFaultPQ(X = 0.001, t1 = 3, t2 = 3.1, R = 8) annotation(Placement(transformation(extent = {{2, 64}, {22, 84}})));
      Modelica.Blocks.Sources.Constant const4(k = 1.095077501312303) annotation(Placement(visible = true, transformation(origin = {20, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
    equation
      connect(avr3.vref, const4.y) annotation(Line(points = {{5.4, 6}, {5.4, 8}, {5.49527, 18.8062}, {9, 20}}, color = {0, 0, 127}));
      connect(AVR1.vf, gen2.vf) annotation(Line(points = {{135.5, 45.4}, {126.75, 45.4}, {126.75, 42.3148}, {116, 42.3148}}, color = {0, 0, 127}, smooth = Smooth.None));
      connect(avr3.vf, gen3.vf) annotation(Line(points = {{2.6, -10.5}, {2.6, -18}, {7.6852, -18}, {7.6852, -26}}, color = {0, 0, 127}, smooth = Smooth.None));
      connect(AVR2.vf, gen1.vf) annotation(Line(points = {{-137.5, 46.6}, {-130, 46.6}, {-130, 53.6852}, {-124, 53.6852}}, color = {0, 0, 127}, smooth = Smooth.None));
      connect(gen3.pm0, gen3.pm) annotation(Line(points = {{8.28385, -49}, {8.28385, -56}, {-12, -56}, {-12, -26}, {-2, -26}}, color = {0, 0, 127}, smooth = Smooth.None));
      connect(gen2.pm, gen2.pm0) annotation(Line(points = {{116, 52}, {116, 76}, {86, 76}, {86, 41.7161}, {93, 41.7161}}, color = {0, 0, 127}, smooth = Smooth.None));
      connect(const.y, AVR2.vref) annotation(Line(points = {{-167, 62}, {-160, 62}, {-160, 49.4}, {-154, 49.4}}, color = {0, 0, 127}, smooth = Smooth.None));
      connect(const3.y, AVR1.vref) annotation(Line(points = {{159, 24}, {166, 24}, {166, 42.6}, {152, 42.6}}, color = {0, 0, 127}, smooth = Smooth.None));
      connect(gen3.v, avr3.v) annotation(Line(points = {{5.54026, -49}, {5.54026, -52}, {-14, -52}, {-14, 10}, {-2, 10}, {-2, 6}, {-1, 6}}, color = {0, 0, 127}, smooth = Smooth.None));
      connect(line4.p, line5.p) annotation(Line(points = {{-40, -79}, {-40, -104}, {38, -104}, {38, -81}}, color = {0, 0, 255}, smooth = Smooth.None));
      connect(gen1.pm0, gen1.pm) annotation(Line(points = {{-101, 54.2839}, {-94, 54.2839}, {-94, 64}, {-128, 64}, {-128, 44}, {-124, 44}}, color = {0, 0, 127}, smooth = Smooth.None));
      connect(gen1.v, AVR2.v) annotation(Line(points = {{-101, 51.5403}, {-92, 51.5403}, {-92, 20}, {-162, 20}, {-162, 43}, {-154, 43}}, color = {0, 0, 127}, smooth = Smooth.None));
      connect(gen1.p, bus2.p) annotation(Line(points = {{-101, 47.8496}, {-90, 47.8496}, {-90, 48}}, color = {0, 0, 255}, smooth = Smooth.None));
      connect(twoWindingTransformer2.p, bus2.p) annotation(Line(points = {{-85, 48}, {-90, 48}}, color = {0, 0, 255}, smooth = Smooth.None));
      connect(twoWindingTransformer2.n, bus7.p) annotation(Line(points = {{-63, 48}, {-58, 48}}, color = {0, 0, 255}, smooth = Smooth.None));
      connect(line1.p, bus7.p) annotation(Line(points = {{-49, 48}, {-58, 48}}, color = {0, 0, 255}, smooth = Smooth.None));
      connect(line3.n, bus7.p) annotation(Line(points = {{-40, -1}, {-40, 34}, {-60, 34}, {-60, 48}, {-58, 48}}, color = {0, 0, 255}, smooth = Smooth.None));
      connect(lOADPQ1.p, bus8.p) annotation(Line(points = {{-20, 35}, {-20, 44}}, color = {0, 0, 255}, smooth = Smooth.None));
      connect(line1.n, bus8.p) annotation(Line(points = {{-35, 48}, {-20, 48}, {-20, 44}}, color = {0, 0, 255}, smooth = Smooth.None));
      connect(line.n, bus8.p) annotation(Line(points = {{17, 48}, {-20, 48}, {-20, 44}}, color = {0, 0, 255}, smooth = Smooth.None));
      connect(line.p, bus9.p) annotation(Line(points = {{31, 48}, {40, 48}}, color = {0, 0, 255}, smooth = Smooth.None));
      connect(twoWindingTransformer1.n, bus9.p) annotation(Line(points = {{47, 48}, {40, 48}}, color = {0, 0, 255}, smooth = Smooth.None));
      connect(line2.n, bus9.p) annotation(Line(points = {{40, -1}, {40, 48}}, color = {0, 0, 255}, smooth = Smooth.None));
      connect(twoWindingTransformer1.p, bus3.p) annotation(Line(points = {{69, 48}, {78, 48}}, color = {0, 0, 255}, smooth = Smooth.None));
      connect(gen2.p, bus3.p) annotation(Line(points = {{93, 48.1504}, {82, 48.1504}, {82, 48}, {78, 48}}, color = {0, 0, 255}, smooth = Smooth.None));
      connect(bus6.p, PQ1.p) annotation(Line(points = {{40, -36}, {42, -36}, {42, -52}, {58, -52}, {58, -55}}, color = {0, 0, 255}, smooth = Smooth.None));
      connect(line5.n, bus6.p) annotation(Line(points = {{38, -67}, {38, -36}, {40, -36}}, color = {0, 0, 255}, smooth = Smooth.None));
      connect(bus6.p, line2.p) annotation(Line(points = {{40, -36}, {40, -15}}, color = {0, 0, 255}, smooth = Smooth.None));
      connect(line4.n, bus5.p) annotation(Line(points = {{-40, -65}, {-40, -50.5}, {-42, -50.5}, {-42, -34}}, color = {0, 0, 255}, smooth = Smooth.None));
      connect(line3.p, bus5.p) annotation(Line(points = {{-40, -15}, {-40, -34}, {-42, -34}}, color = {0, 0, 255}, smooth = Smooth.None));
      connect(twoWindingTransformer.n, bus4.p) annotation(Line(points = {{2, -91}, {2, -98}, {0, -98}}, color = {0, 0, 255}, smooth = Smooth.None));
      connect(bus4.p, line5.p) annotation(Line(points = {{0, -98}, {2, -98}, {2, -104}, {38, -104}, {38, -81}}, color = {0, 0, 255}, smooth = Smooth.None));
      connect(gen3.p, bus1.p) annotation(Line(points = {{1.84964, -49}, {1.84964, -55.5}, {2, -55.5}, {2, -62}}, color = {0, 0, 255}, smooth = Smooth.None));
      connect(twoWindingTransformer.p, bus1.p) annotation(Line(points = {{2, -69}, {2, -62}}, color = {0, 0, 255}, smooth = Smooth.None));
      connect(pwFaultPQ.p, bus8.p) annotation(Line(points = {{5, 75}, {-8, 75}, {-8, 36}, {-20, 36}, {-20, 44}}, color = {0, 0, 255}, smooth = Smooth.None));
      connect(gen2.v, AVR1.v) annotation(Line(points = {{93, 44.4597}, {90, 44.4597}, {90, 64}, {158, 64}, {158, 49}, {152, 49}}, color = {0, 0, 127}, smooth = Smooth.None));
      connect(lOADPQ.p, bus5.p) annotation(Line(points = {{-66, -57}, {-66, -46}, {-48, -46}, {-48, -36}, {-42, -36}, {-42, -34}}, color = {0, 0, 255}, smooth = Smooth.None));
      annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics));
    end IEEE_9Bus;
  end Networks;

  package Models
    model smibwbuses "smib_test_Dean_noAVR_inputs"
      PowerSystems.Electrical.Branches.PwLine pwLine1(G = 0, R = 0.01, X = 0.45, B = 0.001 / 4) annotation(Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
      PowerSystems.Electrical.Branches.PwLine pwLine2(G = 0, R = 0.02, X = 0.9, B = 0.001 / 2) annotation(Placement(visible = true, transformation(origin = {20, 20}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
      PowerSystems.Electrical.Buses.Bus bus1(Vo_real = 1, Vo_img = 0) annotation(Placement(visible = true, transformation(origin = {-57.542, 10}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
      PowerSystems.Electrical.Buses.Bus bus2(Vo_real = 1, Vo_img = 0) annotation(Placement(visible = true, transformation(origin = {-21.7243, 11.8063}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
      PowerSystems.Electrical.Buses.Bus bus3(Vo_real = 1, Vo_img = 0) annotation(Placement(visible = true, transformation(origin = {20, 2.1033}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
      PowerSystems.Electrical.Buses.Bus bus4(Vo_real = 1, Vo_img = 0) annotation(Placement(visible = true, transformation(origin = {71.6888, 10}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
      PowerSystems.Electrical.Branches.PwLine pwLine6(G = 0, R = 0, X = 0.15, B = 0) annotation(Placement(visible = true, transformation(origin = {-40, 10}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
      PowerSystems.Electrical.Branches.PwLine pwLine4(G = 0, R = 0.01, X = 0.45, B = 0.001 / 4) annotation(Placement(visible = true, transformation(origin = {45, 0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
      PowerSystems.Electrical.Machines.PSAT.SecondOrder.Order2 G2(Sn = 100000.0, p0 = 0.00194, q0 = 0.2078, ra0 = 0, x1d0 = 0.01, M0 = 60000, D0 = 0) annotation(Placement(transformation(extent = {{120, -30}, {100, -10}})));
      PowerSystems.Electrical.Machines.PSAT.ThirdOrder.Order3_Inputs_Outputs G1(v0 = 1.019999999999977, anglev0 = 0.154464084195273, p0 = 0.399999999999984, q0 = 0.206882485782117, D0 = 5) annotation(Placement(transformation(extent = {{-95, 0}, {-75, 20}})));
      Modelica.Blocks.Interfaces.RealInput vf1 annotation(Placement(transformation(extent = {{-120, 32}, {-80, 72}}), iconTransformation(extent = {{-120, 32}, {-80, 72}})));
      Modelica.Blocks.Interfaces.RealInput pm1 annotation(Placement(transformation(extent = {{-120, -50}, {-80, -10}}), iconTransformation(extent = {{-120, -50}, {-80, -10}})));
    equation
      connect(pwLine2.p, bus2.p) annotation(Line(points = {{13, 20}, {-10, 20}, {-10, 11.8063}, {-21.7243, 11.8063}}, color = {0, 0, 255}, smooth = Smooth.None));
      connect(bus1.p, pwLine6.p) annotation(Line(points = {{-57.542, 10}, {-47, 10}}, color = {0, 0, 255}, smooth = Smooth.None));
      connect(pwLine6.n, bus2.p) annotation(Line(points = {{-33, 10}, {-30, 10}, {-30, 11.8063}, {-21.7243, 11.8063}}, color = {0, 0, 255}, smooth = Smooth.None));
      connect(pwLine2.n, bus4.p) annotation(Line(points = {{27, 20}, {50, 20}, {50, 10}, {71.6888, 10}}, color = {0, 0, 255}, smooth = Smooth.None));
      connect(pwLine1.p, bus2.p) annotation(Line(points = {{-7, 0}, {-15, 0}, {-15, 10}, {-21.7243, 10}, {-21.7243, 11.8063}}, color = {0, 0, 255}, smooth = Smooth.None));
      connect(pwLine1.n, bus3.p) annotation(Line(points = {{7, 0}, {10, 0}, {10, 2.1033}, {20, 2.1033}}, color = {0, 0, 255}, smooth = Smooth.None));
      connect(bus3.p, pwLine4.p) annotation(Line(points = {{20, 2.1033}, {31, 2.1033}, {31, 0}, {38, 0}}, color = {0, 0, 255}, smooth = Smooth.None));
      connect(pwLine4.n, bus4.p) annotation(Line(points = {{52, 0}, {60, 0}, {60, 10}, {71.6888, 10}}, color = {0, 0, 255}, smooth = Smooth.None));
      connect(G2.p, bus4.p) annotation(Line(points = {{99, -20.1504}, {71.6888, -20.1504}, {71.6888, 10}}, color = {0, 0, 255}, smooth = Smooth.None));
      connect(G1.p, bus1.p) annotation(Line(points = {{-74, 9.84964}, {-64.5, 9.84964}, {-64.5, 10}, {-57.542, 10}}, color = {0, 0, 255}, smooth = Smooth.None));
      connect(G1.vf, vf1) annotation(Line(points = {{-97, 15.6555}, {-106, 15.6555}, {-106, 52}, {-100, 52}}, color = {0, 0, 127}, smooth = Smooth.None));
      connect(G1.pm, pm1) annotation(Line(points = {{-97, 6}, {-108.5, 6}, {-108.5, -30}, {-100, -30}}, color = {0, 0, 127}, smooth = Smooth.None));
      annotation(Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = false, initialScale = 0.1, grid = {5, 5}), graphics = {Text(visible = true, origin = {-70, 69.1417}, fillPattern = FillPattern.Solid, extent = {{-35.0, -5.8583}, {35.0, 5.8583}}, textString = "SystemSbase=100 MVA", fontName = "Arial")}), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = false, initialScale = 0.1, grid = {2, 2}), graphics = {Text(origin = {-84.0681, 70.1403}, extent = {{181.463, -105.01}, {-13.5271, 4.80962}}, textString = "SMIB w. Dean's values", textStyle = {TextStyle.Bold, TextStyle.Italic, TextStyle.UnderLine}), Rectangle(extent = {{-100, 100}, {100, -100}}, lineColor = {0, 0, 255})}));
    end smibwbuses;

    model smib_wobuses "smib_test_Dean_noAVR_inputs"
      PowerSystems.Electrical.Branches.PwLine pwLine1(G = 0, R = 0.01, X = 0.45, B = 0.001 / 4) annotation(Placement(visible = true, transformation(origin = {15, -5}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
      PowerSystems.Electrical.Branches.PwLine pwLine2(G = 0, R = 0.02, X = 0.9, B = 0.001 / 2) annotation(Placement(visible = true, transformation(origin = {35, 10}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
      PowerSystems.Electrical.Loads.PwLoadPQ pwLoadPQ2(P = 0.4, Q = 0.3) annotation(Placement(visible = true, transformation(origin = {45, -25}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 270)));
      PowerSystems.Electrical.Branches.PwLine pwLine6(G = 0, R = 0, X = 0.15, B = 0) annotation(Placement(visible = true, transformation(origin = {-20, 10}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
      PowerSystems.Electrical.Buses.InfiniteBus infiniteBus(v = 1, angle = 0) annotation(Placement(transformation(extent = {{130, 0}, {110, 20}})));
      PowerSystems.Electrical.Events.PwFault pwFault(R = 20, X = 1, t1 = 2, t2 = 2.1) annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 270, origin = {25, -25})));
      PowerSystems.Electrical.Branches.PwLine pwLine4(G = 0, R = 0.01, X = 0.45, B = 0.001 / 4) annotation(Placement(visible = true, transformation(origin = {55, -5}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
      PowerSystems.Electrical.Machines.PSAT.ThirdOrder.Order3_Inputs_Outputs G1(v0 = 1.019999999999977, anglev0 = 0.154464084195273, p0 = 0.399999999999984, q0 = 0.206882485782117) annotation(Placement(transformation(extent = {{-65, 0}, {-45, 20}})));
      Modelica.Blocks.Interfaces.RealInput vf1 annotation(Placement(transformation(extent = {{-130, 27}, {-90, 67}}), iconTransformation(extent = {{-130, 27}, {-90, 67}})));
      Modelica.Blocks.Interfaces.RealInput pm1 annotation(Placement(transformation(extent = {{-130, -40}, {-90, 0}}), iconTransformation(extent = {{-130, -40}, {-90, 0}})));
    equation
      connect(pwLine6.n, pwLine2.p) annotation(Line(points = {{-13, 10}, {28, 10}}, color = {0, 0, 255}, smooth = Smooth.None));
      connect(pwLine2.n, infiniteBus.p) annotation(Line(points = {{42, 10}, {109, 10}}, color = {0, 0, 255}, smooth = Smooth.None));
      connect(pwLine6.n, pwLine1.p) annotation(Line(points = {{-13, 10}, {-5, 10}, {-5, -5}, {8, -5}}, color = {0, 0, 255}, smooth = Smooth.None));
      connect(pwLine1.n, pwLine4.p) annotation(Line(points = {{22, -5}, {48, -5}}, color = {0, 0, 255}, smooth = Smooth.None));
      connect(pwLine4.n, infiniteBus.p) annotation(Line(points = {{62, -5}, {85, -5}, {85, 10}, {109, 10}}, color = {0, 0, 255}, smooth = Smooth.None));
      connect(pwLine1.n, pwFault.p) annotation(Line(points = {{22, -5}, {25, -5}, {25, -18}, {26, -18}}, color = {0, 0, 255}, smooth = Smooth.None));
      connect(pwLine4.p, pwLoadPQ2.p) annotation(Line(points = {{48, -5}, {45, -5}, {45, -18}, {46, -18}}, color = {0, 0, 255}, smooth = Smooth.None));
      connect(vf1, G1.vf) annotation(Line(points = {{-110, 47}, {-90, 47}, {-90, 15.6555}, {-67, 15.6555}}, color = {0, 0, 127}, smooth = Smooth.None));
      connect(pm1, G1.pm) annotation(Line(points = {{-110, -20}, {-90, -20}, {-90, 6}, {-67, 6}}, color = {0, 0, 127}, smooth = Smooth.None));
      connect(G1.p, pwLine6.p) annotation(Line(points = {{-44, 9.84964}, {-34.5, 9.84964}, {-34.5, 10}, {-27, 10}}, color = {0, 0, 255}, smooth = Smooth.None));
      annotation(Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = false, initialScale = 0.1, grid = {5, 5}), graphics = {Text(visible = true, origin = {-70, 69.1417}, fillPattern = FillPattern.Solid, extent = {{-35.0, -5.8583}, {35.0, 5.8583}}, textString = "SystemSbase=100 MVA", fontName = "Arial")}), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = false, initialScale = 0.1, grid = {2, 2}), graphics = {Text(origin = {-84.0681, 70.1403}, extent = {{181.463, -105.01}, {-13.5271, 4.80962}}, textString = "SMIB w. Dean's values", textStyle = {TextStyle.Bold, TextStyle.Italic, TextStyle.UnderLine}), Rectangle(extent = {{-100, 100}, {100, -100}}, lineColor = {0, 0, 255})}));
    end smib_wobuses;

    model smibGenrou "Micromodel with GENROU generator from PSSECheck initial values from .py scripts, from Maxime"
      PowerSystems.Electrical.Buses.Bus bus_gen(Vo_real = 1, Vo_img = 0) annotation(Placement(transformation(extent = {{-40, 10}, {-20, 30}})));
      PowerSystems.Electrical.Machines.PSAT.SecondOrder.Order2 order2_1(D0 = 5) annotation(Placement(visible = true, transformation(origin = {-56.3727, 20.2004}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      PowerSystems.Electrical.Branches.PwLine pwLine(G = 0, R = 0.01, X = 0.45, B = 0.001 / 4) annotation(Placement(visible = true, transformation(origin = {-4.80962, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      PowerSystems.Electrical.Buses.Bus bus_load(Vo_real = 1, Vo_img = 0) annotation(Placement(visible = true, transformation(origin = {23.7876, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      PowerSystems.Electrical.Loads.PwLoadPQ Load(P = 0.4, Q = 0.3) annotation(Placement(visible = true, transformation(origin = {41.8257, 19.0501}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    equation
      connect(bus_load.p, pwLoad.p) annotation(Line(points = {{23.7876, 20}, {34.8257, 20.0501}}, color = {0, 0, 255}));
      connect(pwLine.n, bus_load.p) annotation(Line(points = {{2.19038, 20}, {23.7876, 20}}, color = {0, 0, 255}));
      connect(bus_gen.p, pwLine.p) annotation(Line(points = {{-30, 20}, {-11.8096, 20}}, color = {0, 0, 255}));
      connect(order2_1.p, bus_gen.p) annotation(Line(points = {{-45.3727, 20.05}, {-44.5, 20.05}, {-44.5, 20}, {-30, 20}}, color = {0, 0, 255}));
      connect(bus_load.p, Load.p) annotation(Line(points = {{30, 20}, {41.0381, 20.0501}}, color = {0, 0, 255}));
      annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics));
    end smibGenrou;

    model smibwbuseswfault "smib_test_Dean_noAVR_inputs"
      PowerSystems.Electrical.Branches.PwLine pwLine1(G = 0, R = 0.01, X = 0.45, B = 0.001 / 4) annotation(Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
      PowerSystems.Electrical.Branches.PwLine pwLine2(G = 0, R = 0.02, X = 0.9, B = 0.001 / 2) annotation(Placement(visible = true, transformation(origin = {20, 20}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
      PowerSystems.Electrical.Loads.PwLoadPQ pwLoadPQ2(P = 0.4, Q = 0.3) annotation(Placement(visible = true, transformation(origin = {30, -25}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 270)));
      PowerSystems.Electrical.Buses.Bus bus1(Vo_real = 1, Vo_img = 0) annotation(Placement(visible = true, transformation(origin = {-57.542, 10}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
      PowerSystems.Electrical.Buses.Bus bus2(Vo_real = 1, Vo_img = 0) annotation(Placement(visible = true, transformation(origin = {-21.7243, 11.8063}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
      PowerSystems.Electrical.Buses.Bus bus3(Vo_real = 1, Vo_img = 0) annotation(Placement(visible = true, transformation(origin = {20, 2.1033}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
      PowerSystems.Electrical.Buses.Bus bus4(Vo_real = 1, Vo_img = 0) annotation(Placement(visible = true, transformation(origin = {71.6888, 10}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
      PowerSystems.Electrical.Branches.PwLine pwLine6(G = 0, R = 0, X = 0.15, B = 0) annotation(Placement(visible = true, transformation(origin = {-40, 10}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
      PowerSystems.Electrical.Events.PwFault pwFault(t1 = 40, t2 = 40.6, R = 5, X = 2.5) annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 270, origin = {10, -25})));
      PowerSystems.Electrical.Branches.PwLine pwLine4(G = 0, R = 0.01, X = 0.45, B = 0.001 / 4) annotation(Placement(visible = true, transformation(origin = {45, 0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
      PowerSystems.Electrical.Machines.PSAT.SecondOrder.Order2 G2(Sn = 100000.0, p0 = 0.00194, q0 = 0.2078, ra0 = 0, x1d0 = 0.01, M0 = 60000, D0 = 5) annotation(Placement(transformation(extent = {{120, 0}, {100, 20}})));
      PowerSystems.Electrical.Machines.PSAT.ThirdOrder.Order3_Inputs_Outputs G1(v0 = 0.853147, anglev0 = -0.105796, p0 = 0.0001, q0 = 0.0001, D0 = 5) annotation(Placement(transformation(extent = {{-95, 0}, {-75, 20}})));
      Modelica.Blocks.Interfaces.RealInput vf1 annotation(Placement(transformation(extent = {{-150, 17}, {-110, 57}}), iconTransformation(extent = {{-150, 17}, {-110, 57}})));
      Modelica.Blocks.Interfaces.RealInput pm1 annotation(Placement(transformation(extent = {{-150, -30}, {-110, 10}}), iconTransformation(extent = {{-150, -30}, {-110, 10}})));
    equation
      connect(pwLine2.p, bus2.p) annotation(Line(points = {{13, 20}, {-15, 20}, {-15, 11.8063}, {-21.7243, 11.8063}}, color = {0, 0, 255}, smooth = Smooth.None));
      connect(bus1.p, pwLine6.p) annotation(Line(points = {{-57.542, 10}, {-47, 10}}, color = {0, 0, 255}, smooth = Smooth.None));
      connect(pwLine6.n, bus2.p) annotation(Line(points = {{-33, 10}, {-30, 10}, {-30, 11.8063}, {-21.7243, 11.8063}}, color = {0, 0, 255}, smooth = Smooth.None));
      connect(pwLine2.n, bus4.p) annotation(Line(points = {{27, 20}, {55, 20}, {55, 10}, {71.6888, 10}}, color = {0, 0, 255}, smooth = Smooth.None));
      connect(pwLine1.n, bus3.p) annotation(Line(points = {{7, 0}, {10, 0}, {10, 2.1033}, {20, 2.1033}}, color = {0, 0, 255}, smooth = Smooth.None));
      connect(bus3.p, pwLine4.p) annotation(Line(points = {{20, 2.1033}, {31, 2.1033}, {31, 0}, {38, 0}}, color = {0, 0, 255}, smooth = Smooth.None));
      connect(pwLine4.n, bus4.p) annotation(Line(points = {{52, 0}, {55, 0}, {55, 10}, {71.6888, 10}}, color = {0, 0, 255}, smooth = Smooth.None));
      connect(pwLoadPQ2.p, bus3.p) annotation(Line(points = {{31, -18}, {31, -17}, {20, -17}, {20, 2.1033}}, color = {0, 0, 255}, smooth = Smooth.None));
      connect(pwFault.p, bus3.p) annotation(Line(points = {{11, -18}, {20, -18}, {20, 2.1033}}, color = {0, 0, 255}, smooth = Smooth.None));
      connect(G2.p, bus4.p) annotation(Line(points = {{99, 9.84964}, {71.6888, 9.84964}, {71.6888, 10}}, color = {0, 0, 255}, smooth = Smooth.None));
      connect(G1.p, bus1.p) annotation(Line(points = {{-74, 9.84964}, {-64.5, 9.84964}, {-64.5, 10}, {-57.542, 10}}, color = {0, 0, 255}, smooth = Smooth.None));
      connect(G1.vf, vf1) annotation(Line(points = {{-97, 15.6555}, {-106, 15.6555}, {-106, 37}, {-130, 37}}, color = {0, 0, 127}, smooth = Smooth.None));
      connect(G1.pm, pm1) annotation(Line(points = {{-97, 6}, {-108.5, 6}, {-108.5, -10}, {-130, -10}}, color = {0, 0, 127}, smooth = Smooth.None));
      connect(bus2.p, pwLine1.p) annotation(Line(points = {{-21.7243, 11.8063}, {-15.8622, 11.8063}, {-15.8622, 0}, {-7, 0}}, color = {0, 0, 255}, smooth = Smooth.None));
      annotation(Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = false, initialScale = 0.1, grid = {5, 5}), graphics = {Text(visible = true, origin = {-70, 69.1417}, fillPattern = FillPattern.Solid, extent = {{-35.0, -5.8583}, {35.0, 5.8583}}, textString = "SystemSbase=100 MVA", fontName = "Arial")}), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = false, initialScale = 0.1, grid = {2, 2}), graphics = {Text(origin = {-84.0681, 70.1403}, extent = {{181.463, -105.01}, {-13.5271, 4.80962}}, textString = "SMIB w. Dean's values", textStyle = {TextStyle.Bold, TextStyle.Italic, TextStyle.UnderLine}), Rectangle(extent = {{-100, 100}, {100, -100}}, lineColor = {0, 0, 255})}));
    end smibwbuseswfault;

    package ExamplesPSSE
      model EXAC1_SmallSystem "Test system for the new version governor"
        PowerSystems.Electrical.Loads.PSSE.PwLoadPQ_exponential pwLoadPQ_exponential(P0 = 0.08, Q0 = 0.06, Sbase = 1, v0 = 1.0255) annotation(Placement(transformation(extent = {{112, -82}, {142, -50}})));
        parameter Real vf00 = (Genrou.e1q0 + (Genrou.xd - Genrou.x1d - Genrou.T2d0 / Genrou.T1d0 * Genrou.x2d / Genrou.x1d * (Genrou.xd - Genrou.x1d)) * Genrou.id0) / (1 - Genrou.Taa / Genrou.T1d0) "Initialitation";
        parameter Real Sn = 100 "Power rating, MVA";
        parameter Real SystemBase = 100;
        parameter Real KC = 0.2 "Rectifier load factor, p.u";
        parameter Real E1 = 5.25 "Exciter sat. point 1, p.u";
        parameter Real E2 = 7 "Exciter sat. point 2, p.u";
        parameter Real SE1 = 0.03 "Saturation at E1";
        parameter Real SE2 = 0.1 "Saturation at E2";
        parameter Real KE = 1 "Exciter field factor, p.u";
        parameter Real KD = 0.48 "Exciter demagnetizing factor. p.u";
        PowerSystems.Electrical.Branches.PwLine pwLine2(G = 0, B = 0, R = 0.0000199980002, X = 0.001999800019998) annotation(Placement(visible = true, transformation(origin = {80, -64}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        PowerSystems.Electrical.Branches.PwLine pwLine3(G = 0, B = 0, R = 0.0000199980002, X = 0.001999800019998) annotation(Placement(visible = true, transformation(origin = {102, -84}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        PowerSystems.Electrical.Loads.PSSE.PwLoadPQ_exponential pwLoadPQ_exponential1(P0 = 0.08, Q0 = 0.06, Sbase = 1, v0 = 1.0255) annotation(Placement(transformation(extent = {{112, -102}, {142, -70}})));
        PowerSystems.Electrical.Events.PwFault pwFault1(R = 0.8, X = 8, t1 = 2, t2 = 2.1) annotation(Placement(visible = true, transformation(origin = {124.5, -103.3}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        PowerSystems.Electrical.Branches.PwLine pwLine4(G = 0, B = 0, R = 0.0000199980002, X = 0.001999800019998) annotation(Placement(visible = true, transformation(origin = {80, -76}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        parameter Real if00 = Genrou.Se0 / Genrou.xad0 "Initialitation";
        parameter Real v0 = 1.034 "Power flow, node voltage";
        PowerSystems.Electrical.Branches.PwLine pwLine1(G = 0, B = 0, R = 0.0000199980002, X = 0.001999800019998) annotation(Placement(visible = true, transformation(origin = {102, -64}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        SmarTSLab.Controls.ExcitationSystem.EXAC1 exac11(TR = 0, TB = 0.01, TC = 0, KA = 400, TA = 0.02, VREF = v0) annotation(Placement(visible = true, transformation(origin = {22.0441, 25.5711}, extent = {{-34.8297, -22.7054}, {34.8297, 22.7054}}, rotation = 0)));
        PowerSystems.Electrical.Machines.PSAT.SixthOrder.Order6Type2_Inputs_Outputs_WithVNL Genrou(vf00 = vf00, Sn = Sn, SystemBase = SystemBase, ra0 = 0, xd0 = 1.867, xq0 = 1.76, x1d0 = 0.256, x1q0 = 0.453, x2d0 = 0.174, x2q0 = 0.174, xl = 0.143, T1d0 = 5.115, T1q0 = 0.415, T2d0 = 0.023, T2q0 = 0.055, M0 = 5.6, if00 = if00, anglev0 = 0, p0 = 0.160324, q0 = 0.117354, v0 = v0, m = 0.1, n = 0.3) annotation(Placement(visible = true, transformation(origin = {18.7439, -66.8417}, extent = {{-39, -37}, {39, 37}}, rotation = 0)));
        Modelica.Blocks.Sources.Constant const(k = 0) annotation(Placement(visible = true, transformation(origin = {-71.4552, 35.3434}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      equation
        connect(Genrou.ifd, exac11.vothsg) annotation(Line(points = {{36.2939, -25.1419}, {36.1118, -25.1419}, {36.1118, -15.6228}, {-29.1967, -15.6228}, {-29.1967, 21.7695}, {-17.6717, 21.7695}, {-17.6717, 21.7695}}));
        connect(const.y, exac11.ecomp) annotation(Line(points = {{-60.4552, 35.3434}, {-50.1979, 35.3434}, {-50.1979, 35.3434}, {-16.1508, 35.3434}, {-16.1508, 34.5597}}));
        connect(Genrou.v, exac11.xadifd) annotation(Line(points = {{61.6439, -53.7427}, {76.0652, -53.7427}, {76.0652, 8.96391}, {-42.7707, 8.96391}, {-42.7707, 29.1967}, {-17.9278, 29.1967}, {-17.9278, 28.6845}, {-17.9278, 28.6845}}));
        connect(exac11.EFD, Genrou.vf) annotation(Line(points = {{60.3676, 24.0147}, {78.3702, 24.0147}, {78.3702, -7.68335}, {-57.8813, -7.68335}, {-57.8813, -46.1001}, {-30.9895, -46.1001}, {-30.9895, -46.1001}}));
        connect(Genrou.p, pwLine2.p) annotation(Line(points = {{61.6439, -67.398}, {66, -67.398}, {66, -64}, {73, -64}}, color = {0, 0, 255}));
        connect(Genrou.pm0, Genrou.pm) annotation(Line(points = {{61.6439, -43.5914}, {63.7439, -43.5914}, {63.7439, -43.8416}, {67.7439, -43.8416}, {67.7439, -115.842}, {-44.2561, -115.842}, {-44.2561, -81.8416}, {-30.2561, -81.8416}, {-30.2561, -81.6416}, {-28.0561, -81.6416}}, color = {0, 0, 127}));
        //connect(Genrou.ifd,exac11.ecomp);
        connect(pwFault1.p, pwLoadPQ_exponential1.p) annotation(Line(points = {{117.5, -102.3}, {117.5, -93.15}, {116.5, -93.15}, {116.5, -84.4}}, color = {0, 0, 0}, smooth = Smooth.None));
        connect(pwLine4.n, pwLine2.n) annotation(Line(points = {{87, -76}, {87, -64}}, color = {0, 0, 255}, smooth = Smooth.None));
        connect(pwLine4.p, pwLine2.p) annotation(Line(points = {{73, -76}, {73, -64}}, color = {0, 0, 255}, smooth = Smooth.None));
        connect(pwLine2.n, pwLine1.p) annotation(Line(points = {{87, -64}, {95, -64}}, color = {0, 0, 255}, smooth = Smooth.None));
        connect(pwLine3.p, pwLine1.p) annotation(Line(points = {{95, -84}, {95, -64}}, color = {0, 0, 255}, smooth = Smooth.None));
        connect(pwLine3.n, pwLoadPQ_exponential1.p) annotation(Line(points = {{109, -84}, {114, -84}, {114, -84.4}, {116.5, -84.4}}, color = {0, 0, 255}, smooth = Smooth.None));
        connect(pwLine1.n, pwLoadPQ_exponential.p) annotation(Line(points = {{109, -64}, {112, -64}, {112, -64.4}, {116.5, -64.4}}, color = {0, 0, 255}, smooth = Smooth.None));
        annotation(Icon(coordinateSystem(extent = {{-120, -160}, {220, 60}})), Diagram(coordinateSystem(extent = {{-120, -160}, {220, 60}}, preserveAspectRatio = false, initialScale = 0.1, grid = {2, 2}), graphics = {Text(origin = {115.5, -40.5}, fillPattern = FillPattern.Solid, extent = {{-33.5, -7.5}, {33.5, 7.5}}, textString = "SystemSbase=100 MVA", fontName = "Arial")}));
      end EXAC1_SmallSystem;
      annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})));
    end ExamplesPSSE;
  end Models;

  package Lines
    class MediumLine "Model for a transmission Line based on the pi-equivalent circuit model"
      PowerSystems.Connectors.PwPin p_in annotation(Placement(transformation(extent = {{-80, -10}, {-60, 10}}), iconTransformation(extent = {{-80, -10}, {-60, 10}})));
      PowerSystems.Connectors.PwPin p_out annotation(Placement(transformation(extent = {{60, -10}, {80, 10}}), iconTransformation(extent = {{60, -10}, {80, 10}})));
      parameter Real R "Resistance p.u.";
      parameter Real X "Reactance p.u.";
      parameter Real G "Shunt half conductance p.u.";
      parameter Real B "Shunt half susceptance p.u.";
    equation
      R * (p_out.ir - G * p_out.vr + B * p_out.vi) - X * (p_out.ii - B * p_out.vr - G * p_out.vi) = p_out.vr - p_in.vr;
      R * (p_out.ii - B * p_out.vr - G * p_out.vi) + X * (p_out.ir - G * p_out.vr + B * p_out.vi) = p_out.vi - p_in.vi;
      R * (p_in.ir - G * p_in.vr + B * p_in.vi) - X * (p_in.ii - B * p_in.vr - G * p_in.vi) = p_in.vr - p_out.vr;
      R * (p_in.ii - B * p_in.vr - G * p_in.vi) + X * (p_in.ir - G * p_in.vr + B * p_in.vi) = p_in.vi - p_out.vi;
      annotation(Icon(graphics = {Rectangle(extent = {{-60, 40}, {60, -42}}, lineColor = {0, 0, 255}), Rectangle(extent = {{-40, 10}, {40, -10}}, lineColor = {0, 0, 255}, fillColor = {95, 95, 95}, fillPattern = FillPattern.Solid)}), Diagram(graphics));
    end MediumLine;

    class ShortLine "Model for a transmission Line based on the pi-equivalent circuit model"
      PowerSystems.Connectors.PwPin p_in annotation(Placement(transformation(extent = {{-80, -10}, {-60, 10}}), iconTransformation(extent = {{-80, -10}, {-60, 10}})));
      PowerSystems.Connectors.PwPin p_out annotation(Placement(transformation(extent = {{60, -10}, {80, 10}}), iconTransformation(extent = {{60, -10}, {80, 10}})));
      parameter Real R "Resistance p.u.";
      parameter Real X "Reactance p.u.";
      parameter Real G "Shunt half conductance p.u.";
      parameter Real B "Shunt half susceptance p.u.";
    equation
      R * (p_out.ir - G * p_out.vr + B * p_out.vi) - X * (p_out.ii - B * p_out.vr - G * p_out.vi) = p_out.vr - p_in.vr;
      R * (p_out.ii - B * p_out.vr - G * p_out.vi) + X * (p_out.ir - G * p_out.vr + B * p_out.vi) = p_out.vi - p_in.vi;
      R * (p_in.ir - G * p_in.vr + B * p_in.vi) - X * (p_in.ii - B * p_in.vr - G * p_in.vi) = p_in.vr - p_out.vr;
      R * (p_in.ii - B * p_in.vr - G * p_in.vi) + X * (p_in.ir - G * p_in.vr + B * p_in.vi) = p_in.vi - p_out.vi;
      annotation(Icon(graphics = {Rectangle(extent = {{-60, 40}, {60, -42}}, lineColor = {0, 0, 255}), Rectangle(extent = {{-40, 10}, {40, -10}}, lineColor = {0, 0, 255}, fillColor = {95, 95, 95}, fillPattern = FillPattern.Solid)}), Diagram(graphics));
    end ShortLine;

    package Data
      record PiLine
        parameter Real R = 0.001 "Resistance p.u.";
        parameter Real X = 0.2 "Reactance p.u.";
        parameter Real G = 0 "Shunt half conductance p.u.";
        parameter Real B = 0 "Shunt half susceptance p.u.";
      end PiLine;
    end Data;
  end Lines;

  package Buses
    class Bus
      /*class with the exactly same definition as BUclass in PSAT */
      input Integer iIn;
      input Integer iOut;
      Integer nBuses = iIn + iOut;
      PowerSystems.Connectors.PwPin[iIn] inputs;
      Real[iIn] inAngle;
      PowerSystems.Connectors.PwPin[iOut] outputs;
      Real[iOut] outAngle;
      Real[iIn] Pg;
      Real[iIn] Qg;
      Real[iOut] Pl;
      Real[iOut] Ql;
      PowerSystems.Connectors.PwPin pwpin2 annotation(Placement(visible = true, transformation(origin = {-15, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-15, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      PowerSystems.Connectors.PwPin pwpin1 annotation(Placement(visible = true, transformation(origin = {15, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {15, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    algorithm
      for i in 1:size(inputs, 1) loop
      end for;
      /*automatic drawing of the pins*/
      annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2}), graphics = {Rectangle(origin = {0, 0}, extent = {{-15, 100}, {15, -100}})}));
    end Bus;

    class PQBus
      PowerSystems.Connectors.PwPin p(vr(start = Vo_real), vi(start = Vo_img)) annotation(Placement(visible = true, transformation(origin = {1.5559, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {0.0, -0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
      Real v;
      Real anglev;
      parameter Real Vo_real = 1;
      parameter Real Vo_img = 0;
    equation
      v = sqrt(p.vr ^ 2 + p.vi ^ 2);
      anglev = atan2(p.vi, p.vr);
      p.ir = 0;
      p.ii = 0;
      annotation(Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Rectangle(visible = true, fillPattern = FillPattern.Solid, extent = {{-10.0, -100.0}, {10.0, 100.0}}), Text(visible = true, origin = {0.9738, 119.0625}, fillPattern = FillPattern.Solid, extent = {{-39.0262, -16.7966}, {39.0262, 16.7966}}, textString = "%name", fontName = "Arial")}), Diagram(coordinateSystem(extent = {{-148.5, -105.0}, {148.5, 105.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
    end PQBus;

    class PVBus
      PowerSystems.Connectors.PwPin p(vr(start = Vo_real), vi(start = Vo_img)) annotation(Placement(visible = true, transformation(origin = {1.5559, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {0.0, -0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
      Real v;
      Real anglev;
      parameter Real Vo_real = 1;
      parameter Real Vo_img = 0;
    equation
      v = sqrt(p.vr ^ 2 + p.vi ^ 2);
      anglev = atan2(p.vi, p.vr);
      p.ir = 0;
      p.ii = 0;
      annotation(Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Rectangle(visible = true, fillPattern = FillPattern.Solid, extent = {{-10.0, -100.0}, {10.0, 100.0}}), Text(visible = true, origin = {0.9738, 119.0625}, fillPattern = FillPattern.Solid, extent = {{-39.0262, -16.7966}, {39.0262, 16.7966}}, textString = "%name", fontName = "Arial")}), Diagram(coordinateSystem(extent = {{-148.5, -105.0}, {148.5, 105.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
    end PVBus;

    model BusNew "First winding of Three Winding Transformer"
      PowerSystems.Connectors.PwPin p annotation(Placement(transformation(extent = {{-120, -6}, {-100, 14}})));
      PowerSystems.Connectors.PwPin n annotation(Placement(transformation(extent = {{100, -10}, {120, 10}})));
      parameter Real SystemBase = 100;
      parameter Real Sn = 100 "Power rating MVA";
      parameter Real Vbus = 400000 "Sending end bus voltage";
      parameter Real Vn1 = 400000 "Voltage rating of the first winding, V";
      parameter Real Vn2 = 100000 "Voltage rating of the second winding, V";
      parameter Real Vn3 = 40000 "Voltage rating of the third winding, V";
      parameter Real fn = 50 "Frequency rating, Hz";
      parameter Real R12 = 0.01 "Resistance of the branch 1-2, p.u.";
      parameter Real R13 = 0.01 "Resistance of the branch 1-3, p.u.";
      parameter Real R23 = 0.01 "Resistance of the branch 2-3, p.u.";
      parameter Real X12 = 0.1 "Reactance of the branch 1-2, p.u.";
      parameter Real X13 = 0.1 "Reactance of the branch 1-3, p.u.";
      parameter Real X23 = 0.1 "Reactance of the branch 2-3, p.u.";
      parameter Real m = 0.98 "Fixed Tap ratio";
      Real r1;
      Real x1;
      Real anglev2 "Angle of the fictious bus";
      Real vbus2 "Voltage of the fictious bus";
    equation
      vbus2 = sqrt(n.vr ^ 2 + n.vi ^ 2);
      anglev2 = atan2(n.vi, n.vr);
      r1 = 0.5 * (R12 + R13 - R23);
      x1 = 0.5 * (X12 + X13 - X23);
      r1 * p.ir - x1 * p.ii = 1 / m ^ 2 * p.vr - 1 / m * n.vr;
      r1 * p.ii + x1 * p.ir = 1 / m ^ 2 * p.vi - 1 / m * n.vi;
      r1 * n.ir - x1 * n.ii = n.vr - 1 / m * p.vr;
      x1 * n.ir + r1 * n.ii = n.vi - 1 / m * p.vi;
    end BusNew;
  end Buses;

  package Machines
    package GENROU "Round Rotor Generator"
      function conj "Conjugate of complex number"
        input Complex c1 "Complex number";
        output Complex c2 "= c1.re - j*c1.im";
      algorithm
        c2 := Complex(c1.re, -c1.im);
        annotation(Inline = true, Documentation(info = "<html>
<p>This function returns the Complex conjugate of the Complex input.</p>
</html>"));
      end conj;

      function real "Real part of complex number"
        input Complex c "Complex number";
        output Real r "= c.re ";
      algorithm
        r := c.re;
        annotation(Inline = true, Documentation(info = "<html>
<p>This function returns the real part of the Complex input.</p>
</html>"));
      end real;

      function imag "Imaginary part of complex number"
        input Complex c "Complex number";
        output Real r "= c.im ";
      algorithm
        r := c.im;
        annotation(Inline = true, Documentation(info = "<html>
<p>This function returns the imaginary part of the Complex input.</p>
</html>"));
      end imag;

      function arg "Phase angle of complex number"
        input Complex c "Complex number";
        input Modelica.SIunits.Angle phi0 = 0 "Phase angle phi shall be in the range: -pi < phi-phi0 < pi";
        output Modelica.SIunits.Angle phi "= phase angle of c";
      algorithm
        phi := Modelica.Math.atan3(c.im, c.re, phi0);
        annotation(Inline = true, Documentation(info = "<html>
<p>This function returns the Real argument of the Complex input, i.e., it's angle.</p>
</html>"));
      end arg;

      function fromPolar "Complex from polar representation"
        input Real len "abs of complex";
        input Modelica.SIunits.Angle phi "arg of complex";
        output Complex c "= len*cos(phi) + j*len*sin(phi)";
      algorithm
        c := Complex(len * Modelica.Math.cos(phi), len * Modelica.Math.sin(phi));
        annotation(Inline = true, Documentation(info = "<html>
<p>This function constructs a Complex number from it's length (absolute) and angle (argument).</p>
</html>"));
      end fromPolar;

      function Se
        extends Modelica.Icons.Function;
        input Real u "Psipp";
        input Real s10;
        input Real s12;
        output Real sys;
      protected
        parameter Real a = sqrt(s10 / (s12 * 1.2));
        parameter Real A = 1.2 - (1 - 1.2) / (a - 1);
        parameter Real B = 1.2 * s12 * (a - 1) ^ 2 / (1 - 1.2) ^ 2;
      algorithm
        if u == 0.0 or s10 <= 0.0 then
          sys := 0;
        else
          if u <= A then
            sys := 0;
          else
            sys := B * (u - A) ^ 2 / u;
          end if;
        end if;
      end Se;

      model GENROU
        constant Real pi = Modelica.Constants.pi;
        parameter Real eterm "terminal voltage";
        //1.0
        parameter Real anglev0 "Power flow, node angle in degree";
        parameter Real pelec "active power MVA";
        //80.0
        parameter Real qelec "reactive power MVA";
        //50.0
        parameter Real wbase = 2 * pi * 50 "system base speed";
        parameter Real mbase = 100 "system base power rating MVA";
        parameter Real Ra = 0 "amature resistance";
        parameter Real Tpd0 "d-axis transient open-circuit time constant s";
        parameter Real Tppd0 "d-axis sub-transient open-circuit time constant s";
        parameter Real Tpq0 "q-axis transient open-circuit time constant s";
        parameter Real Tppq0 "q-axis transient open-circuit time constant s";
        parameter Real H "inertia constant s";
        parameter Real D "Damping";
        parameter Real Xd "d-axis reactance";
        parameter Real Xq "q-axis reactance";
        parameter Real Xpd "d-axis transient reactance";
        parameter Real Xpq "d-axis transient reactance";
        parameter Real Xppd "d-axis sub-transient reactance";
        parameter Real Xppq = Xppd "q-axis sub-transient reactance";
        parameter Real Xpp = Xppd "sub-transient reactance";
        parameter Real Xl "leakage reactance";
        parameter Real s10 = Modelica.Constants.small;
        //less than zero can commend the saturation function
        parameter Real s12 = Modelica.Constants.small;
        // paremeter Real gentype = 1;
      protected
        parameter Real anglev_rad = anglev0 * pi / 180 "initial value of bus anglev in rad";
        parameter Real p0 = pelec / mbase "initial value of bus active power in p.u.";
        parameter Real q0 = qelec / mbase "initial value of bus reactive power in p.u.";
        parameter Complex Zs(re = Ra, im = Xpp) "Equivation impedance";
        parameter Complex VT(re = eterm * cos(anglev_rad), im = eterm * sin(anglev_rad));
        parameter Complex S(re = p0, im = q0);
        parameter Complex It = conj(S / VT);
        parameter Complex Is = It + VT / Zs "Equivation current source";
        parameter Complex fpp = Zs * Is "Flux linkage in synchronous reference frame";
        parameter Real ang_P = arg(fpp);
        parameter Real ang_I = arg(It);
        parameter Real ang_PI = ang_P - ang_I;
        parameter Real psi = absol(fpp);
        //Include saturation factor during initialization
        parameter Real dsat = Se(psi, s10, s12);
        parameter Real a = psi + psi * dsat * (Xq - Xl) / (Xd - Xl);
        parameter Real b = absol(It) * (Xpp - Xq);
        //Initialize rotor angle position
        parameter Real delta0 = atan(b * cos(ang_PI) / (b * sin(ang_PI) - a)) + ang_P;
        parameter Complex DQ_dq(re = cos(delta0), im = -sin(delta0)) "Change Reference Frame";
        parameter Complex fpp_dq = fpp * DQ_dq "Flux linkage in rotor reference fram (dq axes)";
        parameter Complex I_dq = conj(It * DQ_dq);
        parameter Real PSIppq0 = real(fpp_dq);
        parameter Real PSIppd0 = imag(fpp_dq);
        //Initialize current and voltage components of rotor reference fram (dq axes).
        parameter Real iq0 = real(I_dq);
        parameter Real id0 = imag(I_dq);
        parameter Real ud0 = (-(PSIppq0 - Xppq * iq0)) - Ra * id0;
        parameter Real uq0 = PSIppd0 - Xppd * id0 - Ra * iq0;
        //Initialize current and voltage components of synchronous reference frame.
        parameter Real v0 = eterm;
        parameter Real vr0 = v0 * cos(anglev_rad);
        parameter Real vi0 = v0 * sin(anglev_rad);
        parameter Real ir0 = (p0 * vr0 + q0 * vi0) / (vr0 ^ 2 + vi0 ^ 2);
        parameter Real ii0 = (p0 * vi0 - q0 * vr0) / (vr0 ^ 2 + vi0 ^ 2);
        //Initialize mechanical power and field voltage.
        parameter Real Pm0 = p0;
        parameter Real Efd0 = dsat * PSIppq0 + PSIppq0 + (Xpd - Xpp) * id0 + (Xd - Xpd) * id0;
        // constant
        parameter Real K1d = (Xpd - Xppd) * (Xd - Xpd) / (Xpd - Xl) ^ 2;
        parameter Real K2d = (Xpd - Xl) * (Xppd - Xl) / (Xpd - Xppd);
        parameter Real K1q = (Xpq - Xppq) * (Xq - Xpq) / (Xpq - Xl) ^ 2;
        parameter Real K2q = (Xpq - Xl) * (Xppq - Xl) / (Xpq - Xppq);
        parameter Real K3d = (Xppd - Xl) / (Xpd - Xl);
        parameter Real K4d = (Xpd - Xppd) / (Xpd - Xl);
        parameter Real K3q = (Xppq - Xl) / (Xpq - Xl);
        parameter Real K4q = (Xpq - Xppq) / (Xpq - Xl);
      public
        Real Vt "Bus voltage magnitude";
        Real anglev "Bus voltage angle";
        Real I "terminal current magnitude";
        Real anglei "terminal current angle";
        // DQ Axis
        Real id(start = id0);
        Real iq(start = iq0);
        Real ud;
        Real uq;
        //states
        Real delta "load angle";
        Real w "machine speed deviation, p.u.";
        Real Epd;
        Real Epq;
        Real Te;
        Real PSId;
        Real PSIq;
        Real PSIkd;
        Real PSIkq;
        Real PSIppd;
        Real PSIppq;
        Real PSIpp;
        Real XadIfd;
        Real Delta_XadIfd;
        Real XaqIlq;
        Real Delta_XaqIlq;
        Real P;
        Real Q;
        PowerSystems.Connectors.PwPin p(vr(start = vr0), vi(start = vi0), ir(start = ir0), ii(start = ii0)) annotation(Placement(transformation(extent = {{80, -12}, {100, 8}}), iconTransformation(extent = {{80, -12}, {100, 8}})));
        output Modelica.Blocks.Interfaces.RealOutput dwr(start = 0) annotation(Placement(transformation(extent = {{74, 50}, {94, 70}}), iconTransformation(extent = {{98, 56}, {114, 72}})));
        input Modelica.Blocks.Interfaces.RealInput Pm(start = Pm0) annotation(Placement(transformation(extent = {{-108, 22}, {-88, 42}}), iconTransformation(extent = {{-104, 50}, {-84, 70}})));
        output Modelica.Blocks.Interfaces.RealOutput P_m0 = Pm0 annotation(Placement(transformation(extent = {{74, 26}, {94, 46}}), iconTransformation(extent = {{98, 32}, {114, 48}})));
        output Modelica.Blocks.Interfaces.RealOutput Ec(start = v0) annotation(Placement(transformation(extent = {{72, -58}, {92, -38}}), iconTransformation(extent = {{98, -70}, {114, -54}})));
        input Modelica.Blocks.Interfaces.RealInput E_fd(start = Efd0) annotation(Placement(transformation(extent = {{-104, -74}, {-84, -54}}), iconTransformation(extent = {{-104, -74}, {-84, -54}})));
        output Modelica.Blocks.Interfaces.RealOutput EFD0 = Efd0 annotation(Placement(transformation(extent = {{72, -82}, {92, -62}}), iconTransformation(extent = {{98, -88}, {114, -72}})));
        output Modelica.Blocks.Interfaces.RealOutput Pe annotation(Placement(transformation(extent = {{74, 6}, {94, 26}}), iconTransformation(extent = {{98, -54}, {114, -38}})));
      initial equation
        delta = delta0;
        w = 0;
        der(Epd) = 0;
        der(Epq) = 0;
        der(PSIkd) = 0;
        der(PSIkq) = 0;
      equation
        dwr = w;
        Ec = Vt;
        der(Epq) = 1 / Tpd0 * (E_fd - XadIfd);
        der(Epd) = 1 / Tpq0 * (-1) * XaqIlq;
        der(PSIkd) = 1 / Tppd0 * (Epq - PSIkd - (Xpd - Xl) * id);
        der(PSIkq) = 1 / Tppq0 * (Epd - PSIkq + (Xpq - Xl) * iq);
        ////(-1)
        der(w) = ((Pm - D * w) / (w + 1) - Te) / (2 * H);
        Te = PSId * iq - PSIq * id;
        PSId = PSIppd - Xppd * id;
        PSIq = PSIppq - Xppq * iq;
        der(delta) = wbase * w;
        PSIppd = Epq * K3d + PSIkd * K4d;
        PSIppq = (-Epd * K3q) - PSIkq * K4q;
        /////
        PSIpp = sqrt(PSIppd * PSIppd + PSIppq * PSIppq);
        ud = (-PSIq * (w + 1)) - Ra * id;
        uq = PSId * (w + 1) - Ra * iq;
        //flow
        anglev = atan2(p.vi, p.vr);
        Vt = sqrt(p.vr ^ 2 + p.vi ^ 2);
        anglei = atan2(p.ii, p.ir);
        I = sqrt(p.ii ^ 2 + p.ir ^ 2);
        Delta_XadIfd = Se(PSIpp, s10, s12) * PSIppd;
        Delta_XaqIlq = Se(PSIpp, s10, s12) * PSIppq * (Xq - Xl) / (Xd - Xl);
        XadIfd = K1d * (Epq - PSIkd - (Xpd - Xl) * id) + Epq + id * (Xd - Xpd) + Delta_XadIfd;
        //
        XaqIlq = K1q * (Epd - PSIkq + (Xpq - Xl) * iq) + Epd - iq * (Xq - Xpq) - Delta_XaqIlq;
        ///-PSIkq
        [p.ir; p.ii] = -[sin(delta), cos(delta); -cos(delta), sin(delta)] * [id; iq];
        [p.vr; p.vi] = [sin(delta), cos(delta); -cos(delta), sin(delta)] * [ud; uq];
        -P = p.vr * p.ir + p.vi * p.ii;
        -Q = p.vi * p.ir - p.vr * p.ii;
        Pe = P;
        annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics), Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Ellipse(extent = {{-102, 92}, {94, -98}}, lineColor = {0, 0, 255}), Text(extent = {{-56, 62}, {54, -62}}, lineColor = {0, 0, 255}, textString = "Genrou"), Rectangle(extent = {{-102, 94}, {98, -102}}, lineColor = {0, 0, 255})}));
      end GENROU;

      record GENROU_D
        constant Real pi = Modelica.Constants.pi;
        parameter Real V = 0.999999 "terminal voltage";
        //1.0
        parameter Real V1 = 4.0463 "Power flow, node angle in degree";
        parameter Real V2 = 0.399989 * 100 "active power MVA";
        //80.0
        parameter Real V3 = 5.41649 * 0.01 * 100 "reactive power MVA";
        //50.0
        parameter Real V4 = 2 * pi * 50 "system base speed";
        parameter Real V5 = 100 "system base power rating MVA";
        parameter Real V6 = 0 "amature resistance";
        parameter Real J = 6.15 "d-axis transient open-circuit time constant s";
        parameter Real J1 = 0.11 "d-axis sub-transient open-circuit time constant s";
        parameter Real J2 = 0.3 "q-axis transient open-circuit time constant s";
        parameter Real J3 = 0.1 "q-axis transient open-circuit time constant s";
        parameter Real J4 = 3 "inertia constant s";
        parameter Real J5 = 0 "Damping";
        parameter Real J6 = 1.157 "d-axis reactance";
        parameter Real J7 = 0.968 "q-axis reactance";
        parameter Real J8 = 0.242 "d-axis transient reactance";
        parameter Real J9 = 0.427 "d-axis transient reactance";
        parameter Real J10 = 0.2 "d-axis sub-transient reactance";
        parameter Real J11 = 0.12 "leakage reactance";
        parameter Real J12 = 0.1175;
        //less than zero can commend the saturation function
        parameter Real J13 = 0.42;
        // paremeter Real gentype = 1;
        parameter Real J14 = J10 "q-axis sub-transient reactance";
        parameter Real J15 = J10 "sub-transient reactance";
      end GENROU_D;

      function absol "Absolute value of complex number"
        input Complex c "Complex number";
        output Real result "= abs(c)";
      algorithm
        result := (c.re ^ 2 + c.im ^ 2) ^ 0.5;
        //changed from sqrt
        annotation(Inline = true, Documentation(info = "<html>
<p>This function returns the Real absolute of the Complex input, i.e., it's length.</p>
</html>"));
      end absol;
    end GENROU;

    package GENCLS
      model GENCLS
        SmarTSLab.Connectors.PwPin p(vr(start = vr0), vi(start = vi0), ir(start = ir0), ii(start = ii0)) annotation(Placement(visible = true, transformation(origin = {2.2777, 10.4683}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {110.0, -1.5036}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        constant Real pi = Modelica.Constants.pi;
        parameter Real v0 = 1 "Power flow, node voltage";
        parameter Real anglev0 = 0 "Power flow, node angle in degree";
        parameter Real p0 = 0.200012000627281 "Power flow, node active power,p.u.";
        parameter Real q0 = 0.0518626935184656 "Power flow, node reactive power,p.u.";
        parameter Real wbase = 2 * pi * 50 "system base speed";
        parameter Real mbase = 100 "system base power rating MVA";
        parameter Real ra = 0 "amature resistance";
        parameter Real x1d = 1 "d-axis transient reactance, p.u.";
        parameter Real H = 0 "inertia";
        parameter Real D = 0 "Damping coefficient";
        parameter Real anglev_rad = anglev0 * pi / 180 "initial value of bus anglev in rad";
        parameter Real c1 = ra * K "CONSTANT";
        parameter Real c2 = x1d * K "CONSTANT";
        parameter Real c3 = x1d * K " CONSTANT";
        parameter Real K = 1 / (ra * ra + x1d * x1d) "CONSTANT";
        parameter Real vr0 = v0 * cos(anglev_rad) "Initialitation";
        parameter Real vi0 = v0 * sin(anglev_rad) "Initialitation";
        parameter Real ir0 = (p0 * vr0 + q0 * vi0) / (vr0 ^ 2 + vi0 ^ 2) "Initialitation";
        parameter Real ii0 = (p0 * vi0 - q0 * vr0) / (vr0 ^ 2 + vi0 ^ 2) "Initialitation";
        parameter Real delta0 = atan2(vi0 + ra * ii0 + x1d * ir0, vr0 + ra * ir0 - x1d * ii0) "Initialitation";
        parameter Real vd0 = vr0 * cos(pi / 2 - delta0) - vi0 * sin(pi / 2 - delta0) "Initialitation";
        parameter Real vq0 = vr0 * sin(pi / 2 - delta0) + vi0 * cos(pi / 2 - delta0) "Initialitation";
        parameter Real id0 = ir0 * cos(pi / 2 - delta0) - ii0 * sin(pi / 2 - delta0) "Initialitation";
        parameter Real iq0 = ir0 * sin(pi / 2 - delta0) + ii0 * cos(pi / 2 - delta0) "Initialitation";
        parameter Real vf0 = vq0 + ra * iq0 + x1d * id0 "Initialitation";
        //Real deltaminusanglev=delta - anglev;
        Real delta "rotor angle index";
        //Real w "machine speed, p.u.";
        Real v(start = v0) "Bus voltage magnitude";
        Real anglev(start = anglev_rad) " Bus voltage angle";
        //Real pm(start=pm0) " mechanical power";
        Real vf(start = vf0) " field voltage";
        Real vd(start = vd0) "voltage direct axis";
        Real vq(start = vq0) "voltage quadrature axis";
        Real id(start = id0) "current direct axis";
        Real iq(start = iq0) "current quadrature axis";
        //Real pe "electric power";
        Real P;
        Real Q;
      equation
        v = sqrt(p.vr ^ 2 + p.vi ^ 2);
        anglev = atan2(p.vi, p.vr);
        delta = delta0;
        vf = vf0;
        // pm0=(vq + ra*iq)*iq + (vd + ra*id)*id;
        id = (-c1 * vd) - c3 * vq + vf * c3;
        iq = c2 * vd - c1 * vq + vf * c1;
        [p.ir; p.ii] = -[sin(delta), cos(delta); -cos(delta), sin(delta)] * [id; iq];
        [p.vr; p.vi] = [sin(delta), cos(delta); -cos(delta), sin(delta)] * [vd; vq];
        -P = p.vr * p.ir + p.vi * p.ii;
        -Q = p.vi * p.ir - p.vr * p.ii;
        annotation(Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Rectangle(visible = true, fillColor = {255, 255, 255}, extent = {{-100.0, -100.0}, {100.0, 100.0}}), Ellipse(visible = true, fillColor = {255, 255, 255}, extent = {{-47.9318, -40.0}, {47.9318, 40.0}}), Text(visible = true, origin = {0.0, 66.9882}, fillPattern = FillPattern.Solid, extent = {{-53.1084, -16.9882}, {53.1084, 16.9882}}, textString = "Second Order", fontName = "Arial"), Text(visible = true, origin = {0.0, -68.0978}, fillPattern = FillPattern.Solid, extent = {{-57.2101, -15.0}, {57.2101, 15.0}}, textString = "%name", fontName = "Arial"), Line(visible = true, origin = {-0.7518, 1.1655}, points = {{-21.872, -8.8345}, {-6.9173, 8.8345}, {8.0374, -8.8345}, {20.7518, 8.8345}})}), Diagram(coordinateSystem(extent = {{-148.5, -105.0}, {148.5, 105.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
      end GENCLS;

      function conj "Conjugate of complex number"
        input Complex c1 "Complex number";
        output Complex c2 "= c1.re - j*c1.im";
      algorithm
        c2 := Complex(c1.re, -c1.im);
        annotation(Inline = true, Documentation(info = "<html>
<p>This function returns the Complex conjugate of the Complex input.</p>
</html>"));
      end conj;

      function arg "Phase angle of complex number"
        input Complex c "Complex number";
        input Modelica.SIunits.Angle phi0 = 0 "Phase angle phi shall be in the range: -pi < phi-phi0 < pi";
        output Modelica.SIunits.Angle phi "= phase angle of c";
      algorithm
        phi := Modelica.Math.atan3(c.im, c.re, phi0);
        annotation(Inline = true, Documentation(info = "<html>
<p>This function returns the Real argument of the Complex input, i.e., it's angle.</p>
</html>"));
      end arg;

      function 'abs' "Absolute value of complex number"
        input Complex c "Complex number";
        output Real result "= abs(c)";
      algorithm
        result := (c.re ^ 2 + c.im ^ 2) ^ 0.5;
        //changed from sqrt
        annotation(Inline = true, Documentation(info = "<html>
<p>This function returns the Real absolute of the Complex input, i.e., it's length.</p>
</html>"));
      end 'abs';

      function fromPolar "Complex from polar representation"
        input Real len "abs of complex";
        input Modelica.SIunits.Angle phi "arg of complex";
        output Complex c "= len*cos(phi) + j*len*sin(phi)";
      algorithm
        c := Complex(len * Modelica.Math.cos(phi), len * Modelica.Math.sin(phi));
        annotation(Inline = true, Documentation(info = "<html>
<p>This function constructs a Complex number from it's length (absolute) and angle (argument).</p>
</html>"));
      end fromPolar;

      record GENCLS_D
        constant Real pi = Modelica.Constants.pi;
        parameter Real V = 1 "terminal voltage";
        //1.0
        parameter Real V1 = -0.000000300563 "Power flow, node angle in degree";
        parameter Real V2 = 0.100184 * 100 "active power MW";
        //80.0
        parameter Real V3 = 0.080064 * 100 "reactive power Mra";
        //50.0
        parameter Real V4 = 2 * pi * 50 "system base speed";
        parameter Real V5 = 100 "system base power rating MVA";
        parameter Real V6 = 0 "amature resistance";
        parameter Real V7 = 1 "d-axis transient reactance, p.u.";
        parameter Real J = 0 "Machanical starting time (2H), kWs/kVA";
        parameter Real J1 = 0 "Damping coefficient";
      end GENCLS_D;
    end GENCLS;
  end Machines;

  package HVDC
    model AVM
      Modelica.Electrical.Analog.Sources.SineCurrent Iaref(I = 1) annotation(Placement(transformation(extent = {{-86, 30}, {-66, 50}})));
      Modelica.Electrical.Analog.Sources.SineVoltage Varef(V = 1) annotation(Placement(transformation(extent = {{-86, -26}, {-66, -6}})));
      Modelica.Electrical.Analog.Sources.SineVoltage Vctot(V = 1) annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 0, origin = {-76, 4})));
      annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics));
    end AVM;
  end HVDC;

  package NonElectrical
    package Math
      class Average
      end Average;

      function DCFunction
        input Real Va_ref;
        input Real Ia_ref annotation(Placement(transformation(extent = {{-80, 0}, {-60, 20}})));
        output Real Idc annotation(Placement(transformation(extent = {{40, 0}, {60, 20}})));
      algorithm
        Idc := (Va_ref * Ia_ref + 0 + 0) / 2;
      end DCFunction;

      function ACFunction
        input Real Vdc;
        input Real Vref;
        output Real Vac;
      algorithm
        Vac := Vdc * Vref / 2;
        annotation(Placement(transformation(extent = {{-80, 0}, {-60, 20}})));
      end ACFunction;
    end Math;

    package Logical
      class SaturationGain
        parameter Real E1;
        parameter Real SE1;
        parameter Real E2;
        parameter Real SE2;
        Modelica.Blocks.Interfaces.RealOutput y annotation(Placement(visible = true, transformation(origin = {110.128, -0.465658}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-20.9546, 17.9278}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        Modelica.Blocks.Interfaces.RealInput x annotation(Placement(visible = true, transformation(origin = {-109.43, -0.232829}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-104.075, 16.0652}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      equation
        y = if x < E1 then SE1 elseif x >= E2 then SE2 else 0;
        annotation(Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2}), graphics = {Line(origin = {-0.382763, 0.430719}, points = {{0.382763, 88.2771}, {0.382763, -88.9057}, {-0.0828952, -87.7415}}), Line(origin = {-0.232829, -0.116414}, points = {{-90.8033, -0.116414}, {89.1735, -0.116414}}), Line(origin = {-4.42375, 53.085}, points = {{-75.9022, 0}, {84.2841, 0}}), Line(origin = {3.72526, -49.8254}, points = {{-91.0361, 0}, {69.6158, 0}})}));
      end SaturationGain;
      annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})));
    end Logical;
  end NonElectrical;

  package Connectors
    connector Ph3
      Real Va;
      Real Vb;
      Real Vc;
      flow Real Ia;
      flow Real Ib;
      flow Real Ic;
    end Ph3;

    connector DC
      Real V;
      flow Real I;
    end DC;

    connector PwPin
      Real vr;
      // real part of the voltage
      Real vi;
      // imaginary part of the voltage
      flow Real ir;
      // real part of the current
      flow Real ii;
      // imaginary part of the current
      annotation(Icon(graphics = {Rectangle(extent = {{-100, 98}, {100, -102}}, lineColor = {0, 0, 255}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid)}));
    end PwPin;
  end Connectors;

  package Loads
    class ConstantLoad
      PowerSystems.Connectors.PwPin p(vr(start = vr0), vi(start = vi0), ir(start = ir0), ii(start = ii0)) annotation(Placement(transformation(extent = {{-56, -10}, {-36, 10}}), iconTransformation(extent = {{-80, 0}, {-60, 20}})));
      constant Real pi = Modelica.Constants.pi;
      parameter Real v0 "initial value of bus voltage";
      parameter Real anglev0 "initial value of bus anglev in degree";
      //     parameter Real p0 "initial value of p0";
      //   parameter Real q0 "initial value of q0";
      parameter Complex S_p "Original Constant Power load in p.u.";
      parameter Complex S_i "Original Constant current load in p.u.";
      parameter Complex S_y "Original Constant shunt admittance load in p.u.";
      parameter Complex a "load transfer fraction for constant current load";
      parameter Complex b "load transfer fraction for constant shunt admittance load";
      parameter Real PQBRAK "Constant power characteristic threshold";
      parameter Complex S_P = Complex((1 - a.re - b.re) * S_p.re, (1 - a.im - b.im) * S_p.im);
      parameter Complex S_I = S_i + Complex(a.re * S_p.re / v0, a.im * S_p.im / v0);
      parameter Complex S_Y = S_y + Complex(b.re * S_p.re / v0 ^ 2, b.im * S_p.im / v0 ^ 2);
    protected
      parameter Real anglev_rad = anglev0 * pi / 180 "initial value of bus anglev in rad";
      parameter Real p0 = S_i.re * v0 + S_y.re * v0 ^ 2 + S_p.re;
      //should be the value before converted
      parameter Real q0 = S_i.im * v0 + S_y.im * v0 ^ 2 + S_p.im;
      parameter Real vr0 = v0 * cos(anglev_rad) "Initialitation";
      parameter Real vi0 = v0 * sin(anglev_rad) "Initialitation";
      parameter Real ir0 = (p0 * vr0 + q0 * vi0) / (vr0 ^ 2 + vi0 ^ 2) "Initialitation";
      parameter Real ii0 = (p0 * vi0 - q0 * vr0) / (vr0 ^ 2 + vi0 ^ 2) "Initialitation";
    public
      Real angle(start = anglev_rad);
      Real v(start = v0);
      Real k(start = 1);
      Real P;
      Real Q;
    equation
      if v < PQBRAK / 2 and v > 0 then
        k = 2 * (v / PQBRAK) ^ 2;
      elseif v > PQBRAK / 2 and v < PQBRAK then
        k = 1 - 2 * ((v - PQBRAK) / PQBRAK) ^ 2;
      else
        k = 1;
      end if;
      angle = atan2(p.vi, p.vr);
      v = sqrt(p.vr ^ 2 + p.vi ^ 2);
      //   k*(S_I.re*v+S_Y.re*v^2+S_P.re)=p.vr*p.ir + p.vi*p.ii;
      //   k*(S_I.im*v+S_Y.im*v^2+S_P.im)=-p.vr*p.ii + p.vi*p.ir;
      1 * (S_I.re * v + S_Y.re * v ^ 2 + S_P.re) = p.vr * p.ir + p.vi * p.ii;
      1 * (S_I.im * v + S_Y.im * v ^ 2 + S_P.im) = (-p.vr * p.ii) + p.vi * p.ir;
      P = p.vr * p.ir + p.vi * p.ii;
      Q = (-p.vr * p.ii) + p.vi * p.ir;
      annotation(Diagram(graphics), Icon(graphics = {Rectangle(extent = {{-60, 60}, {40, -40}}, lineColor = {0, 0, 255}), Rectangle(extent = {{-40, 40}, {20, -20}}, lineColor = {0, 0, 255}), Line(points = {{-40, 40}, {20, -20}}, color = {0, 0, 255}, smooth = Smooth.None), Line(points = {{-40, -20}, {20, 40}}, color = {0, 0, 255}, smooth = Smooth.None)}));
    end ConstantLoad;
  end Loads;

  package Controls
    package ExcitationSystem
      model EXAC1 "IEEE Type AC1 Excitation System"
        parameter Real VREF = 1;
        parameter Real TR = 0.0001 "Voltage input time const., s";
        parameter Real TB = 0.0001 "AVR lead-lag time const., s";
        parameter Real TC = 0.0001 "AVR lead-lag time const., s";
        parameter Real KA = 400 "AVR gain, p.u";
        parameter Real TA = 0.02 "AVR time const., s";
        parameter Real VRmax = 9 "Max. AVR output, p.u";
        parameter Real VRmin = -5.43 "Min. avr output, p.u";
        parameter Real TE = 0.8 "Exciter time const., s";
        parameter Real KF = 0.03 "Rate feedback gain, p.u";
        parameter Real TF = 1 "Rate feedback time const., s";
        parameter Real KC = 0.2 "Rectifier load factor, p.u";
        parameter Real KD = 0.48 "Exciter demagnetizing factor. p.u";
        parameter Real KE = 1 "Exciter field factor, p.u";
        parameter Real E1 = 5.25 "Exciter sat. point 1, p.u";
        parameter Real SE1 = 0.03 "Saturation at E1";
        parameter Real E2 = 7 "Exciter sat. point 2, p.u";
        parameter Real SE2 = 0.1 "Saturation at E2";
        parameter Real vf00 "Initial field voltage";
        parameter Real if00 "Initial field current";
        Modelica.Blocks.Math.Product efd_output annotation(Placement(visible = true, transformation(origin = {169.687, 59.8724}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        Modelica.Blocks.Math.Gain VKD(k = KD) annotation(Placement(visible = true, transformation(origin = {-121.708, -20.2561}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        Modelica.Blocks.Math.Add VFE annotation(Placement(visible = true, transformation(origin = {4.30078, -1.24982}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
        Modelica.Blocks.Math.Add err(k2 = -1) annotation(Placement(visible = true, transformation(origin = {-145.564, 51.8616}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        Modelica.Blocks.Sources.Constant VREFblock(k = VREF) annotation(Placement(visible = true, transformation(origin = {-185.61, 78.4041}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        Modelica.Blocks.Continuous.TransferFunction VALL(b = {TC, 1}, a = {TB, 1}) annotation(Placement(visible = true, transformation(origin = {-41.489, 59.545}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        Modelica.Blocks.Continuous.TransferFunction VC(a = {TR, 1}) annotation(Placement(visible = true, transformation(origin = {-185.144, 45.8081}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        Modelica.Blocks.Continuous.TransferFunction VR(b = {KA}, a = {TA, 1}) annotation(Placement(visible = true, transformation(origin = {-7.51925, 59.7545}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        Modelica.Blocks.Math.Feedback regin "Loop 1" annotation(Placement(visible = true, transformation(origin = {-78.5088, 59.545}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        Modelica.Blocks.Nonlinear.Limiter VR_limit(uMax = VRmax, uMin = VRmin) annotation(Placement(visible = true, transformation(origin = {23.9359, 59.7778}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        Modelica.Blocks.Math.Feedback VTE "Loop 2" annotation(Placement(visible = true, transformation(origin = {54.5186, 59.9769}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        Modelica.Blocks.Continuous.Derivative derivative1(k = KF, T = TF, x_start = if00 * KD + vf00) annotation(Placement(visible = true, transformation(origin = {-45.8535, 19.8601}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
        Modelica.Blocks.Continuous.LimIntegrator VE(k = 1 / TE, outMin = 0, y_start = vf00) annotation(Placement(visible = true, transformation(origin = {89.6626, 59.8724}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        Modelica.Blocks.Math.Add add2(k2 = +1) annotation(Placement(visible = true, transformation(origin = {-110.019, 59.8729}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        Modelica.Blocks.Math.Add add1 annotation(Placement(visible = true, transformation(origin = {30.142, -20.0938}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
        Modelica.Blocks.Math.Gain VExKE(k = KE) annotation(Placement(visible = true, transformation(origin = {82.3611, 7.88563}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
        SmarTSLab.Controls.ExcitationSystem.IN in1 annotation(Placement(visible = true, transformation(origin = {139.313, -4.67298}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
        SmarTSLab.Controls.ExcitationSystem.FEX fex1 annotation(Placement(visible = true, transformation(origin = {139.897, 29.7902}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
        SmarTSLab.NonElectrical.Logical.SaturationGain saturationgain1(E1 = E1, SE1 = SE1, E2 = E2, SE2 = SE2) annotation(Placement(visible = true, transformation(origin = {83.4869, -47.6454}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
        Modelica.Blocks.Interfaces.RealInput ecomp annotation(Placement(visible = true, transformation(origin = {-225.68, 46.0177}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-109.662, 39.5881}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        input Modelica.Blocks.Interfaces.RealInput xadifd annotation(Placement(visible = true, transformation(origin = {-175.799, -20.8995}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-109.862, 13.5047}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        output Modelica.Blocks.Interfaces.RealOutput EFD annotation(Placement(visible = true, transformation(origin = {209.699, 59.8724}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110.031, -6.85464}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        input Modelica.Blocks.Interfaces.RealInput vothsg annotation(Placement(visible = true, transformation(origin = {-146.035, 79.5741}, extent = {{-10.4715, -10.4715}, {10.4715, 10.4715}}, rotation = 360), iconTransformation(origin = {-109.461, -14.2525}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      equation
        connect(VFE.y, VTE.u2) annotation(Line(points = {{4.30078, 9.75018}, {4.30078, 19.7905}, {54.2491, 19.7905}, {54.2491, 50.9895}, {54.482, 50.9895}, {54.482, 50.9895}}));
        connect(VE.y, in1.VE) annotation(Line(points = {{100.663, 59.8724}, {122.468, 59.8724}, {122.468, -23.9814}, {137.602, -23.9814}, {137.602, -16.0652}, {137.602, -16.0652}}));
        connect(VE.y, saturationgain1.x) annotation(Line(points = {{100.663, 59.8724}, {114.319, 59.8724}, {114.319, -49.5925}, {94.7614, -49.5925}, {94.7614, -49.5925}}));
        connect(xadifd, in1.IFD) annotation(Line(points = {{-175.799, -20.8995}, {-169.965, -20.8995}, {-169.965, -67.7532}, {141.327, -67.7532}, {141.327, -16.0652}, {141.327, -16.0652}}));
        connect(saturationgain1.y, add1.u1) annotation(Line(points = {{85.5824, -49.4382}, {67.466, -49.4382}, {42.142, -26.3859}, {42.142, -26.0938}}));
        connect(VFE.y, derivative1.u) annotation(Line(points = {{4.30078, 9.75018}, {4.30078, 19.8002}, {-32.7545, 19.8002}, {-32.7545, 19.8002}}));
        connect(vothsg, add2.u1) annotation(Line(points = {{-146.035, 79.5741}, {-121.497, 79.5741}, {-122.019, 65.2888}, {-122.019, 65.8729}}));
        connect(efd_output.y, EFD) annotation(Line(points = {{180.687, 59.8724}, {200.938, 59.8724}, {200.938, 60.1645}, {200.938, 60.1645}}));
        connect(fex1.FEX, efd_output.u2) annotation(Line(points = {{139.92, 40.7797}, {139.92, 54.0312}, {157.421, 54.0312}, {157.421, 54.0312}}));
        connect(in1.IN, fex1.IN) annotation(Line(points = {{139.36, 6.33982}, {139.36, 18.9839}, {140.481, 18.9839}, {140.481, 18.9839}}));
        connect(VE.y, VExKE.u) annotation(Line(points = {{100.663, 59.8724}, {109.231, 59.8724}, {109.256, 7.88563}, {94.3611, 7.88563}}));
        connect(VExKE.y, add1.u2) annotation(Line(points = {{71.3611, 7.88563}, {42.0567, 7.88563}, {42.142, -14.3859}, {42.142, -14.0938}}));
        connect(add1.y, VFE.u2) annotation(Line(points = {{19.142, -20.0938}, {10.8062, -20.0938}, {10.8062, -13.2498}, {10.3008, -13.2498}}));
        connect(VKD.y, VFE.u1) annotation(Line(points = {{-110.708, -20.2561}, {-1.75236, -20.2561}, {-1.75236, -14.0189}, {-1.75236, -14.0189}}));
        connect(xadifd, VKD.u) annotation(Line(points = {{-175.799, -20.8995}, {-134.056, -20.8995}, {-134.056, -19.5681}, {-134.056, -19.5681}}));
        connect(VE.y, efd_output.u1) annotation(Line(points = {{100.663, 59.8724}, {156.252, 59.8724}, {156.252, 65.4216}, {156.252, 65.4216}}));
        connect(VTE.y, VE.u) annotation(Line(points = {{63.5186, 59.9769}, {77.396, 59.9769}, {77.396, 59.5803}, {77.396, 59.5803}}));
        connect(VR_limit.y, VTE.u1) annotation(Line(points = {{34.9359, 59.7778}, {45.8535, 59.7778}, {45.8535, 59.5803}, {45.8535, 59.5803}}));
        connect(VR.y, VR_limit.u) annotation(Line(points = {{3.48075, 59.7545}, {11.9745, 59.7545}, {11.9745, 59.8724}, {11.9745, 59.8724}}));
        connect(VALL.y, VR.u) annotation(Line(points = {{-30.489, 59.545}, {-20.1522, 59.545}, {-20.1522, 59.8724}, {-20.1522, 59.8724}}));
        connect(regin.y, VALL.u) annotation(Line(points = {{-69.5088, 59.545}, {-54.6153, 59.545}, {-54.6153, 59.5803}, {-54.6153, 59.5803}}));
        connect(derivative1.y, regin.u2) annotation(Line(points = {{-56.8535, 19.8601}, {-78.2722, 19.8601}, {-78.2722, 50.2344}, {-78.2722, 50.2344}}));
        connect(add2.y, regin.u1) annotation(Line(points = {{-99.0188, 59.8729}, {-86.742, 59.8729}, {-86.742, 59.5803}, {-86.742, 59.5803}}));
        connect(add2.y, regin.u1) annotation(Line(points = {{-99.0188, 59.8729}, {-87.3261, 59.8729}, {-87.3261, 59.545}, {-86.5088, 59.545}}));
        connect(err.y, add2.u2) annotation(Line(points = {{-134.564, 51.8616}, {-123.834, 51.8616}, {-122.019, 53.2888}, {-122.019, 53.8729}}));
        connect(VC.y, err.u2) annotation(Line(points = {{-174.144, 45.8081}, {-158.005, 45.8081}, {-158.005, 45.5614}, {-158.005, 45.5614}}));
        connect(VREFblock.y, err.u1) annotation(Line(points = {{-174.61, 78.4041}, {-158.297, 78.4041}, {-158.297, 58.12}, {-158.297, 58.12}}));
        connect(ecomp, VC.u) annotation(Line(points = {{-225.68, 46.0177}, {-197.141, 46.0177}, {-197.141, 46.1456}, {-197.141, 46.1456}}));
        annotation(Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2}), graphics = {Rectangle(origin = {0, 28.5113}, extent = {{-99.793, 20.7808}, {99.9934, -53.2457}}), Text(origin = {0, 10.0761}, extent = {{-80.0246, 49.7963}, {80.0246, -49.7963}}, textString = "EXAC1"), Text(origin = {-91.2631, -14.319}, extent = {{-7.45052, 2.21187}, {5.44651, -1.61067}}, textString = "xadifd"), Text(origin = {-92.0838, 14.1186}, extent = {{-4.3015, 1.04189}, {5.70431, -2.4447}}, textString = "ecomp"), Text(origin = {-91.8743, 40.1397}, extent = {{-5.10311, 1.2423}, {5.70431, -2.4447}}, textString = "vothsg")}));
      end EXAC1;

      block IN
        parameter Real KC;
        Modelica.Blocks.Interfaces.RealInput VE annotation(Placement(visible = true, transformation(origin = {-109.43, 39.8137}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-109.662, 19.5576}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        Modelica.Blocks.Interfaces.RealInput IFD annotation(Placement(visible = true, transformation(origin = {-109.662, -0.232864}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-109.895, -20.0233}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        Modelica.Blocks.Interfaces.RealOutput IN annotation(Placement(visible = true, transformation(origin = {110.128, -0.232783}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110.128, -0.465612}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      equation
        IN = KC * IFD / VE;
        annotation(Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2}), graphics = {Text(origin = {7.10128, -8.38184}, extent = {{-85.5646, 43.539}, {65.5413, -26.3097}}, textString = "IN= (KC*IFD)/VE"), Rectangle(origin = {0.116414, -0.232829}, extent = {{-99.7672, 40.0466}, {100, -39.8137}})}));
      end IN;

      block FEX "FEX=f(IN)"
        input Modelica.Blocks.Interfaces.RealInput IN annotation(Placement(visible = true, transformation(origin = {-109.662, -0.232829}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-109.895, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        output Modelica.Blocks.Interfaces.RealOutput FEX annotation(Placement(visible = true, transformation(origin = {110.128, -0.465658}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {109.895, -0.232829}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      equation
        if IN <= 0 then
          FEX = 1;
        elseif IN > 0 and IN <= 0.433 then
          FEX = 1 - 0.577 * IN;
        elseif IN > 0.433 and IN < 0.75 then
          FEX = sqrt(0.75 - IN ^ 2);
        elseif IN >= 0.75 and IN <= 1 then
          FEX = 1.732 * (1 - IN);
        else
          FEX = 0;
        end if;
        annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = false, initialScale = 0.1, grid = {2, 2}), graphics = {Rectangle(lineColor = {0, 0, 255}, extent = {{-99.688, 39.8207}, {99.9092, -39.9581}}), Text(lineColor = {0, 0, 255}, extent = {{-59.9814, 29.1641}, {59.7788, -30.4657}}, textString = "FEX=f(IN)")}));
      end FEX;
      annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})));
    end ExcitationSystem;
    annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})));
  end Controls;

  package Transformer
    model TwoWindingTransformer "Modeled as series reactances without iron losses"
      PowerSystems.Connectors.PwPin p annotation(Placement(transformation(extent = {{-120, -10}, {-100, 10}})));
      PowerSystems.Connectors.PwPin n annotation(Placement(transformation(extent = {{100, -10}, {120, 10}})));
      parameter Real SystemBase = 100;
      parameter Real Sn = 100 "Power rating MVA";
      parameter Real Vbus = 400000 "Sending end bus voltage";
      parameter Real Vn1 = 400000 "Voltage rating of primary winding KV";
      parameter Real fn = 50 "Frequency rating Hz";
      parameter Real kT = 1 "Nominal Tap ratio (V1/V2), kV/kV";
      parameter Real X = 0.001 "Transformer reactance, p.u.";
      parameter Real R = 0.1 "Transformer resistance, p.u.";
    protected
      parameter Real Vb2new = Vbus * Vbus;
      parameter Real Vb2old = Vn1 * Vn1;
      parameter Real xT = X * (Vb2old * SystemBase) / (Vb2new * Sn) "Reactance(inductive),p.u";
      parameter Real rT = R * (Vb2old * SystemBase) / (Vb2new * Sn) "Reactance(capacitive),p.u";
    equation
      rT * p.ir - xT * p.ii = p.vr - n.vr;
      rT * p.ii + xT * p.ir = p.vi - n.vi;
      rT * n.ir - xT * n.ii = n.vr - p.vr;
      xT * n.ir + rT * n.ii = n.vi - p.vi;
      annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics), Icon(graphics = {Ellipse(extent = {{-46, 30}, {8, -30}}, lineColor = {0, 0, 255}), Ellipse(extent = {{-10, 30}, {44, -30}}, lineColor = {0, 0, 255}), Line(points = {{100, 0}, {44, 0}, {44, 0}}, color = {0, 0, 255}, smooth = Smooth.None), Line(points = {{-100, 0}, {-46, 0}}, color = {0, 0, 255}, smooth = Smooth.None)}));
    end TwoWindingTransformer;

    model ThreeWindingTransformer
      PowerSystems.Connectors.PwPin b1 annotation(Placement(transformation(extent = {{-120, -10}, {-100, 10}})));
      PowerSystems.Connectors.PwPin b2 annotation(Placement(transformation(extent = {{100, 20}, {120, 40}})));
      PowerSystems.Connectors.PwPin b3 annotation(Placement(transformation(extent = {{100, -40}, {120, -20}})));
      parameter Real SystemBase = 100;
      parameter Real Sn = 100 "Power rating MVA";
      parameter Real Vbus = 400000 "Sending end bus voltage";
      parameter Real Vn1 = 400000 "Voltage rating of the first winding, V";
      parameter Real Vn2 = 100000 "Voltage rating of the second winding, V";
      parameter Real Vn3 = 40000 "Voltage rating of the third winding, V";
      parameter Real fn = 50 "Frequency rating Hz";
      parameter Real R12 = 0.01 "Resistance of the branch 1-2, p.u.";
      parameter Real R13 = 0.01 "Resistance of the branch 1-3, p.u.";
      parameter Real R23 = 0.01 "Resistance of the branch 2-3, p.u.";
      parameter Real X12 = 0.1 "Reactance of the branch 1-2, p.u.";
      parameter Real X13 = 0.1 "Reactance of the branch 1-3, p.u.";
      parameter Real X23 = 0.1 "Reactance of the branch 2-3, p.u.";
      parameter Real m = 0.98 "Fixed Tap ratio";
      Real v1;
      Real v2;
      Real v3;
      Real anglev1;
      Real anglev2;
      Real anglev3;
      SmarTSLab.Buses.BusNew bus1_1(SystemBase = SystemBase, Sn = Sn, Vbus = Vbus, Vn1 = Vn1, Vn2 = Vn2, Vn3 = Vn3, fn = fn, R12 = R12, R13 = R13, R23 = R23, X12 = X12, X13 = X13, X23 = X23, m = m) annotation(Placement(transformation(extent = {{-56, -10}, {-36, 10}})));
      SmarTSLab.Buses.BusNew bus2_1(SystemBase = SystemBase, Sn = Sn, Vbus = Vbus, Vn1 = Vn1, Vn2 = Vn2, Vn3 = Vn3, fn = fn, R12 = R12, R13 = R13, R23 = R23, X12 = X12, X13 = X13, X23 = X23, m = m) annotation(Placement(transformation(extent = {{20, 20}, {40, 40}})));
      SmarTSLab.Buses.BusNew bus3_1(SystemBase = SystemBase, Sn = Sn, Vbus = Vbus, Vn1 = Vn1, Vn2 = Vn2, Vn3 = Vn3, fn = fn, R12 = R12, R13 = R13, R23 = R23, X12 = X12, X13 = X13, X23 = X23, m = m) annotation(Placement(transformation(extent = {{20, -40}, {40, -20}})));
    equation
      v1 = sqrt(b1.vr ^ 2 + b1.vi ^ 2);
      v2 = sqrt(b2.vr ^ 2 + b2.vi ^ 2);
      v3 = sqrt(b3.vr ^ 2 + b3.vi ^ 2);
      anglev1 = atan2(b1.vi, b1.vr);
      anglev2 = atan2(b2.vi, b2.vr);
      anglev3 = atan2(b3.vi, b3.vr);
      connect(b1, bus1_1.p) annotation(Line(points = {{-110, 0}, {-84, 0}, {-84, 0.4}, {-57, 0.4}}, color = {0, 0, 255}, smooth = Smooth.None));
      connect(bus1_1.n, bus2_1.p) annotation(Line(points = {{-35, 0}, {0, 0}, {0, 30}, {19, 30}}, color = {0, 0, 255}, smooth = Smooth.None));
      connect(bus3_1.p, bus2_1.p) annotation(Line(points = {{19, -30}, {0, -30}, {0, 30}, {19, 30}}, color = {0, 0, 255}, smooth = Smooth.None));
      connect(bus2_1.n, b2) annotation(Line(points = {{41, 30}, {110, 30}}, color = {0, 0, 255}, smooth = Smooth.None));
      connect(bus3_1.n, b3) annotation(Line(points = {{41, -30}, {110, -30}}, color = {0, 0, 255}, smooth = Smooth.None));
      annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics), Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Ellipse(extent = {{-52, 34}, {12, -28}}, lineColor = {0, 0, 255}), Ellipse(extent = {{-4, 64}, {60, 2}}, lineColor = {0, 0, 255}), Ellipse(extent = {{-2, 16}, {62, -46}}, lineColor = {0, 0, 255}), Line(points = {{-54, -22}, {10, 42}, {10, 42}}, color = {0, 0, 255}, smooth = Smooth.None), Line(points = {{2, 40}, {10, 42}, {10, 42}}, color = {0, 0, 255}, smooth = Smooth.None), Line(points = {{8, 34}, {10, 42}}, color = {0, 0, 255}, smooth = Smooth.None), Line(points = {{60, 32}, {100, 32}, {100, 32}}, color = {0, 0, 255}, smooth = Smooth.None), Line(points = {{58, -28}, {102, -28}, {100, -28}}, color = {0, 0, 255}, smooth = Smooth.None), Line(points = {{-100, 0}, {-52, 0}}, color = {0, 0, 255}, smooth = Smooth.None), Text(extent = {{-54, -62}, {54, -78}}, lineColor = {0, 128, 0}, textString = "%TWT%")}));
    end ThreeWindingTransformer;
    annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})));
  end Transformer;
  annotation(uses(Modelica(version = "3.2"), Complex(version = "1.0")));
end SmarTSLab;