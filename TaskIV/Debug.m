%Debug%
im = '../TestImages/one_chris.png';
addpath('../TaskIII');

% Program 20
Cparams = load('../TaskII/Cparams.mat');
Cparams = Cparams.Cparams;
Fdata = load('FaceData.mat');
NFdata = load('NonFaceData.mat');
FTdata = load('FeaturesToUse.mat');

I = imread(im);
imshow(I)
I = rgb2gray(I);
I = double(I);

% Illummination invariance
u = mean(I(:));
o = std(I(:));
if (o~=0)
    im = (I-u)/o;
    norm_image= im;
else
    im = I;
end

% Integral Image.
ii_im = cumsum(cumsum(im,2));