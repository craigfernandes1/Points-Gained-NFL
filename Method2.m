%% Description of Method 2

% This method looks at each (d,y) pair, and extracts all of the observable instances.
% It then randomly samples (with replacement) from these observations, creating a new
% proportion of how often (d',y') was drawn. This constitutes the transition probability
% matrix (TP). Using this, the V's are calculated by V=TP*V. This is repeated to obtain 
% a distribution of each V(d,y). 

%% Read in Data and Initialize

T = readtable('DataForModelling_V3.csv','Delimiter',',');

% Set changeable parameters
num_samples = 1000;
num_cycles = 30;

% Set vMatrix, note that its down*100 + yardline + 1
vMatrix2 = zeros(500,num_cycles);

%% Get Transition Probabilities & Solve for V's
for i = 1:num_cycles

    TP = zeros(500,504); %Reset TransProb each cycle
       
    for d = 0:4 %for each down
        for y = 0:99 %for each yard

            % Create sub-table for particular down/yardline pair
            rows = T.CurrentDown==d & T.CurrentYardLine==y;
            vars = {'NextDown','NextYardline','Turnover', 'Points', 'Type'};
            T2 = T(rows, vars);
            [n,~] = size(T2);
            row = d*100 + y + 1;

            % Begin selecting from the observable data, num_samples times, to create the transition probabilities

            if(isempty(T2) == 0)

                r = randi(n,num_samples,1);
                T3 = T2(r,:);   % generated table of the num_samples observations

                for j = 1:num_samples

                    play = table2array(T3(j,1:4));
                    D = play(1); Y = play(2); TO = play(3); P = play(4);

                    if(P ~= 0)
                        if(P == -6.97)
                            TP(row,501) = TP(row,501) + 1;                          %increase pTDagainst
                        elseif(P == -2)
                            TP(row,502) = TP(row,502) + 1;                          %increase pSAF
                        elseif(P == 3)
                            TP(row,503) = TP(row,503) + 1;                          %increase pFGgood
                        else
                            TP(row,504) = TP(row,504) + 1;                          %increase pTD
                        end
                    else
                        if(TO == 0)
                            TP(row,D*100 + Y + 1) = TP(row,D*100 + Y + 1) + 1;      %increase p(D,Y)
                        else
                            TP(row,D*100 + Y + 1) = TP(row,D*100 + Y + 1) - 1;      %decrease p(D,Y)
                        end
                    end 
                end
            end
        end
    end

    TP = TP/num_samples;                                                        %get proportion
    % correct "new" way
    TP(:,36) = TP(:,36) - TP(:,501) + TP(:,503) + TP(:,504);                    %kickoffs from scoring plays (0,35)
    TP(:,21) = TP(:,21) + TP(:,502);                                            %kickoffs after the safety (0,20)

    % Solve for V's
    Vp = (TP(:,501)*-6.97 + TP(:,502)*-2 + TP(:,503)*3 + TP(:,504)*6.97)*1;     %constant added for scoring plays
    vMatrix2(:,i) = linsolve(eye(500,500)-TP(:,1:500),Vp);                       %V = TP*V+Vp

end

%%

%PSEUDOCODE - to create TransProb  
            %if Points != 0
                %if Points = -6.97, increase pTDagainst             - array(501) += 1
                %if Points = -2, increase pSAF                      - array(502) += 1
                %if Points = 3, increase pFGgood                    - array(503) += 1
                %if Points = 6.97, increase pTD                     - array(504) += 1
            %Else
                %if turnover = 0, increase (nextYard,nextDown)      - array(down*100 + yardline + 1) += 1
                %else, decrease (nextYard,nextDown)                 - array(down*100 + yardline + 1) -= 1
%END PSUEDOCODE 
            



