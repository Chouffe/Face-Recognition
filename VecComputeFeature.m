function fs = VecComputeFeature(ii_ims, ftype_vec)
n = length(ii_ims);
fs = zeros(n,1);

% ----------------------------------
    % Doesnt matter which case is it
    % It is always the same.
% ----------------------------------
    for i = 1:n
        % Reshape the ii_ims:i
        ii_im = reshape(ii_ims(i,:,:), size(ii_ims(i,:,:),2),size(ii_ims(i,:,:),3));
        % Compute the ftype feature        
        fs(i) = ii_im(:)'*ftype_vec;
    end    
end