%http://www.agriland.ie/farming-news/how-many-cows-can-one-person-milk-its-not-as-straightforward-as-you-may-think/
%https://www.aliexpress.com/store/product/For-Home-Use-Diary-Farm-Use-Stainless-Steel-4-Buckets-Vacuum-Pump-Portable-Milking-Machines-for/1922474_32465142342.html
cluster=40;
Ratio1=cows/cluster;
%Using SPS-MM03
t_row=TimeRatio; %Assumes that Milk is taken and cooled within the same hour.
t_row=repelem(t_row,1,365);
t_row=reshape(t_row,1,(365*(24/h)));
t_wash=ceil(MilkTime1);
%http://www.solpack.in/products/calalogue/cow%20milking%20machine.pdf
C_mm=2.2;
MilkingTime=((ceil(Ratio1).*t_row)+t_wash);
Q_mm=MilkingTime*C_mm;
Q_totalyearmm=sum(Q_mm);
%plot(ts1,Q_mm);