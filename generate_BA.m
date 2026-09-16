function adj = generate_BA(N,L)


% Barabasi-Albert network
% N : number of nodes
% L : number of edges
% adj : adjacency matrix


avg_degree = 2*L/N;

m = round(avg_degree/2);


if m < 1
    error('Edge number is too small');
end



N0=m+1;

adj=zeros(N);


for i=1:N0

    for j=i+1:N0

        adj(i,j)=1;
        adj(j,i)=1;

    end

end



current_edges = sum(adj(:))/2;



for new_node=N0+1:N


    degree=sum(adj,2);


    existing=1:new_node-1;


    prob=degree(existing)/sum(degree(existing));


    targets=[];


    while length(targets)<m


        r=rand;

        cumulative=cumsum(prob);

        target=existing(find(cumulative>=r,1));


        if ~ismember(target,targets)

            targets=[targets,target];

        end

    end



    for j=1:m

        target=targets(j);

        adj(new_node,target)=1;

        adj(target,new_node)=1;

    end



end



current_edges=sum(adj(:))/2;




while current_edges<L


    i=randi(N);
    j=randi(N);


    if i~=j && adj(i,j)==0

        adj(i,j)=1;
        adj(j,i)=1;

        current_edges=current_edges+1;

    end

end




while current_edges>L


    i=randi(N);
    j=randi(N);


    if adj(i,j)==1

        adj(i,j)=0;
        adj(j,i)=0;

        current_edges=current_edges-1;

    end

end



end