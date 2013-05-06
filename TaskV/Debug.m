%Profiling ....

%Debug file
addpath('../TaskII/');
addpath('../TaskI/');
% Load the files of Taks I into Matlab
Fdata = load('FaceData.mat');
NFdata = load('NonFaceData.mat');
FTdata = load('FeaturesToUse.mat');


% % ----------------------------------
% % To test with profile
% % ----------------------------------
% % Create a subset of only N features.
% N = 3000;
% FTdata_N = FTdata;
% FTdata_N.all_ftypes = FTdata_N.all_ftypes(1:N,:);
% FTdata_N.fmat = FTdata_N.fmat(:,1:N);
% FTdata = FTdata_N;
% Define T
% T = 3;
% 
% % Profile 
% profile on -history
% % Get Cparams
% Cparams = BoostingAlg(Fdata, NFdata, FTdata, T);
% profile viewer
% p = profile('info');
% save myprofiledata4 p
% clear p
% load myprofiledata4
% profview(0,p)

% load myprofiledata
% profview(0,p)

% % ----------------------------------
% % Only if creating with T=100
% % ----------------------------------
% % % Save the data
% % name = 'Cparams.mat';
% % save(name, 'Cparams');
% 
% % Compute the final classifier pic.
% Cparams = load('Cparams.mat');
% Cparams = Cparams.Cparams;
% a = MakeClassifierPic(FTdata.all_ftypes,Cparams.Thetas(:,1),Cparams.alphas,Cparams.Thetas(:,3)',FTdata.W,FTdata.H);
% figure();imagesc(a); colormap gray;