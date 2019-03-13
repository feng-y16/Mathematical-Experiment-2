function [dy] = f2(t,y)
dy=zeros(2,1);
dy(1)=y(2);
if t<=60
    dy(2)=32000/(1400-18*t)-9.8;
else
    dy(2)=-9.8;
end

