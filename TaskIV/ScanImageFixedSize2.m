function dets = ScanImageFixedSize(Cparams, im)

% Do image procesing

rgb_I = imread(im);
I = rgb2gray(rgb_I);
% figure, imshow(I);
I = double(I);

% No normalization
im = I;

X = size(im,1);
Y = size(im,2);
L = 19;
squared_im = im .* im;
dets = [];

for x = 1:X-L
    for y = 1:Y-L

        % size(squared_im);
        mu = (1/L^2)*sum(sum(im(x:x+L-1,y:y+L-1)));
        sigma = sqrt((1/(L^2 - 1))*(sum(sum(squared_im(x:x+L-1,y:y+L-1))) -L^2 *mu^2));

        % F1 = (1 / sigma) * FeatureTypeI(im, x, y, L, L)
        % F2 = (1 / sigma) * FeatureTypeII(im, x, y, L, L)
        % F3 = (1 / sigma) * FeatureTypeIII(im, x, y, L, L)
        % F4 = (1 / sigma) * FeatureTypeIV(im, x, y, L, L)

        % sc = ApplyDetector(Cparams, (1 / sigma) * im(x:x+L-1,y:y+L-1));
        sc = ApplyDetectorAdapted(Cparams, im(x:x+L-1,y:y+L-1), sigma, mu, L);

        % Replace following threshold by the Cparams.thresh once saved
        threshold = Cparams.thresh;
        threshold = 4.5;
        % keep only the detected faces

        if sc > threshold
            dets = [dets; [x,y,L,L]];
            sc
            %dets = [dets, [x y L L]'];
        end
    end
end

end

