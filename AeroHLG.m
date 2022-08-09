% AeroHLG Control Linkages Calculations
% Author: Krisian Bargas
%
% February 16, 2020
%
% Matrices are already set up, just change the variable values
% This calculates the torque experienced by the servo motor on the control
% linkages for the ailerons.
%

Fd = 8.621383; %in Newtons
Lsa = 0.0508; % in m
Lca = 0.08; % in m
Lcha = 0.0381; % 
Lch = 0.0508; % in

a = (40*pi/180); % degrees to radians 
b = (20*pi/180); % degrees to radians
d = (20*pi/180); % degrees to radians

A = [1 0 1 0 0 0 0 0 0;
    -1 0 0 0 1 0 0 0 0;
     0 0 0 0 -1 0 1 0 0;
     0 1 0 1 0 0 0 0 0;
     0 -1 0 0 0 1 0 0 0;
     0 0 0 0 0 -1 0 1 0;
     sqrt(Lcha^2 + Lch^2) 0 0 0 0 0 0 0 0;
     -Lca*sin(b) Lca*cos(b) 0 0 0 0 0 0 0;
     0 0 0 0 -Lsa*cos(a) -Lsa*sin(a) 0 0 1];
 
 X = [Fd; 0; 0; 0; 0; 0; Fd*(Lcha*sin(d)); 0; 0];
     
 B = A \ X; 
  