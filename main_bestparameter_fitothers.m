parpool('local',10)
initial_polarization=2:2:98;
N=100;
parfor j=1:5000
    for j1=1:49
        x_polarization_3(j,j1)=voter_wellmixed_polarization_probability(N,initial_polarization(j1),3);
        x_polarization_4(j,j1)=voter_wellmixed_polarization_probability(N,initial_polarization(j1),4);
        x_polarization_6(j,j1)=voter_wellmixed_polarization_probability(N,initial_polarization(j1),6);
        x_polarization_7(j,j1)=voter_wellmixed_polarization_probability(N,initial_polarization(j1),7);
        x_polarization_8(j,j1)=voter_wellmixed_polarization_probability(N,initial_polarization(j1),8);
        x_polarization_9(j,j1)=voter_wellmixed_polarization_probability(N,initial_polarization(j1),9);
    end
end
delete(gcp)

polarization3=[0,mean(x_polarization_3),1];
polarization4=[0,mean(x_polarization_4),1];
polarization6=[0,mean(x_polarization_6),1];
polarization7=[0,mean(x_polarization_7),1];
polarization8=[0,mean(x_polarization_8),1];
polarization9=[0,mean(x_polarization_9),1];

wList = 0.01:0.01:10;

besta = bestParameter(1);
bestb = bestParameter(2);
bestc = bestParameter(3);
bestd = bestParameter(4);

r1=[3,4,6,7,8,9];
for j=1:6
    bestLoss1 = inf;

    bestw1 = NaN;

    for w1 = wList

        phi = fixation_curve(besta,bestb,bestc,bestd,w1);

        loss = sum((phi-eval(['polarization',num2str(r1(j))])).^2);

        if loss<bestLoss1

            bestLoss1 = loss;

            bestw1 = w1;

        end

    end

    bestw(j)=bestw1;

end

bestw=[bestParameter(5),bestw(1),bestw(2),bestParameter(6),bestw(3),bestw(4),bestw(5),bestw(6),bestParameter(7)];
plot(2:10,bestw,'-o')



f = fit(x, y, 'b*log(1+a*(x-1))', 'StartPoint', [10, 0.5]);
plot(x,y,'-o')
hold on
plot(f)
xlabel('Nonlinear exponent $\alpha$','Interpreter','latex','FontSize',18)
ylabel('Selection intensity $\omega$','Interpreter','latex','FontSize',18)
grid on;
