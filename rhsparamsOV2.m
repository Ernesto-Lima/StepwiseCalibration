%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~%Right Hand Sides of the ODE equations%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~function [F] = rhsparamsOV2(t,x,p,free,params)    T = x(1);    I = x(2);    V = x(3);    %Define parameters based on input    g_T = params(1);           u_T = params(2);             a_V = params(3);    g_I = params(4);              g_V = params(5);           a_I = params(6);                     u_V = params(7);         r   = params(8);    D   = params(9);    for w = 1:numel(free)        %Setting our "free" control variable from the minimization search        if(free(w)==1)          g_T = p(w);            elseif(free(w)==2)  u_T = p(w);            elseif(free(w)==3)  a_V = p(w);            elseif(free(w)==4)  g_I = p(w);            elseif(free(w)==5)  g_V = p(w);            elseif(free(w)==6)  a_I = p(w);            elseif(free(w)==7)  u_V = p(w);            elseif(free(w)==8) r   = p(w);            elseif(free(w)==9) D   = p(w);        end     end       if t<3        drug = D*exp(-r*t);    elseif t < 6        drug = D*exp(-r*(t-3));    else        drug = D*exp(-r*(t-6));    end        if T<0        T = 0;    end    if I<0        I = 0;    end    if V<0        V = 0;    end    %Build the RHS of the the ODEs    F = [g_T*T - (u_T+drug)*T*I;...         (g_I+drug)*I*(T - I) + a_V*V*(T - I) - a_I*I*T;...%          (g_I+drug)*I*(T - I) + a_V*V*(T - I);...         g_V*(T + I - V) - u_V*T*V;];end%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~