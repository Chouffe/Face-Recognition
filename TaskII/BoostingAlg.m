function Cparams = BoostingAlg(Fdata, NFdata, FTdata, T)

	Cparams = struct('alphas', zeros(1,T), 'Thetas', zeros(T,3), 'fmat', FTdata.fmat, 'all_ftypes', FTdata.all_ftypes);

	% Number of negative examples
	m = size(NFdata.ii_ims, 1);
	% Number of positive examples
	p = size(Fdata.ii_ims,1);
	% Labels
	ys = [ones(1,p) zeros(1,m)];
	% Initialize weights
	w(1,1:p) = (2*p)^-1;
	w(1,p+1:p+m) = (2*m)^-1;
    % Efficient way
        for j = 1:size(FTdata.fmat, 2)
            feat_j = [Fdata.ii_ims * FTdata.fmat(:,j);NFdata.ii_ims * FTdata.fmat(:,j)];
        end
        
    for t = 1:T
		% Normalize weights
		w(t,:) = w(t,:) / sum(w(t,:));

		lowestErr = 0;
		feature = 0;
		threshold = 0;
		par = 0;
		response = [];
		for j = 1:size(FTdata.fmat, 2)
% -------------------------------------------------------
% Fkn LearnWeakClassifier
% -------------------------------------------------------                        
    %function [theta, p, err] = LearnWeakClassifier(ws, fs, ys)
    a = w(t,:) .* ys;
    b = w(t,:) .* (1-ys);
	mu_p = sum(a .* feat_j') / sum(a);
	mu_n = sum(b .* feat_j') / sum(b);

	theta = .5 * (mu_p + mu_n);

    % p = -1
	errs(1) = sum(w(t,:) .* abs(ys - (-1.*feat_j' < -theta)));
    % p = 1
	errs(2) = sum(w(t,:) .* abs(ys - (1.*feat_j' < theta)));

	[err, ind] = min(errs);

	p = sign(ind - 1.1);  

% -------------------------------------------------------
            
			% Update parameters of optimal feature if necessary
			if j == 1
				lowestErr = err;
				feature = j;
				threshold = theta;
				par = p;
				response = feat_j;
			else
				if err < lowestErr
					lowestErr = err;
					feature = j;
					threshold = theta;
					par = p;
					response = feat_j;
				end
            end
        end

		% Set optimal parameters to the parameters of this iteration
		Cparams.Thetas(t,1) = feature; 
		Cparams.Thetas(t,2) = threshold;
		Cparams.Thetas(t,3) = par;

		beta = lowestErr / (1-lowestErr);

		% Update weights
		h = par * response < par * threshold;
		w(t+1,:) = w(t,:) .* beta .^ (1 - abs(h' - ys));

		Cparams.alphas(t) = log(1/beta);

	end

end
