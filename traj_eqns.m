function xdot = traj_eqns(t,x)

% x(1)=Vx, x(2)=Vy, x(3)=Vz, x(4)=X, x(5)=Y, x(6)=Z, x(7)=omega
xdot = zeros(7,1);

global RADIUS MASS RHO AREA GRAVITY MOI tx ty tz Cd Cl Cm

speed = sqrt(x(1)*x(1)+x(2)*x(2)+x(3)*x(3));
omega = x(7);
spinratio = RADIUS*omega/speed;
Q = RHO*speed^2*AREA/2; %factored out to simplify

% Aerodynamic coeffs
% Cd = 0.12 + 0.8*spinratio;
% Cl = 0.12 + 0.77*spinratio;
% Cm = 0.0125*spinratio;

Cd = 0.2; 
Cm = 0.2; 
Cl = 0.2; 
% STILL NEED  CM

xdot(1) = (-Q*Cd*x(1)/speed + Q*Cl*(ty*x(3)-tz*x(2))/speed)/MASS ;  %Vx dot
xdot(2) = (-Q*Cd*x(2)/speed + Q*Cl*(tz*x(1)-tx*x(3))/speed)/MASS - GRAVITY; %Vy dot
xdot(3) = (-Q*Cd*x(3)/speed + Q*Cl*(tx*x(2)-ty*x(1))/speed)/MASS;   %Vz dot
xdot(4) = x(1);
xdot(5) = x(2);
xdot(6) = x(3);

xdot(7) = -Q*Cm*RADIUS*2/MOI;   %omega dot
end
