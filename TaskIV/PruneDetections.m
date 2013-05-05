function fdets = PruneDetections(dets)
    
nd = size(dets,1);
D = zeros(nd, nd);

for i = 1:nd

    xi = dets(i, 1);
    yi = dets(i, 2);
    wi = dets(i, 3);
    hi = dets(i, 4);
    A = [xi, yi, wi, hi];

    for j = 1:nd

        xj = dets(j, 1);
        yj = dets(j, 2);
        wj = dets(j, 3);
        hj = dets(j, 4);
        B = [xj, yj, wj, hj];

        if rectint(A, B)
            D(i, j) = 1;
        end

    end
end

[S, C] = graphconncomp(sparse(D));

fdets = zeros(S, 4);
total = zeros(S);

for k = 1:length(C)

    total(C(k)) = total(C(k)) + 1;

    fdets(C(k), 1) = fdets(C(k), 1) + dets(C(k), 1);
    fdets(C(k), 2) = fdets(C(k), 2) + dets(C(k), 2);
    fdets(C(k), 3) = fdets(C(k), 3) + dets(C(k), 3);
    fdets(C(k), 4) = fdets(C(k), 4) + dets(C(k), 4);
    
end

for l = 1:S
    for m = 1:4
        fdets(l,m) = fdets(l,m) / total(l);
    end
end

end