
% % -------------------------------------------
% % Debug 3
% % -------------------------------------------
% DirName = 'TrainingImages/FACES/';
% format = 'bmp';
% mystr = [DirName,'/*.',format];
% im_files = dir(mystr);
% addpath(DirName);
% eps = 1e-6;
% 
% for i = 1:100
%     [im, ii_im] = LoadIm(im_files(i).name);
%     if i ==1
%         ii_ims = zeros(100,size(ii_im,1), size(ii_im,2));
%     end
%     % store each ii_im
%     ii_ims(i,:,:)= ii_im;
% end
% dinfo3 = load('DebugInfo/debuginfo3.mat');
% ftype = dinfo3.ftype;
% sum(abs(dinfo3.fs - ComputeFeature(ii_ims, ftype)) > eps)

% % -------------------------------------------
% % Debug 2.4 - Vectorize Prgm 9
% % -------------------------------------------
% [im, ii_im] = LoadIm('TrainingImages/FACES/face00001.bmp');
% x = 2; y = 2; w = 4; h = 2;
% b_vec = VecBoxSum(x,y,w,h,19,19);
% A1 = ii_im(:)'*b_vec
% A2 = ComputeBoxSum(ii_im,x,y,w,h)


% % -------------------------------------------
% % Debug 2.4 - Vectorize Prgm 10
% % -------------------------------------------
% [im, ii_im] = LoadIm('TrainingImages/FACES/face00001.bmp');
% x = 2; y = 5; w = 4; h = 1;
% ftype_vec = VecFeature([4, x, y, w, h], 19, 19);
% A1 = ii_im(:)'*ftype_vec
% A2 = FeatureTypeIV(ii_im,x,y,w,h)

% % -------------------------------------------
% % Debug 2.4 - Vectorize Prgm 12
% % -------------------------------------------
% DirName = 'TrainingImages/FACES/';
% format = 'bmp';
% mystr = [DirName,'/*.',format];
% im_files = dir(mystr);
% addpath(DirName);
% eps = 1e-6;
% W = 0;
% H = 0;
% for i = 1:100
%     [im, ii_im] = LoadIm(im_files(i).name);
%     if i ==1
%         W = size(ii_im,1);
%         H = size(ii_im,2);
%         ii_ims = zeros(100,size(ii_im,1), size(ii_im,2));
%     end
%     % store each ii_im
%     ii_ims(i,:,:)= ii_im;
% end
% % Type
% TYPE = 1;
% % Old
% all_ftypes = EnumAllFeatures(W,H,TYPE);
% fmat = VecAllFeatures(all_ftypes,W,H);
% fs1 = VecComputeFeature(ii_ims, fmat(:,TYPE));
% % New
% fs2 = ComputeFeature(ii_ims, all_ftypes(TYPE,:));
% % Check
% sum(abs(fs1-fs2')> eps)

% % -------------------------------------------
% % Debug 2.5 - Prgm 13
% % -------------------------------------------
% LoadSaveImData('TrainingImages/FACES/',100,'FaceData.mat');

% % -------------------------------------------
% % Debug 2.5 - Prgm 14
% % -------------------------------------------
% all_ftypes = [];
% all_ftypes = [all_ftypes;EnumAllFeatures(19,19,1)];
% all_ftypes = [all_ftypes;EnumAllFeatures(19,19,2)];
% all_ftypes = [all_ftypes;EnumAllFeatures(19,19,3)];
% all_ftypes = [all_ftypes;EnumAllFeatures(19,19,4)];
% ComputeSaveFData(all_ftypes,'FeaturesToMat.mat');

% % -------------------------------------------
% % Debug 2.5 - Checking for Pgrm 13 & 14
% % -------------------------------------------
% dinfo4 = load('DebugInfo/debuginfo4.mat'); 
% ni = dinfo4.ni;
% all_ftypes = dinfo4.all_ftypes;
% im_sfn = 'FaceData.mat';
% f_sfn = 'FeaturesToMat.mat';
% rng(dinfo4.jseed);
% dirname = 'TrainingImages/FACES/';
% LoadSaveImData(dirname, ni, im_sfn); 
% ComputeSaveFData(all_ftypes, f_sfn);
% % compare that the fmat and dinfo4.fmat are the same
% min = load('FeaturesToMat.mat');
% sum(sum(abs(dinfo4.fmat-min.fmat)>eps))
% % Compare that ii_ims and dinfo4.ii_ims are the same
% min2 = load('FaceData.mat');
% sum(sum(abs(dinfo4.ii_ims-min2.ii_ims)>eps))

% -------------------------------------------
% Debug 2.5 - Checking all
% -------------------------------------------
dinfo5 = load('DebugInfo/debuginfo5.mat'); 
np = dinfo5.np;
nn = dinfo5.nn;
all_ftypes = dinfo5.all_ftypes;
rng(dinfo5.jseed);
GetTrainingData(all_ftypes,np,nn);
% Load the files into Matlab
Fdata = load('FaceData.mat');
NFdata = load('NonFaceData.mat');
FTdata = load('FeaturesToUse.mat');



