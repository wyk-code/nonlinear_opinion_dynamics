function x_plus = voter_static_polarization(alpha,polarization_initial)
N = 100;

% alpha = 1;

% ER/WS/BA
% adj = generate_pairwise_ER(N,4*N);
% adj = generate_small_world(N,8,0.3);
adj = generate_BA(N,4*N);

% ================= 初始化状态 =================
size_A = randi(polarization_initial);
size_B = polarization_initial - size_A;

vec = [ones(1,size_A), zeros(1,N-size_A-size_B), -ones(1,size_B)];
a_adj = vec(randperm(N));

degree = sum(adj,2);

neighbor = cell(N,1);
for i = 1:N
    neighbor{i} = find(adj(i,:));
end

nodes = 1:N;

nPlus  = nnz(a_adj==1);
nMinus = nnz(a_adj==-1);
nZero  = nnz(a_adj==0);


while true
    a_update = randi(N);
    nei = neighbor{a_update};
    deg = degree(a_update);

    if deg > 0
        states = a_adj(nei);

        nA = nnz(states == 1);
        nB = nnz(states == -1);

        fA = nA / deg;
        fB = nB / deg;
        fC = 1 - fA - fB;
    else
        fA = 0; fB = 0; fC = 0;
    end

    p = rand;

    old = a_adj(a_update);

    if old == 1 || old == -1
        if p <= fC^alpha
            a_adj(a_update) = 0;

            if old == 1
                nPlus = nPlus - 1; nZero = nZero + 1;
            else
                nMinus = nMinus - 1; nZero = nZero + 1;
            end
        end

    else
        if p <= fA^alpha
            a_adj(a_update) = 1;
            nZero = nZero - 1; nPlus = nPlus + 1;
        end
        if p > fA^alpha && p <= fA^alpha + fB^alpha
            a_adj(a_update) = -1;
            nZero = nZero - 1; nMinus = nMinus + 1;
        end
    end

    if nZero == N || nZero == 0
        x_plus = 1 - nZero/N;
        break;
    end
end

end



% parpool('local',10)
% initial_polarization=2:2:98;
% N=100;
% parfor j=1:5000
%     for j1=1:19
%         x_polarization_1(j,j1)=voter_static_polarization(1,initial_polarization(j1));
%         x_polarization_2(j,j1)=voter_static_polarization(2,initial_polarization(j1));
%         x_polarization_5(j,j1)=voter_static_polarization(5,initial_polarization(j1));
%     end
% end
% delete(gcp)
% plot([0,initial_polarization/N,1],[0,mean(x_polarization_1),1],'-o','LineWidth',2,'MarkerSize',8)
% hold on
% plot([0,initial_polarization/N,1],[0,mean(x_polarization_2),1],'-^','LineWidth',2,'MarkerSize',8)
% plot([0,initial_polarization/N,1],[0,mean(x_polarization_5),1],'-*','LineWidth',2,'MarkerSize',8)
% xlabel('$x+y$','Interpreter','latex','FontSize',18)
% ylabel('Polarization probability','Interpreter','latex','FontSize',18)
% title('(c) $\mathrm{BA}$ network','Interpreter','latex','FontSize',18)
% legend({sprintf('Simulation $\\alpha=1$'),sprintf('Simulation $\\alpha=2$'),sprintf('Simulation $\\alpha=5$')},'Interpreter','latex', 'Location','northwest')
% box on
% grid on
% set(gca,'FontSize',16)



% parpool('local',10)
% initial_polarization=2:2:98;
% N=100;
% parfor j=1:5000
%     for j1=1:49
%         x_polarization_1(j,j1)=voter_static_polarization(1,initial_polarization(j1));
%         x_polarization_2(j,j1)=voter_static_polarization(2,initial_polarization(j1));
%         x_polarization_3(j,j1)=voter_static_polarization(3,initial_polarization(j1));
%         x_polarization_4(j,j1)=voter_static_polarization(4,initial_polarization(j1));
%         x_polarization_5(j,j1)=voter_static_polarization(5,initial_polarization(j1));
%         x_polarization_6(j,j1)=voter_static_polarization(6,initial_polarization(j1));
%     end
% end
% delete(gcp)
% 
% polarization1=[0,mean(x_polarization_1),1];
% polarization2=[0,mean(x_polarization_2),1];
% polarization3=[0,mean(x_polarization_3),1];
% polarization4=[0,mean(x_polarization_4),1];
% polarization5=[0,mean(x_polarization_5),1];
% polarization6=[0,mean(x_polarization_6),1];