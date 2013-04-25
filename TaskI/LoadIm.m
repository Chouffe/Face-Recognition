function [im, ii_im]= LoadIm(im_fname)
%Read the image    
I = double(imread(im_fname));

% Illummination invariance
u = mean(I(:));
o = std(I(:));
im = (I-u)/o;

% Cumulative sum. First in y and then in x.
ii_im = cumsum(cumsum(im,2));
end