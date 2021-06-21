%% Jooooordan

% limitiamo il picco in risposta ad un errore di velocità

syms  t d
x0 = [0; 1];

M = 1; 
k = 100;
% d = 2;

A = [0 1; -k/M -d/M]; 
B = [0; 1/M];
C = [1 0];
D = [0];
% G = ss(A,B,C,D)
% lsim(G,u,t,z0)

x = expm(A*t)*x0;
pos = simplify(x(1));
d_pos = diff(pos,t);
d_pos = simplify(d_pos);

t_peak = solve(d_pos == 0, t);
t_peak = simplify(t_peak);
pos2 = expm(A*t_peak)*x0;
pos2 = simplify(pos2);
pos_peak = pos2(1);

% % -(M*exp(-((log((d + (d^2 - 4*M*k)^(1/2))/(d - (d^2 - 4*M*k)^(1/2))) + pi*l*2i)*((-(- d^2 + 4*M*k)^3)^(1/2) + d^3 - 4*M*d*k))/(2*(d^2 - 4*M*k)^(3/2)))*(exp(((log((d + (d^2 - 4*M*k)^(1/2))/(d - (d^2 - 4*M*k)^(1/2))) + pi*l*2i)*(-(- d^2 + 4*M*k)^3)^(1/2))/(d^2 - 4*M*k)^(3/2)) - 1)*(- d^2 + 4*M*k))/(-(- d^2 + 4*M*k)^3)^(1/2)
% 
% M = 1;
% k = 100;
d = solve(pos_peak == 0.01, d);
d = simplify(d);


% A1 = [0 1; -k/M -d/M]; 
B = [0; 1/M];
C = [1 0];
D = [0];


t1 = [0.01:0.01:10]; 
u = ones(length(t1),1)*0; % disturb

A1 = [0 1;-100 -96.138836035593148858759890067603];

G = ss(A1,B,C,D);
lsim(G,u,t1,x0)
hold on 
grid on

A2 =  [0 1; -k/M -sqrt(4*k*M)/M];
B2 = [0; 1/M];
C2 = [1 0];
D2 = [0];

G2 = ss(A2,B2,C2,D2)
lsim(G2,u,t1,x0)