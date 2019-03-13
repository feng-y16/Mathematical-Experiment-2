num_of_points=20;
high=1;
low=0;
xs=low:(high-low)/num_of_points:high;
y0=1;
tic
[~,y_euler]=Euler_solver(@f11,xs,y0);
toc
tic
[~,y_euler_improved]=Euler_solver_improved(@f11,xs,y0);
toc
tic
[~,y_ode23]=ode23(@f11,xs,y0);
toc
tic
[~,y_ode45]=ode45(@f11,xs,y0);
toc
y_gt=zeros(num_of_points,1);
tic
for i=1:1:num_of_points+1
    y_gt(i)=3*exp(xs(i))-2*xs(i)-2;
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
saveas(gcf,'1_1.png')
close