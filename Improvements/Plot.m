% Plotting on diff colors

C100 = load('../TaskV/Cparams.mat');
C100 = C100.Cparams;

[fpr,tpr] = ROCoverC(C100);

n = 98;
col=hsv(n);
figure()
xlabel('Fpr')
ylabel('Tpr')
title('ROC curves from 1 to 100 classifiers');
hold on;
for i=2:n
    plot(fpr(i,:),tpr(i,:),'color',col(i,:));
end