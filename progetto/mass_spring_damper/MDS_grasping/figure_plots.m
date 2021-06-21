% figure plots
figure;
time = out.e_max.Time;
e_max = out.e_max.Data(:,1);
pos_fixed = out.position_fixed.Data(:,2);
reference = out.reference.Data(:,1);
plot(time, e_max, 'Linewidth',2, 'LineStyle', '--')
hold on
grid on
plot(time, pos_fixed, 'Linewidth',2)
hold on 
grid on 
plot(time, reference, 'Linewidth', 2, 'LineStyle', '--')

xlabel('time [sec]')
ylabel('Position [m]')

xlim([0 5])
ylim([-0.15 0.05])