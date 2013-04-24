function f = FeatureTypeIV(ii_im, x, y, w, h)
    f = ComputeBoxSum(ii_im,x,y+h,w,h) + ComputeBoxSum(ii_im,x+w,y,w,h);
    f = f - ComputeBoxSum(ii_im,x+w,y+h,w,h) - ComputeBoxSum(ii_im,x,y,w,h);
end