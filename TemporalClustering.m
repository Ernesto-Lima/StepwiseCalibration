
clear all; close all; clc;
load IndividualMouseTumorVolumes.mat

%experimental times are days:   0,2,3,5,7,12,17,20
%corresponding to the elements: 1,2,3,4,5, 6, 7, 8
%all mice have data for days:   0,2,3,  7,12

stopper = 6;
flag = 1;
if stopper <= 3
s_list1 = [RC1(2,1:stopper);
          RC2(2,1:stopper);
          RT1(2,1:stopper);
          RT2(2,1:stopper);
          RT3(2,1:stopper);
          RT4(2,1:stopper);
          NC1(2,1:stopper);
          NC2(2,1:stopper);
          NC3(2,1:stopper);
          NT1(2,1:stopper);
          NT2(2,1:stopper);
          NT3(2,1:stopper);
          NT4(2,1:stopper);];
else   
s_list1 = [RC1(2,1:stopper-1);
          RC2(2,1:stopper-1);
          RT1(2,1:stopper-1);
          RT2(2,1:stopper-1);
          RT3(2,1:stopper-1);
          RT4(2,1:stopper-1);
          NC1(2,1:stopper-1);
          NC2(2,[1:3,5:stopper]);
          NC3(2,[1:3,5:stopper]);
          NT1(2,1:stopper-1);
          NT2(2,1:stopper-1);
          NT3(2,[1:3,5:stopper]);
          NT4(2,[1:3,5:stopper]);];
end

if flag == 1
if size(s_list1,2) > 1
    for j = 1:size(s_list1,1)
        % normalize list of timecourse to baseline signal
        s_list2(j,:) = s_list1(j,:)/s_list1(j,1);  
    end
end
else
    s_list2 = s_list1;
end


figure
subplot(2,2,1) 
plot(s_list1')
xlabel('Time')
ylabel('Volume (mm^3)');

% just do kmeans cluster
[idx ~] = kmeans(s_list2,2);  % 2 = # of clusters
% idx provides the identifier that tells us if a set is in cluster 1, 2,
idx
% Below: Plot the two clusters.
subplot(2,2,2)
plot(s_list1(idx==1,:)')
subplot(2,2,3.5)
plot(s_list1(idx==2,:)')


         
            