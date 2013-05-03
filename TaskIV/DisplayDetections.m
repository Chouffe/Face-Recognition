function DisplayDetections(im, dets)
% just a test
I = imread(im);
 
 
figure(); imagesc(I); axis equal;
detectedFaceNumber = size(dets,1);
 
for i = 1:detectedFaceNumber
 
    x = dets(i, 1)-0.5;
    y = dets(i, 2)-0.5;
    w = dets(i, 3)+0.5;
    h = dets(i, 4)+0.5;
    rectangle('Position',[x, y, w, h],'EdgeColor', 'r');
    % % Wrong ploting
    % rectangle('Position',[x - w/2, y + h/2, w, h],'EdgeColor', 'b');
end
 
end

