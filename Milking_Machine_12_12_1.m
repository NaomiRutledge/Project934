cows;
%http://www.agriland.ie/farming-news/how-many-cows-can-one-person-milk-its-not-as-straightforward-as-you-may-think/
%https://www.aliexpress.com/store/product/For-Home-Use-Diary-Farm-Use-Stainless-Steel-4-Buckets-Vacuum-Pump-Portable-Milking-Machines-for/1922474_32465142342.html
cluster=40;
Ratio1=cows/cluster;
%Using SPS-MM03
t_row=(12/60)/h; %Assumes that Milk is taken and cooled within the same hour.
%t_row=repelem(t_row,1,365);
%t_row=reshape(t_row,1,(365*(24/h)));
%Washing machinery for 10 mins, every hour for 8 hours?
t_wash=MilkTime1;
%http://www.solpack.in/products/calalogue/cow%20milking%20machine.pdf
C_mm=2.2;
Q_mm=((ceil(Ratio1).*t_row)+t_wash)*C_mm;
Q_totalyearmm=sum(Q_mm)
