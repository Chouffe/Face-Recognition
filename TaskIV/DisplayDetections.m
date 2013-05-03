function DisplayDetections(im, dets)

I = imread(im);

figure, imshow(I);

detectedFaceNumber = size(dets,2);

for i = 1:detectedFaceNumber

    x = dets(1, i);
    y = dets(2, i);
    w = dets(3, i) - x;
    h = dets(4, i) - y;

    rectangle('Position',[x, y, w, h],'EdgeColor', 'r');
end

end
