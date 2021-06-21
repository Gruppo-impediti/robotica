% ANIMAZIONE MDS

inc=0.05;
fps=10;
period=1/fps;
fig = figure('name', 'RR');
fig.Position = [0 0 800 800];
xlim([-0.5 1.75]);
ylim([-0.5 1.5]);
hold off;
grid on
tprec=0;
index=1;
t = out.z_des.time;
sizet=size(t);
while index < sizet(1)
    cla;
    while t(index) < (tprec+period) 
        if index >= sizet(1)
            break 
        else 
            index = index + 1;
        end
    end
    r = 0.02;
    
    %desired position
    pos = [ -0.45 1.45-2*r 2*r 2*r];
    rectangle('Position',pos,'Curvature',[1 1], 'EdgeColor', [0.2 0.7 0],'LineWidth',2);
    text(-0.45+2*r+0.05, 1.45-r, 'Desired Position')
    
    %real position before grasping
    pos = [-0.45 1.45-4*r-0.05 2*r 2*r];
    rectangle('Position',pos, 'EdgeColor','r','LineWidth',1)
    text( -0.45+2*r+0.05, 1.45-3*r-0.05, 'Position')
    
    %real position after grasping
    pos = [-0.45 1.45-6*r-0.1 2*r 2*r];
    rectangle('Position', pos, 'EdgeColor','r', 'FaceColor', 'r')
    text(-0.45+2*r+0.05, 1.45-5*r-0.1, 'Position after Grasping')
    
    %object to grasp
    pos = [-0.45 1.45-6*r-0.15-0.2 0.1 0.2]
    rectangle('Position',pos,'Curvature',0.1, 'EdgeColor','b', 'LineWidth',2);
    text(-0.45+0.1+0.05, 1.45-6*r-0.15-0.1, 'Object to Grasp')

    % wall
    pos = [1.5 -0.5 0.15 2];
    rectangle('Position', pos, 'EdgeColor', [0.5 1 0.9],'FaceColor',[0.5 1 0.9])
    % shelf
    pos = [1 0.5-0.02 0.5 0.02];
    rectangle('Position', pos, 'Curvature',0.1, 'EdgeColor',[0.9 0.7 0], 'LineWidth',3)
    % table
    pos = [-0.5 -0.07 2 0.07];
    rectangle('Position', pos, 'Curvature',0.2, 'EdgeColor', [0.2 0.1 0] , 'FaceColor', [0.2 0.1 0])

    
    
    pos = [out.z_des.Data(index,1)-r out.z_des.Data(index,2)-r 2*r 2*r];
    rectangle('Position',pos,'Curvature',[1 1], 'EdgeColor', [0.2 0.7 0],'LineWidth',2);

    
    if t(index) < 2
        pos = [0.5 0 0.1 0.2];
        rectangle('Position',pos,'Curvature',0.1, 'EdgeColor','b', 'LineWidth',2);
        pos = [out.z1.Data(index,1)-r out.z1.Data(index,2)-r 2*r 2*r];
        rectangle('Position',pos, 'EdgeColor', 'r');
    elseif t(index) < 3.5
        pos = [out.z1.Data(index,1) out.z1.Data(index,2) 0.1 0.2];
        rectangle('Position', pos, 'Curvature', 0.1, 'EdgeColor', 'b', 'LineWidth',2);
        pos = [out.z1.Data(index,1)-r out.z1.Data(index,2)-r 2*r 2*r];
        rectangle('Position',pos, 'EdgeColor', 'r', 'FaceColor','r');
    else
        pos = [1.4 0.5 0.1 0.2];
        rectangle('Position', pos, 'Curvature', 0.1, 'EdgeColor', 'b', 'LineWidth',2);
        pos = [out.z1.Data(index,1)-r out.z1.Data(index,2)-r 2*r 2*r];
        rectangle('Position',pos, 'EdgeColor', 'r','LineWidth',1);
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
