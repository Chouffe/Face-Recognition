function [ii_im, dets] = ScanImageFixedSize(Cparams, im, classifier_index)
 
%Read the image    
im = double(im);

% Integral Image.
ii_im = cumsum(cumsum(im,2));
 
L = 19;
mu = (1/L^2)*ii_im;  
% Square the ii
squared = cumsum(cumsum(im.*im,2));

[Y,X]=size(im);
dets = [];

for x = 1:X-L+1
    for y = 1:Y-L+1
        
        vector = VecBoxSumAld(x,y,L,L,X,Y);
        % -------------------------------------
        % Normalize the box
        % -------------------------------------
        patch = ii_im(y:y+L-1,x:x+L-1);
        % Compute mean      
        u = mu(:)'*vector;
        % Compute sigma        
        o = sqrt((1/ (L^2-1))*(squared(:)'*vector - L^2*u^2));        
        % *******************************-------------------------------------                
        % sc = ApplyDetectorM(Cparams,patch,o,u);
% *******************************-------------------------------------                        
    sc = 0;
	for t = 1:classifier_index
		
        % Get w and h from the feature.
        w = Cparams.all_ftypes(Cparams.Thetas(t,1),4);        
        h = Cparams.all_ftypes(Cparams.Thetas(t,1),5);
        
        % Get the type of feature.
        type = Cparams.all_ftypes(Cparams.Thetas(t,1),1);
        
        % Feature response                    
        % It changes for F type III          
        switch type
            case 3              
                feature = ( Cparams.fmat(:,Cparams.Thetas(t,1))  + u*w*h ) / o;
                f = patch(:)' * ( feature );                                
            otherwise
                f =  patch(:)' * ( Cparams.fmat(:,Cparams.Thetas(t,1)) / o) ;
         end
		% Parity
        p = Cparams.Thetas(t,3);
        % threshold
		theta = Cparams.Thetas(t,2);
        % score
		sc = sc + Cparams.alphas(t) * (p.*f < p*theta);
    end
% *******************************-------------------------------------                    
        % Is it a face?
        if (sc>Cparams.thresh(classifier_index))
          % Keep it as a face  
          dets = [dets;[x,y,L,L,u,o]];
        end 
    end
end
end

