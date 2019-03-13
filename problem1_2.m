num_of_points=200;
high=5*pi;
low=pi/2;
xs=low:(high-low)/num_of_points:high;
y0=[2,-2/pi];
tic
[~,y_euler]=Euler_solver(@f12,xs,y0);
toc
tic
[~,y_euler_improved]=Euler_solver_improved(@f12,xs,y0);
toc
tic
[~,y_ode23]=ode23(@f12,xs,y0);
toc
tic
[~,y_ode45]=ode45(@f12,xs,y0);
toc
y_euler=y_euler(:,1);
y_euler_improved=y_euler_improved(:,1);
y_ode23=y_ode23(:,1);
y_ode45=y_ode45(:,1);
y_gt=zeros(num_of_points,1);
tic
for i=1:1:num_of_points+1
    y_gt(i)=sin(xs(i))*sqrt(2*pi/xs(i));
end
toc
fprintf("Euler method error:%f\n",max(abs(y_gt-y_euler)))
fprintf("Improved Euler method error:%f\n",max(abs(y_gt-y_euler_improved)))
fprintf("Ode23 method error:%f\n",max(abs(y_gt-y_ode23)))
fprintf("Ode45 method error:%f\n",max(abs(y_gt-y_ode45)))

subplot(2,2,1); 
plot(xs,y_gt,xs,y_euler,'--','LineWidth',3)
hold
legend('真实结果','数值结果');
xlabel('x')
ylabel('y')
title('欧拉法')
set(gca,'FontSize',18)

subplot(2,2,2); 
plot(xs,y_gt,xs,y_euler_improved,'--','LineWidth',3)
hold
legend('真实结果','数值结果');
xlabel('x')
ylabel('y')
title('改进欧拉法')
set(gca,'FontSize',18)

subplot(2,2,3); 
plot(xs,y_gt,xs,y_ode23,'--','LineWidth',3)
hold
legend('真实结果','数值结果');
xlabel('x')
ylabel('y')
title('Ode23')
set(gca,'FontSize',18)

subplot(2,2,4); 
plot(xs,y_gt,xs,y_ode45,'--','LineWidth',3)
hold
legend('真实结果','数值结果');
xlabel('x')
ylabel('y')
title('Ode45')
set(gca,'FontSize',18)

set(gcf,'outerposition',get(0,'screensize'));
saveas(gcf,'1_2.png')
close