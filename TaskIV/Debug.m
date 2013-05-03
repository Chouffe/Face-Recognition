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

% % ----------------------------------
% % Program 22 Debug
% % ----------------------------------
% 
% % Old Detector
% im = '../TrainingImages/FACES/face00007.bmp';
% [i1,i2] = LoadIm(im);
% a = ApplyDetector(Cparams,i2)
% 
% % New detector
% b = ScanImageFixedSize(Cparams, im)
% 
% % Should be 0.
% abs(a-b)

% Test with an image
im = '../TestImages/one_chris.png'
dets = ScanImageFixedSize(Cparams, im);
size(dets)

