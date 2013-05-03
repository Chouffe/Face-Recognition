function dets = ScanImageOverScale(Cparams, im, min_s, max_s, step_s)
    
for s = min_s:step_s:max_s

    scaled_im = imresize(im, s);
    s_dets = ScanImageFixedSize(Cparams, scaled_im);
    s_fdets = PruneDetections(s_dets);

    % Convert the x_scaled and y_scaled into original values
    dets = [dets, round((1/s) * s_fdets)];

end

% Is it useful here? ---> Yep
dets = PruneDetections(dets);

end
