function DisplayDetections(im, dets,min_s, max_s, step_s)
% just a test
I = imread(im);
 
 
figure(); imagesc(I); axis equal;
detectedFaceNumber = size(dets,1);
 
scales = min_s:step_s:max_s;

for i = 1:detectedFaceNumber
    
    ratio = scales(dets(i,7));
    x = floor(dets(i, 1) / ratio ) -0.5;
    y = floor(dets(i, 2) / ratio ) -0.5;
    w = floor(dets(i, 3) / ratio ) ;
    h = floor(dets(i, 4) / ratio ) ;
    rectangle('Position',[x, y, w, h],'EdgeColor', 'r');
    % % Wrong ploting
    % rectangle('Position',[x - w/2, y + h/2, w, h],'EdgeColor', 'b');
end
 
end

