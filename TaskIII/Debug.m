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
% Get the test images.
face_fnames = dir(Fdata.dirname);
index = 3:length(face_fnames);
face_test_index = setdiff(index,Fdata.fnums);

% Store the values of scores.
scores_faces = zeros(1,length(face_test_index));

% To access the test images we do
for i=1:length(face_test_index)
    % Choose filename
    im_fname = [Fdata.dirname, face_fnames(face_test_index(i)).name];
    % ----------------
    % Load data
    % ----------------
    [im, ii_im] = LoadIm(im_fname);
    
    % Apply detector
    scores_faces(i) = ApplyDetector(Cparams, ii_im);
    
end

% Get the test images.
face_fnames = dir(NFdata.dirname);
index = 3:length(face_fnames);
Nface_test_index = setdiff(index,NFdata.fnums);

% Store the values of scores for non faces
scores_Nfaces = zeros(1,length(Nface_test_index));

% To access the test images we do
for i=1:length(Nface_test_index)
    % Choose filename
    im_fname = [NFdata.dirname, face_fnames(Nface_test_index(i)).name];
    % ----------------
    % Load data
    % ----------------
    [im, ii_im] = LoadIm(im_fname);
    
    % Apply detector
    scores_Nfaces(i) = ApplyDetector(Cparams, ii_im);
    
end


thresh = ComputeROC(Cparams,Fdata,NFdata);

Cparams.thresh = thresh;

name = 'Cparams.mat';
save(name, 'Cparams');
