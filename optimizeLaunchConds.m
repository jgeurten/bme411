function distance = optimizeLaunchConds(launchConds)

    v0 = launchConds(1);            % initial speed [m/s] 
    angle = launchConds(2);  % degrees
    wz = launchConds(3);            % back spin [rad/s]
    [v_max, height] = calcVelocity(angle); 
    
    if(v0 == -1)
        v0 = v_max; 
    end
    
    if(v_max < v0)
        v0 = v_max; 
    end
    
    launch_params = [v0, angle, wz, height]; 
    [x, final,t] = simBallTrajectory(launch_params);

    distance = x(final,3);
    distance = -distance; 
%     if distance < 0
%         distance = 1; 
%     else
%         distance = -distance;
%     end
    
end