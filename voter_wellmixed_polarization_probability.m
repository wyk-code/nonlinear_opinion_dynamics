function x_plus = voter_wellmixed_polarization_probability(initial_polarization,alpha)

N = 100;

% size_A = randi(initial_polarization);
size_A = round(initial_polarization/2);
size_B = initial_polarization - size_A;

state = [ones(1,size_A), zeros(1,N-size_A-size_B), -ones(1,size_B)];

state = state(randperm(N));

nPlus  = nnz(state==1);
nMinus = nnz(state==-1);
nZero  = nnz(state==0);

for t = 1:1000000000000

    i = randi(N);

    fA = nPlus/N;
    fB = nMinus/N;
    fC = nZero/N;

    p = rand;

    old = state(i);

    if old==1

        if p<=fC^alpha
            state(i)=0;
            nPlus=nPlus-1;
            nZero=nZero+1;
        end

    elseif old==-1

        if p<=fC^alpha
            state(i)=0;
            nMinus=nMinus-1;
            nZero=nZero+1;
        end

    else

        if p<=fA^alpha
            state(i)=1;
            nZero=nZero-1;
            nPlus=nPlus+1;

        elseif p<=fA^alpha+fB^alpha
            state(i)=-1;
            nZero=nZero-1;
            nMinus=nMinus+1;
        end

    end

    if nZero == N || nZero == 0
        x_plus = 1 - nZero/N;
        break;
    end

end
