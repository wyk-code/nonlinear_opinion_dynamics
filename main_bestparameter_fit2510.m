parpool('local',10)
initial_polarization=2:2:98;
N=100;
parfor j=1:5000
    for j1=1:49
        x_polarization_2(j,j1)=voter_wellmixed_polarization_probability(N,initial_polarization(j1),2);
        x_polarization_5(j,j1)=voter_wellmixed_polarization_probability(N,initial_polarization(j1),5);
        x_polarization_10(j,j1)=voter_wellmixed_polarization_probability(N,initial_polarization(j1),10);
    end
end
delete(gcp)
plot([0,initial_polarization/N,1],[0,mean(x_polarization_2),1],'-o','LineWidth',2,'MarkerSize',8)
hold on
plot([0,initial_polarization/N,1],[0,mean(x_polarization_5),1],'-s','LineWidth',2,'MarkerSize',8)
plot([0,initial_polarization/N,1],[0,mean(x_polarization_10),1],'-^','LineWidth',2,'MarkerSize',8)
xlabel('$x+y$','Interpreter','latex','FontSize',18)
ylabel('Polarization probability','Interpreter','latex','FontSize',18)
legend({sprintf('Simulation $\\alpha=2$'),sprintf('Simulation $\\alpha=5$'),sprintf('Simulation $\\alpha=10$')},'Interpreter','latex', 'Location','northwest')
box on
grid on
set(gca,'FontSize',16)

polarization2=[0,mean(x_polarization_2),1];
polarization5=[0,mean(x_polarization_5),1];
polarization10=[0,mean(x_polarization_10),1];


value = 0:0.1:1;

wList = 0.01:0.01:10;

bestLoss = inf;

bestParameter = zeros(1,7);

for a = value
    for b = value
        for c = value
            for d = value

                %alpha=2

                bestLoss1 = inf;

                bestw1 = NaN;

                for w1 = wList

                    phi = fixation_curve(a,b,c,d,w1);

                    loss = sum((phi-polarization2).^2);

                    if loss<bestLoss1

                        bestLoss1 = loss;

                        bestw1 = w1;

                    end

                end

                %alpha=5

                bestLoss2 = inf;

                bestw2 = NaN;

                for w2 = wList

                    phi = fixation_curve(a,b,c,d,w2);

                    loss = sum((phi-polarization5).^2);

                    if loss<bestLoss2

                        bestLoss2 = loss;

                        bestw2 = w2;

                    end

                end

                %alpha=10

                bestLoss3 = inf;

                bestw3 = NaN;

                for w3 = wList

                    phi = fixation_curve(a,b,c,d,w3);

                    loss = sum((phi-polarization10).^2);

                    if loss<bestLoss3

                        bestLoss3 = loss;

                        bestw3 = w3;

                    end

                end

                totalLoss = bestLoss1 + bestLoss2 + bestLoss3;

                if totalLoss<bestLoss

                    bestLoss = totalLoss;

                    bestParameter = [a b c d bestw1 bestw2 bestw3];

                end

            end
        end
    end
end

ratio = 0:0.02:1;
besta = bestParameter(1);
bestb = bestParameter(2);
bestc = bestParameter(3);
bestd = bestParameter(4);
bestw1 = bestParameter(5);
bestw2 = bestParameter(6);
bestw3 = bestParameter(7);


