function [velocity, height] = calcVelocity(theta)

global PATH_L MASS F_O DECAY H_SH RADIUS A_O L_ARM


velocity = sqrt(2*(F_O - DECAY*theta)*PATH_L/MASS); 
height = H_SH + L_ARM*sind(theta + A_O) - RADIUS; 

end