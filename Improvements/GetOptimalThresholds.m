function thresholds = GetOptimalThresholds(fpr,tpr,epsilon,start,stop)
c = size(fpr,1);
thresholds = zeros(1,c);
for i = 1:c
    threshes = linspace(start(i),stop(i),2000);    
    temp = threshes(find(tpr(i,:) < epsilon,1)-1);
    if (isempty(temp))
        thresholds(i) = threshes(1);
    else
        thresholds(i) = temp;
    end
    
end