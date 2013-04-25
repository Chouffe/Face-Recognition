function fpic = MakeFeaturePic(ftype, W, H);

	fpic = zeros(W,H);
	x = ftype(2);
	y = ftype(3);
	w = ftype(4);
	h = ftype(5);

	switch ftype(1)

		case 1
			fpic(y:y+h-1,x:x+w-1) = -1;
			fpic(y+h:y+2*h-1,x:x+w-1) = 1;

		case 2
			fpic(y:y+h-1,x:x+w-1) = 1;
			fpic(y:y+h-1,x+w:x+2*w-1) = 1;

		case 3
			fpic(y:y+h-1,x:x+w-1) = 1;
			fpic(y:y+h-1,x+w:x+2*w-1) = -1;
			fpic(y:y+h-1,x+2*w:x+3*w-1) = 1;

		case 4
			fpic(y:y+h-1,x:x+w-1) = 1;
			fpic(y+h:y+2*h-1,x:x+w-1) = -1;
			fpic(y:y+h-1,x+w:x+2*w-1) = -1;
			fpic(y+h:y+2*h-1,x+w:x+2*w-1) = 1;
		otherwise
	end

end
