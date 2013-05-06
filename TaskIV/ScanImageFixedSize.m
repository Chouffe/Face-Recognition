function dets = ScanImageFixedSize(Cparams, im)
 
%Read the image    
im = double(im);

% Integral Image.
ii_im = cumsum(cumsum(im,2));
 
L = 19;
mu = (1/L^2)*cumsum(cumsum(im,2));  
% Square the ii
squared = cumsum(cumsum(im.*im,2));

[Y,X]=size(im);
dets = [];

for x = 1:X-L+1
    for y = 1:Y-L+1
        
        vector = VecBoxSumSparse(x,y,L,L,X,Y);
        % -------------------------------------
        % Normalize the box
        % -------------------------------------
        patch = ii_im(y:y+L-1,x:x+L-1);
        % Compute mean      
        u = mu(:)'*vector;
        % Compute sigma        
        o = sqrt((1/ (L^2-1))*(squared(:)'*vector - L^2*u^2));        
        % *******************************-------------------------------------                
        sc = ApplyDetectorM(Cparams,patch,o,u);
        % Is it a face?
        if (sc>Cparams.thresh)
          % Keep it as a face  
          dets = [dets;[x,y,L,L]];
        end 
    end
end
end

