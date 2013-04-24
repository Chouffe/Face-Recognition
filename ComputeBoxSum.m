function A = ComputeBoxSum(ii_im, x, y, w, h)
% (x-1) !=0
if x ==1
    % (y-1) != 0
    if y ==1
        % 4
        A = ii_im(y+h-1,x+w-1);
    else 
        % 4 - 2
        A = ii_im(y+h-1,x+w-1) -ii_im(y-1,x+w-1);
    end    
else if y ==1
    % 4 - 3
    A = ii_im(y+h-1,x+w-1) -ii_im(y+h-1,x-1);
else
    % 4+1 - 2-3
    A = ii_im(y+h-1,x+w-1) + ii_im(y-1,x-1) - ii_im(y-1,x+w-1)-ii_im(y+h-1,x-1);
    end
end
end