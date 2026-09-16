% polarization_ER2=[0,mean(ER2),1];
% polarization_ER4=[0,mean(ER4),1];
% polarization_ER6=[0,mean(ER6),1];
% polarization_WS2=[0,mean(WS2),1];
% polarization_WS4=[0,mean(WS4),1];
% polarization_WS6=[0,mean(WS6),1];
% polarization_BA2=[0,mean(BA2),1];
% polarization_BA4=[0,mean(BA4),1];
% polarization_BA6=[0,mean(BA6),1];


value = 0:0.1:1;

wList = 0.01:0.01:10;

bestLoss = inf;

% [a b c d w_ER2 w_ER4 w_ER6 w_WS2 w_WS4 w_WS6 w_BA2 w_BA4 w_BA6]
bestParameter = zeros(1,13);


for a = value
    for b = value
        for c = value
            for d = value

                %% =====================================================
                %  ER2
                %% =====================================================
                bestLoss_ER2 = inf;
                bestw_ER2 = NaN;

                for w = wList

                    phi = fixation_curve(a,b,c,d,w);

                    loss = sum((phi - polarization_ER2).^2);

                    if loss < bestLoss_ER2
                        bestLoss_ER2 = loss;
                        bestw_ER2 = w;
                    end

                end


                %% =====================================================
                %  ER4
                %% =====================================================
                bestLoss_ER4 = inf;
                bestw_ER4 = NaN;

                for w = wList

                    phi = fixation_curve(a,b,c,d,w);

                    loss = sum((phi - polarization_ER4).^2);

                    if loss < bestLoss_ER4
                        bestLoss_ER4 = loss;
                        bestw_ER4 = w;
                    end

                end


                %% =====================================================
                %  ER6
                %% =====================================================
                bestLoss_ER6 = inf;
                bestw_ER6 = NaN;

                for w = wList

                    phi = fixation_curve(a,b,c,d,w);

                    loss = sum((phi - polarization_ER6).^2);

                    if loss < bestLoss_ER6
                        bestLoss_ER6 = loss;
                        bestw_ER6 = w;
                    end

                end


                %% =====================================================
                %  WS2
                %% =====================================================
                bestLoss_WS2 = inf;
                bestw_WS2 = NaN;

                for w = wList

                    phi = fixation_curve(a,b,c,d,w);

                    loss = sum((phi - polarization_WS2).^2);

                    if loss < bestLoss_WS2
                        bestLoss_WS2 = loss;
                        bestw_WS2 = w;
                    end

                end


                %% =====================================================
                %  WS4
                %% =====================================================
                bestLoss_WS4 = inf;
                bestw_WS4 = NaN;

                for w = wList

                    phi = fixation_curve(a,b,c,d,w);

                    loss = sum((phi - polarization_WS4).^2);

                    if loss < bestLoss_WS4
                        bestLoss_WS4 = loss;
                        bestw_WS4 = w;
                    end

                end


                %% =====================================================
                %  WS6
                %% =====================================================
                bestLoss_WS6 = inf;
                bestw_WS6 = NaN;

                for w = wList

                    phi = fixation_curve(a,b,c,d,w);

                    loss = sum((phi - polarization_WS6).^2);

                    if loss < bestLoss_WS6
                        bestLoss_WS6 = loss;
                        bestw_WS6 = w;
                    end

                end


                %% =====================================================
                %  BA2
                %% =====================================================
                bestLoss_BA2 = inf;
                bestw_BA2 = NaN;

                for w = wList

                    phi = fixation_curve(a,b,c,d,w);

                    loss = sum((phi - polarization_BA2).^2);

                    if loss < bestLoss_BA2
                        bestLoss_BA2 = loss;
                        bestw_BA2 = w;
                    end

                end


                %% =====================================================
                %  BA4
                %% =====================================================
                bestLoss_BA4 = inf;
                bestw_BA4 = NaN;

                for w = wList

                    phi = fixation_curve(a,b,c,d,w);

                    loss = sum((phi - polarization_BA4).^2);

                    if loss < bestLoss_BA4
                        bestLoss_BA4 = loss;
                        bestw_BA4 = w;
                    end

                end


                %% =====================================================
                %  BA6
                %% =====================================================
                bestLoss_BA6 = inf;
                bestw_BA6 = NaN;

                for w = wList

                    phi = fixation_curve(a,b,c,d,w);

                    loss = sum((phi - polarization_BA6).^2);

                    if loss < bestLoss_BA6
                        bestLoss_BA6 = loss;
                        bestw_BA6 = w;
                    end

                end


                %% =====================================================
                %  总误差
                %% =====================================================

                totalLoss = ...
                    bestLoss_ER2 + bestLoss_ER4 + bestLoss_ER6 + ...
                    bestLoss_WS2 + bestLoss_WS4 + bestLoss_WS6 + ...
                    bestLoss_BA2 + bestLoss_BA4 + bestLoss_BA6;


                %% =====================================================
                %  保存全局最优参数
                %% =====================================================

                if totalLoss < bestLoss

                    bestLoss = totalLoss;

                    bestParameter = [...
                        a, b, c, d, ...
                        bestw_ER2, bestw_ER4, bestw_ER6, ...
                        bestw_WS2, bestw_WS4, bestw_WS6, ...
                        bestw_BA2, bestw_BA4, bestw_BA6];

                end

            end
        end
    end
