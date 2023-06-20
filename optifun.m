%''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
%Begin optifun.m
%This is essentially a driver file for the ODE solver as well as the
% minimization process for the difference between model output and the data
%''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
% function [out,p] = invitro_optifun(p,y0,tf,datapoints,dataweights,datatimes)
function [out,p] = optifun(p,init,tf,which,params,datapoints,dataweights,datatimes,datasizes)

    clear t x
    [t,x] = ode45(@rhsparamsO,[0 tf],init,[],p,which,params);
    
    %''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
    %Comparing ODE solution to data
    %Determing corresponding time points for each model output to compare  
    %back to the data. Using cubic interpolator "pchip"
    
    %Need to add checks for different tfs
    
    OutputPointsT = interp1(t,x(:,1),datatimes(1:datasizes(1)),'pchip');
    OutputPointsIT = interp1(t,x(:,2),datatimes(1:datasizes(1)),'pchip');
    OutputPointsI = interp1(t,x(:,2),datatimes(datasizes(1)+datasizes(2)+1:end),'pchip');
    OutputPointsV = interp1(t,x(:,3),datatimes(datasizes(1)+1:datasizes(1)+datasizes(2)),'pchip');
    OutputPointsTI = interp1(t,x(:,1),datatimes(datasizes(1)+datasizes(2)+1:end),'pchip');
    OutputPointsTH = interp1(t,x(:,1),datatimes(datasizes(1)+1:datasizes(1)+datasizes(2)),'pchip');
%     OutputPoints = [OutputPointsT,OutputPointsI,1-OutputPointsV];
%     OutputPoints = [OutputPointsT,OutputPointsI,OutputPointsTH-OutputPointsV];
%     OutputPoints = [OutputPointsT,OutputPointsI./OutputPointsTI,(OutputPointsTH-OutputPointsV)./OutputPointsTH];
%     OutputPoints = [OutputPointsT,OutputPointsI,OutputPointsV];
    OutputPoints = [OutputPointsT+OutputPointsIT,OutputPointsI./(OutputPointsTI+OutputPointsI),1-OutputPointsV];
    diff = OutputPoints - datapoints;
    diff = diff./dataweights';

%     diff = OutputPoints([1:datasizes(1),datasizes(1)+datasizes(2)+1:end]) - datapoints([1:datasizes(1),datasizes(1)+datasizes(2)+1:end]);
%     diff = diff./dataweights([1:datasizes(1),datasizes(1)+datasizes(2)+1:end])';
    
    err = norm(diff);
    
%Sending out the norm of the error between the model and the data
out = err;

%''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
%End of file