function dets = ScanImageOverScale(Cparams, im, min_s, max_s, step_s)
<<<<<<< HEAD

% Image processing
I = imread(im);
if size(I,3) == 3
    I = rgb2gray(I);
end
I = double(I);


dets = [];
 
for s = min_s:step_s:max_s

    scaled_im = imresize(I, s);
    s_dets = ScanImageFixedSize(Cparams, scaled_im);
    s_fdets = PruneDetections(s_dets);

    for k = 1:size(s_fdets, 1)
        s_fdets(k,1) = round(s_fdets(k,1) / sqrt(s));
        s_fdets(k,2) = round(s_fdets(k,2) / sqrt(s));
        s_fdets(k,3) = round(s_fdets(k,3) / sqrt(s));
        s_fdets(k,4) = round(s_fdets(k,4) / sqrt(s));
    end

    dets = [dets; s_fdets];

end

end
=======
    
for s = min_s:step_s:max_s

    scaled_im = imresize(im, s);
    s_dets = ScanImageFixedSize(Cparams, im);
    s_fdets = PruneDetections(s_dets);
    % TODO
    % Need to convert it on a detection on the original step
    dets = [dets, s_fdets];

end

dets = PruneDetections(dets);
>>>>>>> Started ScanImageOverScale
