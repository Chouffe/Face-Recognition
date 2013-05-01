% Debug file

% Program 20
Cparams = load('../TaskII/Cparams.mat').Cparams;

[im, ii_im] = LoadIm('../TrainingImages/FACES/face00001.bmp');
sc = ApplyDetector(Cparams, ii_im)
