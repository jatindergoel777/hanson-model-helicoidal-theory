function out = PsiLoad(kx,varargin)
%% 
% two options for distribution function -
% 1. uniform
% 2. parabolic (default)

if ~isempty(varargin)
    profile =varargin{1};
else
    profile = 'parabolic';
end 

if strcmp(profile,'uniform')
    fx = @(x) exp(1i*kx.*x);   
else
    fx = @(x) (1.5-6*x.^2).*exp(1i*kx.*x); 
%     fx = @(x) (1-4*x.^2).*exp(1i*kx.*x); 
end

out = integral(fx,-0.5,0.5,'ArrayValued',true);