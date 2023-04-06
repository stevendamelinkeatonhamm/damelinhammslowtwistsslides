clear all; close all; clc;
%create some points
x = -5:.1:5;
y = [x;x];

%w = -pi:.1:pi;
%y = [cos(w)+.1; sin(w)+.1];

f = @(t) exp(-1*norm(t));
f = @(t) norm(t);
%f = @(t) 1./(1+norm(t));
%Theta = [cos(pi/4) -sin(pi/4); sin(pi/4) cos(pi/4)];
S = @(x) [cos(f(x)) sin(f(x)); -sin(f(x)) cos(f(x))]*x;
%S = @(x) [cos(f(Theta*x)) sin(f(Theta*x)); -sin(f(Theta*x)) cos(f(Theta*x))]*x;
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
for i=1:length(y)
    t7(:,i) = S(t6(:,i));
end
for i=1:length(y)
    t8(:,i) = S(t7(:,i));
end
for i=1:length(y)
    t9(:,i) = S(t8(:,i));
end
for i=1:length(y)
    t10(:,i) = S(t9(:,i));
end
% figure;
% plot(y(1,:),y(2,:),'o',t(1,:),t(2,:),'o');
% legend('Data','Twisted')
figure;
%fig = plot(y(1,:),y(2,:),'o',t(1,:),t(2,:),'o',t2(1,:),t2(2,:),'o',t3(1,:),t3(2,:),'o');
 plot(y(1,:),y(2,:),'o',t(1,:),t(2,:),'o',t2(1,:),t2(2,:),'o');
 legend('Data','1Twist','2Twists');
%figure;
%plot(t(1,:),t(2,:),'o');

