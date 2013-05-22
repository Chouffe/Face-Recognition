function dets = ApplyClassifier(in_dets, scimages, Cparams, classifier_index)
    
    dets = [];

    for i=1:size(in_dets,1)

        s = in_dets(i,7);
        ii_im = scimages{s};
        X = size(ii_im,2);
        Y = size(ii_im,1);
        x = in_dets(i, 1)-0.5;
        y = in_dets(i, 2)-0.5;
        w = in_dets(i, 3);
        h = in_dets(i, 4);
        L = w;
        u = in_dets(i,5);
        o = in_dets(i,6);
        patch = ii_im(y:y+L-1,x:x+L-1);

        % Score
        sc = 0;
        % 1 to the number of features
        for t = 1:classifier_index
            
            % Get w and h from the feature.
            w = Cparams.all_ftypes(Cparams.Thetas(t,1),4);        
            h = Cparams.all_ftypes(Cparams.Thetas(t,1),5);
            
            % Get the type of feature.
            type = Cparams.all_ftypes(Cparams.Thetas(t,1),1);
            
            % Feature response                    
            switch type
                case 3              
                    feature = ( Cparams.fmat(:,Cparams.Thetas(t,1))  + u*w*h ) / o;
                    f = patch(:)' * ( feature );                                
                otherwise
                    f =  patch(:)' * ( Cparams.fmat(:,Cparams.Thetas(t,1)) / o) ;
             end
            % Parity
            p = Cparams.Thetas(t,3);
            % threshold
            theta = Cparams.Thetas(t,2);
            % score
            sc = sc + Cparams.alphas(t) * (p.*f < p*theta);
        end
            % Is it a face?
            if (sc>Cparams.thresh(classifier_index))
              % Keep it as a face  
              dets = [dets;[x,y,L,L,mu,o,s]];
            end 
        end
    end
end
