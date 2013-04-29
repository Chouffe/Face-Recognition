%Debug file

% ----------------------------------
% Program 16 Debug
% ----------------------------------

% Load the files into Matlab
addpath('../TaskI');
Fdata = load('FaceData.mat');
NFdata = load('NonFaceData.mat');
FTdata = load('FeaturesToUse.mat');

% Get the feature type
f = FTdata.fmat(:,12028);

% Get the VectorFeatures from the Face data.
fsp = VecComputeFeature( Fdata.ii_ims, f);

% Get the VectorFeatures from the None Face data.
fsn = VecComputeFeature( NFdata.ii_ims, f);

% Get rid of NaN
fsn(find(isnan(fsn)))=0;
% *************************************************************************
% OBS!!!! Don't know why this is happening :S
% *************************************************************************

% ....................
% Inputs
% ....................
% Define parameters
m = length(fsn);
n = length(fsp);

% Define fs
fs = [fsp;fsn];

% Correct + incorrect.
ys = [ones(n,1);zeros(m,1)];

% Create the weights (according to alg 2) ?ws = 1
ws = ones(n+m,1)*(1/(n+m));

% Call LearnWeakClassifier
[theta,p,err]=LearnWeakClassifier(ws,fs,ys)

% ....................
% Get the histograms
% ....................
% hist 1 fase positive
[h1,x1] = hist(fsp,10);
h1 = h1/sum(h1);
plot(x1,h1,'-r');
hold on;
plot(x1,h1,'.r');

% hist 2 fase negative
[h2,x2] = hist(fsn,10);
h2 = h2/sum(h2);
plot(x2,h2,'-b');
plot(x2,h2,'.b');
line([theta theta], [0 0.40],'Color','black')
% labels
legend('Face','','NonFace','','Theta');

