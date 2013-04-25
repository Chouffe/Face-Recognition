
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

% -------------------------------------------
% Debug 2.4 - Vectorize Prgm 12
% -------------------------------------------
DirName = 'TrainingImages/FACES/';
format = 'bmp';
mystr = [DirName,'/*.',format];
im_files = dir(mystr);
addpath(DirName);
eps = 1e-6;
W = 0;
H = 0;
for i = 1:100
    [im, ii_im] = LoadIm(im_files(i).name);
    if i ==1
        W = size(ii_im,1);
        H = size(ii_im,2);
        ii_ims = zeros(100,size(ii_im,1), size(ii_im,2));
    end
    % store each ii_im
    ii_ims(i,:,:)= ii_im;
end
% Type
TYPE = 1;
% Old
all_ftypes = EnumAllFeatures(W,H,TYPE);
fmat = VecAllFeatures(all_ftypes,W,H);
fs1 = VecComputeFeature(ii_ims, fmat(:,TYPE));
% New
fs2 = ComputeFeature(ii_ims, all_ftypes(TYPE,:));
% Check
sum(abs(fs1-fs2')> eps)