clear ;
close all;
t = figure();
load path.mat;

global x_init_obst y_init_obst x_end_obst y_end_obst NombreObstacle TEXT1 TEXT2 TEXT3
global sprec XYDpath nbrpoints ThetaRefPrec k kk ThetaRef ThetaRefForwardPrec stop
global c
c = [];
k = 0;
kk = 0;

%Path and obstacle selection (points)
[xys]=Path_def;
%xys(1,:) xpath
%xys(2,:) ypath



%path distance computation
A=size(xys);nbrpoints=A*[0 1]';
Xpath(1)=xys(1,1);Ypath(1)=xys(2,1);DISTpathPREC=0;DISTpath(1)=0;
for i=1:(nbrpoints-1)
    Xpath(i+1) = xys(1,i+1);
    Ypath(i+1) = xys(2,i+1);
    DISTpath(i+1) = sqrt((Xpath(i+1) - Xpath(i))^2 + (Ypath(i+1) - Ypath(i))^2) + DISTpathPREC;
    DISTpathPREC=DISTpath(i);
end
XYDpath = [Xpath;Ypath;DISTpath];
% figure()
%plot(xys(1,:),xys(2,:),'b-');
hold on
set(TEXT1,'string','Pick ropbot Position');
[xR,yR,but] = ginput(1);

%xR = 0;
%yR = 0;
plot(xR,yR,'rd')
axis([-100 300 -500 500])
s=0;
ccc = [];

[Xrab,Yrab,ThetaRef,Cc,g,s1,y1]=SplinePath(s,xR,yR);

[Xrab,Yrab,ThetaRef,Cc,g,s1,y1]

theta0 = ThetaRef;

plot(Xrab,Yrab,'ko')

save path.mat xys xR yR but

out = sim("model2.slx")
hold on
g=plot(out.x(1),out.y(1),'ko','markerfacecolor','R','markersize',12)
hold on
h = plot(out.x(1),out.y(1))
legend("desired path","Our robot","Our robot trajectory")
xlabel("x(m)")
xlabel("y(m)")
for i = 2:100:length(out.x)
    g.XData = out.x(i);
    g.YData = out.y(i);
    h.XData = out.x(1:i);
    h.YData = out.y(1:i);
    drawnow
    frame = getframe(t);
    im = frame2im(frame);
    [imind,cm] = rgb2ind(im,256);
    filename = "our_simulation3.gif";
    if i == 2
        imwrite(imind,cm,filename,'gif','Loopcount',inf,'DelayTime',0.00001);
    else
        imwrite(imind,cm,filename,'gif','WriteMode','append','DelayTime',0.00001);
    end 
end

time = linspace(0,400,length(out.x));
figure()
plot(time,out.wr,'LineWidth',3)
xlabel("time(s)")
ylabel("right wheel velocity")

figure()
plot(time,out.wl,'LineWidth',3)
xlabel("time(s)")
ylabel("left wheel velocity")


figure()
plot(time,out.y11,'LineWidth',3)
xlabel("time(s)")
ylabel("y1(m)")

figure()
plot(time,out.s11,'LineWidth',3)
xlabel("time(s)")
ylabel("s1(m)")