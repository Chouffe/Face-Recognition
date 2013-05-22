function opt_indices = GetOptimalIndices(fpr,tpr,epsilon)
c = size(fpr,1);
opt_indices = zeros(1,c);
for i = 1:c
    opt_indices(i) = find(tpr(i,:) < epsilon,1)-1;
    
    start = min([tpr(i,:),fpr(i,:)]);
    stop  = max([tpr(i,:),fpr(i,:)]);

    STEPS = 2000;
    thresholds = linspace(start,stop,STEPS);
end