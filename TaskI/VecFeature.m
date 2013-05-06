function ftype_vec = VecFeature(ftype, W, H)
%Get the info.
type = ftype(1);
x = ftype(2);
y = ftype(3);
w = ftype(4);
h = ftype(5);
% Similar to FeatureTypeI, II, III and IV.
switch type
    case 1
        ftype_vec = VecBoxSumSparse(x,y,w,h,W,H) - VecBoxSumSparse(x,y+h,w,h,W,H);        
    case 2
        ftype_vec = VecBoxSumSparse(x+w,y,w,h,W,H)-VecBoxSumSparse(x,y,w,h,W,H);
    case 3
        ftype_vec = VecBoxSumSparse(x+w,y,w,h,W,H) - VecBoxSumSparse(x+2*w,y,w,h,W,H) - VecBoxSumSparse(x,y,w,h,W,H);
    case 4
        f = VecBoxSumSparse(x,y+h,w,h,W,H) + VecBoxSumSparse(x+w,y,w,h,W,H);
        ftype_vec = f - VecBoxSumSparse(x+w,y+h,w,h,W,H) - VecBoxSumSparse(x,y,w,h,W,H);        
end
end