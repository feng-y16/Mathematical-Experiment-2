num_of_points=10000;
high=500;
low=0;
ts=low:(high-low)/num_of_points:high;
y0=[0,0];
tic
[~,y_ode45]=ode45(@f2,ts,y0);
toc
h=y_ode45(:,1);
v=y_ode45(:,2);
a=zeros(num_of_points,1);
h_gt=zeros(num_of_points,1);
v_gt=zeros(num_of_points,1);
tic
for i=1:1:num_of_points+1
    if ts(i)<=60
        a(i)=32000/(1400-18*ts(i))-9.8;
        v_gt(i)=16000/9*log(700/9)-16000/9*log(700/9-ts(i))-9.8*ts(i);
        h_gt(i)=16000/9*log(700/9)*ts(i)+16000/9*(700/9-ts(i))*log(700/9-ts(i))-0.5*9.8*ts(i)^2+16000/9*ts(i)-16000/9*700/9*log(700/9);
    else
        a(i)=-9.8;
        v_gt(i)=16000/9*log(700/9)-16000/9*log(700/9-60)-9.8*ts(i);
        h_gt(i)=16000/9*log(700/9)*60+16000/9*(700/9-60)*log(700/9-60)-0.5*9.8*60^2+16000/9*60-16000/9*700/9*log(700/9)-0.5*9.8*(ts(i)-60)^2+(ts(i)-60)*(16000/9*log(700/9)-16000/9*log(700/9-60)-9.8*60);
    end
end
toc

plot(ts,h_gt,ts,h,'--','LineWidth',3)
legend('真实结果','数值结果');
xlabel('t')
ylabel('h(t)')
title('高度变化图')
set(gca,'FontSize',18)
set(gcf,'outerposition',get(0,'screensize'));
saveas(gcf,'2_1.png')
close

plot(ts,v_gt,ts,v,'--','LineWidth',3)
legend('真实结果','数值结果');
xlabel('t')
ylabel('v(t)')
title('速度变化图')
set(gca,'FontSize',18)
set(gcf,'outerposition',get(0,'screensize'));
saveas(gcf,'2_2.png')
close

plot(ts,a,'LineWidth',3)
xlabel('t')
ylabel('a(t)')
title('加速度变化图')
set(gca,'FontSize',18)
set(gcf,'outerposition',get(0,'screensize'));
saveas(gcf,'2_3.png')
close