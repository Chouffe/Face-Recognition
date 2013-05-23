% Cparams = load('../TaskV/Cparams.mat');
% Cparams = Cparams.Cparams;
% 
% addpath('../TaskI');
% [start, stop, fpr,tpr] = ROCoverC(Cparams);
% Thresholds = GetOptimalThresholds(fpr,tpr,0.9,start,stop);
% Cparams.thresh = Thresholds;
%
%path = '../TestImages/many_faces.png';

%im = path;
min_s = 0.6;
max_s = 1.4;
step_s = .06;

scimages = {};

% % Profile 
% profile on -history

[scimages, dets] = ScanImageOverScale(Cparams, im, min_s, max_s, step_s, scimages, 1);
dets2 = ApplyClassifier(dets, scimages, Cparams, 10);
dets3 = ApplyClassifier(dets2, scimages, Cparams, 40);
dets4 = ApplyClassifier(dets3, scimages, Cparams, 70);
dets5 = ApplyClassifier(dets4, scimages, Cparams, 100);
DisplayDetections(im, dets5);

% profile viewer
% p = profile('info');
% save myprofiledata4 p
% clear p
% load myprofiledata4
% profview(0,p)



%classifier_index = 10;
%dets = ApplyClassifier(dets, scimages, Cparams, classifier_index)
