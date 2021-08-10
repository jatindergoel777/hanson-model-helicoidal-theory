function out = PsiV(kx,varargin)
%% 
% two options for distribution function -
% 1. uniform
% 2. parabolic (default)

if ~isempty(varargin)
    profile =varargin{1};
    if length(varargin)>1
        X = varargin{2};
        HX = varargin{3};
    end
else
    profile = 'parabolic';
end 

if strcmp(profile,'custom')
   fx = HX.*exp(1i*kx.*X);
   out = simps(X,fx,1);
elseif strcmp(profile,'uniform')
    fx = @(x) exp(1i*kx.*x);
    out = integral(fx,-0.5,0.5,'ArrayValued',true);
else
    fx = @(x) (1-4*x.^2).*exp(1i*kx.*x); 
    out = integral(fx,-0.5,0.5,'ArrayValued',true);
end

