function fmat = VecAllFeatures(all_ftypes, W, H)
nf = length(all_ftypes);
% Define size of fmat.
%fmat = zeros(W*H,nf);
fmat = sparse([],[],[],W*H,nf);
for i = 1:nf
    fmat(:,i) = VecFeature(all_ftypes(i,:),W,H);
end