function sc = ApplyDetectorM(Cparams, ii_im,sigma,u)

	sc = 0;
	for t = 1:length(Cparams.alphas)
		
        % Get w and h from the feature.
        w = Cparams.all_ftypes(Cparams.Thetas(t,1),4);        
        h = Cparams.all_ftypes(Cparams.Thetas(t,1),5);
        
        % Get the type of feature.
        type = Cparams.all_ftypes(Cparams.Thetas(t,1),1);
        
        % Feature response                    
        % It changes for F type III          
        switch type
            case 3              
                feature = ( Cparams.fmat(:,Cparams.Thetas(t,1))  + u*w*h ) / sigma;
                f = ii_im(:)' * ( feature );                                
            otherwise
                f =  ii_im(:)' * ( Cparams.fmat(:,Cparams.Thetas(t,1)) / sigma) ;
         end
		% Parity
        p = Cparams.Thetas(t,3);
        % threshold
		theta = Cparams.Thetas(t,2);
        % score
		sc = sc + Cparams.alphas(t) * classifier(f,p,theta);
	end
end

% Weak classifier.
function cls = classifier(f,p,theta)
	cls = p.*f < p*theta;
end
