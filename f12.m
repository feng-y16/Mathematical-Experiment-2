function [dy] = f12(x,y)
n=0.5;
dy(1)=y(2);
dy(2)=-y(2)/x-y(1)+n^2*y(1)/x^2;
dy=dy';
end
