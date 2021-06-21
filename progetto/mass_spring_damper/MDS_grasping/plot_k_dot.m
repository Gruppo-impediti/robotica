syms k

ki = 10;
a0 = 0.98;
csi = 1;
m = 1;

k_dot = (4*a0*sqrt(ki/m)*(k)^(3/2))/(sqrt(k) + 2*a0*csi*sqrt(ki));

fplot(k, k_dot, [10 100])
grid on
hold on
