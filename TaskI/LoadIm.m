function [im, ii_im]= LoadIm(im_fname)
%Read the image    
I = imread(im_fname);

% Convert to grayscale if needed.
if size(I,3) == 3
    I = rgb2gray(I);
end
% Convert to double.
I = double(I);

% Illummination invariance
u = mean(I(:));
o = std(I(:));
if (o~=0)
    im = (I-u)/o;
else
    im = I;
end

% Cumulative sum. First in y and then in x.
ii_im = cumsum(cumsum(im,2));

end