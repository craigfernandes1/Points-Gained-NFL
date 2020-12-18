%% EDA Bar Graphs

%% graph by downs

figure
x = 0:1:4;
y = [6.6 37.5 28.3 18.3 9.3];
bar(x,y)
xlabel('Down');
ylabel('Percentage of Total Plays (%)');
% title('Percentage of Plays by Down');
grid;

%% graph by yard line

figure
x = 1:99;
load('y');
bar(x,y, 'Stacked')
xlabel('Yard Line');
ylabel('Percentage of Total Plays (%)');
% title('Percentage of Plays by Yard Line');
grid;

%% graph by play type

figure
y = [40.3 28.6 12.88 6.7 3.0 2.7 2.5 1.9 1.5 ];
bar(y)
xlabel('Type of Play');
ylabel('Percentage of Total Plays (%)');
% title('Percentage of Plays by Play Type');
somenames={'Pass'; 'Run';'Punt'; 'Penalty'; 'Touchdown';'Sack'; 'Field Goal'; 'Turnover'; 'Scramble';};
% xt = get(gca, 'XTick');
% set(gca, 'XTick', xt, 'XTickLabel', {'Pass' 'Rush' 'Sack' 'Scramble' 'Turnover' 'Penalty' 'Punt' 'TD' 'FG' 'Safety'})
set(gca,'xticklabel',somenames)
grid;


%% graph by year

figure
y = [25.84 24.66 24.86 24.64];
bar(y)
xlabel('Season');
ylabel('Percentage of Total Plays (%)');
title('Percentage of Plays by Year');
somenames={'2013-14'; '2014-15'; '2015-16'; '2016-17';};
% xt = get(gca, 'XTick');
% set(gca, 'XTick', xt, 'XTickLabel', {'Pass' 'Rush' 'Sack' 'Scramble' 'Turnover' 'Penalty' 'Punt' 'TD' 'FG' 'Safety'})
set(gca,'xticklabel',somenames)
grid;



%% Reality

    y = [4.1 81.7 107.8 11.9];
%     hbar = bar(y);
    
    figure
    hold on
    for i = 1:length(y)
        hbar=bar(i,y(i));
        if y(i) == 107.8
            set(hbar,'FaceColor','k');
        else
            set(hbar,'FaceColor','r');
        end
    end

    % Get the data for all the bars that were plotted

    x = get(hbar,'XData');

    y = get(hbar,'YData');

 

    ygap = 0.1;  % Specify vertical gap between the bar and label

    ylimits = get(gca,'YLim');

%     set(gca,'YLim',[ylim(1),ylim(2)+0.2*max(y)]); % Increase y limit for labels

 
    % Create labels to place over bars

    labels = {'4.1', '81.7','107.8','11.9'}; 

    for i = 1:length(x) % Loop over each bar 

            xpos = x(i);        % Set x position for the text label

            ypos = y(i) + ygap; % Set y position, including gap

            htext = text(xpos,ypos,labels{i});          % Add text label

            set(htext,'VerticalAlignment','bottom','HorizontalAlignment','center')

    end
    
    xlabel('Stage');
ylabel('Duration (hours)');
title('Average Duration of Key Stages in Current Process');
somenames={'CTSim'; 'Contours'; 'Planning'; 'Plan Approval'};
% xt = get(gca, 'XTick');
% set(gca, 'XTick', xt, 'XTickLabel', {'Pass' 'Rush' 'Sack' 'Scramble' 'Turnover' 'Penalty' 'Punt' 'TD' 'FG' 'Safety'})
set(gca,'xticklabel',somenames)
grid;

% hbar(1,3).FaceColor = 'r';

%% all recommendations planning

    figure; % Create new figure

    y = [96.9 108.7 148.9 80.3 92.9 80.0 111.9 82.7 79.1 137.0 87.5 73.5 73.8];
    hbar = bar(y);

    % Get the data for all the bars that were plotted

    x = get(hbar,'XData');

    y = get(hbar,'YData');

 

    ygap = 0.1;  % Specify vertical gap between the bar and label

    ylimits = get(gca,'YLim');

    set(gca,'YLim',[50,160]); % Increase y limit for labels

 
    % Create labels to place over bars

    labels = {'96.9', '108.7', '148.9', '80.3', '92.9', '80.0', '111.9', '82.7', '79.1','137.0', '87.5', '73.5', '73.8'}; 

    for i = 1:length(x) % Loop over each bar 

            xpos = x(i);        % Set x position for the text label

            ypos = y(i) + ygap; % Set y position, including gap

            htext = text(xpos,ypos,labels{i});          % Add text label

            set(htext,'VerticalAlignment','bottom','HorizontalAlignment','center')

    end
    
    xlabel('Recommendation Number');
