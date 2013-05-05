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
    nf = size(Fdata.fnums,2);
    nNf = size(NFdata.fnums,2);
    feat_j = zeros(nf+nNf,1);
	for t = 1:T

		% Normalize weights
		w(t,:) = w(t,:) / sum(w(t,:));

		lowestErr = 0;
		feature = 0;
		threshold = 0;
		par = 0;
		response = [];
		for j = 1:size(FTdata.fmat, 2)
            % Fdata.ii_ims*Fdata.fmat(:,j) similar to
            % VecComputeFeature(ii_ims, fmat(:,j).
			feat_j(1:nf) = Fdata.ii_ims * FTdata.fmat(:,j);
            feat_j(nf+1:nf+nNf) = NFdata.ii_ims * FTdata.fmat(:,j);
            % Train the classifier.
			[theta, p, err] = LearnWeakClassifier(w(t,:),feat_j',ys);

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
