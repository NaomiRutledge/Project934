%Data Sets
h=4;
run Dates
run Temperature

%Individual Files
run Milk_12_12_2; Q_totalyearmc;
run Water_Heating_12_12_2; Q_totalyearwh;
run Milking_Machine_12_12_1; Q_totalyearmm;
run Lighting_13_12_1; Q_totalyearl;

Q_all_matrix=[Q_totalyearmc Q_totalyearwh Q_totalyearmm Q_totalyearl];
Q_total=sum(Q_all_matrix);
Q_all=Q_mc+Q_wh+Q_mm+Q_l;
%plot(ts1,Q_all)