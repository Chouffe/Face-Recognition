function sc = ApplyDetectorAdapted(Cparams, patch, sigma)

	sc = 0;
	for t = 1:length(Cparams.alphas)
		% Feature response
        f = (1 / sigma) * patch(:)' * Cparams.fmat(:,Cparams.Thetas(t,1));
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
