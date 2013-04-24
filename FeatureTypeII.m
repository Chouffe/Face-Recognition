function f = FeatureTypeII(ii_im, x, y, w, h)
    f = ComputeBoxSum(ii_im,x+w,y,w,h)-ComputeBoxSum(ii_im,x,y,w,h);
end