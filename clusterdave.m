%cluster_example for dave
clear all; close all; clc;
%load dave_test.mat
%%
% dyn = data.DCE.im;
% imagesc(dyn(:,:,10,end));
% mask  = roipoly();
% 
% j = 0;
% for y  = 1:128
%     for x = 1:128
%         if mask(y,x) == 1;
%             j = j+1;
%             s_list(j,:) = squeeze(dyn(y,x,10,:));
%         end
%     end
% end
% save('dave_test','s_list');
           
%% 
clear all;% close all; clc;
load dave_test
for j = 1:size(s_list,1)
    % normalize list of timecourse to baseline signal
    s_list(j,:) = s_list(j,:)/mean(s_list(j,1:5));  
    
    % remove voxels that don't enhance
    if max(s_list(j,:))< 1.2  
        s_list(j,:) = 0;
    end
end


figure
subplot(2,4,1) 
plot(s_list')
xlabel('time')
ylabel('signal');

% just do kmeans cluster
[idx ~] = kmeans(s_list,3);  % 3 = # of clusters
% idx provides the identifier that tells us if a voxel is in cluster 1, 2,
% or 3 

% Below: Plot the three clusters.
subplot(2,4,2)
plot(s_list(idx==1,:)')
subplot(2,4,3)
plot(s_list(idx==2,:)')
subplot(2,4,4)
plot(s_list(idx==3,:)')

         
            