end


%% =====================================================
%  最优参数
%% =====================================================

besta = bestParameter(1);
bestb = bestParameter(2);
bestc = bestParameter(3);
bestd = bestParameter(4);

bestw_ER2 = bestParameter(5);
bestw_ER4 = bestParameter(6);
bestw_ER6 = bestParameter(7);

bestw_WS2 = bestParameter(8);
bestw_WS4 = bestParameter(9);
bestw_WS6 = bestParameter(10);

bestw_BA2 = bestParameter(11);
bestw_BA4 = bestParameter(12);
bestw_BA6 = bestParameter(13);





%% =====================================================
%  ER_omega_fitting_all_omega
%% =====================================================

polarization_ER1=[0,mean(ER1),1];
polarization_ER15=[0,mean(ER15),1];
polarization_ER2=[0,mean(ER2),1];
polarization_ER25=[0,mean(ER25),1];
polarization_ER3=[0,mean(ER3),1];
polarization_ER35=[0,mean(ER35),1];
polarization_ER4=[0,mean(ER4),1];
polarization_ER45=[0,mean(ER45),1];
polarization_ER5=[0,mean(ER5),1];
polarization_ER55=[0,mean(ER55),1];
polarization_ER6=[0,mean(ER6),1];

wList = 0.01:0.01:10;
besta = bestParameter(1);
bestb = bestParameter(2);
bestc = bestParameter(3);
bestd = bestParameter(4);
bestw_ER2 = bestParameter(5);
bestw_ER4 = bestParameter(6);
bestw_ER6 = bestParameter(7);
bestw = zeros(1,8);
r1=[1,15,25,3,35,45,5,55];
for j=1:length(r1)
    bestLoss1 = inf;
    bestw1 = NaN;
    for w1 = wList
        phi = fixation_curve(besta,bestb,bestc,bestd,w1);
        loss = sum((phi-eval(['polarization_ER',num2str(r1(j))])).^2);
        if loss<bestLoss1
            bestLoss1 = loss;
            bestw1 = w1;
        end
    end
    bestw(j)=bestw1;
end

bestw_ER=[bestw(1:2),bestw_ER2,bestw(3:5),bestw_ER4,bestw(6:8),bestw_ER6];
plot(1:0.5:6,bestw_ER,'-o')



%% =====================================================
%  WS_omega_fitting_all_omega
%% =====================================================

polarization_WS1=[0,mean(WS1),1];
polarization_WS15=[0,mean(WS15),1];
polarization_WS2=[0,mean(WS2),1];
polarization_WS25=[0,mean(WS25),1];
polarization_WS3=[0,mean(WS3),1];
polarization_WS35=[0,mean(WS35),1];
polarization_WS4=[0,mean(WS4),1];
polarization_WS45=[0,mean(WS45),1];
polarization_WS5=[0,mean(WS5),1];
polarization_WS55=[0,mean(WS55),1];
polarization_WS6=[0,mean(WS6),1];

