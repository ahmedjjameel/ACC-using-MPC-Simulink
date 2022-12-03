%% Adaptive Cruise Control System Using Model Predictive Control
clear; close all; clc

%% Define the sample time, |Ts|, and simulation duration, |T|, in seconds.
Ts = 0.1;
T = 80;             % T = 80 sec

%% Specify the linear model for ego car.
G_ego = tf(1,[0.5,1,0]);

%% Specify the initial position and velocity for the two vehicles.
x0_lead = 50;       % initial position for lead car 50 (m)
v0_lead = 25;       % initial velocity for lead car 25 (m/s)
x0_ego = 10;        % initial position for ego car 10 (m)
v0_ego = 20;        % initial velocity for ego car 20 (m/s)

%% The safe distance between the lead car and the ego car is a function
%% of the ego car velocity
t_gap = 1.5;        % t_gap = 1.4
D_default = 10;     % D_default = 10

%% Specify the driver-set velocity in m/s.
v_set = 30;         % v_set = 30

%% Considering the physical limitations of the vehicle dynamics, the
%% acceleration is constrained to the range  |[-3,2]| (m/s^2).
amin_ego = -3;      % amin_ego = -3
amax_ego = 2;       % amax_ego = 2

%% Run the simulation
sim('ACCmpcsystem')

%% Open Simulink model
open_system('ACCmpcsystem')  % open the Simulink Model 'mpcACCsystem'

%% Plot the simulation result
ACCmpcplot(logsout,D_default,t_gap,v_set)
