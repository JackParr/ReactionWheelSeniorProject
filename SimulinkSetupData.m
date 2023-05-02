%{
Setup Function

Jack Parr
Senior Seminar
Mississippi State University Aerospace Engineering CO'23

Purpose:
This program sets the system up for the simulink simulation. It would
import variables to the Simulink simulation.

%}
clc 
%% CubeSat Properties - Mass Props
% This should pull all the values of the CubeSat's mass properties, these
% should likely be imported from Solidworks, might have to run through CSV

% Read in mass properties CSV file
MassProps = readtable('MassProps.csv');

% Assign Data from MassProps CSV file
Mass = MassProps.Mass;               % Total System Mass
XCG = MassProps.XCG;                 % X Center of Gravity
YCG = MassProps.YCG;                 % Y Center of Gravity
ZCG = MassProps.ZCG;                 % Z Center of Gravity
I_sat = [244981.17 21101.32 12947.9; 21101.32 68490.28 101502.37;12947.9 101502.37 185548.54];       % MMOI Taken from solidworks, units in kg*mm^2
% ADD PROPS HERE AS NEEDED

% Work with data to make more usable
CG = [XCG; YCG; ZCG];
%% Initial Conditions
W_Sat_0 = [0 0 0];               % Initial Angular Velocity of the Satellite
Position_Sat_0 = [0, 0, 0];     % Initial Angles of the satellite

%% Reaction Wheel - motor orientation
% The RWA will have 4 wheels oriented at different angles with the base of
% the CubeSat.

% Motor Properties
L = 0.05;                                                                  % Motor Inductance (H)
Kt = 0.01;                                                                % Torsional Constant (angular)
J = 0.01;                                                                 % MOI of the motor (kg*m^2)
b = 0.1;                                                                  % motor viscous friction constant
Ke = 0.01;                                                                % electromotive force constant
R = 1;                                                                    % Resistance(ohms)
Voltage = [0:0.1:10];                                                       % Volts
MMOI_Wheel= [0.00000252, 0.00000000, 0.00000000; 0.00000000, 0.00000479, 0.00000000; 0.00000000, 0.00000000, 0.00000256];              % Kg in X, Y, & Z directions

% Wheel angles as theta and phi. Theta is measuremet from y axis on the XY
% plane. Phi is measurement up from XY plane. (see jack's attached notes

theta1 = deg2rad(24);                              % Degrees (for now)
phi1 = deg2rad(21);                                % Degrees (for now)
theta2 = deg2rad(-74);                             % Degrees (for now)
phi2 = deg2rad(46);                                % Degrees (for now)
theta3 = deg2rad(-14);                             % Degrees (for now)
phi3 = deg2rad(-3);                                % Degrees (for now)
theta4 = deg2rad(84);                              % Degrees (for now)
phi4 = deg2rad(-39);                               % Degrees (for now)

% Unit vectors made with the layout angles 
RWA_UV_1 = [sind(theta1)*cosd(phi1) sind(90-theta1)*cosd(phi1) sind(phi1)];      % Unit Vector
RWA_UV_2 = [sind(theta2)*cosd(phi2) sind(90-theta2)*cosd(phi2) sind(phi2)];      % Unit Vector
RWA_UV_3 = [sind(theta3)*cosd(phi3) sind(90-theta3)*cosd(phi3) sind(phi3)];      % Unit Vector
RWA_UV_4 = [sind(theta4)*cosd(phi4) sind(90-theta4)*cosd(phi4) sind(phi4)];      % Unit Vector