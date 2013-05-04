function sc = ApplyDetectorM(Cparams, ii_im,sigma,uwh)

	sc = 0;
	for t = 1:length(Cparams.alphas)
		% Feature response                    
        % It changes for F type III
        type = Cparams.all_ftypes(Cparams.Thetas(t,1));
        switch type
            case 3                        
                f = ii_im(:)' * ((Cparams.fmat(:,Cparams.Thetas(t,1)))*sigma-uwh);                   
            otherwise
                f = ii_im(:)' * (Cparams.fmat(:,Cparams.Thetas(t,1)))*sigma;            
        end
		% Parity
        p = Cparams.Thetas(t,3);
        % threshold
		theta = Cparams.Thetas(t,2);
        % score
		sc = sc + Cparams.alphas(t) * h(f,p,theta);
	end
end

% Weak classifier.
function cls = h(f,p,theta)
	cls = p*f < p*theta;
end
