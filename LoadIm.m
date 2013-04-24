function [im, ii_im]= LoadIm(im_fname)
%Read the image    
I = double(imread(im_fname));
% Illummination invariance
u = mean(I(:));
o = std(I(:));
im = (I-u)/o;
[x,y]= size(im);
%ii_im = zeros(size(im));
ii_im = cumsum(cumsum(im,2));
% for i=1:x
%    for j=1:y
%        ii_im(i,j)= cumsum( im(1:i,1:j) );
%    end
% end
end