function out = PsiLoad(kx,varargin)
%% 
% two options for distribution function -
% 1. uniform
% 2. parabolic (default)

if ~isempty(varargin)
    profile =varargin{1};
    if length(varargin)>1
        X = varargin{2};
        fX = varargin{3};
    end
else
    profile = 'parabolic';
end 

if strcmp(profile,'custom')
   f = fX.*exp(1i*kx.*X);
   out = simps(X,f,1);
elseif strcmp(profile,'uniform')
    f = @(x) exp(1i*kx.*x);
    out = integral(f,-0.5,0.5,'ArrayValued',true);
else
    f = @(x) (1.5-6*x.^2).*exp(1i*kx.*x); 
    out = integral(f,-0.5,0.5,'ArrayValued',true);
end
