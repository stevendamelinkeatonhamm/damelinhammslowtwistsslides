clear all; close all; clc;
%create some points
x = -5:.05:5;
y = [x;x];

w = -pi:.1:pi;
y = [cos(w)+1; sin(w)+1];

f = @(t) exp(-0.1*norm(t));
%f = @(t) norm(t);
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
for i=1:length(y)
    t11(:,i) = S(t10(:,i));
end
for i=1:length(y)
    t12(:,i) = S(t11(:,i));
end
for i=1:length(y)
    t13(:,i) = S(t12(:,i));
end
for i=1:length(y)
    t14(:,i) = S(t13(:,i));
end
for i=1:length(y)
    t15(:,i) = S(t14(:,i));
end
% figure;
% plot(y(1,:),y(2,:),'o',t(1,:),t(2,:),'o');
% legend('Data','Twisted')
figure;
%fig = plot(y(1,:),y(2,:),'o',t(1,:),t(2,:),'o',t2(1,:),t2(2,:),'o',t3(1,:),t3(2,:),'o');
axis([-2 2 -2 2]); 
plot(y(1,:),y(2,:),'o');
 saveas(gcf,'CircleTwist_0.png');
figure;
plot(t(1,:),t(2,:),'o');
axis([-2 2 -2 2]); 
saveas(gcf,'CircleTwist_1.png');
figure;
plot(t2(1,:),t2(2,:),'o');
axis([-2 2 -2 2]); 
saveas(gcf,'CircleTwist_2.png');
figure;
plot(t3(1,:),t3(2,:),'o');
axis([-2 2 -2 2]); 
saveas(gcf,'CircleTwist_3.png');
figure;
plot(t4(1,:),t4(2,:),'o');
axis([-2 2 -2 2]); 
saveas(gcf,'CircleTwist_4.png');
figure;
plot(t5(1,:),t5(2,:),'o');
axis([-2 2 -2 2]); 
saveas(gcf,'CircleTwist_5.png');
figure;
plot(t6(1,:),t6(2,:),'o');
axis([-2 2 -2 2]); 
saveas(gcf,'CircleTwist_6.png');
figure;
plot(t7(1,:),t7(2,:),'o');
axis([-2 2 -2 2]); 
saveas(gcf,'CircleTwist_7.png');
figure;
plot(t8(1,:),t8(2,:),'o');
axis([-2 2 -2 2]); 
saveas(gcf,'CircleTwist_8.png');
figure;
plot(t9(1,:),t9(2,:),'o');
axis([-2 2 -2 2]); 
saveas(gcf,'CircleTwist_9.png');
figure;
plot(t10(1,:),t10(2,:),'o');
axis([-2 2 -2 2]); 
saveas(gcf,'CircleTwist_10.png');
figure;
plot(t11(1,:),t11(2,:),'o');
axis([-2 2 -2 2]); 
saveas(gcf,'CircleTwist_11.png');
figure;
plot(t12(1,:),t12(2,:),'o');
axis([-2 2 -2 2]); 
saveas(gcf,'CircleTwist_12.png');
figure;
plot(t13(1,:),t13(2,:),'o');
axis([-2 2 -2 2]); 
saveas(gcf,'CircleTwist_13.png');
figure;
plot(t14(1,:),t14(2,:),'o');
axis([-2 2 -2 2]); 
saveas(gcf,'CircleTwist_14.png');
figure;
plot(t15(1,:),t15(2,:),'o');
axis([-2 2 -2 2]); 
saveas(gcf,'CircleTwist_15.png');
% plot(y(1,:),y(2,:),'o',t(1,:),t(2,:),'o',t2(1,:),t2(2,:),'o',t3(1,:),t3(2,:),'o',t4(1,:),t4(2,:),'o',t5(1,:),t5(2,:),'o',t6(1,:),t6(2,:),'o');
%legend('Data','1 Twist','2 Twist','3 Twist');
