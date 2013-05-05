function [theta, p, err] = LearnWeakClassifier(ws, fs, ys)

    a = ws .* ys;
    b = ws .* (1-ys);
	mu_p = sum(a .* fs) / sum(a);
	mu_n = sum(b .* fs) / sum(b);

	theta = .5 * (mu_p + mu_n);

    % p = -1
	errs(1) = sum(ws .* abs(ys - (-1.*fs < -theta)));
    % p = 1
	errs(2) = sum(ws .* abs(ys - (1.*fs < theta)));

	[err, ind] = min(errs);

	p = sign(ind - 1.1);  

end


% function cls = h(f,p,theta)
% 	cls = p.*f < p*theta;
% end
