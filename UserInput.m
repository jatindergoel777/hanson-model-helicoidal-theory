%% User Inputs for Hanson model to caculate tonal noise in frequency domain
%%  Ambient conditions
Amb.rho= 1.225;                 % Air density[kg/m^3]
Amb.c0 = 340.2941;              % speed of sound [m/s];
Amb.gamma = 1.4;                % Ratio of specific heats [-]
Amb.pref = 2.e-5;               % Reference pressure for SPL calculations [Pa]

%% Propeller parameters
prop.B = 2;                     % Number of propeller blades [-]
prop.rt = 0.631/2;              % Propeller tip radius [m]
prop.hub = 0.084;               % Propeller hub radius [m]
prop.mu = 100;                  % No. of elements in the radial direction [-]
prop.method = 'linear';         % Two options - 'linear' or 'cosine' for distribution of elements along blade span

%% Blade properties
inputFolder = './InputData/';   % Folder with blade properties contianing csv files
file.bD = 'bd_rR.csv';          % chord to diamater ratio (csv file)

file.tb = 'tb_rR.csv';          % maximum thickness to chord ratio (csv file)
prop.thick_dist = 'parabolic';      % Two options - 'parabolic' or 'uniform' for thickness distrbution along the chord

file.FA = 'FA_rR.csv';          % Face alignment [m] or offset (csv file)
file.MCA = 'MCA_rR.csv';        % midchord alignment or sweep [m] for wept blades (csv file)

file.Cl = 'Cl_rR.csv';          % Lift coefficient distrbution along blade span
file.Cd = 'Cd_rR.csv';          % Drag coefficient distribution along blade span
prop.load_dist = 'parabolic';      % Two options - 'parabolic' or 'uniform' for loading distrbution along the chord
%% operating condition
op.Min = 0.32;                  % inflow Mach number [-]
op.Mfl = 0;                     % flight Mach number [-] 
op.Mht = 1.049;                 % Helical tip Mach number [-]

%% Observer location
obs.R = [0.1, 0.1]./prop.rt;             % prependicualr distance in plane of rotation/ propeller radius [-]
obs.x = [0.1, 0.2]./prop.rt;              % Observer distance in axial direction/ propeller radius [-] 
