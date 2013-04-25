function cpic = MakeClassifierPic(all_ftypes, chosen_f, alphas, ps, W, H)

	%Weights
	w = alphas .* ps;

	cpic = zeros(H,W);

	%Sum weighted feature pics
	%for i = 1
	for i = 1:length(chosen_f)
		cpic = cpic + w(i) * MakeFeaturePic(all_ftypes(chosen_f(i),:),W,H);
	end
	
end
