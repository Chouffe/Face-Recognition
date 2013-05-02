% Debug file

% Program 20
Cparams = load('../TaskII/Cparams.mat');
Cparams = Cparams.Cparams;
Fdata = load('FaceData.mat');
NFdata = load('NonFaceData.mat');
FTdata = load('FeaturesToUse.mat');


% % ----------------------------------
% % Program 20 Debug
% % ----------------------------------
% [im, ii_im] = LoadIm('../TrainingImages/FACES/face00001.bmp');
% sc = ApplyDetector(Cparams, ii_im)


% ----------------------------------
% Program 21 Debug
% ----------------------------------

thresh = ComputeROC(Cparams,Fdata,NFdata);

Cparams.thresh = thresh;

save(name, 'Cparams');