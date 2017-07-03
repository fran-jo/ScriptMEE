model cim_ieee_9bus "something here"
  OpenIPSL.Electrical.Branches.PwLine Ln46(
    R=0.017000000923871994,
    X=0.09200000017881393,
    G=0,
    B=0.07900000363588333) "something here" annotation ();
  OpenIPSL.Electrical.Buses.Bus BUS4 "something here" annotation ();
  OpenIPSL.Electrical.Buses.Bus BUS2 "something here" annotation ();
  OpenIPSL.Electrical.Buses.Bus BUS7 "something here" annotation ();
  OpenIPSL.Electrical.Buses.Bus BUS6 "something here" annotation ();
  OpenIPSL.Electrical.Loads.PSSE.Load Ld8(
    angle_0=-91.6318588256836,
    V_0=1.0116652250289917,
    P_0=100,
    Q_0=35) "something here" annotation ();
  OpenIPSL.Electrical.Buses.Bus BUS8 "something here" annotation ();
  OpenIPSL.Electrical.Branches.PwLine Ln57(
    R=0.03200000151991844,
    X=0.16099999845027924,
    G=0,
    B=0.15299999713897705) "something here" annotation ();
  OpenIPSL.Electrical.Buses.Bus BUS5 "something here" annotation ();
  OpenIPSL.Electrical.Loads.PSSE.Load Ld6(
    angle_0=-96.99684143066406,
    V_0=1.010051965713501,
    P_0=90,
    Q_0=30) "something here" annotation ();
  OpenIPSL.Electrical.Branches.PwLine Ln45(
    R=0.009999999776482582,
    X=0.08500000089406967,
    G=0,
    B=0.08799999952316284) "something here" annotation ();
  OpenIPSL.Electrical.Loads.PSSE.Load Ld5(
    angle_0=-97.19761657714844,
    V_0=0.993704617023468,
    P_0=125,
    Q_0=50) "something here" annotation ();
  OpenIPSL.Electrical.Branches.PwLine Ln89(
    R=0.011900000274181366,
    X=0.10080000013113022,
    G=0,
    B=0.10450000315904617) "something here" annotation ();
  OpenIPSL.Electrical.Buses.Bus BUS9 "something here" annotation ();
  OpenIPSL.Electrical.Branches.PSSE.TwoWindingTransformer T3(
    R=0,
    X=0.0625,
    G=0,
    B=0,
    ANG1=0.1,
    S_n=0,
    CW=1,
    CZ=1,
    t2=1,
    VB2=13.800000190734863,
    VNOM2=13.800000190734863,
    t1=1,
    VB1=230,
    VNOM1=230) "something here" annotation ();
  OpenIPSL.Electrical.Branches.PSSE.TwoWindingTransformer T1(
    R=0,
    X=0.05860000103712082,
    G=0,
    B=0,
    ANG1=0.1,
    S_n=0,
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
    ANG1=0.1,
    S_n=0,
    CW=1,
    CZ=1,
    t1=1,
    VB1=18,
    VNOM1=18,
    t2=1,
    VB2=230,
    VNOM2=230) "something here" annotation ();
  OpenIPSL.Electrical.Buses.Bus BUS3 "something here" annotation ();
  OpenIPSL.Electrical.Buses.Bus BUS1 "something here" annotation ();
  OpenIPSL.Electrical.Branches.PwLine Ln78(
    R=0.008500000461935997,
    X=0.07199999690055847,
    G=0,
    B=0.07450000196695328) "something here" annotation ();
  OpenIPSL.Electrical.Branches.PwLine Ln69(
    R=0.039000000804662704,
    X=0.17000000178813934,
    G=0,
    B=0.17900000512599945) "something here" annotation ();
  OpenIPSL.Electrical.Machines.PSSE.GENROU Gn2(
    S_b=100,
    M_b=320,
    V_b=18,
    V_0=1.030107021331787,
    angle_0=-82.5199966430664,
    P_0=177.21009826660156,
    Q_0=12.977800369262695,
    R_a=0,
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
  OpenIPSL.Electrical.Machines.PSSE.GENSAL Gn1(
    S_b=100,
    M_b=275,
    V_b=16.5,
    V_0=1.0381430387496948,
    angle_0=-94.33999633789062,
    P_0=52.78450012207031,
    Q_0=27.511499404907227,
    R_a=0,
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
  OpenIPSL.Electrical.Machines.PSSE.GENROU Gn3(
    S_b=100,
    M_b=300,
    V_b=13,
    V_0=1.0229270458221436,
    angle_0=-87.72000122070312,
    P_0=89.55909729003906,
    Q_0=-12.135199546813965,
    R_a=0,
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
  OpenIPSL.Electrical.Events.PwFault faultAtBus8(
    R=0.1,
    t1=2,
    t2=2.2,
    X=0.01) "manually implemented, for simulation of dynamic behaviour";
equation
  connect(Ln46.p, BUS4.p);
  connect(T2.n, BUS7.p);
  connect(T2.p, BUS2.p);
  connect(Ld8.p, BUS8.p);
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
  connect(Ln78.n, BUS8.p);
  connect(Ln46.n, BUS6.p);
  connect(Ln69.p, BUS6.p);
  connect(Ln69.n, BUS9.p);
  connect(Ln78.p, BUS7.p);
  connect(T3.p, BUS9.p);
  connect(Gn1.p, BUS1.p);
  connect(Gn2.p, BUS2.p);
  connect(Gn3.p, BUS3.p);
  connect(Gn2.PMECH0, Gn2.PMECH);
  connect(Gn2.EFD0, Gn2.EFD);
  connect(Gn1.PMECH0, Gn1.PMECH);
  connect(Gn1.EFD0, Gn1.EFD);
  connect(Gn3.PMECH0, Gn3.PMECH);
  connect(Gn3.EFD0, Gn3.EFD);
  //manually implemented, for simulation purposes
  connect(faultAtBus8.p, BUS8.p);
  annotation (uses(Modelica(version="3.2.1")));
end cim_ieee_9bus;
