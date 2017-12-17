%Temperature
    T_bulk=18+273;
    %http://lacpatrick.com/milk-cooling-and-storage/
    T_final=3+273;
    dT=T_bulk-T_final;
    T_evap=268;
    T_ambmin=[3.8 3.2 4 5.05 6.8 9.5 11 11 10 8 5.5 4]+273;
    T_ambmax=[7.6 7.5 8.2 10.5 12.8 14.9 16 16 15 12.5 10 8]+273;
    T_amb=(T_ambmax+T_ambmin)/2;
    T_amb2=repelem(T_amb,[(length(jan:1:feb)-1)*24/h (length(feb:1:mar)-1)*24/h (length(mar:1:apr)-1)*24/h (length(apr:1:may)-1)*24/h (length(may:1:jun)-1)*24/h (length(jun:1:jul)-1)*24/h (length(jul:1:aug)-1)*24/h (length(aug:1:sep)-1)*24/h (length(sep:1:oct)-1)*24/h (length(oct:1:nov)-1)*24/h (length(nov:1:dec)-1)*24/h length(dec:1:t2)*24/h]);