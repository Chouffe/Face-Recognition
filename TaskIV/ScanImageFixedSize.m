function dets = ScanImageFixedSize(Cparams, im)
 
%Read the image    
im = double(im);

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
mu = (1/L^2)*cumsum(cumsum(im,2));  
% Square the ii
squared = cumsum(cumsum(im.*im,2));

[Y,X]=size(im);
% score vector
scs = [];
dets = [];

% just a test
% I = imread('../TestImages/one_chris.png');
% figure(); imagesc(I); axis equal;
for x = 1:X-L+1
    for y = 1:Y-L+1
        sc=0;
        vector = VecBoxSumSparse(x,y,L,L,X,Y);
        % -------------------------------------
        % Normalize the box
        % -------------------------------------
        patch = im(y:y+L-1,x:x+L-1);
        % Compute mean
        % Same as u = mean(patch(:))
        u = mu(:)'*vector;       
        % Compute sigma
        % Same as o = std(patch(:))
        o = sqrt((1/ (L^2-1))*(squared(:)'*vector - L^2*u^2));
        % -------------------------------------
        % Normalize the patch
        Norm_patch = (patch-u)/o;
        % Integral Image
        ii_im = cumsum(cumsum(Norm_patch,2));
        % Apply detector taking into account sigma, and mu*w*h        
        sc = ApplyDetector(Cparams,ii_im);
        % Is it a face?
        % For debug.
%         sc
%         if (sc>6.5) 
%             if sc>Cparams.thresh
%                     rectangle('Position',[x, y, L, L],'EdgeColor', 'r');
%             else 
%                     rectangle('Position',[x, y, L, L],'EdgeColor', 'b');
%             end
%         drawnow;
%         sc
        if (sc>Cparams.thresh)
          % Keep it as a face  
          % Debug          
          %dets = sc;
          %scs = [scs;sc];
          sc;
          dets = [dets;[x,y,L,L]];
        end 
    end
end
end

