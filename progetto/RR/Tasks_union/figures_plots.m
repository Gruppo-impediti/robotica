%% Plot figures

% figure;
% time = out.F_ext.Time;
% plot(time, out.F_ext.Data(:,1), 'Linewidth',2)
% hold on
% grid on
% plot(time, out.F_ext_fixed.Data(:,1), 'Linewidth',2)
% title('Interaction Force X axes')
% xlabel('time [sec]')
% ylabel('Force [N]')
% legend('variable', 'fixed')
figure;
time = out.F_ext_var.Time;
plot(time, out.F_ext_var.Data(:,1), 'Linewidth',2)
hold on
grid on
plot(time, out.F_ext_fixed.Data(:,1), 'Linewidth',2)
title('Interaction Force X axes')
xlabel('time [sec]')
ylabel('Force [N]')
legend('variable', 'fixed')
limits = [0 11]
xlim(limits)
figure;
% time = out.F_ext_var.Time;
plot(time, out.F_ext_var.Data(:,2), 'Linewidth',2)
hold on
grid on
plot(time, out.F_ext_fixed.Data(:,2), 'Linewidth',2)
title('Interaction Force Y axes')
xlabel('time [sec]')
ylabel('Force [N]')
legend('variable', 'fixed')
xlim(limits)

figure;
% time = out.z.Time;
plot(time, out.z.Data(:,:), 'Linewidth',2)
hold on
grid on
% time = out.z_fixed.Time;
plot(time, out.z1.Data(:,:), 'Linewidth',2)
plot(time, out.z_des.Data(:,:), 'Linewidth', 2)
title('Position Comparison')
xlabel('time [sec]')
ylabel('Position [m]')
legend('variablex','variabley', 'fixedx', 'fixedy','desiredx','desiredy')
xlim(limits)

%  
figure;
% time = out.z.Time;
plot(time, out.z.Data(:,2), 'Linewidth',2)
hold on
grid on
% time = out.z_fixed.Time;
plot(time, out.z1.Data(:,2), 'Linewidth',2)
plot(time, out.z_des.Data(:,2), 'Linewidth', 1)
title('Position Comparison Y axes')
xlabel('time [sec]')
ylabel('Position [m]')
legend('variable', 'fixed', 'desired')
xlim(limits)

% figure;
% time = out.d_var.Time;
% plot(time, out.d_var.Data(:,1), 'Linewidth',2)
% hold on
% grid on
% plot(time, out.d1.Data(:,1), 'Linewidth',2)
% plot(time, out.d2.Data(:,1), 'Linewidth', 2)
% plot(time, out.d3.Data(:,1), 'Linewidth', 2)
% title('Response to an initial velocity comparison')
% xlabel('time [sec]')
% ylabel('Position [m]')
% legend('variable', 'critically damped','underdamped','overdamped')

% time = out.K_step.Time;
% data1 = zeros(size(time));
% data2 = zeros(size(time));
% for i = 1:size(time)
% data1 = out.K_step.Data(1,1,i);
% data2 = out.K_step.Data(2,2,i);
% end
% plot(time, data1, 'Linewidth',2, 'Color',[0.8500 0.3250 0.0980])
% hold on
% plot(time, data2, 'Linewidth',2, 'Color','b')
% 
% % ylim([0 100])
% xlabel('time [s]')
% ylabel('K [N/m]')
% title('Piece-wise constant stiffness') 
% 
% figure;
% grid on
% time = out.energy.Time;
% data = zeros(size(time));
% for i = 1:size(time)
% data(i) = out.energy.Data(1,1,i);
% end
% plot(time, data, 'Linewidth',2,'Color',[0.9290 0.6940 0.1250]) 
% title('Energy')
% xlabel('time [sec]')
% ylabel('Energy [J]')

% figure;
% grid on
% time = out.k_unstable.Time;
% data = zeros(size(time));
% for i = 1:size(time)
% data(i) = out.k_unstable.Data(1,1,i);
% end
% plot(time, data, 'Linewidth',2,'Color','b') 
% title('Stifness variation')
% xlabel('time [sec]')
% ylabel('K [N/m]')
% ylim([40 160])


% figure;
% time = out.F_ext_var.Time;
% plot(time, out.F_ext_var.Data(:,2), 'Linewidth',2)
% hold on
% grid on
% plot(time, out.F_ext_stepposo.Data(:,2), 'Linewidth',2)
% title('Interaction Force Y axes')
% xlabel('time [sec]')
% ylabel('Force [N]')
% legend('variable', 'fixed')

% figure;
% time = out.z.Time;
% plot(time, out.z.Data(:,1), 'Linewidth',2)
% hold on
% grid on
% % time = out.z_fixed.Time;
% plot(time, out.z_fixed.Data(:,1), 'Linewidth',2)
% plot(time, out.z_des.Data(:,1), 'Linewidth', 1)
% title('Position Comparison X axes')
% xlabel('time [sec]')
% ylabel('Position [m]')
% legend('variable', 'fixed', 'desired')

 
% figure;
% time = out.z.Time;
% plot(time, out.z.Data(:,2), 'Linewidth',2)
% hold on
% grid on
% % time = out.z_fixed.Time;
% plot(time, out.z_low.Data(:,2), 'Linewidth',2)
% plot(time, out.z_des.Data(:,2), 'Linewidth', 1, 'Color', [1 0.9 0])
% 
% title('Position Comparison Y axes')
% xlabel('time [sec]')
% ylabel('Position [m]')
% legend('variable', 'fixed', 'desired')
% 
% % figure;
% % time = out.d_var.Time;
% % plot(time, out.d_var.Data(:,1), 'Linewidth',2)
% % hold on
% % grid on
% % plot(time, out.d1.Data(:,1), 'Linewidth',2)
% % plot(time, out.d2.Data(:,1), 'Linewidth', 2)
% % plot(time, out.d3.Data(:,1), 'Linewidth', 2)
% % title('Response to an initial velocity comparison')
% % xlabel('time [sec]')
% % ylabel('Position [m]')
% % legend('variable', 'critically damped','underdamped','overdamped')
% 
% % time = out.damping.Time;
% % data = zeros(size(time));
% % for i = 1:size(time)
% % data(i) = out.damping.Data(1,1,i);
% % end
% plot(time, data, 'Linewidth',2, 'Color',[0.8500 0.3250 0.0980])
% ylim([0 100])
% xlabel('time [s]')
% ylabel('D [Ns/m]')
% title('Variable damping') 
% 
% figure;
% grid on
% time = out.energy.Time;
% data = zeros(size(time));
% for i = 1:size(time)
% data(i) = out.energy.Data(1,1,i);
% end
% plot(time, data, 'Linewidth',2,'Color',[0.9290 0.6940 0.1250]) 
% title('Energy')
% xlabel('time [sec]')
% ylabel('Energy [J]')

% figure;
% grid on
% time = out.F_ext_var.Time;
% data = zeros(size(time));
% for i = 1:size(time)
% data(i) = out.K_stepposo.Data(2,2,i);
% end
% plot(time, data, 'Linewidth',2,'Color','b') 
% title('Stiffness')
% xlabel('time [sec]')
% ylabel('K [N/m]')
% 
% 
