num_of_points=20;
high=1;
low=0;
xs=low:(high-low)/num_of_points:high;
y0=1;
[~,y_euler]=Euler_solver(@f11,xs,y0);
[~,y_euler_improved]=Euler_solver_improved(@f11,xs,y0);
y_gt=zeros(num_of_points,1);
for i=1:1:num_of_points+1
    y_gt(i)=3*exp(xs(i))-2*xs(i)-2;
end
fprintf("Euler method error:%f\n",max(abs(y_gt-y_euler)))
fprintf("Improved Euler method error:%f\n",max(abs(y_gt-y_euler_improved)))

num_of_points=200;
high=1;
low=0;
xs=low:(high-low)/num_of_points:high;
y0=1;
[~,y_euler]=Euler_solver(@f11,xs,y0);
[~,y_euler_improved]=Euler_solver_improved(@f11,xs,y0);
y_gt=zeros(num_of_points,1);
for i=1:1:num_of_points+1
    y_gt(i)=3*exp(xs(i))-2*xs(i)-2;
end
fprintf("Euler method error:%f\n",max(abs(y_gt-y_euler)))
fprintf("Improved Euler method error:%f\n",max(abs(y_gt-y_euler_improved)))