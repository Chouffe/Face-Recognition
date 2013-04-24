DirName = 'TrainingImages/FACES/';
format = 'bmp';
mystr = [DirName,'/*.',format];
im_files = dir(mystr);
addpath(DirName);
eps = 1e-6;

for i = 1:100
    [im, ii_im] = LoadIm(im_files(i).name);
    if i ==1
        ii_ims = zeros(100,size(ii_im,1), size(ii_im,2));
    end
    % store each ii_im
    ii_ims(i,:,:)= ii_im;
end
dinfo3 = load('DebugInfo/debuginfo3.mat');
ftype = dinfo3.ftype;
sum(abs(dinfo3.fs - ComputeFeature(ii_ims, ftype)) > eps)