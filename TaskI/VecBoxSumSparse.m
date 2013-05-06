function b_vec = VecBoxSumSparse(x, y, w, h, W, H)    
%b_vec = zeros(H,W); 
% (x-1) !=0
if x ==1
    % (y-1) != 0
    if y ==1
        % 4
        i = [y+h-1];
        j = [x+w-1];
        s = [1];
        m = H;
        n = W;
        b_vec = sparse(i,j,s,m,n);
    else 
        % 4 - 2
        i = [y+h-1,y-1];
        j = [x+w-1,x+w-1];
        s = [1,-1];
        m = H;
        n = W;
        b_vec = sparse(i,j,s,m,n);        
    end    
else if y ==1
        % 4 - 3
        i = [y+h-1,y+h-1];
        j = [x+w-1,x-1];
        s = [1,-1];
        m = H;
        n = W;
        b_vec = sparse(i,j,s,m,n);     
    else
        % 4+1 - 2-3     
        i = [y+h-1,y-1,y-1,y+h-1];
        j = [x+w-1,x-1,x+w-1,x-1];
        s = [1,1,-1,-1];
        m = H;
        n = W;
        b_vec = sparse(i,j,s,m,n);     
    end
end
% Transform it!
b_vec = b_vec(:);
end