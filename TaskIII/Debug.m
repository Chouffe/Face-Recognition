% Debug file

% Program 20
Cparams = load('../TaskII/Cparams.mat');
Cparams = Cparams.Cparams;


% ----------------------------------
% Program 20 Debug
% ----------------------------------
[im, ii_im] = LoadIm('../TrainingImages/FACES/face00001.bmp');
sc = ApplyDetector(Cparams, ii_im)


% ----------------------------------
% Program 21 Debug
% ----------------------------------
% Get the test images.
face_fnames = dir(Fdata.dirname);
index = 1:length(face_fnames);
face_test_index = setdiff(index,Fdata.fnums);
length(face_test_index)
% To access the test images we do
% Choose filename
% i is the file number
i=1;
im_fname = [Fdata.dirname, face_fnames(face_test_index(i)).name];