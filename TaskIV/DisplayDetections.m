function DisplayDetections(im, dets)

I = imread(im);

figure, imshow(I);
<<<<<<< HEAD

detectedFaceNumber = size(dets,2);
=======
detectedFaceNumber = size(dets,1);
>>>>>>> Changed and Fixed PruneDetections and DisplayDetections

for i = 1:detectedFaceNumber

    x = dets(i, 1);
    y = dets(i, 2);
    w = dets(i, 3);
    h = dets(i, 4);

    rectangle('Position',[x, y, w, h],'EdgeColor', 'r');
end

end
