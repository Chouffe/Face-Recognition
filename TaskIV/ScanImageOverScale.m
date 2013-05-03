function dets = ScanImageOverScale(Cparams, im, min_s, max_s, step_s)
    
for s = min_s:step_s:max_s

    scaled_im = imresize(im, s);
    s_dets = ScanImageFixedSize(Cparams, im);
    s_fdets = PruneDetections(s_dets);
    % TODO
    % Need to convert it on a detection on the original step
    dets = [dets, s_fdets];

end

dets = PruneDetections(dets);
