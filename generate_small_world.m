function adj = generate_small_world(N,K,p)

% Watts-Strogatz small-world network
% N : number of nodes
% L : number of edges
% adj : adjacency matrix


if mod(K,2)~=0
    error('K must be even');
end



adj = zeros(N);



for i = 1:N
    
    for j = 1:K/2
        
        % clockwise
        neighbor = mod(i-1+j,N)+1;
        
        adj(i,neighbor)=1;
        adj(neighbor,i)=1;
        
        % counter-clockwise
        neighbor = mod(i-1-j,N)+1;
        
        adj(i,neighbor)=1;
        adj(neighbor,i)=1;
        
    end
    
end



for i = 1:N
    
    for j = 1:K/2
        
        old_neighbor = mod(i-1+j,N)+1;
        
        
        if rand < p
            
            % 删除原边
            adj(i,old_neighbor)=0;
            adj(old_neighbor,i)=0;
            
            
            % 找可连接的新节点
            possible = find(adj(i,:)==0);
            
            % 去掉自己
            possible(possible==i)=[];
            
            
            % 去掉已有边
            new_neighbor = possible(randi(length(possible)));
            
            
            % 添加新边
            adj(i,new_neighbor)=1;
            adj(new_neighbor,i)=1;
            
        end
        
    end
    
end


end