clear all; close all; clc;
%create some points
x = 0:.1:5;
y = [x;x.^2;x.^3];
y = [x;x;x];
n = 1000;
TH = 2*pi*rand(1,n);
PH = asin(-1+2*rand(1,n));
[X,Y,Z] = sph2cart(TH,PH,1);
y = [X; Y; Z];
%y2 = [x; x];
%y = [zeros(1,length(x)); x];
%w = -pi:.1:pi;
%y = [cos(w); sin(w)];
%r = 1;
%theta = linspace(0,2*pi);
%phi = linspace(-pi,pi);
%y = [r*cos(theta).*sin(phi); r*sin(theta).*sin(phi); r*cos(phi)]; 


%g = @(t) exp(-.5*norm(t));
%g = @(t) norm(t);
%g = @(t) [1./(1+abs(t(1,:)).^2); .5*exp(-abs(t(2,:)))];
mu = 0.5;
g = @(t) [exp(-mu*abs(t(1,:))); exp(-2*mu*abs(t(2,:))); exp(-3*mu*abs(t(3,:)))];
%g = @(t) [abs(t(1,:)); abs(t(2,:))];

t = y+g(y);
%t2 = y2+g(y2);
t2 = t+g(t);
t3 = t2+g(t2);
t4 = t3+g(t3);
t5 = t4+g(t4);
t6 = t5+g(t5);
t7 = t6+g(t6);
t8 = t7+g(t7);
t9 = t8+g(t8);
t10 = t9+g(t9);
t11 = t10+g(t10);
t12 = t11+g(t11);
t13 = t12+g(t12);
t14 = t13+g(t13);
t15 = t14+g(t14);

%yy = [y(1,:) y2(1,:); y(2,:) y2(2,:)];
%tt = [t(1,:) t2(1,:); t(2,:) t2(2,:)];
%tt2 = tt+g(tt);
%tt3 = tt2+g(tt2);

figure;
plot3(y(1,:),y(2,:),y(3,:),'.',t(1,:),t(2,:),t(3,:),'.',t2(1,:),t2(2,:),t2(3,:),'.',t3(1,:),t3(2,:),t3(3,:),'.',t4(1,:),t4(2,:),t4(3,:),'.',t5(1,:),t5(2,:),t5(3,:),'.',t6(1,:),t6(2,:),t6(3,:),'.');
axis equal vis3d