function GetTrainingData(all_ftypes, np, nn)
% Dir name
dirname = '../TrainingImages/FACES/';
im_sfn = 'FaceData.mat';
% First for FACES
LoadSaveImData(dirname, np, im_sfn); 

dirname = '../TrainingImages/NFACES/';
im_sfn = 'NonFaceData.mat';
% Second for NFACES
LoadSaveImData(dirname, nn, im_sfn); 

% Save the features.
f_sfn = 'FeaturesToUse.mat';
ComputeSaveFData(all_ftypes,f_sfn);
end