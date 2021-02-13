% Finding the TF of the OpAmp Circuit
A = importdata('AmplifierCCT.txt');

time = A.data(:,1);
outputvoltage = A.data(:,2);
inputvoltage = 5.0*ones(length(outputvoltage),1);

opampdata = iddata(outputvoltage,inputvoltage,1E-8);

np = 2; % number of poles
nz = 0; % number of zeros
opamptf = tfest(opampdata, np, nz)
subplot(2,1,1)
step(opamptf)
subplot(2,1,2)
impulse(opamptf)

% Finding the TF of the Motor
R  = 1.02;       % Armature (terminal) resistance
L  = 0.000058;   % Armature (terminal) inductance
Km = 0.00918;        % Motor constant
Kb = 0.00918;        % Back-EMF constant
J  = 0.000000505 + 0.000012203355624; % Armature inertia
B  = Km * 0.0392 / 649.262481742;     % Armature damping (Km*ia/(NL speed in rad/s))

% Display results
G  = tf(Km, [L*J (L*B + R*J) R*B]);
H  = tf(Kb, 1);
motortf = feedback(G,H);

% Finding Root Locus
TF = opamptf * motortf * tf([1], [1 0]);
rlocus(TF);