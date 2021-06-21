%% Animazione RR2
inc=0.05;
fps=10;
period=1/fps;
fig = figure('name', 'Franka');

hold off;
grid on
tprec=0;
index=1;
t = out.q.time;
sizet=size(t);

%% Calculations
q1 = out.q.Data(1, 1);
q2 = out.q.Data(2, 1);
q3 = out.q.Data(3, 1);
q4 = out.q.Data(4, 1);
q5 = out.q.Data(5, 1);
q6 = out.q.Data(6, 1);
q7 = out.q.Data(7, 1);


% D-H parameters
a3 = 0.0825;
a4 = -0.0825;
a6 = 0.088;
d1 = 0.333;
d3 = 0.316;
d5 = 0.384;
d7 = 0.107;

A1 = [  cos(q1) 0 sin(q1) 0; ...
        sin(q1) 0 -cos(q1) 0; ...
         0 1 0 d1; ...
         0 0 0 1];
     
A2 = [  cos(q2) 0 -sin(q2) 0; ...
        sin(q2) 0 cos(q2) 0; ...
        0 -1 0 0; ...
        0 0 0 1];
    
A3 = [  cos(q3) 0 sin(q3) a3*cos(q3); ...
        sin(q3) 0 -cos(q3) a3*sin(q3); ...
        0 1 0 d3; ...
        0 0 0 1];
     
A4 = [  cos(q4) 0 -sin(q4) a4*cos(q4); ...
        sin(q4) 0 cos(q4) a4*sin(q4); ...
        0 -1 0 0; ...
         0 0 0 1];

A5 = [  cos(q5) 0 sin(q5) 0; ...
        sin(q5) 0 -cos(q5) 0; ...
        0 1 0 d5; ...
        0 0 0 1];
    
A6 = [  cos(q6) 0 sin(q6) a6*cos(q6); ...
        sin(q6) 0 -cos(q6) a6*sin(q6); ...
        0 1 0 0; ...
        0 0 0 1];
    
A7 = [  cos(q7) -sin(q7) 0 0; ...
        sin(q7) cos(q7) 0 0; ...
        0 0 1 d7; ...
        0 0 0 1];

