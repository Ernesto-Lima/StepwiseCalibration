close all
init = init(1,:);
% params = {'g_T','u_T','a_V','g_I','g_V','a_I','u_V','K_T','K_I','r'};
params = [0.29,   2.32,   0.12,   0.05,   0.14,   0.06, 4.84, 1,1,0.1,0];
lower  = [0.2     2.32    0.12    0.05    0.14    0.06   0      0    0    0.07 0];
upper  = [0.3     5       5        5       5       5     5      1    1    0.14 0];


which    = [0, 1, 1, 1, 1, 1, 0, 0, 0, 0];
free = find(which == 1);

multiguesssize = 10000;

RandNums = zeros(multiguesssize,numel(params));
for nn = 1:multiguesssize
%   RandNums(nn,:) = upper.*rand(1,size(params,2));
%   r = a + (b-a).*rand(100,1);
    RandNums(nn,:) = lower+(upper-lower).*rand(1,numel(params));
end

errors = zeros(multiguesssize,1);
figure
hold
errorbar(Tuexptimes, Tudatamed, Tudatamed-Tudatalow', Tudataupp'-Tudatamed, 'ko','MarkerFaceColor','k','LineWidth',2)
for jj = 1:multiguesssize
    calibratedparams = params;
    calibratedparams(free) = RandNums(jj,free);
   [t,x] = ode45(@rhsparams,[0 tf],init,[],calibratedparams);    
   OutputPointsT = interp1(t,x(:,1),Tuexptimes,'pchip');
   OutputPointsI = interp1(t,x(:,2),Tuexptimes,'pchip');
    errors(jj) =  abs(sum((Tudatamed - (OutputPointsT+OutputPointsI))./(Tudataupp'-Tudatalow')));
end

min(errors)
a = find(errors<0.001)
for bb = 1:numel(a)
calibratedparams = params;
calibratedparams(free) = RandNums(a(bb),free);
[t,x] = ode45(@rhsparams,[0 tf],init,[],calibratedparams); 
plot(t,x(:,1)+x(:,2)); 
end

%%
                   
                   
   1.886029771132733
   0.289025517637359
   0.103208447545220
   0.092090941632724
   0.963763333721755
   
   1.231789457802695
   0.482383274038372
   0.337607918495146
   0.130627727009598
   0.916052034962231
   
   1.387186395952423
   0.322025084376922
   0.240385523511882
   0.173212100496990
   0.533750772580015
   
   1.570944115166154
   0.226449920158621
   0.252997829088212
   0.150881691709391
   0.746131734981950
   
   1.241586963832453
   0.722377851928748
   0.342415742424463
   0.090278391573722
   0.478107711612329
   
   2.115094477197737
   0.302959035169765
   0.065957796553884
   0.121002126429533
   0.389111899447560
   
   1.258355215948032
   0.160264510072077
   0.161121132077989
   0.833901862814883
   0.862457400509389
   
   1.249657406042648
   0.238918472841489
   0.291931731677077
   0.696491781337733
   0.607140500025450
   
   %%
close all
init = init(1,:);
% params = {'g_T','u_T','a_V','g_I','g_V','a_I','u_V','K_T','K_I','r'};
params = [0.29,   2.32,   0.12,   0.05,   0.14,   0.06, 4.84, 1,1,0.1,0];
lower  = [0.2     2.32    0.12    0.05    0.14    0.06   0      0    0    0.07 0];
upper  = [0.3     5       5        5       5       5     5      1    1    0.14 0];


which    = [1, 1, 1, 1, 1, 1, 0, 0, 0, 0];
free = find(which == 1);

multiguesssize = 10000;

RandNums = zeros(multiguesssize,numel(params));
for nn = 1:multiguesssize
%   RandNums(nn,:) = upper.*rand(1,size(params,2));
%   r = a + (b-a).*rand(100,1);
    RandNums(nn,:) = lower+(upper-lower).*rand(1,numel(params));
end


figure
hold
errorbar(Tuexptimes, Tudatamed, Tudatamed-Tudatalow', Tudataupp'-Tudatamed, 'ko','MarkerFaceColor','k','LineWidth',2)
for jj = 1:multiguesssize
    calibratedparams = params;
    calibratedparams(free) = RandNums(jj,free);
   [t,x] = ode45(@rhsparams,[0 tf],init,[],calibratedparams);    
   if x(end,1)+x(end,2) > 0.50 && x(end,1)+x(end,2) < 0.60
       jj
    plot(t,x(:,1)+x(:,2)); 
   end
end