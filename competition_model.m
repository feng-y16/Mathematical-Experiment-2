function [ ] = competition_model(time,num_of_points,r1,r2,n1,n2,s1,s2,x0,y0,filename)
    function[dy]=f3(t,y)
        dy=zeros(2,1);
        dy(1)=r1*y(1)*(1-y(1)/n1-s1*y(2)/n2);
        dy(2)=r2*y(2)*(1-s2*y(1)/n1-y(2)/n2);
    end
    ts=0:time/num_of_points:time;
    y0=[x0,y0];
    [~,y_ode45]=ode45(@f3,ts,y0);
    x=y_ode45(:,1);
    y=y_ode45(:,2);
    
    plot(ts,x,'LineWidth',2);
    xlabel('t')
    ylabel('x(t)')
    title('甲种群变化图')
    set(gca,'FontSize',18)
    set(gcf,'outerposition',get(0,'screensize'));
    saveas(gcf,[filename 'x-t.png'])
    close
    
    plot(ts,y,'LineWidth',2);
    xlabel('t')
    ylabel('y(t)')
    title('乙种群变化图')
    set(gca,'FontSize',18)
    set(gcf,'outerposition',get(0,'screensize'));
    saveas(gcf,[filename 'y-t.png'])
    close
    
    plot(x,y,'LineWidth',2);
    xlabel('x(t)')
    ylabel('y(t)')
    title('相图')
    set(gca,'FontSize',18)
    set(gcf,'outerposition',get(0,'screensize'));
    saveas(gcf,[filename 'y-x.png'])
    close
end

