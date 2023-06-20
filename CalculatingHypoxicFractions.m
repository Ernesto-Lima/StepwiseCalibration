%I do not trust the ROIs I was given, going with Patrick's results and not
%using the threshold per mouse

%Calculating tumor hypoxic fractions using mouse muscle PET data 
%First calculate the muscle SUV across all mice and days
%Calculate mean and stdev of muscle SUV across all mice and days
%Define 3 thresholds from mean and muscle SUV per mouse and per day
%Calculate the tumor SUV values
%Apply each threshold for each mouse and day to define range of hypoxic
%fractions
clear all
close all

%Define file paths
codepath = pwd;
filefolder1 = '/Users/Angela/Box/Immune/MC38 in C57BL:6/MC38 immunotherapy longitudinal study ROI DICOMS/Muscle ROIs/ROI2/';
filefolder2 = '/Users/Angela/Box/Immune/MC38 in C57BL:6/MC38 immunotherapy longitudinal study ROI DICOMS/Tumor ROIs/ROI2/';

%Define data values
mice = ['NC3';'NT3';'NT4';'NC2';'RT1';'NC1';'RT2';'RC2';'NT2';'RT4';'NT1';'RT3';'RC1']; %Code names for mice
mouseweights = [14.50, 14.00, 16.00, 14.40, 18, 18.3, 17.00, 15.7, 16.3, 19.80, 15.6, 17.30, 20.3]; %grams
days = [0 2 5]; %FMISO PET collected
mousedoses = [89.39861889	90.00266361	85.17030583 %uCi to MBq multiply by 0.037, mCi to MBq *by 37
88.79457416	83.35817166	88.19052944
91.21075305	79.12985861	80.33794805
98.45928972	86.37839527	93.02288722
86.98244	91.21075305	83.35817166
91.21075305	84.56626111	96.04311083
84.56626111	87.58648472	90.60670833
88.79457416	88.79457416	94.23097666
89.39861889	89.39861889	85.77435055
87.58648472	87.58648472	79.73390333
88.19052944	88.19052944	81.5460375
88.19052944	84.56626111	87.58648472
84.56626111	88.19052944	86.98244]*37;

%Move to muscle ROI folder
cd(filefolder1)
DirectoryListing1 = dir; 
DirectoryListing1([1:2]) = [];
cd(codepath)

%First calculate mean and standard deviation of PET muscle data
means = zeros(13,3);
stdevs = zeros(13,3);
%Due to the dicom files saved separately for each day, have 2 counters
count1 = 0; %each day
count2 = 0; %each mouse
for aa = 1:size(DirectoryListing1,1)
    clear X map Z SUVZ
    
    if count1 < 1 || count1 > 3
        count1 = 1;
        count2 = count2 + 1;
    end
    
    %load file
    [X, map] = dicomread([filefolder1 DirectoryListing1(aa).name]);
    %reformat shape of the matrix
    Z = zeros(size(X,1),size(X,2),size(X,4));
    for jj = 1:600 
        Z(:,:,jj) = X(:,:,1,jj);
    end
    %Delete zeros and get data in ROI only
    Z(Z==0) = [];
    
    %Caclulate the SUV
    SUVZ = Z/mousedoses(count2,count1)/mouseweights(count2);
    
    %Save relevant measures
    means(count2,count1) = mean(SUVZ);
    stdevs(count2,count1) = std(SUVZ);
    count1 = count1 + 1;
end

%Defining thresholds
meanp1 = means+stdevs;
meanp2 = means+2*stdevs;
meanp3 = means+3*stdevs;

%Calculate tumor ROI SUV values and define hypoxic fractions using
%thresholds
%Move to tumor ROI folder
cd(filefolder2)
DirectoryListing2 = dir; 
DirectoryListing2([1:2]) = [];
cd(codepath)

upper = zeros(13,3);
lower = zeros(13,3);
mid = zeros(13,3);
%Due to the dicom files saved separately for each day, have 2 counters
count1 = 0; %each day
count2 = 0; %each mouse
tmeans = zeros(13,3);
tstdevs = zeros(13,3);
for aa = 1:size(DirectoryListing2,1)
    clear X map Z SUVZ vox
    
    if count1 < 1 || count1 > 3
        count1 = 1;
        count2 = count2 + 1;
    end
    [X, map] = dicomread([filefolder2 DirectoryListing2(aa).name]);

    Z = zeros(size(X,1),size(X,2),size(X,4));
    for jj = 1:600 
        Z(:,:,jj) = X(:,:,1,jj);
    end
    Z(Z==0) = [];
    vox = numel(Z);
    
    %Caclulate the SUV
    SUVZ = Z/mousedoses(count2,count1)/mouseweights(count2);
    
    tmeans(count2,count1) = mean(SUVZ);
    tstdevs(count2,count1) = std(SUVZ);
    
    upper(count2,count1) = 100*numel(find(SUVZ>meanp1(count2,count1)))/vox;
    lower(count2,count1) = 100*numel(find(SUVZ>meanp3(count2,count1)))/vox;
    mid(count2,count1)   = 100*numel(find(SUVZ>meanp2(count2,count1)))/vox;
    
    count1 = count1 + 1;
end


for jj = 1:size(DirectoryListing2,1)/numel(days)
    eval([mice(jj,:) '(1,:)=[' num2str(days) '];'])
    eval([mice(jj,:) '(2,:)=[' num2str(mid(jj,:)) '];'])
end


% save('IndividualMouseHypoxicFractions.mat')





