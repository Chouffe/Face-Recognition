function [theta, p, err] = LearnWeakClassifier(ws, fs, ys)

	mu_p = sum(ws .* fs .* ys) / sum(ws .* ys);
	mu_n = sum(ws .* fs .* (1-ys)) / sum(ws .* (1-ys));

	theta = .5 * (mu_p + mu_n);

	errs(1) = sum(ws .* abs(ys - h(fs,-1,theta)));
	errs(2) = sum(ws .* abs(ys - h(fs,1,theta)));

	[err, ind] = min(errs);

	p = sign(ind - 1.1);  

end


function cls = h(f,p,theta)
	cls = p.*f < p*theta;
end
