function sc = ApplyDetector(Cparams, ii_im)

	sc = 0;
	for t = 1:length(Cparams.alphas)
		f = ii_im(:)' * Cparams.fmat(:,Cparams.Thetas(t,1));
		p = Cparams.Thetas(t,3);
		theta = Cparams.Thetas(t,2);
		sc = sc + Cparams.alphas(t) * h(f,p,theta);
	end
end


function cls = h(f,p,theta)
	cls = p.*f < p*theta;
end
