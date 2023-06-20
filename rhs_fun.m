%''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
%Begin rhs_fun.m
%This is essentially a driver file for the ODE solver as well as the
% minimization process for the difference between model output and the data
%''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

function [out,p] = rhs_fun(p)

    %Grabbing information from previous file
    load all
    %For some reason these two have to be redefined
    tf = 7;
    init = [Ci,Ii,Ni,Vi,Hi];

    g_C = params(1);       
    rHo = params(2);         
    aLpha = params(3);
    bEta = params(4);          
    dElta = params(5);       
    gAmma = params(6);                 
    eTa = params(7);       
    mU = params(8);             
    g_V = params(9);       
    pHi = params(10);         
    xI = params(11);           
    nU = params(12);           
    pSi = params(13); 
%     NEWPARAMETER = params(14);
  
    %Defining the control parameter for the minimization process specified 
    %by OptiCode.m file to be use in rhs1.m 
    free = k;       

    %Saving parameters to pass to other files
    %The saving of mat files makes things slower, but fmin functions have
    %issues with the passing of variables that I haven't resolved yet, so
    %if you figure it out, do, please, let me know (doing 1 calibration
    %doesn't matter much, but when doing 1000s... any speed up is useful).
    delete('parameters.mat')
    save parameters.mat

    %''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
    %Making call to ODE solver for solutions while passing in the control
    %parameter p
    clear x
    clear t
    [t,x] = ode45(@rhs1,[0 tf],init,p,free);

    %''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
    %Comparing ODE solution to data

    %Determing corresponding time points for each model output to compare  
    %back to the data. Using cubic interpolator "pchip"
    OutputPointsC = interp1(t,x(:,1),CExpTimes,'pchip');
    OutputPointsN = interp1(t,x(:,3),NExpTimes,'pchip');
    OutputPointsV = interp1(t,x(:,4),VExpTimes,'pchip');
    OutputPointsH = interp1(t,x(:,5),HExpTimes,'pchip');

    %Taking the difference between the model and experimental data
    diffC = OutputPointsC - Cave;
    diffC = diffC./Cconf;
    err(1) = norm(diffC);
    diffN = OutputPointsN - Nave;
    diffN = diffN./Nconf;
    err(2) = norm(diffN);
    diffV = OutputPointsV - Vave;
    diffV = diffV./Vconf;
    err(3) = norm(diffV);
    diffH = OutputPointsH - Have;
    diffH = diffH./Hconf;
    err(4) = norm(diffH);
    
%Sending out the norm of the error between the model and the data
%points as well as the slope at the final experimental time point.
out = err(1) + err(2) + err(3) + err(4);

%''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
%End of file