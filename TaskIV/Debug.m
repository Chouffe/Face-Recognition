%Debug%
addpath('../TaskIII');
addpath('../TaskII');
addpath('../TaskI');
 
% Program 20
 
Cparams = load('../TaskIII/Cparams.mat');
 
Cparams = Cparams.Cparams;
% Fdata = load('FaceData.mat');
% NFdata = load('NonFaceData.mat');
% FTdata = load('FeaturesToUse.mat');
 
% % ----------------------------------
% % One file test
% % ----------------------------------
% im_fname = '../TrainingImages/FACES/face00001.bmp';
% [im, ii_im] = LoadIm(im_fname);
% % Apply detector
% ApplyDetector(Cparams, ii_im)
% dets = ScanImageFixedSize(Cparams,ii_im);
% DisplayDetections(im_fname, dets);
% colormap gray;
% 
% % % ----------------------------------
% % % Program 22 Debug
% % % ----------------------------------
% % 
% % More robust check!
% 
% % Get the test images.
% Fdata = load('FaceData.mat');
% face_fnames = dir(Fdata.dirname);
% index = 3:length(face_fnames);
% face_test_index = setdiff(index,Fdata.fnums);
% 
% % Store the values of scores.
% scores_faces = zeros(1,length(face_test_index));
% new_scores_faces = zeros(1,length(face_test_index));
% 
% % To access the test images we do
% for i=1:length(face_test_index)
%     % Choose filename
%     im_fname = [Fdata.dirname, face_fnames(face_test_index(i)).name];
%     % ----------------
%     % Load data
%     % ----------------
%     [im, ii_im] = LoadIm(im_fname);
%     
%     % Apply detector
%     scores_faces(i) = ApplyDetector(Cparams, ii_im);
%     new_scores_faces(i) = ScanImageFixedSize(Cparams,ii_im);
%     
% end
% sum(abs(scores_faces-new_scores_faces))
 
 
% ----------------------------------
% Program 23 Debug
% ----------------------------------
% Test ScanImageFixedSize
path = '../TestImages/one_chris.png';
 
% Load the image
[im, I] = LoadIm(path);
 
% % Without pruning
dets = ScanImageFixedSize(Cparams, I);
DisplayDetections(path, dets);
 
% Display the detected face with pruning
fdets = PruneDetections(dets);
DisplayDetections(path, fdets);
 
% Test ScanImageOverScale: Fucked!!!
im = '../TestImages/big_one_chris.png';
min_s = 0.1;
max_s = 1.0;
step_s = .06;
 
dets = ScanImageOverScale(Cparams, im, min_s, max_s, step_s);
%DisplayDetections(im, dets);
 

