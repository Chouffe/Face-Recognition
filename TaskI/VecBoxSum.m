function b_vec = VecBoxSum(x, y, w, h, W, H)    
b_vec = zeros(H,W);    
% (x-1) !=0
if x ==1
    % (y-1) != 0
    if y ==1
        % 4
        % First point (4)
        b_vec( y+h-1,x+w-1 ) = 1;
    else 
        % 4 - 2
        % First point (4)
        b_vec( y+h-1,x+w-1 ) = 1;
        % Third point (-2)
        b_vec( y-1,x+w-1 ) = -1;
    end    
else if y ==1
    % 4 - 3
    % First point (4)
    b_vec( y+h-1,x+w-1 ) = 1;
    % Forth point (-3)
    b_vec( y+h-1,x-1 ) = -1;    
else
    % 4+1 - 2-3        
    % First point (4)
    b_vec( y+h-1,x+w-1 ) = 1;
    % Second point (1)
    b_vec( y-1,x-1 ) =1;
    % Third point (-2)
    b_vec( y-1,x+w-1 ) = -1;
    % Forth point (-3)
    b_vec( y+h-1,x-1 ) = -1;
    end
end
    % Transform it!
    b_vec = b_vec(:);
end