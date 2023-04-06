clear all; close all; clc;
%create some points
x = -1:.05:1;
y = [x; x; x];

%w = -pi:.1:pi;
%y = [cos(w)+.1; sin(w)+.1];

a = 1/sqrt(3);
b = 1/sqrt(3);
c = 1/3;
d = 1/3;

Theta = [a^2+b^2-c^2-d^2 2*b*c-2*a*d 2*b*d+2*a*c; 2*b*c+2*a*d a^2-b^2+c^2-d^2  2*c*d-2*a*b; 2*b*d-2*a*c 2*c*d+2*a*b a^2-b^2-c^2+d^2];

    

f = @(t) exp(-.5*norm(t));
%f = @(t) norm(t);
f = @(t) 1./(1+norm(t));
S = @(x) Theta'*[1 0 0; 0 cos(f(x)) sin(f(x)); 0 -sin(f(x)) cos(f(x))]*Theta*x;
%S2 = @(x) [cos(f2(x)) sin(f2(x)) 0; -sin(f2(x)) cos(f2(x)) 0; 0 0 1]*x;
for i=1:length(y)
    t(:,i) = S(y(:,i));
end
for i=1:length(y)
    t2(:,i) = S(t(:,i));
end
for i=1:length(y)
    t3(:,i) = S(t2(:,i));
end
% figure;
% plot3(y(1,:),y(2,:),y(3,:),'o',t(1,:),t(2,:),t(3,:),'o');
% legend('Data','Twisted')
figure;
plot3(y(1,:),y(2,:),y(3,:),'o',t(1,:),t(2,:),t(3,:),'o',t2(1,:),t2(2,:),t3(3,:),'o');
legend('Data','1 Twist','2 Twist');
