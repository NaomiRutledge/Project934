%MILK COOLING CALCULATION
    %Taken as an equation used to match to: https://strath-my.sharepoint.com/personal/npb13178_uni_strath_ac_uk/_layouts/15/onedrive.aspx?id=%2Fpersonal%2Fnpb13178_uni_strath_ac_uk%2FDocuments%2FOptimisation%2F2%20-%20Operational%20Conditions%2FDemand%20Data%2Fcow%20feature%201%2EJPG&parent=%2Fpersonal%2Fnpb13178_uni_strath_ac_uk%2FDocuments%2FOptimisation%2F2%20-%20Operational%20Conditions%2FDemand%20Data
    ro_milk=1.033;
    days=365;
    cows=45;
    x=[1:1:days];
    DailyMilk=(cows*7800*ro_milk)/(days*0.688818719)*(-2*(10^-10).*x.^4+2*(10^-07).*x.^3-8*(10^-05).*x.^2+0.0116.*x+0.4352);
    %Ratio of milk produced every hour to max milk production. Should be +-
    %a certain amount. Based on https://strath-my.sharepoint.com/:x:/r/personal/npb13178_uni_strath_ac_uk/_layouts/15/WopiFrame.aspx?sourcedoc=%7BAFD5B4F7-09BD-44AE-8019-6E9053BE82F9%7D&file=Milk%20Produced%20Per%20Cow,%20States%20and%20United%20States%20(1).csv&action=default
    if h==1
        MilkRatio=[0;0;0;0;0;0.1;0.1;0.2;0.2;0.2;0.1;0.05;0.05;0;0;0;0;0;0;0;0;0;0;0];
    elseif h==2
            MilkRatio=[0;0;0.1;0.3;0.4;0.15;0.05;0;0;0;0;0];
    elseif h==3
                MilkRatio=[0;0.1;0.5;0.35;0.05;0;0;0]; 
    elseif h==4
                        MilkRatio=[0;0.5;0.45;0.05;0;0];
    elseif h==6
                            MilkRatio=[0.1;0.85;0.05;0];
    elseif h==8
                                MilkRatio=[0.5;0.5;0];
    elseif h==12
                                    MilkRatio=[0.95;0.05];
    elseif h==24
                                        MilkRatio=1;
    end
    HourlyMilkProduction=MilkRatio*DailyMilk;
    HourlyMilk=reshape(HourlyMilkProduction,1,(365*24/h));
    TotalYearlyMilk=sum(DailyMilk);
    %Final Equation
    a=0.1;
    T_amb_evap=(T_amb2+273)-T_evap;
    COP=(a*T_evap)./T_amb_evap;
    C_mc=3.93;
    Q_mc=(C_mc*dT.*HourlyMilk)./(COP*3600);
    Q_totalyearmc=sum(Q_mc);
    %Capacity of the MilkCoolers
    %http://www.fao.org/3/a-i5791e.pdf - chosen the least efficient one
    C_mc=2;
    MilkTime1=Q_mc/C_mc;