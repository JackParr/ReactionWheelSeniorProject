%% Simulink Data Processing
% Use this file after you run the simulink. This should process the data
% and plot it

%% Pull data from Simulink

% Pull out number of timesteps
Time = out.tout';                   % Timestep out
% Angular Acceleration (Matlab Calculation)
W_satx = out.W_sat_x;               % Angular accelleration X direction
W_saty = out.W_sat_y;               % Angular accelleration Y direction
W_satz = out.W_sat_z;               % Angular accelleration Z direction
% Moments acting on the satellite
X_moment_Sat = out.X_moment_Sat;
Y_moment_Sat = out.Y_moment_Sat;
Z_moment_Sat = out.Z_moment_Sat;
% Simulink Run W_sat data
W_Sat = out.W_Sat_Simulink;




Moment_sat = [X_moment_Sat';Y_moment_Sat';Z_moment_Sat'];  % Make this easier to work with
%% Plot Data

% Plot Angular Velocity about each axis
fig1 = figure(1);
hold on
plot(Time,(180/pi)*W_Sat(:,1),'r')
plot(Time,(180/pi)*W_Sat(:,2),'g')
plot(Time,(180/pi)*W_Sat(:,3),'b')
xlabel('Time (seconds)')
ylabel('Angular Velocity (Degrees/sec)')
title('Angular Velocity About Each Axis')
legend('W_x', 'W_y', 'W_z','location','east')
hold off

% Plot new displacement
% fig2 = figure(2);
% hold on 
% plot(Time,(180/pi)*displacement(1,:),'r')
% plot(Time,(180/pi)*displacement(2,:),'g')
% plot(Time,(180/pi)*displacement(3,:),'b')
% xlabel('Time (seconds)')
% ylabel('Angular Displacement (Degrees)')
% title('Angular Displacement About Each Axis')
% legend('Theta_x', 'Theta_y', 'Theta_z','location','east')
% hold off

%% Print out important end variables
% Print final orientation about each axis
% fprintf("The total angular displacement about the X axis is: %4.8f Radians \n",displacement_total(1))
% fprintf("The total angular displacement about the Y axis is: %4.8f Radians \n",displacement_total(2))
% fprintf("The total angular displacement about the Z axis is: %4.8f Radians \n",displacement_total(3))
fprintf('------------------------------------------------------------------------------------------\n')
% Print final velocity about each axis
fprintf("The Final angular velocity about the X axis is: %4.8f Radians per Second \n",W_Sat(end,1))
fprintf("The Final angular velocity about the Y axis is: %4.8f Radians per Second \n",W_Sat(end,2))
fprintf("The Final angular velocity about the Z axis is: %4.8f Radians per Second \n",W_Sat(end,3))