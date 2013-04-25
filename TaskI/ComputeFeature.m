function fs = ComputeFeature(ii_ims, ftype)
n = length(ii_ims);
fs = zeros(1,n);
type = ftype(1);
x = ftype(2);
y = ftype(3);
w = ftype(4);
h = ftype(5);
% ----------------------------
if (type==1)
% ----------------------------
    for i = 1:n
        % Reshape the ii_ims:i
        ii_im = reshape(ii_ims(i,:,:), size(ii_ims(i,:,:),2),size(ii_ims(i,:,:),3));
        % Compute the ftype feature        
        fs(i) = FeatureTypeI(ii_im,x,y,w,h);
    end
% ----------------------------
else if (type ==2)
% ----------------------------
    for i = 1:n
        % Reshape the ii_ims:i
        ii_im = reshape(ii_ims(i,:,:), size(ii_ims(i,:,:),2),size(ii_ims(i,:,:),3));
        % Compute the ftype feature
        fs(i) = FeatureTypeII(ii_im,x,y,w,h);
    end
% ----------------------------
    else if (type ==3)
% ----------------------------
    for i = 1:n
        % Reshape the ii_ims:i
        ii_im = reshape(ii_ims(i,:,:), size(ii_ims(i,:,:),2),size(ii_ims(i,:,:),3));
        % Compute the ftype feature
        fs(i) = FeatureTypeIII(ii_im,x,y,w,h);
    end
% ----------------------------
        else if (type == 4)
% ----------------------------
    for i = 1:n
        % Reshape the ii_ims:i
        ii_im = reshape(ii_ims(i,:,:), size(ii_ims(i,:,:),2),size(ii_ims(i,:,:),3));
        % Compute the ftype feature
        fs(i) = FeatureTypeIV(ii_im,x,y,w,h);
    end
% ----------------------------
% ends of end else                
            end
        end
    end
end
% ----------------------------
end