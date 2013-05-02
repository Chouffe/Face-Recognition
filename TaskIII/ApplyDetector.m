function sc = ApplyDetector(Cparams, ii_im)

	sc = 0;
	for t = 1:length(Cparams.alphas)
		% Feature response
        f = ii_im(:)' * Cparams.fmat(:,Cparams.Thetas(t,1));
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
