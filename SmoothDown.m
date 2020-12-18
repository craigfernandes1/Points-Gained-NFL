%% Description of Smoothing

% Smoothing different value functions from teams/top4 etc

%% Smooth General Value by Down

load("vAll");
y = vAll;
x = (1:99)';
down = 5:10:95;
yneg = NaN(4,99);
ypos = NaN(4,99);

yy1 = smooth(x,y(102:200,1),0.20,'rloess');
yy2 = smooth(x,y(202:300,1),0.20,'rloess');
yy3 = smooth(x,y(302:400,1),0.2,'rloess');
yy4 = smooth(x,y(402:500,1),0.2,'rloess');
yyy = [yy1 ; yy2; yy3; yy4]

% for jj = 1:4
%     for ii = 1:length(down)
% 
%         z = yyy(500*(jj-1) + 100*jj + 1 + down(ii),:);
%         n = 30;
%         zbar = mean(z);
%         nboot = 1000; %really will be 10000
% 
%         tmpdata = vec2mat(datasample(z,n*nboot),nboot);
%         bsmeans = mean(tmpdata);
%         deltastar = bsmeans - zbar;
%         d = quantile(deltastar, [0.025 0.975]);
%         % ci = [xbar + d(1) , xbar + d(2)]
% 
%         yneg(jj,down(ii)) = d(1);
%         ypos(jj,down(ii)) = d(2);
%     end
% end

% figure
% plot(x,yy1,x,yy2,x,yy3,x,yy4)
% legend ( [ {'2013/14'} {'2014/15'} {'2015/16'} {'2016/17'} ], 'Location','NorthWest' );
% grid;
% xlabel('Yard Line');
% ylabel('Value');
% title('League Wide Value Function by Year for the 1st Down');
% axis([0 100 -3.5 7.5])


figure
hold on
errorbar(x,yy1,yneg(1,:),ypos(1,:));
errorbar(x,yy2,yneg(2,:),ypos(2,:));
errorbar(x,yy3,yneg(3,:),ypos(3,:));
errorbar(x,yy4,yneg(4,:),ypos(4,:));
legend ( [ {'1st Down'} {'2nd Down'} {'3rd Down'} {'4th Down'} ], 'Location','NorthWest' );
grid;
xlabel('Yard Line');
ylabel('Value');
% title('League Wide Value Function by Year for the 1st Down');
axis([0 100 -3 6])

%% 