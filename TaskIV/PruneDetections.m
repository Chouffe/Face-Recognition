function fdets = PruneDetections(dets)
    
nd = size(dets,2);
D = zeros(nd, nd);

for i = 1:nd

    xi = dets(1, i);
    yi = dets(2, i);
    wi = dets(3, i) - xi;
    hi = dets(4, i) - yi;
    A = [xi, yi, wi, hi];

    for j = 1:nd

        xj = dets(1, j);
        yj = dets(2, j);
        wj = dets(3, j) - xj;
        hj = dets(4, j) - yj;
        B = [xj, yj, wj, hj];

        if rectint(A, B)
            D(i, j) = 1;
        end

    end
end

[S, C] = graphconncomp(sparse(D))

fdets = zeros(4, S);
total = zeros(S);

for k = 1:length(C)
    total(C(k)) = total(C(k)) + 1;

    fdets(1, C(k)) = fdets(1, C(k)) + dets(1, C(k));
    fdets(2, C(k)) = fdets(2, C(k)) + dets(2, C(k));
    fdets(3, C(k)) = fdets(3, C(k)) + dets(3, C(k));
    fdets(4, C(k)) = fdets(4, C(k)) + dets(4, C(k));
    
end

for l = 1:S
    for m = 1:4
        fdets(m,l) = fdets(m,l) / total(l);
    end
end

end

