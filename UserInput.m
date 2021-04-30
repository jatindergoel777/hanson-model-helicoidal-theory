%% User Inputs for Hanson model to caculate tonal noise in frequency domain
%%  Ambient conditions
Amb.rho= 1.225;                 % Air density[kg/m^3]
Amb.c0 = 340.2941;              % speed of sound [m/s];
Amb.gamma = 1.4;                % Ratio of specific heats [-]
Amb.pref = 2.e-5;               % Reference pressure for SPL calculations [Pa]

%% Propeller parameters
prop.B = 3;                     % Number of propeller blades [-]
prop.rt = 0.2032;              % Propeller tip radius [m]
prop.hub = 0.21*0.2032;               % Propeller hub radius [m]
prop.mu = 100;                  % No. of elements in the radial direction [-]
prop.method = 'linear';         % Two options - 'linear' or 'cosine' for distribution of elements along blade span

%% Blade properties
inputFolder = './InputData/Xprop/';   % Folder with blade properties contianing csv files
file.bD = 'bd_rR.csv';          % chord to diamater ratio (csv file)

file.tb = 'tb_rR.csv';          % maximum thickness to chord ratio (csv file)
prop.thick_dist = 'parabolic';      % Two options - 'parabolic' or 'uniform' for thickness distrbution along the chord

file.FA = 'FA_rR.csv';          % Face alignment [m] or offset (csv file)
file.MCA = 'MCA_rR.csv';        % midchord alignment or sweep [m] for wept blades (csv file)

file.Cl = sprintf('/Loading/RANS_ClwithoutInduction_rR_J%.02f_idx%d.csv',J,idx);          % Lift coefficient distrbution along blade span
file.Cd = sprintf('/Loading/RANS_CdwithoutInduction_rR_J%.02f_idx%d.csv',J,idx);          % Drag coefficient distribution along blade span
prop.load_dist = 'parabolic';      % Two options - 'parabolic' or 'uniform' for loading distrbution along the chord

%% Thrust Torque noise
TQ.flag = 1;                    % Switch to turn on the calculation of thrust and torque noise
TQ.file.dT = sprintf('/Loading/RANS_dT_rR_J%.02f_idx%d.csv',J,idx);              % propeller thrust distribution per blade along radial direction
TQ.file.dQ = sprintf('/Loading/RANS_dQ_rR_J%.02f_idx%d.csv',J,idx);              % propeller torque distribution per blade along radial direction
%% operating condition
op.Min = 0;                  % inflow Mach number [-]
op.Mfl = 43.29211446/Amb.c0;                     % flight Mach number [-] 
op.Mht = sqrt((92.67241297*2*pi*0.2032)^2 + 43.29211446^2)/Amb.c0;                 % Helical tip Mach number [-]

%% Observer location
obs.R = [];             % prependicualr distance in plane of rotation/ propeller radius [-]
obs.x = [];             % Observer distance in axial direction/ propeller radius [-] 

obs.theta =  (1:1:179).*(pi/180);     %observer angle in axial direction [rad]
obs.r = 10;         % observer distance from propeller center/ propeller radius [-]