function setGlobalVars()

global RADIUS MASS RHO AREA GRAVITY MOI PATH_L F_O DECAY H_SH A_O L_ARM
% Constants
RADIUS = 11/100; % in m
MASS = 430/1000; % in kg
RHO = 1.19; % in kg/m^3
AREA = 4*pi*RADIUS^2; % in m^2
GRAVITY = 9.81; % in m/s^2
MOI = 2/5*MASS*RADIUS^2; % I for thin spherical shell

PATH_L = 1.3; % m
F_O = 46; % N
DECAY = 0.44; %N/degree
H_SH = 1.58; % average of height of shoulder above ground
A_O = 21; % degrees
L_ARM = 0.8; %m

end