function out = TQLD(x1,x2,rho,Uinf,omega,r,b,str)
Vp = sqrt(Uinf^2+(omega*r).^2);
phi = asin(Uinf./Vp);
f = 0.5*rho.*Vp.^2.*b;
if strcmp(str,'TQ2LD')
    dTNdr_f = x1./f;
    dQNdr_fr = x2./(f.*r);
    Cl = cos(phi).*dTNdr_f + sin(phi).*dQNdr_fr;
    Cd = cos(phi).*dQNdr_fr - sin(phi).*dTNdr_f;
    out = [Cl;Cd];
elseif strcmp(str,'LD2TQ')
    Cl = x1; Cd = x2;
    dTNdr_f = cos(phi).*Cl - sin(phi).*Cd;
    dQNdr_fr = sin(phi).*Cl + cos(phi).*Cd;
    out = [dTNdr_f.*f;dQNdr_fr.*(f.*r)];
end