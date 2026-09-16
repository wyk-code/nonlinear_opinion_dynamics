function A=generate_pairwise_ER(N,L)

% ER
% N : number of nodes
% L : number of edges
% adj : adjacency matrix

% ---------- Step 1: 生成随机生成树（保证无孤立点） ----------
perm = randperm(N);
edges = zeros(N-1, 2);

for k = 2:N
    i = perm(k);
    j = perm(randi(k-1));
    edges(k-1, :) = [i, j];
end

% 当前边数
edgeCount = N - 1;

% ---------- Step 2: 随机补边 ----------
A = zeros(N, N);
for k = 1:edgeCount
    i = edges(k,1);
    j = edges(k,2);
    A(i,j) = 1;
    A(j,i) = 1;
end

while edgeCount < L
    i = randi(N);
    j = randi(N);
    if i ~= j && A(i,j) == 0
        A(i,j) = 1;
        A(j,i) = 1;
        edgeCount = edgeCount + 1;
    end
end


