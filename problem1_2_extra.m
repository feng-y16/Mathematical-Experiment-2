num_of_points=200;
high=5*pi;
low=pi/2;
xs=low:(high-low)/num_of_points:high;
y0=[2,-2/pi];
[~,y_euler]=Euler_solver(@f12,xs,y0);
[~,y_euler_improved]=Euler_solver_improved(@f12,xs,y0);
y_euler=y_euler(:,1);
y_euler_improved=y_euler_improved(:,1);
y_gt=zeros(num_of_points,1);
for i=1:1:num_of_points+1
    y_gt(i)=sin(xs(i))*sqrt(2*pi/xs(i));
end
fprintf("Euler method error:%f\n",max(abs(y_gt-y_euler)))
fprintf("Improved Euler method error:%f\n",max(abs(y_gt-y_euler_improved)))

num_of_points=2000;
high=5*pi;
low=pi/2;
xs=low:(high-low)/num_of_points:high;
y0=[2,-2/pi];
[~,y_euler]=Euler_solver(@f12,xs,y0);
[~,y_euler_improved]=Euler_solver_improved(@f12,xs,y0);
y_euler=y_euler(:,1);
y_euler_improved=y_euler_improved(:,1);
y_gt=zeros(num_of_points,1);
for i=1:1:num_of_points+1
    y_gt(i)=sin(xs(i))*sqrt(2*pi/xs(i));
end
fprintf("Euler method error:%f\n",max(abs(y_gt-y_euler)))
fprintf("Improved Euler method error:%f\n",max(abs(y_gt-y_euler_improved)))