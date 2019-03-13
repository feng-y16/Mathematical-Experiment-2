num_of_points=10000;
high=500;
medium=60;
low=0;
num_of_points1=round((medium-low)/(high-low)*num_of_points);
num_of_points2=round((high-medium)/(high-low)*num_of_points);
ts1=low:(medium-low)/num_of_points1:medium;
ts2=medium:(high-medium)/num_of_points2:high;
ts=[ts1,ts2(2:num_of_points2+1)];
y0=[0,0];
tic
[~,y1_ode45]=ode45(@f2,ts1,y0);
[~,y2_ode45]=ode45(@f2,ts2,y1_ode45(num_of_points1+1,:));
y_ode45=[y1_ode45;y2_ode45(2:num_of_points2+1,:)];
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
saveas(gcf,'2_4.png')
close

plot(ts,v_gt,ts,v,'--','LineWidth',3)
legend('真实结果','数值结果');
xlabel('t')
ylabel('v(t)')
title('速度变化图')
set(gca,'FontSize',18)
set(gcf,'outerposition',get(0,'screensize'));
saveas(gcf,'2_5.png')
close

plot(ts,a,'LineWidth',3)
xlabel('t')
ylabel('a(t)')
title('加速度变化图')
set(gca,'FontSize',18)
set(gcf,'outerposition',get(0,'screensize'));
saveas(gcf,'2_6.png')
close

v0_gt=16000/9*log(700/9)-16000/9*log(700/9-60)-9.8*60;
h0_gt=16000/9*log(700/9)*60+16000/9*(700/9-60)*log(700/9-60)-0.5*9.8*60^2+16000/9*60-16000/9*700/9*log(700/9);
h1_gt=h0_gt+v0_gt^2/(2*9.8);
for i=1:1:num_of_points
    if ts(i)<60
        continue;
    else
        fprintf("引擎关闭时高度：%f\n",h(i));
        fprintf("误差：%f\n",abs(h(i)-h0_gt));
        fprintf("引擎关闭时速度：%f\n",v(i));
        fprintf("误差：%f\n",abs(v(i)-v0_gt));
        fprintf("引擎关闭时加速度：%f\n",a(i));
        break;
    end
end

[~,i_hmax]=max(h);
fprintf("最高点高度：%f\n",h(i_hmax));
fprintf("误差：%f\n",abs(h(i_hmax)-h1_gt));
fprintf("最高点加速度：%f\n",a(i_hmax));