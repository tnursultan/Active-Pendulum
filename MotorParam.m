%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Initializes variables for the Simulink model of an electric motor %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Start with a clean slate
clear all;

% Motor parameters
% Electrical
R  = 1.02;       % Armature (terminal) resistance
L  = 0.000058;   % Armature (terminal) inductance

% Bridge
Km = 0.00918;        % Motor constant
Kb = 0.00918;        % Back-EMF constant

% Mechanical
J  = 0.000000505 + 0.000012203355624; % Armature inertia
B  = Km * 0.0392 / 649.262481742;     % Armature damping (Km*ia/(NL speed in rad/s))

% Display some results
G  = tf(Km, [L*J (L*B + R*J) R*B]);
H  = tf(Kb, 1);
TF = feedback(G,H)
