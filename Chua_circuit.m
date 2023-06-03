clear all;		
close all;
clc;
clf;

%% 参数值
alpha = 16;
beta = 15;
gamma = 0.5;
xi = 1.4;
a = 0.2;
b = 0.4;

%% 微分方程
Chua = @(t,x)[alpha*(x(2)-x(1)+xi*x(1)-(a+3*b*x(4)^2)*x(1)); x(1)-x(2)+x(3); -beta*x(2)-gamma*x(3); x(1)];

%% 解微分方程
x0 = [0;10^(-10);0;0];
dt = 0.001;
t_end = 200;
[t, x] = ode45(Chua, [0:dt:t_end], x0);
x1 = x(:,1);
x2 = x(:,2);
x3 = x(:,3);
x4 = x(:,4);

i = (a+3*b*x4.^2).*x1;
v = x1;

figure(1)
plot(x1,x2);
xlabel('$x_1$','FontSize',16,'interpreter','latex');
ylabel('$x_2$','FontSize',16,'interpreter','latex');

% figure(2)
% plot(x1,x4);
% xlabel('\itx\rm_1','FontSize',12,'FontName','Times New Roman');
% ylabel('\itx\rm_4','FontSize',12,'FontName','Times New Roman');
% 
% figure(3)
% plot(v,i);
% xlabel('\itv\rm','FontSize',12,'FontName','Times New Roman');
% ylabel('\iti\rm','FontSize',12,'FontName','Times New Roman');
% 
% figure(4)
% plot(x1(1:10000),'b-','LineWidth',2);
% hold on
% plot(x3(1:10000),'k-','LineWidth',2);
% hold off
% % grid on;
% xlabel('Iterations','FontSize',12,'FontName','Times New Roman');
% ylabel('Filter output','FontSize',12,'FontName','Times New Roman');

% save chua.mat x



