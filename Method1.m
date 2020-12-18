%% Description of Method 1

% This method looks at each (d,y) pair, and creates the transition
% probabilities (TP) to (d',y') by looking at the all of the observable
% data. The V's are obtained by solving V^(i+1) = P*V^(i). This is iterated
% successively until it passes a tolerance limit. The initial V^0 is
% obtained from my initial excel EDA. 

%% Read in Data and Initialize

T = readtable('DataForModelling_V3.csv','Delimiter',',');
% T = T(T.OffenseTeam == "CLE",:); % this selects the data just for one team
T = T(:,[8 10 46 47 48 49 50]);  

% Set changeable parameters
num_iter = 100;
tol = 1e-15;
count = 0;

% Set vMatrix, note that its down*100 + yardline + 1
TP = zeros(500,504);
vMatrix1 = zeros(500,500);

%% Get Transition Probabilities

for d = 0:4 %for each down
    for y = 0:99 %for each yard
        % Create sub-table for particular down/yardline pair
        rows = T.CurrentDown==d & T.CurrentYardLine==y;
        vars = {'NextDown','NextYardline','Turnover', 'Points', 'Type'};
        T2 = T(rows, vars);
        [n,~] = size(T2);
        row = d*100 + y + 1;

        if(isempty(T2) == 0)
            for j = 1:n     %create TP_row for this particular (d,y)

                play = table2array(T2(j,1:4));
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
            TP(row,:) = TP(row,:)/n;
        end
    end
end
% 
% TP(:,36) = TP(:,36) + TP(:,501) - TP(:,503) - TP(:,504);                    %kickoffs from scoring plays (0,35)
% TP(:,21) = TP(:,21) - TP(:,502);                                            %kickoffs after the safety (0,20)

%try inverting additions/subtractions
TP(:,36) = TP(:,36) - TP(:,501) + TP(:,503) + TP(:,504);                    %kickoffs from scoring plays (0,35)
TP(:,21) = TP(:,21) + TP(:,502);                                            %kickoffs after the safety (0,20)

%% Solve for V's

Vp = (TP(:,501)*-6.97 + TP(:,502)*-2 + TP(:,503)*3 + TP(:,504)*6.97)*1;     %constant added for scoring plays

V_old = ones(500,1);    %create initial V's
vMatrix1(:,1) = V_old;

%iteratively update V_new until it passes a tolerance
while true
    V_new = TP(:,1:500) * (V_old) + Vp;
    if(abs(V_new - V_old) < tol)
        break;
    end
    V_old = V_new;
    count = count + 1;
    
    vMatrix1(:,count+1) = V_new;
   
end

vMatrix1 = vMatrix1(:,1:count+1);

%%


            



