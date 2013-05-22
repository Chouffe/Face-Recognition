% Cparams = load('../TaskV/Cparams.mat');
% Cparams = Cparams.Cparams;
% 
% addpath('../TaskI');
% [fpr,tpr] = ROCoverC(Cparams);
% Thresholds = GetOptimalThresholds(fpr,tpr,0.9);
% Cparams.thresh = Thresholds;

% path = '../TestImages/one_chris.png';
% 
% im = path;
% min_s = 0.6;
% max_s = 1.4;
% step_s = .06;
% 
% scimages = {};
% 
% [scimages, dets] = ScanImageOverScale(Cparams, im, min_s, max_s, step_s, scimages, 1);
classifier_index = 10;
dets = ApplyClassifier(dets, scimages, Cparams, classifier_index)