clear all; close all; clc;
%create some points
x = -5:.05:5;
y = [x;-x];
%y2 = [x; x];
%y = [zeros(1,length(x)); x];
%w = -pi:.1:pi;
%y = [cos(w); sin(w)];


%g = @(t) exp(-.5*norm(t));
%g = @(t) norm(t);
%g = @(t) [1./(1+abs(t(1,:)).^2); .5*exp(-abs(t(2,:)))];
g = @(t) [exp(-0.5*abs(t(1,:))); exp(-0.5*abs(t(2,:)))];
%g = @(t) [abs(t(1,:)); abs(t(2,:))];

t = y+g(y);
%inv = fzero(x-g(x)-t,ones(size(t)));
inv = t-g(t);

plot(y(1,:),y(2,:),'o',t(1,:),t(2,:),'o',inv(1,:),inv(2,:),'o');
%plot(y(1,:),y(2,:),'ob',y2(1,:),y2(2,:),'ob',t(1,:),t(2,:),'or',t2(1,:),t2(2,:),'or');
%plot(yy(1,:),yy(2,:),'o',tt(1,:),tt(2,:),'o',tt2(1,:),tt2(2,:),'o',tt3(1,:),tt3(2,:),'o');
%plot(y(1,:),y(2,:),'o',t(1,:),t(2,:),'o',t2(1,:),t2(2,:),'o',t3(1,:),t3(2,:),'o',t4(1,:),t4(2,:),'o',t5(1,:),t5(2,:),'o',t6(1,:),t6(2,:),'o',t7(1,:),t7(2,:),'o',t8(1,:),t8(2,:),'o',t9(1,:),t9(2,:),'o');
%legend('Data','1 Slide','2 Slides','3 Slides')
% figure;
% plot(y(1,:),y(2,:),'o',t(1,:),t(2,:),'o',t2(1,:),t2(2,:),'o',t3(1,:),t3(2,:),'o');
% legend('Data','1 Twist','2 Twist','3 Twist');
