% ----------------------------------
% Program 23 Debug
% ----------------------------------
% Test ScanImageFixedSize
path = '../TestImages/one_chris.png';
addpath('../TaskIV/');
addpath('../TaskI/');
 

 
Cparams = load('../TaskIII/Cparams.mat');
 
Cparams = Cparams.Cparams;
% % Load the image
% I = imread(path);
% % Convert to grayscale if needed.
% if size(I,3) == 3
%     I = rgb2gray(I);
% end
%  
% % Without pruning
% dets = ScanImageFixedSize(Cparams, I);
% DisplayDetections(path, dets);
%  
% % Display the detected face with pruning
% fdets = PruneDetections(dets,0.5);
% DisplayDetections(path, fdets);

% ----------------------------------
% Program 24 Debug
% ----------------------------------
%im = '../TestImages/IMG_0197.jpg';
%im = '../TestImages/many_faces.jpg';
im = path;
min_s = 0.6;
max_s = 1.4;
step_s = .06;
 
dets = ScanImageOverScale(C100, im, min_s, max_s, step_s);
DisplayDetections(im, dets);
 