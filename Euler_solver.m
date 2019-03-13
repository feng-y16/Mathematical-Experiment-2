function [ts,result] = Euler_solver(f,ts,x0)
D=length(x0);
T=length(ts);
result=zeros(T,D);
result(1,:)=x0;
for i=1:1:T-1
    result(i+1,:)=result(i,:)+(ts(i+1)-ts(i))*f(ts(i),result(i,:))';
end
end

