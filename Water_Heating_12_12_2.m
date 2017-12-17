%T_hot determined by Teagasc Milk Quality Handbook
T_hot=80+273;
T_cold=T_amb2
T_w=T_hot-T_cold
plot(ts1,T_cold)
%Mass of Water as a function of cows  & MilkingTime, given 0.5l for each
%https://dairy.ahdb.org.uk/technical-information/animal-health-welfare/mastitis/working-arena-prevention-of-infection/milking-parlour/cleaning-routine/#.WjFfIFVl-M8
%car per time unit. 
%170l average water heater 
M_w=cows*MilkTime1*(170);
e_wh=0.9;
%Capacity Taken as 3kW - http://www.milkingmachines.co.uk/uk2shop-74.htm
C_wh=3;
Q_wh=(C_wh.*T_w.*M_w)/(e_wh*3600);
Q_totalyearwh=sum(Q_wh);