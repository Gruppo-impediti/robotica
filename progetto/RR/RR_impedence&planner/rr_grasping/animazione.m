%% ANIMAZIONE RR

inc=0.05;
fps=10;
period=1/fps;
fig = figure('name', 'RR');
fig.Position = [0 0 800 800];
xlim([-2.5 2.5]);
ylim([-2.5 2.5]);
hold off;
grid on
tprec=0;
index=1;
t = out.z_des.time;
sizet=size(t);
q = out.q.signals.values;
while index < sizet(1)
    cla;
    while t(index) < (tprec+period) 
        if index >= sizet(1)
            break 
        else 
            index = index + 1;
        end
    end
    line([0 l1*cos(q(index,1))], [0 l1*sin(q(index,1))],'LineWidth',5);
    line([l1*cos(q(index,1)), l1*cos(q(index,1))+l2*cos(q(index,1)+q(index,2))], [l1*sin(q(index,1)), l1*sin(q(index,1))+l2*sin(q(index,1)+q(index,2))],'LineWidth',5);
%      viscircles([0,0],1.5,'LineStyle','--','Color','g');
    
    if t(index) < 1
        
        viscircles([out.z_des.signals.values(index,1) out.z_des.signals.values(index,2)],0.05,'Color','r');
    else
        viscircles([l1*cos(q(index,1))+l2*cos(q(index,1)+q(index,2)) l1*sin(q(index,1))+l2*sin(q(index,1)+q(index,2))],0.05, 'Color', 'k');
        viscircles([out.z_des.signals.values(index,1) out.z_des.signals.values(index,2)],0.05,'Color','r');
    end
    tprec=t(index);
    drawnow;
    pause(period);
    index = index +1;
end

%% disegno cerchio senza toolbox
%% desired trajectory
% temp=0:0.01:2*pi;
% r = 1.5;
% xp=r*cos(temp);
% yp=r*sin(temp);
% line(xp,yp,'LineStyle','--','Color','g');
% % desired point
% temp=0:0.01:2*pi;
% r = 0.05;
% x0 = [out.z_des(index,1) out.z_des(index,2)];
% xp=x0(1) + r*cos(temp);
% yp=x0(2) + r*sin(temp);
% line(xp,yp);

