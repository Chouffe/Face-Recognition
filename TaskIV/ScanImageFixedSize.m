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
for x = 1:X
    for y = 1:Y
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
        % Normalize the patch
        new_patch = (patch-mu)/sigma;
        % Apply detector taking into account sigma, and mu*w*h        
        sc = ApplyDetectorM(Cparams,new_patch,sigma,mu*L^2);
        % Is it a face?
        if (sc>Cparams.thresh)
          % Keep it as a face  
          dets = [dets;[x,y,L,L]]; 
          % For debug and check if it is working.
          % dets = [dets;sc]; 
        end 
        if (y+L > Y)
            break;
        end
    end
    if (x+L> X)
        break;
    end
end
% x = 22, y = 25;
end


