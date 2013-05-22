function opt_indices = Derivative(fpr,tpr,epsilon)
c = size(fpr,1);
opt_indices = zeros(1,c);
for i = 1:c
    opt_indices(i) = find(tpr(i,:) < epsilon,1)-1;
%     if (isempty(opt_indices(i)))
%         opt_indices(i) = find(tpr(i,:) > epsilon,1);
%     end
    
    
%     start = min([tpr(i,:),fpr(i,:)]);
%     stop  = max([tpr(i,:),fpr(i,:)]);
% 
%     STEPS = 2000;
%     thresholds = linspace(start,stop,STEPS);
%     thresh = thresholds(a);
%     plot(fpr,tpr,'r')
%     line([thresh,thresh],[0,1])
end