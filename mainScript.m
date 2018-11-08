% Main Script
setGlobalVars(); 
launch_params = [50, 28, 2, 15, 10, 1.5]; 
[x, final,t] = simBallTrajectory(launch_params); 
figure, 
plot3(x(1:final,4),x(1:final,5),x(1:final,6));
xlabel('X [m]'); 
ylabel('Y [m]'); 
zlabel('Z [m]'); 
