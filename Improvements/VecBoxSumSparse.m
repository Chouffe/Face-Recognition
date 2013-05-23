function b_vec = VecBoxSumSparse(x, y, w, h, W, H)    
% 4+1 - 2-3
i = [y+h-1 ,y ,y    ,y+h-1];
j = [x+w-1 ,x ,x+w-1,x];
s = [1,1,-1,-1];
m = H;
n = W;
b_vec = sparse(i,j,s,m,n);
% Transform it!
b_vec = b_vec(:);
end