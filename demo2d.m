
x2 = (linspace(0,2*pi,10002));
y2 = 1-exp(-linspace(0,5,10002));

X = [x2',y2'];
[L2,R2,K2] = curvature(X);
figure;
h = plot(x2,y2); grid on; axis equal
set(h,'marker','.');
xlabel x
ylabel y
title('2D curve with curvature vectors')
hold on
quiver(x2',y2',K2(:,1),K2(:,2));
hold off
Cc = K2(2:end-1);