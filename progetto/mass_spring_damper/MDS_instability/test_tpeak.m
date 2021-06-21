k = 10;
d = 100;
M = 1;
x0 = [0;1];
A = [0 1; -k/M -d/M]; 
B = [0; 1/M];
C = [1 0];
D = [0];
x = expm(A*t)*x0;
pos = simplify(x(1));
d_pos = diff(pos,t);
d_pos = simplify(d_pos);

t_peak = solve(d_pos == 0, t);
t_peak = simplify(t_peak)

a = k/M;
b = d/M;
gamma = b^2-4*a;
t_peak_nostro = log(4*a/(b-sqrt(gamma))^2)/sqrt(gamma)