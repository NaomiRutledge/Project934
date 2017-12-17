%lm=milking facility lights
    N_lm=16;  
    Q_lm=0.055;
    t_lm=ceil(MilkingTime);
%lhf=housing facility (for cows)(during winter months)
    %https://www.lightingever.co.uk/led-low-bay-light-dw.html?gclid=Cj0KCQiAyNjRBRCpARIsAPDBnn3zldA6o8Tvh47DRj6b9f56Gf-W8zIOLewpvlK4eh6AvE_Hdcne0VsaAoalEALw_wcB
    N_lhf=16;
    Q_lhf=0.055;
    %Time was an input to the system. Must synthesise with guess.
    t_lhf_daily=ceil(TimeRatio); %Lights are either on or off.
    t_lhf_year=[ones(1,50),zeros(1,255),ones(1,60)]; %Only occurs in winter
    t_lhf=reshape((t_lhf_year.*t_lhf_daily),1,2190);
%lod=outside area lights
%https://www.lightingever.co.uk/20w-super-bright-led-flood-lights-dw.html?gclid=Cj0KCQiAyNjRBRCpARIsAPDBnn0M75FP-HRpI-wgDy0rDAnfE0ZYi3dmMJ3wcOg2cbCiLAk1Fuj85aUaAs6rEALw_wcB
    N_lod=20;
    Q_lod=0.02;
    t_lod_daily=1-ceil(TimeRatio);
    t_lod=reshape((t_lhf_year.*t_lod_daily),1,2190);
    %during oct to feb
%Final Lighting Demand
Q_l=N_lm*Q_lm.*t_lm+N_lhf*Q_lhf.*t_lhf+N_lod*Q_lod.*t_lod;
Q_totalyearl=sum(Q_l);