function [scimages, dets] = ScanImageOverScale(Cparams, im, min_s, max_s, step_s, scimages, classifier_index)
 
% Image processing
I = imread(im);
if size(I,3) == 3
    I = rgb2gray(I);
end
I = double(I);
 
 
% Scale
sc = 1;
dets = [];
 
for s = min_s:step_s:max_s
    % Scale the image
    scaled_im = imresize(I, s);
    
    % Search for faces on the scaled image
    % scimages = Integral images
    [scimages{sc}, s_dets] = ScanImageFixedSize(Cparams, scaled_im, classifier_index );
    % Prune the faces
    s_fdets = s_dets;
    % s_fdets = PruneDetections(s_dets);
    
    sc_vector = ones(size(s_fdets,1),1) * sc;
 
    % ---------------------- %
    %      dets format       %
    % ---------------------- %
    % dets(1) = x            %
    % dets(2) = y            %
    % dets(3) = L (w)        %
    % dets(4) = L (h)        %
    % dets(5) = mean         %
    % dets(6) = stdv         %
    % dets(7) = scale_index  %
    % ---------------------- %
    
    dets = [dets; s_fdets, sc_vector];
    sc = sc + 1;
 
end

end
