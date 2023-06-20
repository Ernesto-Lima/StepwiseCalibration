%''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
%Begin optifun.m
%This is essentially a driver file for the ODE solver as well as the
% minimization process for the difference between model output and the data
%''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
% function [out,p] = invitro_optifun(p,y0,tf,datapoints,dataweights,datatimes)
function [out,p] = optifunCIV(p,init,tf,which,params,datapoints,dataweights,datatimes,datasizes)

    clear t x
    [t,x] = ode45(@rhsparamsOCIV,[0 tf],init,[],p,which,params);
    
    %''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
    %Comparing ODE solution to data
    %Determing corresponding time points for each model output to compare  
    %back to the data. Using cubic interpolator "pchip"
    
    %Need to add checks for different tfs
    
    OutputPointsC = interp1(t,x(:,1),datatimes(1:datasizes(1)),'pchip');
    OutputPointsIC = interp1(t,x(:,2),datatimes(1:datasizes(1)),'pchip');
    OutputPointsI = interp1(t,x(:,2),datatimes(datasizes(1)+1:datasizes(1)+datasizes(2)),'pchip');    
    OutputPointsCI = interp1(t,x(:,1),datatimes(datasizes(1)+1:datasizes(1)+datasizes(2)),'pchip');    
%     OutputPointsCV = interp1(t,x(:,1),datatimes(datasizes(1)+1:datasizes(1)+datasizes(2)),'pchip');
%     OutputPointsIV = interp1(t,x(:,2),datatimes(datasizes(1)+1:datasizes(1)+datasizes(2)),'pchip');
%     OutputPointsV = interp1(t,x(:,3),datatimes(datasizes(1)+1:datasizes(1)+datasizes(2)),'pchip');
    OutputPointsCV = interp1(t,x(:,1),datatimes(datasizes(2)+1:datasizes(2)+datasizes(3)),'pchip');
    OutputPointsIV = interp1(t,x(:,2),datatimes(datasizes(2)+1:datasizes(2)+datasizes(3)),'pchip');
    OutputPointsV = interp1(t,x(:,3),datatimes(datasizes(2)+1:datasizes(2)+datasizes(3)),'pchip');
%     OutputPoints = [OutputPointsC+OutputPointsIC,1-OutputPointsV./(OutputPointsCV+OutputPointsIV)];
    OutputPoints = [OutputPointsC+OutputPointsIC,OutputPointsI./(OutputPointsI+OutputPointsCI),1-OutputPointsV./(OutputPointsCV+OutputPointsIV)];
    diff = abs(OutputPoints - datapoints);
    dataweights(dataweights==0) = 1;
    diff = diff./dataweights';    
    err = norm(diff);
    
%Sending out the norm of the error between the model and the data
out = err;

%''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
%End of file