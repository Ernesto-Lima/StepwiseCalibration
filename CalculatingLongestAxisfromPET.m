codepath = pwd;
filefolder = '/Users/Angela/Box/Immune/MC38 in C57BL:6/MC38 immunotherapy longitudinal study ROI DICOMS/Tumor ROIs/';
cd(filefolder)
DirectoryListing = dir; 
DirectoryListing([1:2,end]) = [];
cd(codepath)

% bigr = zeros(size(DirectoryListing));
% bigV = zeros(size(DirectoryListing));
% for aa = 1:size(DirectoryListing,1)
%     clear X map Z L
%     [X, map] = dicomread([filefolder DirectoryListing(aa).name]);
% 
%     Z = zeros(size(X,1),size(X,2),size(X,4));
%     for jj = 1:600 
%         Z(:,:,jj) = X(:,:,1,jj);
%     end
%     Z(Z>0) = 1;
% 
%     %Only calculates longest axis if there is an ROI
%     if(sum(sum(sum(Z)))>0)     
%         L = RegionProps3(Z,'MajorAxisLength');
%     end
%     bigr(aa) = L.MajorAxisLength*0.2/2; %mm
% 
%     bigV(aa) = (4/3)*pi*r(aa)^3;
% end
% 
% r1 = zeros(size(DirectoryListing));
% r2 = zeros(size(DirectoryListing));
% r3 = zeros(size(DirectoryListing));
% V = zeros(size(DirectoryListing));
% for aa = 1:size(DirectoryListing,1)
%     clear X map Z L
%     [X, map] = dicomread([filefolder DirectoryListing(aa).name]);
% 
%     Z = zeros(size(X,1),size(X,2),size(X,4));
%     for jj = 1:600 
%         Z(:,:,jj) = X(:,:,1,jj);
%     end
%     Z(Z>0) = 1;
% 
%     %Only calculates longest axis if there is an ROI
%     if(sum(sum(sum(Z)))>0)     
%         L = RegionProps3(Z,'AllAxes');
%     end
%     r1(aa) = L.FirstAxisLength*0.2/2; %mm
%     r2(aa) = L.SecondAxisLength*0.2/2; %mm
%     r3(aa) = L.ThirdAxisLength*0.2/2; %mm
% 
%     V(aa) = (4/3)*pi*r1(aa)*r2(aa)*r3(aa);
% end

Vox = zeros(size(DirectoryListing));
for aa = 1:size(DirectoryListing,1)
    clear X map Z
    [X, map] = dicomread([filefolder DirectoryListing(aa).name]);

    Z = zeros(size(X,1),size(X,2),size(X,4));
    for jj = 1:600 
        Z(:,:,jj) = X(:,:,1,jj);
    end
    Z(Z>0) = 1;
    Vox(aa) = sum(sum(sum(Z)))*(0.2)^3;
end


for aa = 1:size(DirectoryListing)
    DirectoryListing(aa).name
    Vox(aa)
end