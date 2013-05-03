function fdets = PruneDetections(dets)
    
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
nd = size(dets,1);
=======
nd = size(dets,2);
>>>>>>> Added PruneDetections
=======
nd = size(dets,1);
>>>>>>> Changed and Fixed PruneDetections and DisplayDetections
=======
nd = size(dets,2);
>>>>>>> Added PruneDetections
=======
nd = size(dets,1);
>>>>>>> Changed and Fixed PruneDetections and DisplayDetections
D = zeros(nd, nd);

for i = 1:nd

<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> Changed and Fixed PruneDetections and DisplayDetections
=======
>>>>>>> Changed and Fixed PruneDetections and DisplayDetections
    xi = dets(i, 1);
    yi = dets(i, 2);
    wi = dets(i, 3);
    hi = dets(i, 4);
<<<<<<< HEAD
<<<<<<< HEAD
=======
=======
>>>>>>> Added PruneDetections
    xi = dets(1, i);
    yi = dets(2, i);
    wi = dets(3, i) - xi;
    hi = dets(4, i) - yi;
<<<<<<< HEAD
>>>>>>> Added PruneDetections
=======
>>>>>>> Changed and Fixed PruneDetections and DisplayDetections
=======
>>>>>>> Added PruneDetections
=======
>>>>>>> Changed and Fixed PruneDetections and DisplayDetections
    A = [xi, yi, wi, hi];

    for j = 1:nd

<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> Changed and Fixed PruneDetections and DisplayDetections
=======
>>>>>>> Changed and Fixed PruneDetections and DisplayDetections
        xj = dets(j, 1);
        yj = dets(j, 2);
        wj = dets(j, 3);
        hj = dets(j, 4);
<<<<<<< HEAD
<<<<<<< HEAD
=======
=======
>>>>>>> Added PruneDetections
        xj = dets(1, j);
        yj = dets(2, j);
        wj = dets(3, j) - xj;
        hj = dets(4, j) - yj;
<<<<<<< HEAD
>>>>>>> Added PruneDetections
=======
>>>>>>> Changed and Fixed PruneDetections and DisplayDetections
=======
>>>>>>> Added PruneDetections
=======
>>>>>>> Changed and Fixed PruneDetections and DisplayDetections
        B = [xj, yj, wj, hj];

        if rectint(A, B)
            D(i, j) = 1;
        end

    end
end

<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
[S, C] = graphconncomp(sparse(D));

fdets = zeros(S, 4);
total = zeros(S);

for k = 1:length(C)

    total(C(k)) = total(C(k)) + 1;

    fdets(C(k), 1) = fdets(C(k), 1) + dets(C(k), 1);
    fdets(C(k), 2) = fdets(C(k), 2) + dets(C(k), 2);
    fdets(C(k), 3) = fdets(C(k), 3) + dets(C(k), 3);
    fdets(C(k), 4) = fdets(C(k), 4) + dets(C(k), 4);
=======
[S, C] = graphconncomp(sparse(D))
=======
[S, C] = graphconncomp(sparse(D));
>>>>>>> ScanImageOverScale done, part IV done, check that out

fdets = zeros(S, 4);
total = zeros(S);

for k = 1:length(C)

    total(C(k)) = total(C(k)) + 1;

<<<<<<< HEAD
=======
[S, C] = graphconncomp(sparse(D))

fdets = zeros(S, 4);
total = zeros(S);

for k = 1:length(C)

    total(C(k)) = total(C(k)) + 1;

<<<<<<< HEAD
>>>>>>> Added PruneDetections
    fdets(1, C(k)) = fdets(1, C(k)) + dets(1, C(k));
    fdets(2, C(k)) = fdets(2, C(k)) + dets(2, C(k));
    fdets(3, C(k)) = fdets(3, C(k)) + dets(3, C(k));
    fdets(4, C(k)) = fdets(4, C(k)) + dets(4, C(k));
<<<<<<< HEAD
>>>>>>> Added PruneDetections
=======
=======
>>>>>>> Changed and Fixed PruneDetections and DisplayDetections
    fdets(C(k), 1) = fdets(C(k), 1) + dets(C(k), 1);
    fdets(C(k), 2) = fdets(C(k), 2) + dets(C(k), 2);
    fdets(C(k), 3) = fdets(C(k), 3) + dets(C(k), 3);
    fdets(C(k), 4) = fdets(C(k), 4) + dets(C(k), 4);
<<<<<<< HEAD
>>>>>>> Changed and Fixed PruneDetections and DisplayDetections
=======
>>>>>>> Added PruneDetections
=======
>>>>>>> Changed and Fixed PruneDetections and DisplayDetections
    
end

for l = 1:S
    for m = 1:4
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
        fdets(l,m) = fdets(l,m) / total(l);
=======
        fdets(m,l) = fdets(m,l) / total(l);
>>>>>>> Added PruneDetections
=======
        fdets(l,m) = fdets(l,m) / total(l);
>>>>>>> Changed and Fixed PruneDetections and DisplayDetections
=======
        fdets(m,l) = fdets(m,l) / total(l);
>>>>>>> Added PruneDetections
=======
        fdets(l,m) = fdets(l,m) / total(l);
>>>>>>> Changed and Fixed PruneDetections and DisplayDetections
    end
end

end

