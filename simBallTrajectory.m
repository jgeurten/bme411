function [x, final,t] = simBallTrajectory(launch_params)

global tx ty tz

% Initial launch conditions
v0 = launch_params(1);      % initial speed [m/s] 
elev = launch_params(2)*pi/180;    % angle of elevation, theta in diagram
wz = launch_params(3);      % back spin [rad/s]
height = launch_params(4);  % height of release above ground [m]

vx = v0*cos(elev);
vy = v0*sin(elev);
tz = wz;

t0 = 0;
tf = 100;
%x(1)=Vx, x(2)=Vy,  x(3)=X, x(4)=Y
x0 = [vx, vy, 0, height]';   % initial launch conditions

options = odeset('RelTol',1e-5,'AbsTol',1e-6);
[t,x] = ode45('traj_eqns', [t0,tf], x0, options);

% find time when ball returns to ground.
final_height= 0;  % final ground height, in meters
final = -1;
[rows,cols] = size(x);
for i=2:rows,
  if x(i,4) < final_height  % ball has impacted ground (check y_dot < 0)
    if final < 0            % then we are at first instant of impact.
        final = i;
        % use linear interpolation to get final values:
        t(i)= t(i-1) + (t(i)-t(i-1))*(final_height-x(i-1,4))/(x(i,4)-x(i-1,4));
        x(i,1) = x(i-1,1) + (x(i,1)-x(i-1,1))*(final_height-x(i-1,4))/(x(i,4)-x(i-1,4));
        x(i,2) = x(i-1,2) + (x(i,2)-x(i-1,2))*(final_height-x(i-1,4))/(x(i,4)-x(i-1,4));
        x(i,3) = x(i-1,3) + (x(i,3)-x(i-1,3))*(final_height-x(i-1,4))/(x(i,4)-x(i-1,4));
        %x(i,5) = x(i-1,5) + (x(i,5)-x(i-1,5))*(final_height-x(i-1,4))/(x(i,4)-x(i-1,4));
        x(i,4) = final_height;  %final y value reset to fgh
    end
  end
end
end
