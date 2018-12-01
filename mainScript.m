% Main Script

% Initial launch conditions
% v0 = launch_params(1);      % initial speed [m/s] 
% 
% elev = launch_params(2);    % angle of elevation, theta in diagram
% 
% wz = launch_params(3);      % back spin [rad/s]
% height = launch_params(4);  % height of release above ground [m]

close all; 
setGlobalVars(); 

angles = 0:10:60;  %deg
backspins = 0:5:20; %rad/s

%PLot distances as a function of angle
figure, hold on 
for i = 1:length(angles)
    launch_params = [20, angles(i), 10, 2];
    [x, final,t] = simBallTrajectory(launch_params); 
    dispName = [num2str(angles(i)), ' deg']; 
    plot(x(1:final,3),x(1:final,4), 'LineWidth', 3,'DisplayName', dispName );
%     plot(t(1:final), x(1:final, 4), 'LineWidth', 3,'DisplayName', dispName); 
    legend('-DynamicLegend');
end
hold off
legend('show')
xlabel('Ball Distance [m]'); 
ylabel('Ball Height [m]'); 
zlabel('Z [m]'); 
title('Ball Trajectory')

figure, hold on
for i = 1:length(backspins)
    launch_params = [20, 20, backspins(i), 2];
    [x, final,t] = simBallTrajectory(launch_params); 
    dispName = [num2str(backspins(i)), ' rad/s']; 
    plot(x(1:final,3),x(1:final,4), 'LineWidth', 3,'DisplayName', dispName );
%     plot(t(1:final), x(1:final, 4), 'LineWidth', 3,'DisplayName', dispName); 
    legend('-DynamicLegend');
end
hold off
legend('show')
xlabel('Ball Distance [m]'); 
ylabel('Ball Height [m]'); 
zlabel('Z [m]'); 
title('Ball Trajectory')

%% Optimization part of the code

%[ vel (m/s), angle (deg), backspin (rad/s)];     
lBounds = [0, 0, 0]; 
uBounds = [20, 60, 10*pi];
initConds = [10, 35, 5]; 
options = optimoptions('fmincon','Display','iter'); 
nonlcon = @unitdisk; 
[optimalLaunchConds, distance] = fmincon(@optimizeLaunchConds, initConds,[],[],[],[],lBounds, uBounds, [], options)

figure, 
[~, height] = calcVelocity(optimalLaunchConds(2)); 
launchConds = [optimalLaunchConds, height]; 
[x, final,t] = simBallTrajectory(launchConds); 
plot(x(1:final,3),x(1:final,4), 'LineWidth', 3);
