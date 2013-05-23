% Cparams = load('../TaskV/Cparams.mat');
% Cparams = Cparams.Cparams;
% 
% addpath('../TaskI');
% addpath('../TaskIV');
% [start, stop, fpr,tpr] = ROCoverC(Cparams);
% Thresholds = GetOptimalThresholds(fpr,tpr,0.9,start,stop);
% Cparams.thresh = Thresholds;

path = '../TestImages/many_faces.jpg';

im = path;

min_s = 0.6;
max_s = 1.4;
step_s = .06;

scimages = {};

% Profile 
profile on -history

[scimages, dets] = ScanImageOverScale(Cparams, im, min_s, max_s, step_s, scimages, 1);

size(dets)
dets2 = ApplyClassifier(dets, scimages, Cparams, 10);
size(dets2)

dets3 = ApplyClassifier(dets2, scimages, Cparams, 40);
size(dets3)

dets4 = ApplyClassifier(dets3, scimages, Cparams, 70);
size(dets4)

dets5 = ApplyClassifier(dets4, scimages, Cparams, 100);
size(dets5)
DisplayDetections(im, dets5, min_s, max_s,step_s);

profile viewer
p = profile('info');
save myprofiledata4 p
clear p
load myprofiledata4
profview(0,p)

%classifier_index = 10;
%dets = ApplyClassifier(dets, scimages, Cparams, classifier_index)
