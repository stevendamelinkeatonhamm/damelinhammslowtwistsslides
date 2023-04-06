clear all; close all; clc;
%create some points
x = -5:.05:5;
y = [x;x];

%w = -pi:.1:pi;
%y = [cos(w)+.1; sin(w)+.1];

f = @(t) exp(-1*norm(t));
%f = @(t) norm(t);
%f = @(t) 1./(1+norm(t));
Theta = [cos(pi/4) -sin(pi/4); sin(pi/4) cos(pi/4)];
S = @(x) [cos(f(x)) sin(f(x)); -sin(f(x)) cos(f(x))]*x;
S = @(x) [cos(f(Theta*x)) sin(f(Theta*x)); -sin(f(Theta*x)) cos(f(Theta*x))]*x;
for i=1:length(y)
    t(:,i) = S(y(:,i));
end
for i=1:length(y)
    t2(:,i) = S(t(:,i));
end
for i=1:length(y)
    t3(:,i) = S(t2(:,i));
end
for i=1:length(y)
    t4(:,i) = S(t3(:,i));
end
for i=1:length(y)
    t5(:,i) = S(t4(:,i));
end
for i=1:length(y)
    t6(:,i) = S(t5(:,i));
end
% figure;
% plot(y(1,:),y(2,:),'o',t(1,:),t(2,:),'o');
% legend('Data','Twisted')
figure;
plot(y(1,:),y(2,:),'o',t(1,:),t(2,:),'o',t2(1,:),t2(2,:),'o',t3(1,:),t3(2,:),'o');
% plot(y(1,:),y(2,:),'o');
% figure;
% plot(t(1,:),t(2,:),'o');
% figure;
% plot(t2(1,:),t2(2,:),'o');
% figure;
% plot(t3(1,:),t3(2,:),'o');
% figure;
% plot(t4(1,:),t4(2,:),'o');
% figure;
% plot(t5(1,:),t5(2,:),'o');
% figure;
% plot(t6(1,:),t6(2,:),'o');
% figure;
% plot(y(1,:),y(2,:),'o',t(1,:),t(2,:),'o',t2(1,:),t2(2,:),'o',t3(1,:),t3(2,:),'o',t4(1,:),t4(2,:),'o',t5(1,:),t5(2,:),'o',t6(1,:),t6(2,:),'o');
%legend('Data','1 Twist','2 Twist','3 Twist');
