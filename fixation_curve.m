function phi = fixation_curve(a,b,c,d,w)

ratio = 0:0.02:1;

N = 100;

phi = zeros(size(ratio));

for k = 1:length(ratio)

    i0 = round(ratio(k)*N);

    phi(k) = fixation_probability_evolutionary_game_theory(a,b,c,d,w,i0);

end

end