function [ts,result] = Euler_solver_improved(f,ts,x0)
D=length(x0);
T=length(ts);
result=zeros(T,D);
result(1,:)=x0;
for i=1:1:T-1
    temp=result(i,:)+(ts(i+1)-ts(i))*f(ts(i),result(i,:))';
    result(i+1,:)=result(i,:)+(ts(i+1)-ts(i))/2*(f(ts(i),result(i,:))+f(ts(i+1),temp))';
end
end
