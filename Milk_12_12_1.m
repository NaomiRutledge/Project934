%Milk Cooling Calculation 1
x=1:1:365;
x1=1:1:8760;
DailyMilk=(5000*1.033)/(365*0.688818719)*(-2*(10^-10).*x.^4+2*(10^-07).*x.^3-8*(10^-05).*x.^2+0.0116.*x+0.4352);
%Taken as an equation used to match to:
%https://strath-my.sharepoint.com/personal/npb13178_uni_strath_ac_uk/_layouts/15/onedrive.aspx?id=%2Fpersonal%2Fnpb13178_uni_strath_ac_uk%2FDocuments%2FOptimisation%2F2%20-%20Operational%20Conditions%2FDemand%20Data%2Fcow%20feature%201%2EJPG&parent=%2Fpersonal%2Fnpb13178_uni_strath_ac_uk%2FDocuments%2FOptimisation%2F2%20-%20Operational%20Conditions%2FDemand%20Data
plot(DailyMilk);
MilkRatio=[0;0;0;0;0;0.1;0.2;0.4;0.6;0.7;0.8;0.9;0.95;1;1;1;1;1;1;0;0;0;0;0];
HourlyMilk1=MilkRatio*DailyMilk;
HM=reshape(HourlyMilk1,1,8760);
X=sum(DailyMilk)
plot(x1,HM)
xlim([0,10000])