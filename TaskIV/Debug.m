
% %Debug%
% im = '../TestImages/one_chris.png';
% addpath('../TaskIII');
% addpath('../TaskII');
% addpath('../TaskI');
% 
% % Program 20
% Cparams = load('../TaskII/Cparams.mat');
% Cparams = Cparams.Cparams;
% Fdata = load('FaceData.mat');
% NFdata = load('NonFaceData.mat');
% FTdata = load('FeaturesToUse.mat');

%Test

addpath('../TaskIII/');
addpath('../TaskI/');

% Cparams = load('../TaskII/Cparams_AllT3.mat');
Cparams = load('../TaskII/Cparams.mat');
Cparams = Cparams.Cparams;

im = '../TrainingImages/FACES/face00007.bmp';
[i1,i2] = LoadIm(im);
a = ApplyDetector(Cparams,i2)

b = ScanImageFixedSize(Cparams, im)

abs(a-b)

im = '../TestImages/one_chris.png'
dets = ScanImageFixedSize(Cparams, im);
size(find (dets> Cparams.thresh))
