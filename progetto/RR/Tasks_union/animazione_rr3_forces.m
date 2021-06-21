%% setup
% movie parameters
movie_mode = 1;
line_graph = 1;
k = 1;				% init of movie's frames counter
movie_fps = 50;		% movie frame per second
movie_title = 'film_rr3_forces';

%% Animazione RR3
%colors
arm_color = [0 0.4 0.6];
can_color = [0.7 0.2 0.7];
ee_color = [0.8 0 0];
table_color = [0.3 0.3 0.3];
inc=0.05;
fps=movie_fps;
period=1/fps;
figh = figure('name', 'RR');
if(line_graph == 1)
    subplot(2,2,[1 3]);
end
title('movie')
xlabel('X')
ylabel('Y')
%figh.Position = [0 0 800*(3/2) 800];
xlim([-1 2]);
ylim([-0.5 1.5]);
hold off;
grid on
tprec=0;
index=1;
t = out.z_des.time;
sizet=size(t);

if(line_graph == 1)
    subplot(2,2,2);
%     anim_line1 = animatedline('Color','b','LineWidth',2);
%     anim_line2 = animatedline('Color','r','LineWidth',2);
    y11 = out.F_ext_var.Data(:,1);
    y12 = out.F_ext_fixed.Data(:,1);
    y21 = out.F_ext_var.Data(:,2);
    y22 = out.F_ext_fixed.Data(:,2);
    plot(t, y11);
    hold on
    plot(t, y12);
    hold off
    legend('variable X','fixed X')
    title('Interaction Force X')
    xlabel('time [sec]')
    ylabel('Force [N]')
    ylim([-20 5]);
    subplot(2,2,4);
    plot(t, y21);
    hold on
    plot(t, y22);
    hold off
    legend('variable Y','fixed Y')
    hold off
    title('Interaction Force Y')
    xlabel('time [sec]')
    ylabel('Force [N]')
    ylim([-10 50]);
    %axis([0,20,0,30])
end
pause();

while index < sizet(1)
    cla;
    while t(index) < (tprec+period) 
        if index >= sizet(1)
            break 
        else 
            index = index + 1;
        end
    end
    if(line_graph == 1)
        subplot(2,2,[1 3]);
        cla;
        hold off
    end
    title('RR places a can on a shelf')
    %% Legend 
    %desired position
    r = 0.03;
    pos = [ -0.95 1.45-2*r 2*r 2*r];
    rectangle('Position',pos,'Curvature',[1 1], 'EdgeColor', 'g', 'LineWidth', 2);
    text(-0.95+2*r+0.05, 1.45-r, 'Desired Position');
    
    %real position before grasping
    pos = [-0.95 1.45-4*r-0.05 2*r 2*r];
    rectangle('Position',pos, 'EdgeColor', ee_color)
    text( -0.95+2*r+0.05, 1.45-3*r-0.05, 'Position')
    
    %real position after grasping
    pos = [-0.95 1.45-6*r-0.1 2*r 2*r];
    rectangle('Position', pos, 'EdgeColor','r', 'FaceColor', ee_color)
    text(-0.95+2*r+0.05, 1.45-5*r-0.1, 'Position after Grasping')
    
    %object to grasp
    pos = [-0.95 1.45-6*r-0.15-0.2 0.1 0.2];
    rectangle('Position',pos,'Curvature',0.1, 'EdgeColor',can_color, 'LineWidth',4);
    text(-0.95+0.1+0.05, 1.45-6*r-0.15-0.1, 'Object to Grasp')
    
    % wall
    pos = [1.5 -0.5 0.15 2];
    rectangle('Position', pos, 'EdgeColor', [0.5 1 0.9],'FaceColor',[0.5 1 0.9])
    % shelf
    pos = [1 0.5-0.02 0.5 0.02];
    rectangle('Position', pos, 'Curvature',0.1, 'EdgeColor',[0.9 0.7 0], 'LineWidth',3)
    % table
    pos = [-0.5 -0.07 2 0.07];
    rectangle('Position', pos, 'Curvature',0.2, 'EdgeColor', [0.3 0.3 0.3] , 'FaceColor', [0.3 0.3 0.3])

    %% Plot
    % base
    pos1 = [-0.1 -0 0.2 0.07];
    rectangle('Position', pos1, 'EdgeColor', arm_color, 'FaceColor', arm_color); 
    
    line([0 l1*cos(out.q.Data(1,index))], [0 l1*sin(out.q.Data(1,index))],'Color',arm_color, 'LineWidth',10);
