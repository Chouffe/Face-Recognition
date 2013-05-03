function dets = ScanImageFixedSize(Cparams, ii_im)

% %Read the image    
% I = im;
% 
% u = mean(I(:));
% o = std(I(:));
% if (o~=0)
%     im = (I-u)/o;
% else
%     im = I;
% end
% 
% % Integral Image.
% ii_im = cumsum(cumsum(im,2));


L = 19;
[Y,X]=size(ii_im);
% score vector
scs = [];
dets = [];
% Square the ii
squared = ii_im.*ii_im;

for x = 1:X-L+1
    for y = 1:Y-L+1
        sc=0;
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
        Norm_patch = (patch-mu)/sigma;
        % Apply detector taking into account sigma, and mu*w*h        
        sc = ApplyDetectorM(Cparams,Norm_patch,sigma,mu*L^2);
        % Is it a face?
        %if (sc>0)% For debug.
        if (sc>Cparams.thresh)
          % Keep it as a face  
          % Debug
          %scs = [scs;sc];
          dets = [dets;[x,y,L,L]];
        end 
    end
end
<<<<<<< HEAD
% Debug
%dets = scs;

=======
% x = 22, y = 25;
>>>>>>> Debug file and ScanImageFixedSize created
end
