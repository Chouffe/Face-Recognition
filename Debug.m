
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

% -------------------------------------------
% Debug 2.4 - Vectorize
% -------------------------------------------
[im, ii_im] = LoadIm('TrainingImages/FACES/face00001.bmp');
x = 2; y = 2; w = 4; h = 2;
b_vec = VecBoxSum(x,y,w,h,19,19);
A1 = ii_im(:)'*b_vec
A2 = ComputeBoxSum(ii_im,x,y,w,h)
