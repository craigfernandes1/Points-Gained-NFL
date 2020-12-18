%% Description of Method 1

% This method looks at each (d,y) pair, and creates the transition
% probabilities (TP) to (d',y') by looking at the all of the observable
% data. The V's are obtained by solving V^(i+1) = P*V^(i). This is iterated
% successively until it passes a tolerance limit. The initial V^0 is
% obtained from my initial excel EDA. 


%% Read in Data and Initialize

T = readtable('DataForModelling_V3.csv','Delimiter',',');
Tpass = T(T.PlayType == "RUSH",:); % this selects the data just for one team
% Trush = T(T.PlayType == "RUSH",:);
Tpass = Tpass(:,[8 10 46 47 48 49 50]);  
% Trush = Trush(:,[8 10 46 47 48 49 50]);  

% Set vMatrix, note that its down*100 + yardline + 1
num_cycles = 30;
num_samples = 800;

VrushMethod2 = zeros(500,num_cycles);
% Vrush = zeros(500,num_cycles);

load('vAll.mat');

vAll = [vAll ; -vAll];

vAll(1001,1) = -6.97;
vAll(1002,1) = -2;
vAll(1003,1) = 3;
vAll(1004,1) = 6.97;


%% Get Transition Probabilities for Pass/RUSH
% Done once and saved the values, can comment out now :) 
% 

for i = 1:num_cycles

    TPpass = zeros(500,1004); %Reset TransProb each cycle
       
    for d = 0:4 %for each down
        for y = 0:99 %for each yard

            % Create sub-table for particular down/yardline pair
            rows = Tpass.CurrentDown==d & Tpass.CurrentYardLine==y;
            vars = {'NextDown','NextYardline','Turnover', 'Points', 'Type'};
            T2 = Tpass(rows, vars);
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
                            TPpass(row,1001) = TPpass(row,1001) + 1;                          %increase pTDagainst
                        elseif(P == -2)
                            TPpass(row,1002) = TPpass(row,1002) + 1;                          %increase pSAF
                        elseif(P == 3)
                            TPpass(row,1003) = TPpass(row,1003) + 1;                          %increase pFGgood
                        else
                            TPpass(row,1004) = TPpass(row,1004) + 1;                          %increase pTD
                        end
                    else
                        if(TO == 0)
                            TPpass(row,D*100 + Y + 1) = TPpass(row,D*100 + Y + 1) + 1;      %increase p(D,Y)
                        else
                            TPpass(row,500 + D*100 + Y + 1) = TPpass(row,500 + D*100 + Y + 1) + 1;      %decrease p(D,Y)
                        end
                    end 
                end
            end
        end
    end

    TPpass = TPpass/num_samples;                                                        %get proportion
    TPpass(:,36) = TPpass(:,36) + TPpass(:,1001) - TPpass(:,1003) - TPpass(:,1004);                    %kickoffs from scoring plays (0,35)
    TPpass(:,21) = TPpass(:,21) - TPpass(:,1002);                                            %kickoffs after the safety (0,20)

    % Solve for V's
    VrushMethod2(:,i) = (TPpass)*vAll;               

end
 

save('VrushMethod2','VrushMethod2');

%% calculate values pased on pass or rush
% 
% Vpass = zeros(500,1);
% Vrush = zeros(500,1);
% 
% load('vAll.mat');
% load('TPpass.mat');
% load('TPrush.mat');
% 
% vAll = [vAll ; -vAll];
% 
% vAll(1001,1) = -6.97;
% vAll(1002,1) = -2;
% vAll(1003,1) = 3;
% vAll(1004,1) = 6.97;
% 
% Vpass = (TPpass)*vAll;
% Vrush = (TPrush)*vAll;


            



