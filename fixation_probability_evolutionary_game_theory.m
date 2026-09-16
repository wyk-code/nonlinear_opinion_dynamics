function phi = fixation_probability_evolutionary_game_theory(a,b,c,d,w,i0)
% Moran process (well-mixed)

N = 100;

gamma = zeros(N-1,1);

for j = 1:N-1

    % fraction of A
    x = j/N;

    piA = ((j-1)*a + (N-j)*b)/(N-1);
    piB = (j*c + (N-j-1)*d)/(N-1);

    % exponential fitness
    fA = exp(w*piA);
    fB = exp(w*piB);

    gamma(j) = fB/fA;

end

prod_gamma = cumprod(gamma);

den = 1 + sum(prod_gamma);

if i0==1
    num = 1;
else
    num = 1 + sum(prod_gamma(1:i0-1));
end

phi = num/den;

end