wList = 0.01:0.01:10;
besta = bestParameter(1);
bestb = bestParameter(2);
bestc = bestParameter(3);
bestd = bestParameter(4);
bestw_WS2 = bestParameter(8);
bestw_WS4 = bestParameter(9);
bestw_WS6 = bestParameter(10);
bestw = zeros(1,8);
r1=[1,15,25,3,35,45,5,55];
for j=1:length(r1)
    bestLoss1 = inf;
    bestw1 = NaN;
    for w1 = wList
        phi = fixation_curve(besta,bestb,bestc,bestd,w1);
        loss = sum((phi-eval(['polarization_WS',num2str(r1(j))])).^2);
        if loss<bestLoss1
            bestLoss1 = loss;
            bestw1 = w1;
        end
    end
    bestw(j)=bestw1;
end

bestw_WS=[bestw(1:2),bestw_WS2,bestw(3:5),bestw_WS4,bestw(6:8),bestw_WS6];
plot(1:0.5:6,bestw_WS,'-o')



%% =====================================================
%  BA_omega_fitting_all_omega
%% =====================================================

parpool('local',10)
initial_polarization=2:2:98;
N=100;
parfor j=1:5000
    for j1=1:49
        BA15(j,j1)=voter_static_polarization(1.5,initial_polarization(j1));
        BA25(j,j1)=voter_static_polarization(2.5,initial_polarization(j1));
        BA35(j,j1)=voter_static_polarization(3.5,initial_polarization(j1));
        BA45(j,j1)=voter_static_polarization(4.5,initial_polarization(j1));
        BA55(j,j1)=voter_static_polarization(5.5,initial_polarization(j1));
    end
end
delete(gcp)

polarization_BA1=[0,mean(BA1),1];
polarization_BA15=[0,mean(BA15),1];
polarization_BA2=[0,mean(BA2),1];
polarization_BA25=[0,mean(BA25),1];
polarization_BA3=[0,mean(BA3),1];
polarization_BA35=[0,mean(BA35),1];
polarization_BA4=[0,mean(BA4),1];
polarization_BA45=[0,mean(BA45),1];
polarization_BA5=[0,mean(BA5),1];
polarization_BA55=[0,mean(BA55),1];
polarization_BA6=[0,mean(BA6),1];

wList = 0.01:0.01:10;
besta = bestParameter(1);
bestb = bestParameter(2);
bestc = bestParameter(3);
bestd = bestParameter(4);
bestw_BA2 = bestParameter(11);
bestw_BA4 = bestParameter(12);
bestw_BA6 = bestParameter(13);
bestw = zeros(1,8);
r1=[1,15,25,3,35,45,5,55];
for j=1:length(r1)
    bestLoss1 = inf;
    bestw1 = NaN;
    for w1 = wList
        phi = fixation_curve(besta,bestb,bestc,bestd,w1);
        loss = sum((phi-eval(['polarization_BA',num2str(r1(j))])).^2);
        if loss<bestLoss1
            bestLoss1 = loss;
            bestw1 = w1;
        end
    end
    bestw(j)=bestw1;
end

bestw_BA=[bestw(1:2),bestw_BA2,bestw(3:5),bestw_BA4,bestw(6:8),bestw_BA6];
plot(1:0.5:6,bestw_BA,'-o')



load('WS_parameters.mat')
load('ER_parameters.mat')
load('BA_parameters.mat')
plot(1:0.5:6,bestw_ER,'-o','LineWidth',2,'MarkerSize',8')
hold on
plot(1:0.5:6,bestw_WS,'-s','LineWidth',2,'MarkerSize',8)
plot(1:0.5:6,bestw_BA,'-^','LineWidth',2,'MarkerSize',8)
xlabel('Nonlinear exponent $\alpha$','Interpreter','latex','FontSize',18)
ylabel('Selection intensity $\omega$','Interpreter','latex','FontSize',18)
legend({...
    sprintf('ER networks'),...
    sprintf('WS networks'),...
    sprintf('BA networks')},...
    'Interpreter','latex',...
    'FontSize',16,...
    'Location','best')