pos0 = [0;0;0;1];
pos1 = A1*[0;0;0;1];
pos2 = A1*(A2*[0 0 0 1]');
pos3 = A1*(A2*(A3*[0 0 0 1]'));
pos4 = A1*(A2*(A3*(A4*[0 0 0 1]')));
pos5 = A1*(A2*(A3*(A4*(A5*[0 0 0 1]'))));
pos6 = A1*(A2*(A3*(A4*(A5*A6*([0 0 0 1]')))));
pos7 = A1*(A2*(A3*(A4*(A5*A6*(A7*([0 0 0 1]'))))));

pos = [pos0 pos1 pos2 pos3 pos4 pos5 pos6 pos7];
Px = pos(1, 1:8);
Py = pos(2, 1:8);
Pz = pos(3, 1:8);

% First Plot
[X,Y,Z] = sphere;

% joint 1
center = pos1;
r = 0.01;
X1 = X * r;
Y1 = Y * r;
Z1 = Z * r;
surf(X1+pos1(1), Y1+pos1(2), Z1+pos1(3))
axis equal
hold on;
% joint 2
center = pos2;
r = 0.01;
X1 = X * r;
Y1 = Y * r;
Z1 = Z * r;
surf(X1+pos2(1), Y1+pos2(2), Z1+pos2(3))
axis equal
hold on;
% joint 3
center = pos3;
r = 0.01;
X1 = X * r;
Y1 = Y * r;
Z1 = Z * r;
surf(X1+pos3(1), Y1+pos3(2), Z1+pos3(3))
axis equal
hold on;
% joint 4
center = pos4;
r = 0.01;
X1 = X * r;
Y1 = Y * r;
Z1 = Z * r;
surf(X1+pos4(1), Y1+pos4(2), Z1+pos4(3))
axis equal
hold on;
% joint 5
center = pos5;
r = 0.01;
X1 = X * r;
Y1 = Y * r;
Z1 = Z * r;
surf(X1+pos5(1), Y1+pos5(2), Z1+pos5(3))
axis equal
hold on;
% joint 6
center = pos6;
r = 0.01;
X1 = X * r;
Y1 = Y * r;
Z1 = Z * r;
surf(X1+pos6(1), Y1+pos6(2), Z1+pos6(3))
axis equal
hold on;
% joint 7
center = pos7;
r = 0.01;
X1 = X * r;
Y1 = Y * r;
Z1 = Z * r;
surf(X1+pos7(1), Y1+pos7(2), Z1+pos7(3))
axis equal
hold on;

ppp = plot3(Px, Py, Pz);
ppp.LineWidth = 7;
axis equal
xlim([-1 1]);
ylim([-1 1]);
zlim([-1 1]);
xlabel('x');
ylabel('y');
zlabel('z');
grid on
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
    % Calculations
    q1 = out.q.Data(1, index);
    q2 = out.q.Data(2, index);
    q3 = out.q.Data(3, index);
    q4 = out.q.Data(4, index);
    q5 = out.q.Data(5, index);
    q6 = out.q.Data(6, index);
    q7 = out.q.Data(7, index);
    % D-H parameters
    a3 = 0.0825;
    a4 = -0.0825;
    a6 = 0.088;
    d1 = 0.333;
    d3 = 0.316;
    d5 = 0.384;
    d7 = 0.107;
    % transformation matrices
    A1 = [  cos(q1) 0 sin(q1) 0; ...
            sin(q1) 0 -cos(q1) 0; ...
             0 1 0 d1; ...
             0 0 0 1];
    A2 = [  cos(q2) 0 -sin(q2) 0; ...
            sin(q2) 0 cos(q2) 0; ...
            0 -1 0 0; ...
            0 0 0 1];
    A3 = [  cos(q3) 0 sin(q3) a3*cos(q3); ...
            sin(q3) 0 -cos(q3) a3*sin(q3); ...
            0 1 0 d3; ...
            0 0 0 1];
    A4 = [  cos(q4) 0 -sin(q4) a4*cos(q4); ...
            sin(q4) 0 cos(q4) a4*sin(q4); ...
            0 -1 0 0; ...
             0 0 0 1];
    A5 = [  cos(q5) 0 sin(q5) 0; ...
            sin(q5) 0 -cos(q5) 0; ...
            0 1 0 d5; ...
            0 0 0 1];
    A6 = [  cos(q6) 0 sin(q6) a6*cos(q6); ...
            sin(q6) 0 -cos(q6) a6*sin(q6); ...
            0 1 0 0; ...
            0 0 0 1];
    A7 = [  cos(q7) -sin(q7) 0 0; ...
            sin(q7) cos(q7) 0 0; ...
            0 0 1 d7; ...
            0 0 0 1];
    % joints positions
    pos0 = [0;0;0;1];
    pos1 = A1*[0;0;0;1];
    pos2 = A1*(A2*[0 0 0 1]');
    pos3 = A1*(A2*(A3*[0 0 0 1]'));
    pos4 = A1*(A2*(A3*(A4*[0 0 0 1]')));
    pos5 = A1*(A2*(A3*(A4*(A5*[0 0 0 1]'))));
    pos6 = A1*(A2*(A3*(A4*(A5*A6*([0 0 0 1]')))));
    pos7 = A1*(A2*(A3*(A4*(A5*A6*(A7*([0 0 0 1]'))))));
    pos = [pos0 pos1 pos2 pos3 pos4 pos5 pos6 pos7];
    Px = pos(1, 1:8);
    Py = pos(2, 1:8);
    Pz = pos(3, 1:8);
    % Plot
    % joint 1
    center = pos1;
    r = 0.01;
    X1 = X * r;
    Y1 = Y * r;
    Z1 = Z * r;
    surf(X1+pos1(1), Y1+pos1(2), Z1+pos1(3))
    axis equal
    hold on;
    % joint 2
    center = pos2;
    r = 0.01;
    X1 = X * r;
    Y1 = Y * r;
    Z1 = Z * r;
    surf(X1+pos2(1), Y1+pos2(2), Z1+pos2(3))
    axis equal
    hold on;
    % joint 3
    center = pos3;
    r = 0.01;
    X1 = X * r;
    Y1 = Y * r;
    Z1 = Z * r;
    surf(X1+pos3(1), Y1+pos3(2), Z1+pos3(3))
    axis equal
    hold on;
    % joint 4
    center = pos4;
    r = 0.01;
    X1 = X * r;
    Y1 = Y * r;
    Z1 = Z * r;
    surf(X1+pos4(1), Y1+pos4(2), Z1+pos4(3))
    axis equal
    hold on;
    % joint 5
    center = pos5;
    r = 0.01;
    X1 = X * r;
    Y1 = Y * r;
    Z1 = Z * r;
    surf(X1+pos5(1), Y1+pos5(2), Z1+pos5(3))
    axis equal
    hold on;
    % joint 6
    center = pos6;
    r = 0.01;
    X1 = X * r;
    Y1 = Y * r;
    Z1 = Z * r;
    surf(X1+pos6(1), Y1+pos6(2), Z1+pos6(3))
    axis equal
    hold on;
    % joint 7
    center = pos7;
    r = 0.01;
    X1 = X * r;
    Y1 = Y * r;
    Z1 = Z * r;
    surf(X1+pos7(1), Y1+pos7(2), Z1+pos7(3))
    axis equal
    hold on;
    ppp = plot3(Px, Py, Pz);
    ppp.LineWidth = 7;
    axis equal
    xlim([-1 1]);
    ylim([-1 1]);
    zlim([-1 1]);
    grid on

    tprec=t(index);
    drawnow;
    pause(period);
    index = index +1;
    
end

