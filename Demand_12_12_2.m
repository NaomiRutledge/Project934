%Data Sets
    %HourPeriod
    h=4;
    t1=datetime(2010,1,1,0,0,0);
    t2=datetime(2010,12,31,23,0,0);
    jan=datetime(2010,1,1,0,0,0);
    feb=datetime(2010,2,1,0,0,0);
    mar=datetime(2010,3,1,0,0,0);
    apr=datetime(2010,4,1,0,0,0);
    may=datetime(2010,5,1,0,0,0);
    jun=datetime(2010,6,1,0,0,0);
    jul=datetime(2010,7,1,0,0,0);
    aug=datetime(2010,8,1,0,0,0);
    sep=datetime(2010,9,1,0,0,0);
    oct=datetime(2010,10,1,0,0,0);
    nov=datetime(2010,11,1,0,0,0);
    dec=datetime(2010,12,1,0,0,0);
    ts1=(t1:hours(h):t2);
    %ts2=(t1:calmonths(1):t2);
    T_bulk=18;
    %http://lacpatrick.com/milk-cooling-and-storage/
    %Below is average monthly temperatures, and should be updated.
    T_final=3;
    dT=T_bulk-T_final;
    T_evap=268;
    T_ambmin=[3.8 3.2 4 5.05 6.8 9.5 11 11 10 8 5.5 4];
    T_ambmax=[7.6 7.5 8.2 10.5 12.8 14.9 16 16 15 12.5 10 8];
    T_amb=(T_ambmax+T_ambmin)/2;
    T_amb2=repelem(T_amb, [(length(jan:1:feb)-1)*24/h (length(feb:1:mar)-1)*24/h (length(mar:1:apr)-1)*24/h (length(apr:1:may)-1)*24/h (length(may:1:jun)-1)*24/h (length(jun:1:jul)-1)*24/h (length(jul:1:aug)-1)*24/h (length(aug:1:sep)-1)*24/h (length(sep:1:oct)-1)*24/h (length(oct:1:nov)-1)*24/h (length(nov:1:dec)-1)*24/h length(dec:1:t2)*24/h]);
    
run Milk_12_12_2
Q_totalyearmc;

run Water_Heating_12_12_2
Q_totalyearwh;

run Milking_Machine_12_12_1
Q_totalyearmm;

%run Lighting_13_12_1

Q_all=[Q_totalyearmc Q_totalyearwh Q_totalyearmm];
Q_total=sum(Q_all);