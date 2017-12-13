%T_hot determined by Teagasc Milk Quality Handbook
T_hot=80;
T_cold=T_amb2;
T_w=T_hot-T_cold;
%Mass of Water as a function of cows 
M_w=cows*0.1*1*h;
e_wh=0.9;
%Capacity Taken as 3kW - http://www.milkingmachines.co.uk/uk2shop-74.htm
C_wh=3;
Q_wh=(C_wh.*T_w.*M_w)/(e_wh*3600);
Q_totalyearwh=sum(Q_wh);