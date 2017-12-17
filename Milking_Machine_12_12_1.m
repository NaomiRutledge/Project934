cows;
%http://www.agriland.ie/farming-news/how-many-cows-can-one-person-milk-its-not-as-straightforward-as-you-may-think/
cluster=20;
Ratio1=cows/cluster;
t_row=TimeRatio*12/60; %Assumes that Milk requires cooled ASAP after milking.
t_row=repelem(t_row,1,365);
t_row=reshape(t_row,1,(365*(24/h)));

%Washing machinery for 10 mins, every hour for 8 hours?
t_wash=MilkTime1;
%http://www.solpack.in/products/calalogue/cow%20milking%20machine.pdf
C_mm=1.1;
Q_mm=((ceil(Ratio1).*t_row)+t_wash)*C_mm;
Q_totalyearmm=sum(Q_mm);