ylabel('Duration (hours)');
title('Average Duration of Planning Based on Different Recommendations');
somenames = {'1','2','3','4','5','6','7','8','9','10','11','12','13'}; 
% xt = get(gca, 'XTick');
% set(gca, 'XTick', xt, 'XTickLabel', {'Pass' 'Rush' 'Sack' 'Scramble' 'Turnover' 'Penalty' 'Punt' 'TD' 'FG' 'Safety'})
set(gca,'xticklabel',somenames)

hline = refline([0 108.1]);
hline.Color = 'r';

grid;

%% site group divisons

    figure; % Create new figure

    y = [25 1 2 1 10 7 12 5 8 8 11 4 6];
    hbar = bar(y);

    % Get the data for all the bars that were plotted

    x = get(hbar,'XData');

    y = get(hbar,'YData');

 

    ygap = 0.1;  % Specify vertical gap between the bar and label

    ylimits = get(gca,'YLim');

    set(gca,'YLim',[0,27]); % Increase y limit for labels

 
    % Create labels to place over bars

    labels = {'25', '1', '2', '1', '10', '7', '12', '5', '8', '8','11', '4', '6'}; 

    for i = 1:length(x) % Loop over each bar 

            xpos = x(i);        % Set x position for the text label

            ypos = y(i) + ygap; % Set y position, including gap

            htext = text(xpos,ypos,labels{i});          % Add text label

            set(htext,'VerticalAlignment','bottom','HorizontalAlignment','center')

    end
    
    xlabel('Disease Site');
ylabel('Percentage of Total Cases (%)');
% title('Breakdown of Cases by Disease Site');
somenames = {'H&N','Endocrine','Ocular','Skin','Lung','Upper GI','GU','Lowe GI','Gynae','CNS','Lymphoma','Paediatric','Sarcoma'}; 
% xt = get(gca, 'XTick');
% set(gca, 'XTick', xt, 'XTickLabel', {'Pass' 'Rush' 'Sack' 'Scramble' 'Turnover' 'Penalty' 'Punt' 'TD' 'FG' 'Safety'})
set(gca,'xticklabel',somenames)
grid;

%% verif & valid

    figure; % Create new figure

    y = [4.06 3.75 ; 81.74 79.56; 107.78 108.12; 11.87 11.53];
    hbar = bar(y);
    
    hbar(2).FaceColor = 'red';

    % Get the data for all the bars that were plotted

    x = get(hbar,'XData');

    y = get(hbar,'YData');

 

    ygap = 0.1;  % Specify vertical gap between the bar and label

    ylimits = get(gca,'YLim');

%     set(gca,'YLim',[0,120]); % Increase y limit for labels

 
    % Create labels to place over bars

    labels = {'4.06', '3.75', '81.74', '79.56', '107.78', '108.12', '11.87', '11.53'}; 

    for i = 1:2*length(x{1,1}) % Loop over each bar 

%             xpos = x{1,1}(i);        % Set x position for the text label
            xpos = zz(1)
            ypos = y{1,1}(i); % Set y position, including gap

            htext = text(xpos,ypos,labels{i});          % Add text label

            set(htext,'VerticalAlignment','bottom','HorizontalAlignment','center')

    end
    
    xlabel('Recommendation Number');
ylabel('Duration (hours)');
title('Comparison of Average Stage Durations between Reality and the Simulation');
somenames={'CTSim'; 'Contours'; 'Planning'; 'Plan Approval'};
% xt = get(gca, 'XTick');
% set(gca, 'XTick', xt, 'XTickLabel', {'Pass' 'Rush' 'Sack' 'Scramble' 'Turnover' 'Penalty' 'Punt' 'TD' 'FG' 'Safety'})
set(gca,'xticklabel',somenames)
grid;
legend ( [ {'Reality'} {'Simulation'} ], 'Location','NorthWest' );


