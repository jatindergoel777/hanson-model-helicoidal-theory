%Period
function t = timeSignal(prop,op,obs,m,P,steps)
prop.Period = 2*pi/(op.omega*prop.B);
t.steps = steps;
t.range = linspace(-prop.Period, prop.Period,t.steps);
t.p = zeros(1,length(t.range));
P.Totalm = P.Vm+P.Lm+P.Dm;
for i = 1:length(obs.x)
t.p(i,:) =    sum(2*real(P.Totalm(:,i).*exp(-1i*m'*prop.B*op.omega*t.range)));
% t.p = t.p + 2*real(P.Totalm(i).*exp(-1i*m(i)*prop.B*op.omega*t.range));
end
