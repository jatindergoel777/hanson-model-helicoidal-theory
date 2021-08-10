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
prop.method = 'cosine';         % Two options - 'linear' or 'cosine' for distribution of elements along blade span

%% Blade properties
inputFolder = './InputData/Xprop/';   % Folder with blade properties contianing csv files
file.bD = 'bd_rR.csv';          % chord to diamater ratio (csv file)
file.tb = 'tb_rR.csv';          % maximum thickness to chord ratio (csv file)
file.FA = 'FA_rR.csv';          % Face alignment [m] or offset (csv file)
file.MCA = 'MCA_rR.csv';        % midchord alignment or sweep [m] for wept blades (csv file)

prop.thick_dist = 'custom';      % Three options - 'parabolic','uniform','custom' for thickness distrbution along the chord
file.thick_dist = 't_xc.csv'; % Give filename if 'custom' distribution is chosen otherwise you can leave it empty
%% Analysis type - Either provide Cl and Cd files or Thurst and Toqrue files, leaver the other two empty as ''
file.Cl_span = 'Loading/BEM_Cl_rR_J1.60_idx71.csv';   % Lift coefficient distrbution along blade span (without induction)
file.Cd_span = 'Loading/BEM_Cd_rR_J1.60_idx71.csv';   % Drag coefficient distrbution along blade span (without induction)
file.dTNdr = '';        % propeller thrust distribution per blade along radial direction
file.dQNdr = '';        % propeller torque distribution per blade along radial direction

%% chord distribution of forces

prop.load_dist = 'custom';      % Three options - 'parabolic','uniform','custom' for loading distrbution along the chord

prop.nu = 100;                  % No. of elements in the chorddirection [-], relevant for 'custom' only
file.Cl_chord = 'Loading/BEM_dCl_dxc_J1.60_idx71.csv';             % Give filename if 'custom' distribution is chosen otherwise you can leave it empty ''
file.Cd_chord = 'Loading/BEM_dCd_dxc_J1.60_idx71.csv';             % Give filename if 'custom' distribution is chosen otherwise you can leave it empty ''
%% operating condition
op.Min = 0;                  % inflow Mach number [-]
op.Mfl = 54.9567/Amb.c0;                     % flight Mach number [-] 
op.Mht = sqrt((84.5792*2*pi*0.2032)^2 + 54.9567^2)/Amb.c0;                 % Helical tip Mach number [-]

%% Observer location
obs.R = [];             % prependicualr distance in plane of rotation/ propeller radius [-]
obs.x = [];             % Observer distance in axial direction/ propeller radius [-] 

obs.theta =  (1:1:179).*(pi/180);     %observer angle in axial direction [rad]
obs.r = 10;         % observer distance from propeller center/ propeller radius [-]