function DisplayDetections(im, dets)

I = imread(im);

figure, imshow(I);
detectedFaceNumber = size(dets,1);

for i = 1:detectedFaceNumber

    x = dets(i, 1);
    y = dets(i, 2);
    w = dets(i, 3);
    h = dets(i, 4);

    rectangle('Position',[x, y, w, h],'EdgeColor', 'r');
end

end
