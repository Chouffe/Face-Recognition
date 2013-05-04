%Debug%
im = '../TestImages/one_chris.png';
addpath('../TaskIII');
addpath('../TaskII');
addpath('../TaskI');

% Program 20
Cparams = load('../TaskII/Cparams.mat');
Cparams = Cparams.Cparams;
% Fdata = load('FaceData.mat');
% NFdata = load('NonFaceData.mat');
% FTdata = load('FeaturesToUse.mat');

%Test
%
%im = '../TrainingImages/FACES/face00007.bmp';
%[i1,i2] = LoadIm(im);
%a = ApplyDetector(Cparams,i2)
%
%b = ScanImageFixedSize(Cparams, im)
%
%abs(a-b)

% Test ScanImageFixedSize
im = '../TestImages/one_chris.png'
I = imread(im);

if size(im,3) == 3
    I = rgb2gray(I);
end
I = double(I);

% Without pruning
dets = ScanImageFixedSize(Cparams, I);
DisplayDetections(im, dets);
% size(find (dets> Cparams.thresh))

% Display the detected face with pruning
fdets = PruneDetections(dets);
DisplayDetections(im, fdets);


% Test ScanImageOverScale: Fucked!!!
im = '../TestImages/big_one_chris.png';
min_s = 0.1;
max_s = 1.0;
step_s = .06;

dets = ScanImageOverScale(Cparams, im, min_s, max_s, step_s);
DisplayDetections(im, dets);
