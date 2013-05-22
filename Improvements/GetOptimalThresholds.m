function thresholds = GetOptimalThresholds(fpr,tpr,epsilon)
c = size(fpr,1);
thresholds = zeros(1,c);
for i = 1:c
    start = min([tpr(i,:),fpr(i,:)]);
    stop  = max([tpr(i,:),fpr(i,:)]);

    STEPS = 2000;
    threshes = linspace(start,stop,STEPS);
    thresholds(i) = threshes(find(tpr(i,:) < epsilon,1)-1);
end