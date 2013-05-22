function b_vec = VecBoxSumAld(x, y, w, h, W, H)    
b_vec = sparse(zeros(H,W));    

b_vec(y,x) = 1;
b_vec(y+h-1,x+w-1) = 1;
b_vec(y+h-1,x) = -1;
b_vec(y,x+w-1) = -1;

b_vec = b_vec(:);
