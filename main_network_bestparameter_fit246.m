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