%     %joint
%     pos = [l1*cos(out.q.Data(1,index))-0.01 l1*sin(out.q.Data(1,index))-0.01 0.02 0.02];
%     rectangle('Position',pos,'Curvature',[1 1],'EdgeColor', arm_color, 'FaceColor',arm_color)
    line([l1*cos(out.q.Data(1,index)), l1*cos(out.q.Data(1,index))+l2*cos(out.q.Data(1,index)+out.q.Data(2,index))], [l1*sin(out.q.Data(1,index)), l1*sin(out.q.Data(1,index))+l2*sin(out.q.Data(1,index)+out.q.Data(2,index))],'Color',arm_color,'LineWidth',10);
    %giuntino
    pos = [l1*cos(out.q.Data(1,index))-0.04 l1*sin(out.q.Data(1,index))-0.04 0.08 0.08];
    rectangle('Position',pos,'Curvature',[1 1],'EdgeColor', arm_color, 'FaceColor', arm_color)
    
    % before grasping
    if t(index) < 3
        pos = [0.5 0 0.1 0.2];
        rectangle('Position',pos,'Curvature',0.1, 'EdgeColor',can_color, 'LineWidth',4);
        pos = [out.z.Data(index,1)-1.5*r out.z.Data(index,2)-1.5*r 2*1.5*r 2*1.5*r];
        rectangle('Position',pos, 'EdgeColor', ee_color);
    elseif t(index) < 7
        pos = [out.z.Data(index,1) out.z.Data(index,2) 0.1 0.2];
        rectangle('Position', pos, 'Curvature', 0.1, 'EdgeColor', can_color, 'LineWidth',4);
        pos = [out.z.Data(index,1)-1.5*r out.z.Data(index,2)-1.5*r 2*1.5*r 2*1.5*r];
        rectangle('Position',pos, 'EdgeColor', ee_color, 'FaceColor',ee_color);
    else
        pos = [1.4 0.5 0.1 0.2];
        rectangle('Position', pos, 'Curvature', 0.1, 'EdgeColor', can_color, 'LineWidth',2);
        pos = [out.z.Data(index,1)-1.5*r out.z.Data(index,2)-1.5*r 2*1.5*r 2*1.5*r];
        rectangle('Position',pos, 'EdgeColor', ee_color,'LineWidth',1);
    end
    %desired position
    pos = [out.z_des.Data(index,1)-r out.z_des.Data(index,2)-r 2*r 2*r];
    rectangle('Position',pos,'Curvature',[1 1], 'EdgeColor', 'g', 'Linewidth', 2);
    
    if(line_graph == 1)
        subplot(2,2,2);
        plot(t, y11);
        hold on
        plot(t, y12);
        ylim([-20 5]);
        line([t(index) t(index)], ylim, 'Color','k');
        hold off
        legend('variable X','fixed X')
        title('Interaction Force X')
        xlabel('time [sec]')
        ylabel('Force [N]')
        subplot(2,2,4);
        plot(t, y21);
        hold on
        plot(t, y22);
        ylim([-10 50]);
        line([t(index) t(index)], ylim, 'Color','k');
        hold off
        legend('variable Y', 'fixed Y')
        title('Interaction Force Y')
        xlabel('time [sec]')
        ylabel('Force [N]')
    end
    
    tprec=t(index);
    drawnow;
    pause(period);
    index = index +1;
    
    % animation
    if movie_mode == 1
		movieVector(k) = getframe(figh);
    elseif movie_mode == 2
        movieVector(k) = getframe(figh, [10,10,1910,960]);
    end		
	k = k+1;
end

% movie generator
if movie_mode == 1
    if movie_mode
        movie = VideoWriter( movie_title, 'MPEG-4');
        movie.FrameRate = movie_fps;

        open(movie);
        writeVideo(movie, movieVector);
        close(movie);
        disp([movie_title ' saved!'])
    end
end