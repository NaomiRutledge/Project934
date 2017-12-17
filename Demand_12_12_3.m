%Data Sets
    %HourPeriod
    h=4; %hour period
    i=[0:hours(1):24]; %hours
    j=datetime(2010,1,1):calmonths(1):datetime(2010,12,1);
    T_bulk=18+273;
    %http://lacpatrick.com/milk-cooling-and-storage/
    %Below is average monthly temperatures, and should be updated.
    T_final=3+273;
    dT=T_bulk-T_final;
    T_ambmin=[3.8 3.2 4 5.05 6.8 9.5 11 11 10 8 5.5 4]+273;
    T_ambmax=[7.6 7.5 8.2 10.5 12.8 14.9 16 16 15 12.5 10 8]+273;
    T_amb=(T_ambmax+T_ambmin)/2;

% run Milk_12_12_2
% Q_totalyearmc;
% 
% run Water_Heating_12_12_2
% Q_totalyearwh;
% 
% run Milking_Machine_12_12_1
% Q_totalyearmm;
% 
% %run Lighting_13_12_1
% 
% Q_all_matrix=[Q_totalyearmc Q_totalyearwh Q_totalyearmm];
% Q_total=sum(Q_all_matrix);
% Q_all=Q_mc+Q_wh+Q_mm;
%plot(ts1,Q_all)