function DisplayDetections(im, dets)
% just a test
I = imread(im);

figure, imagesc(I); axis equal;

detectedFaceNumber = size(dets,1);

for i = 1:detectedFaceNumber

    x = dets(i, 1);
    y = dets(i, 2);
    w = dets(i, 3);
    h = dets(i, 4);
    rectangle('Position',[x, y, w, h],'EdgeColor', 'r');
    % % Wrong ploting
    % rectangle('Position',[x - w/2, y + h/2, w, h],'EdgeColor', 'b');
end

end
