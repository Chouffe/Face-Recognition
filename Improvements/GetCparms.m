function Cparams_mod = GetCparms(num_c,Cparams_100, thesholds)

% Create a new Cparams
Cparams_mod = struct('alphas', zeros(1,num_c), 'Thetas', zeros(num_c,3), 'fmat', Cparams_100.fmat, 'all_ftypes', Cparams_100.all_ftypes);

% Get the alphas
alphas = Cparams_100.alphas(1:num_c);

% Get the thetas
thetas = Cparams_100.alphas(1:num_c);

% Set the alphas and thetas
Cparams_mod.alphas = alphas;
Cparams_mod.Thetas = thetas;

% Set the threshold
Cparams_mod.thresh = thresholds(num_c);

end