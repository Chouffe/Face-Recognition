%Profiling ....

%Debug file
addpath('../TaskI/');

% Load the files of Taks I into Matlab
Fdata = load('FaceData.mat');
NFdata = load('NonFaceData.mat');
FTdata = load('FeaturesToUse.mat');

% Create a subset of only N features.
N = 3000;
FTdata_N = FTdata;
FTdata_N.all_ftypes = FTdata_N.all_ftypes(1:N,:);
FTdata_N.fmat = FTdata_N.fmat(:,1:N);
FTdata = FTdata_N;
% Define T
T = 3;

% Profile 
p = profile('info');
save myprofiledata p
% Get Cparams
Cparams = BoostingAlg(Fdata, NFdata, FTdata, T);

clear p
load myprofiledata
profview(0,p)

% load myprofiledata
% profview(0,p)