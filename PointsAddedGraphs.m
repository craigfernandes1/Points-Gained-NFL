
%% 

yTop = zeros(99,1);
yBot = zeros(99,1);
x = (1:99)';

%% 

figure
plot(x,yTop)
% legend ( [ {'Top Teams'} {'Bottom Teams'}], 'Location','NorthWest' );
grid;
xlabel('Yard Line');
ylabel('PointsGained');
% title('League Wide Value Function by Year for the 1st Down');
axis([0 100 -0.5 0.5])

%% 


