function all_ftypes = EnumAllFeatures(W, H,ftype)
all_ftypes = zeros(50000,5);
index = 1;

% ----------------------------
if (ftype == 1)
% ----------------------------
% Why start in 2? ******
% Width is constant.
for w = 1:W-2
    % Height is splitted in 2 parts.
    for h = 1:floor(H/2)-2        
        for x = 2:W-w
            % y starts in 2 and it stops where h can no longer be splitted
            % in two            
            for y = 2:H-2*h
                % Put the instance
                all_ftypes(index,:) = [ftype,x,y,w,h];
                % Add one to the index.
                index=index+1;
            end
        end        
    end
end

% ----------------------------
else if ftype == 2
% ----------------------------
% Why start in 2?
% Width splits in 2 parts.
for w = 1:floor(W/2)-2
    % Height is constant.
    for h = 1:H-2
        % x starts in 2 and it stops where w can no longer be splitted
        % in two
        for x = 2:W-2*w
            % Same for y but only where h fits.
            for y = 2:H-h
                % Put the instance
                all_ftypes(index,:) = [ftype,x,y,w,h];
                % Add one to the index.
                index=index+1;
            end
        end        
    end
end
    
% ----------------------------
    else if ftype == 3
% ----------------------------
% Why start in 2?
% Width splits in 2 parts.
for w = 1:floor(W/3)-2
    % Height is constant.
    for h = 1:H-2
        % x starts in 2 and it stops where w can no longer be splitted
        % in two
        for x = 2:W-3*w
            % Same for y but only where h fits.
            for y = 2:H-h
                % Put the instance
                all_ftypes(index,:) = [ftype,x,y,w,h];
                % Add one to the index.
                index=index+1;
            end
        end        
    end
end

% ----------------------------
        else if ftype == 4
% ----------------------------
% Why start in 2?
% Width splits in 2 parts.
for w = 1:floor(W/2)-2
    % Height is constant.
    for h = 1:floor(H/2)-2
        % x starts in 2 and it stops where w can no longer be splitted
        % in two
        for x = 2:W-2*w
            % Same for y.
            for y = 2:H-2*h
                % Put the instance
                all_ftypes(index,:) = [ftype,x,y,w,h];
                % Add one to the index.
                index=index+1;
            end
        end        
    end
end
            end
        end
    end
end
%b= all_ftypes(find(all_ftypes(1) ~= 0));
% Remove one to the index as it will have +1 at the last instance.
all_ftypes = all_ftypes(1:index-1,:);
end