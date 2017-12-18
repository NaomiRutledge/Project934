%lm=milking facility lights
    %https://www.tlc-direct.co.uk/Products/MDSURF235HF.html?source=adwords&ad_position=1o10&ad_id=45425533757&placement=&kw=&network=g&matchtype=&ad_type=pla&product_id=MDSURF235HF&product_partition_id=174055673827&test=finalurl_v2&gclid=CjwKCAiA693RBRAwEiwALCc3u6BZQRYqGC8KuOSLuZ7hlF5XGGE8uqZ3w_Y4o3dW34OE_yRGIvcX2BoCaUUQAvD_BwE
    N_lm=4;  
    Q_lm=0.035;
    t_lm=MilkingTime;
%lhf=housing facility (for cows)(during winter months)
    %https://www.lightingever.co.uk/led-low-bay-light-dw.html?gclid=Cj0KCQiAyNjRBRCpARIsAPDBnn3zldA6o8Tvh47DRj6b9f56Gf-W8zIOLewpvlK4eh6AvE_Hdcne0VsaAoalEALw_wcB
    N_lhf=4;
    Q_lhf=0.055;
    %Time was an input to the system. Must synthesise with guess.
    t_lhf_daily=TimeRatio; %Lights are either on or off.
    t_lhf_year=[ones(1,30),zeros(1,275),ones(1,60)]; %Only occurs in winter
    t_lhf=reshape((t_lhf_year.*t_lhf_daily),1,2190);
%lod=outside area lights
%https://www.lightingever.co.uk/20w-super-bright-led-flood-lights-dw.html?gclid=Cj0KCQiAyNjRBRCpARIsAPDBnn0M75FP-HRpI-wgDy0rDAnfE0ZYi3dmMJ3wcOg2cbCiLAk1Fuj85aUaAs6rEALw_wcB
    N_lod=4;
    Q_lod=0.02;
    
    if h==1
        Timelod=[0;0;0;0;0;1;1;1;1;0;0;0;0;0;0;1;1;1;1;0;0;0;0;0];
    elseif h==2
        Timelod=[0;0;1;2;1;0;0;1;2;1;0;0];
    elseif h==3
        Timelod=[0;1;3;0;0;3;1;0];
    elseif h==4
        Timelod=[0;3;1;1;3;0];
    elseif h==6
        Timelod=[1;3;3;1];
    elseif h==12
        Timelod=[4;4];
    elseif h==24
        Timelod=[8];
    end 
    
    t_lod_daily=Timelod;
    t_lod=reshape((t_lhf_year.*t_lod_daily),1,2190);
    %during oct to feb
%Final Lighting Demand
Q_l=N_lm*Q_lm.*t_lm+N_lhf*Q_lhf.*t_lhf+N_lod*Q_lod.*t_lod;
Q_totalyearl=sum(Q_l)