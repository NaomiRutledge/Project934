%Calculation split into two parts. One water is heated to 80 deg, it would
%not need reheated from T_amb. Instead, it is heated from 70 deg to
%replicate the need for constantly heated water.
    %T_hot determined by Teagasc Milk Quality Handbook
    %Mass of Water taken from capacity 
    %170l average water heater 
    %Capacity Taken as 3kW - http://www.milkingmachines.co.uk/uk2shop-74.htm

    %Extra Info
    %https://dairy.ahdb.org.uk/technical-information/animal-health-welfare/mastitis/working-arena-prevention-of-infection/milking-parlour/cleaning-routine/#.WjFfIFVl-M8
    %car per time unit.

T_hot=80+273;
M_w=(170);
e_wh=0.9;
C_wh=3;

%It takes half as much time to heat the water as to wash the cows. 

%Also assumes that since 80-80=0, 

for T_cold1=T_amb2
    T_w1=T_hot-T_cold1;
    %Takes 40 mins for water to heat fully. Only needs to be heated to max
    %at the beginning of the day.
        if h==1
        TimeRatio_wh=[0;0;0;0;0;0.6666;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0];
    elseif h==2
            TimeRatio_wh=[0;0;0.3333;0;0;0;0;0;0;0;0;0];
    elseif h==3
                TimeRatio_wh=[0;0.2222;0;0;0;0;0;0]; 
    elseif h==4
                        TimeRatio_wh=[0;0.1667;0;0;0;0];
    elseif h==6
                            TimeRatio_wh=[0.1111;0;0;0];
    elseif h==8
                                TimeRatio_wh=[0.0833;0;0];
    elseif h==12
                                    TimeRatio_wh=[0.0555;0];
    elseif h==24
                                        TimeRatio_wh=0.02777;
        end
    t_wh1=repmat(TimeRatio_wh,365,1);
    t_wh1=reshape(t_wh1,1,(365*24/h));
    Q_wh1=[(C_wh.*T_w1.*M_w)/(e_wh*3600)].*t_wh1;
    Q_totalyearwh1=sum(Q_wh1);
end 
for T_cold2=T_hot-20;
    %Since minimum temp is 60. Taken from same area as T_hot temp. 
    T_w2=T_hot-T_cold2;
    Q_wh2=(C_wh.*T_w2*M_w)/(e_wh*3600).*MilkTime1;
    Q_totalyearwh2=sum(Q_wh2);
end 
Q_wh=Q_wh1+Q_wh2;
Q_totalyearwh=Q_totalyearwh1+Q_totalyearwh2