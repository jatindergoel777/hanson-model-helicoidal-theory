function P = hanson(Amb,prop,op,obs,dep,m)
nbytes = 0;
for o = 1:length(obs.x)
    for k = 1:length(m)
        var1 = 2*m(k)*prop.B./(op.Mr*dep.df(o));
        var2 = op.Mr.^2.*cos(obs.thetar(o))-op.Mx;
        hm.kx(k,:) = var1.*prop.bD.*op.Mt;
        hm.ky(k,:) = var1.*prop.bD.*var2./prop.r_mu;
        hm.phi0(k,:) = var1.*var2.*prop.FA./(prop.r_mu*2*prop.rt);
        hm.phis(k,:) = var1.*op.Mt.*prop.MCA./(2*prop.rt);
        
        hm.f1(k,:) = -Amb.rho*Amb.c0^2*prop.B*sin(obs.thetar(o)).*exp(1i*m(k)*prop.B.*(dep.omegaD(o)*obs.rr(o)*prop.rt/Amb.c0 - pi/2))...
            ./(8*pi*(obs.R(o)./2)*dep.df(o));
        
        bsl = besselj(m(k)*prop.B,m(k)*prop.B*prop.r_mu*op.Mt*sin(obs.thetar(o))/dep.df(o));
        psiVKx = PsiV(hm.kx(k,:),prop.thick_dist);
        psiLoadKx = PsiLoad(hm.kx(k,:),prop.load_dist);
        
        hm.f2(k,:) = op.Mr.^2.*exp(1i*(hm.phi0(k,:) + hm.phis(k,:))).*bsl;
        hm.f3.Vm(k,:) = hm.kx(k,:).^2.*prop.tb.*psiVKx;
        hm.f3.Dm(k,:) = 1i*hm.kx(k,:).*(prop.Cd/2).*psiLoadKx;
        hm.f3.Lm(k,:) = -1i*hm.ky(k,:).*(prop.Cl/2).*psiLoadKx;
        
        hm.PVm(k,:) = trapz(prop.r_mu,hm.f1(k,:).*hm.f2(k,:).*hm.f3.Vm(k,:));
        hm.PDm(k,:) = trapz(prop.r_mu,hm.f1(k,:).*hm.f2(k,:).*hm.f3.Dm(k,:));
        hm.PLm(k,:) = trapz(prop.r_mu,hm.f1(k,:).*hm.f2(k,:).*hm.f3.Lm(k,:));
        
        hm.P(k,:) = hm.PVm(k,:) + hm.PDm(k,:) + hm.PLm(k,:);
        
        %% Print progress
        fprintf(repmat('\b',1,nbytes))
        nbytes = fprintf('Progress = %.02f%% \n', 100*(((o-1)*length(m)+k)/(length(m)*length(obs.x))));
    end
    P.Vm(:,o) = hm.PVm;
    P.Lm(:,o) = hm.PLm;
    P.Dm(:,o) = hm.PDm;
    P.Totalm(:,o) = hm.P;
end