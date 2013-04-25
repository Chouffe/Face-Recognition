function b_vec = VecBoxSum(x, y, w, h, W, H)    
    b_vec = zeros(H,W);    
    % First point (4)
    b_vec( y+h-1,x+w-1 ) = 1;
    % Second point (1)
    b_vec( y-1,x-1 ) =1;
    % Third point (-2)
    b_vec( y-1,x+w-1 ) = -1;
    % Forth point (-3)
    b_vec( y+h-1,x-1 ) = -1;
    % Transform it!
    b_vec = b_vec(:);
end