function thresh = CalculateAllThresholds(Cparams100)


Fdata = load('FaceData.mat');
NFdata = load('NonFaceData.mat');
thresh = zeros(1,100);
    
for i = 1:100        
    % Get the alphas
    alphas = Cparams100.alphas(1:i);

    % Get the thetas
    thetas = Cparams100.Thetas(1:i,:);

    % Create a new Cparams
    Cparams = struct('alphas', alphas, 'Thetas', thetas, 'fmat', Cparams100.fmat, 'all_ftypes', Cparams100.all_ftypes);        
    
    % Get the thresh
    thresh(i) = ComputeROC(Cparams,Fdata,NFdata);
    i
    
end