function [xys]=PathANDObstacle

global x_init_obst y_init_obst x_end_obst y_end_obst NombreObstacle TEXT1 TEXT2 TEXT3


axis([-100 300 -50 50])
hold on
% Initially, the list of points is empty.
xy = [];
n = 0;
% Loop, picking up the points.
%TEXT1 = text(-150,350,'Path point keyboarding :','color',[1 0 0]);
%TEXT2 = text(-150,320,'Left mouse button picks points.','color',[1 0 0]);
%TEXT3 = text(-150,295,'Right mouse button picks last point.','color',[1 0 0]);
%but = 1;
 %while but == 1
   %set(TEXT1,'string','Path point keyboarding :');
   %set(TEXT2,'string','Left mouse button picks points.');
   %set(TEXT3,'string','Right mouse button picks last point.');
   %[xi,yi,but] = ginput(1);
   %plot(xi,yi,'ro')
   %n = n+1;
   %xy(:,n) = [xi;yi];
 %end

%% xy lign 
clear xy
xy = [37.4424,200;20,20];

%%
% Interpolate with a spline curve and finer spacing.
n = 2;
t = 1:n;
ts = 1: 0.001: n;
xys = spline(t,xy,ts);
% Plot the interpolated curve.
plot(xys(1,:),xys(2,:),'--');

plot(xys(1,1),xys(2,1))
plot(xys(1,end),xys(2,end))
% NombreObstacle=0;
% but = 1;
%set(TEXT1,'string','');
%set(TEXT2,'string','');
%set(TEXT3,'string','');
% 
% while but == 1
%     [xiobstInit,yiobstInit,but] = ginput(1);
%     plot(xiobstInit,yiobstInit,'bo')
%     [xiobstEnd,yiobstEnd,but] = ginput(1);
%     plot(xiobstEnd,yiobstEnd,'go')
%     line([xiobstInit xiobstEnd],[yiobstInit yiobstEnd],'color',[0 0 0]);
%     NombreObstacle = NombreObstacle+1;
%     x_init_obst(NombreObstacle)=xiobstInit;
%     y_init_obst(NombreObstacle)=yiobstInit;
%     x_end_obst(NombreObstacle)=xiobstEnd;
%     y_end_obst(NombreObstacle)=yiobstEnd;
% end
% 
% hold off
% 
% pause(0.1)

