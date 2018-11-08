function setGlobalVars()

global RADIUS MASS RHO AREA GRAVITY MOI
% Constants
RADIUS = 34.5/pi/100; % in m
MASS = 430/1000; % in kg
RHO = 1.225; % in kg/m^3
AREA = 4*pi*RADIUS^2; % in m^2
GRAVITY = 9.81; % in m/s^2
MOI = 2/3*MASS*RADIUS^2; % I for thin spherical shell

end