function f = FeatureTypeI(ii_im, x, y, w, h)
    f = ComputeBoxSum(ii_im,x,y,w,h) - ComputeBoxSum(ii_im,x,y+h,w,h);
end