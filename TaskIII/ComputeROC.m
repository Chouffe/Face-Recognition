function ComputeROC(Cparams, Fdata, NFdata)

% Get the test images.
face_fnames = dir(Fdata.dirname);
index = 3:length(face_fnames);
face_test_index = setdiff(index,Fdata.fnums);

% Store the values of scores.
scores_faces = zeros(1,length(face_test_index));

% To access the test images we do
for i=1:length(face_test_index)
    % Choose filename
    im_fname = [Fdata.dirname, face_fnames(face_test_index(i)).name];
    % ----------------
    % Load data
    % ----------------
    [im, ii_im] = LoadIm(im_fname);
    
    % Apply detector
    scores_faces(i) = ApplyDetector(Cparams, ii_im);
    
end

% Get the test images.
face_fnames = dir(NFdata.dirname);
index = 3:length(face_fnames);
Nface_test_index = setdiff(index,NFdata.fnums);

% Store the values of scores for non faces
scores_Nfaces = zeros(1,length(Nface_test_index));

% To access the test images we do
for i=1:length(Nface_test_index)
    % Choose filename
    im_fname = [NFdata.dirname, face_fnames(Nface_test_index(i)).name];
    % ----------------
    % Load data
    % ----------------
    [im, ii_im] = LoadIm(im_fname);
    
    % Apply detector
    scores_Nfaces(i) = ApplyDetector(Cparams, ii_im);
    
end

start = min([scores_faces,scores_Nfaces]);
stop = max([scores_faces,scores_Nfaces]);

STEPS = 2000;
tpr = zeros(STEPS,1);
fpr = zeros(STEPS,1);
i = 1;
np = length(scores_faces);
nn = length(scores_Nfaces);
thresholds = linspace(start,stop,STEPS);
for thresh = thresholds
    
    % Number of true positives
    tpr(i) = sum(scores_faces >= thresh) / (np);   
        
    % Number of false positives
    fpr(i) = sum(scores_Nfaces >= thresh) / (nn);
    
    % Update i
    i=i+1;
    
    
end
plot(fpr,tpr)
xlabel('fpr')
ylabel('tpr')
axis([-0.01,1,0,1.01])

% % Debug for tpr
% figure()
% plot(linspace(start,stop,STEPS),tpr)
% hold on
% % Debug for fpr
% plot(linspace(start,stop,STEPS),fpr,'r')
% hold off
% legend('True positive rate', 'False positive rate')


Cparams.thresh = thresholds(find(tpr < 0.7,1)-1);

end