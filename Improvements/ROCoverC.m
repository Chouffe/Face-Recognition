function [fpr,tpr] = ROCoverC(Cparams)


C = length(Cparams.alphas);

Fdata = load('FaceData.mat');
NFdata = load('NonFaceData.mat');
% Size of Non Face data
n = length(NFdata.fnums);
% Size of Face data
p = length(Fdata.fnums);

% Threshold vector
thresh = zeros(1,C);    

counter = 1;
nscores = zeros(1,n);
pscores = zeros(1,p);


STEPS = 2000;
tpr = zeros(C, STEPS);
fpr = zeros(C, STEPS);

for c = 1:C
    
    for i = 1:p
        % Get integral image
        ii_im = Fdata.ii_ims(i,:);
    % Get Score
    % -------------------------------------------------------
    	% Feature response
        f = ii_im(:)' * Cparams.fmat(:,Cparams.Thetas(c,1));
		% Parity
        p = Cparams.Thetas(c,3);
        % threshold
		theta = Cparams.Thetas(c,2);
        % score
		pscores(i) = pscores(i) + Cparams.alphas(c) * (p.*f < p*theta)
    % -------------------------------------------------------
    end
    
    
    for i = 1:n
        % Get integral image
        ii_im = NFdata.ii_ims(i,:);
    % Get Score
    % -------------------------------------------------------
    	% Feature response
        f = ii_im(:)' * Cparams.fmat(:,Cparams.Thetas(c,1));
		% Parity
        p = Cparams.Thetas(c,3);
        % threshold
		theta = Cparams.Thetas(c,2);
        % score
		nscores(i) = nscores(i) + Cparams.alphas(c) * (p.*f < p*theta);
    % -------------------------------------------------------
    end
       
    % Loop over T
    
    start = min([nscores,pscores]);
    stop = max([nscores,pscores]);
    
    % Counter
    i = 1;
    thresholds = linspace(start,stop,STEPS);
    for t = thresholds    
        % Number of true positives
        tpr(c,i) = sum(pscores >= t) / (p);   
      
        % Number of false positives
        fpr(c,i) = sum(nscores >= t) / (n);
    
        % Update i
        i=i+1;    
    end
    if (mod(c,10)==0)        
        figure()
        plot(fpr(c,:),tpr(c,:))
        xlabel('fpr')
        ylabel('tpr')
        axis([-0.01,1,0,1.01])
    end    
    
end