cows;
%http://www.agriland.ie/farming-news/how-many-cows-can-one-person-milk-its-not-as-straightforward-as-you-may-think/
cluster=20;
Ratio1=cows/cluster;
t_row=12/60; %From Link Above
%Washing machinery for 10 mins, every hour for 8 hours?
t_wash=[0;0;1;1;0;0];
t_wash=repelem(t_wash,1,365);
t_wash=reshape(t_wash,1,2190);
%http://www.solpack.in/products/calalogue/cow%20milking%20machine.pdf
C_mm=1.1;
Q_mm=(ceil(Ratio1)*t_row+t_wash)*C_mm;
Q_totalyearmm=sum(Q_mm);
