%''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
%Begin optifun.m
%This is essentially a driver file for the ODE solver as well as the
% minimization process for the difference between model output and the data
%''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
% function [out,p] = invitro_optifun(p,y0,tf,datapoints,dataweights,datatimes)
function [out,p] = optifunG(p,init,tf,which,params,datapoints,dataweights,datatimes,datasizes)

    clear t x
    [t,x] = ode45(@rhsparamsO,[0 tf],init,[],p,which,params);
    
    %''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
    %Comparing ODE solution to data
    %Determing corresponding time points for each model output to compare  
    %back to the data. Using cubic interpolator "pchip"
    
    %Need to add checks for different tfs
    
    OutputPointsT = interp1(t,x(:,1),datatimes(1:datasizes(1)),'pchip');
    OutputPointsTV = interp1(t,x(:,1),datatimes(datasizes(1)+1:datasizes(1)+datasizes(2)),'pchip');
    OutputPointsI = interp1(t,x(:,2),datatimes(1:datasizes(1)),'pchip');
    OutputPointsIV = interp1(t,x(:,2),datatimes(datasizes(1)+1:datasizes(1)+datasizes(2)),'pchip');
    OutputPointsV = interp1(t,x(:,3),datatimes(datasizes(1)+1:datasizes(1)+datasizes(2)),'pchip');
%     OutputPoints = [OutputPointsT+OutputPointsI,1-OutputPointsV];
    OutputPoints = [OutputPointsT+OutputPointsI,1-OutputPointsV./(OutputPointsTV+OutputPointsIV)];
%     OutputPoints = [OutputPointsT+OutputPointsI,(1-OutputPointsV).*OutputPointsTV];
    diff = abs(OutputPoints - datapoints);
    diff = diff./dataweights';    
    err = norm(diff);
    
%Sending out the norm of the error between the model and the data
out = err;

%''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
%End of file