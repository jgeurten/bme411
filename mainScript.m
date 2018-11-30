% Main Script

% Initial launch conditions
% v0 = launch_params(1);      % initial speed [m/s] 
% 
% elev = launch_params(2);    % angle of elevation, theta in diagram
% azim = launch_params(3);    % angle of azimuth, alpha in diagram
% 
% wx = 0;                     % rifle spin [rad/s] - not physically possible
% wz = launch_params(4);      % back spin [rad/s]
% wy = launch_params(5);      % side spin [rad/s]
% height = launch_params(6);  % height of release above ground [m]
setGlobalVars(); 

angles = 1:1:20;  %deg
backspins = 0:5:20; %rad/s

%PLot distances as a function of angle
figure, 
hold on 
for i = 1:length(angles)
    launch_params = [20, angles(i), 1, 1, 1, 2.3];
    [x, final,t] = simBallTrajectory(launch_params); 
    dispName = [num2str(angles(i)), ' deg']; 
    plot3(x(1:final,4),x(1:final,5),x(1:final,6), 'LineWidth', 3,'DisplayName', dispName );
    legend('-DynamicLegend');
end

legend('show')
xlabel('Ball Distance [m]'); 
ylabel('Ball Height [m]'); 
zlabel('Z [m]'); 
title('Ball Trajectory')

