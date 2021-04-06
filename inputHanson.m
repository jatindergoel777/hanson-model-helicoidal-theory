%% Input parameters for Hanson model (frequency domain)

% Amp.p0  = Amb.rho*Amb.c0^2/Amb.gamma;       %Static pressure [Pa]

%% Discretization
if strcmp(prop.method,'cosine')
    prop.r_mu = cosspace(prop.hub,prop.rt,prop.mu)./prop.rt;
elseif strcmp(prop.method,'linear')
    prop.r_mu = linspace(prop.hub,prop.rt,prop.mu)./prop.rt;
else
    warning('Wrong Input! Calculations will continue with <strong>linear</strong> method')
    prop.r_mu = linspace(prop.hub,prop.rt,prop.mu)./prop.rt;
end
%% Blade properties
inputData.bD = csvread([inputFolder,file.bD]);
prop.bD = interp1(inputData.bD(:,1),inputData.bD(:,2),prop.r_mu,'spline',NaN);
NaNidx = isnan(prop.bD);
prop.bD(NaNidx) = interp1(prop.r_mu(~NaNidx),prop.bD(~NaNidx),prop.r_mu(NaNidx),'nearest','extrap');
clear NaNidx

inputData.tb = csvread([inputFolder,file.tb]);
prop.tb = interp1(inputData.tb(:,1),inputData.tb(:,2),prop.r_mu,'spline',NaN); %t/c
NaNidx = isnan(prop.tb);
prop.tb(NaNidx) = interp1(prop.r_mu(~NaNidx),prop.tb(~NaNidx),prop.r_mu(NaNidx),'nearest','extrap');
clear NaNidx

inputData.FA = csvread([inputFolder,file.FA]);
prop.FA = interp1(inputData.FA(:,1),inputData.FA(:,2),prop.r_mu,'spline',NaN);
NaNidx = isnan(prop.FA);
prop.FA(NaNidx) = interp1(prop.r_mu(~NaNidx),prop.FA(~NaNidx),prop.r_mu(NaNidx),'nearest','extrap');
clear NaNidx

inputData.MCA = csvread([inputFolder,file.MCA]);
prop.MCA = interp1(inputData.MCA(:,1),inputData.MCA(:,2),prop.r_mu,'spline','extrap'); 
NaNidx = isnan(prop.MCA);
prop.MCA(NaNidx) = interp1(prop.r_mu(~NaNidx),prop.MCA(~NaNidx),prop.r_mu(NaNidx),'nearest','extrap');
clear NaNidx
%% Propeller loading
inputData.Cl = csvread([inputFolder,file.Cl]);
prop.Cl = interp1(inputData.Cl(:,1),inputData.Cl(:,2),prop.r_mu,'spline',NaN); 
NaNidx = isnan(prop.Cl);
prop.Cl(NaNidx) = interp1(prop.r_mu(~NaNidx),prop.Cl(~NaNidx),prop.r_mu(NaNidx),'nearest','extrap');
clear NaNidx

inputData.Cd = csvread([inputFolder,file.Cd]);
prop.Cd = interp1(inputData.Cd(:,1),inputData.Cd(:,2),prop.r_mu,'spline',NaN); 
NaNidx = isnan(prop.Cd);
prop.Cd(NaNidx) = interp1(prop.r_mu(~NaNidx),prop.Cd(~NaNidx),prop.r_mu(NaNidx),'nearest','extrap');
clear NaNidx 


%% operating conditions
op.Mx = op.Mfl + op.Min;                        %Effective Mach number [-]
op.Mt = sqrt(op.Mht^2 - (op.Mx)^2);     %Tip mach number [-]
op.omega = op.Mt*Amb.c0/prop.rt;                %Rotation speed [rad/s]
op.Mr = sqrt((op.Mx)^2 + (op.Mt.*prop.r_mu).^2); % blade section Mach number [-]
op.beta = sqrt(1-op.Mfl^2);

%% Observer location

%%%% visual coordinates
if isempty(obs.theta) && isempty(obs.r)
    obs.theta = atan2(obs.R,obs.x);    %observer angle in axial direction [rad]
    obs.r = sqrt(obs.R.^2 + obs.x.^2);    % observer distance from propeller center [-]
elseif isempty(obs.R) && isempty(obs.x)
    obs.R = obs.r.*sin(obs.theta); 
    obs.x = obs.r.*cos(obs.theta);
end

%%%% Retarded system
obs.S0 = sqrt(obs.x.^2 + op.beta^2*obs.R.^2);
obs.xr = 1/op.beta^2*(obs.x + op.Mfl*obs.S0); % x in retarded system
obs.rr = sqrt(obs.xr.^2 + obs.R.^2);  % observer distance from propeller center [-]
obs.thetar = atan2(obs.R,obs.xr);    %observer angle in axial direction [rad]


%% Dependent parameters of the model

dep.df = 1-op.Mfl*cos(obs.thetar); %Doppler factor [-]
dep.omegaD = op.omega./dep.df;