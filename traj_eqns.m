function xdot = traj_eqns(t,x)

% x(1)=Vx, x(2)=Vy, , x(3)=X, x(4)=Y
xdot = zeros(4,1);

global RADIUS MASS RHO AREA GRAVITY MOI tx ty tz Cd Cl Cm

speed = sqrt(x(1)*x(1)+x(2)*x(2)); 
omega = tz;
Q = RHO*AREA/(2*MASS); %factored out to simplify

% Aerodynamic coeffs
% Cd = 0.12 + 0.8*spinratio;
% Cl = 0.12 + 0.77*spinratio;
% Cm = 0.0125*spinratio;

Sp = RADIUS*omega/speed; 
Cl = -0.35*exp(-7*Sp) + 0.35; 
Cd = 0.25 + 0.5*Sp; 

% Cd = 0.2; 
% Cm = 0.2; 
% Cl = 0.2; 

xdot(1) =  -Q*speed*(Cd*x(1) + Cl*x(2)); %Vx dot
xdot(2) = Q*speed*(Cl*x(1) - Cd*x(2)) - GRAVITY; %Vy dot
xdot(3) = x(1);
xdot(4) = x(2);

end
