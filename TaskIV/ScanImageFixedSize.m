function dets = ScanImageFixedSize(Cparams, im)
%Read the image    
I = imread(im);

% Do image procesing
if size(im,3) == 3
    I = rgb2gray(I);
end
I = double(I);
% Illummination invariance
u = mean(I(:));
o = std(I(:));
if (o~=0)
    im = (I-u)/o;
else
    im = I;
end

% Integral Image.
ii_im = cumsum(cumsum(im,2));

L = 19;
[Y,X]=size(im);
% score vector
sc = zeros(1,4);
dets = [];
% Square the ii
squared = ii_im.*ii_im;
for x = 1:X-L
    for y = 1:Y-L
        % -------------------------------------
        % Normalize the box
        % -------------------------------------
        patch = ii_im(y:y+L-1,x:x+L-1);
        % Compute mean
        mu = (1/L^2)*sum(sum(patch));        
        sq = squared(y:y+L-1,x:x+L-1);
        % Compute sigma
        sigma = sqrt((1/ (L^2-1))*(sum(sum(sq)) - L^2*mu^2)); 
        % -------------------------------------
        % Apply detector
        % Error here!!!!!!!!!
        sc = ApplyDetectorM(Cparams,patch,sigma,mu*L^2);
        % Is it a face?
        if (sc>0)%Cparams.thresh)
          % Keep it as a face  
          dets = [dets;sc];%[x,y,L,L]];
        end        
    end
end
% x = 22, y = 25;

end