function dets = ScanImageOverScale(Cparams, im, min_s, max_s, step_s)
 
% Image processing
I = imread(im);
if size(I,3) == 3
    I = rgb2gray(I);
end
I = double(I);
 
 
dets = [];
 
for s = min_s:step_s:max_s
    % Scale the image
    scaled_im = imresize(I, s);
    % Search for faces on the scaled image
    s_dets = ScanImageFixedSize(Cparams, scaled_im);
    % Prune the faces
    s_fdets = PruneDetections(s_dets);
 
    % Rescale the results.
    for k = 1:size(s_fdets, 1)
        s_fdets(k,1) = round(s_fdets(k,1) / (s));
        s_fdets(k,2) = round(s_fdets(k,2) / (s));
        s_fdets(k,3) = round(s_fdets(k,3) / (s));
        s_fdets(k,4) = round(s_fdets(k,4) / (s));
    end
 
    dets = [dets; s_fdets];
 
end
%dets = PruneDetections(dets);
end
