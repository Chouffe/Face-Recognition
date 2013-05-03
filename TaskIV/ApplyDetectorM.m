function sc = ApplyDetectorM(Cparams, ii_im,sigma,uwh)

	sc = 0;
	for t = 1:length(Cparams.alphas)
		% Feature response                    
        f = ii_im(:)' * Cparams.fmat(:,Cparams.Thetas(t,1));
        % It changes for F type III
        if (Cparams.all_ftypes(Cparams.Thetas(t,1)) == 3)
            f = (f)*sigma-uwh;
        else
            f = f*sigma;
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
	cls = p.*f < p*theta;
end
