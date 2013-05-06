%Profiling ....

%Debug file
addpath('../TaskII/');
addpath('../TaskI/');
% Load the files of Taks I into Matlab
Fdata = load('FaceData.mat');
NFdata = load('NonFaceData.mat');
FTdata = load('FeaturesToUse.mat');

% Define T
T = 100;
% Get Cparams
Cparams = BoostingAlg(Fdata, NFdata, FTdata, T);

% ----------------------------------
% Only if creating with T=100
% ----------------------------------
% Save the data
name = 'Cparams.mat';
save(name, 'Cparams');

% ----------------------------------
% Compute the final classifier pic.
% ----------------------------------
Cparams = load('Cparams.mat');
Cparams = Cparams.Cparams;
a = MakeClassifierPic(FTdata.all_ftypes,Cparams.Thetas(:,1),Cparams.alphas,Cparams.Thetas(:,3)',FTdata.W,FTdata.H);
figure();imagesc(a); colormap gray;
