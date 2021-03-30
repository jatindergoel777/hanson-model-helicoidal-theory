function SPL = SPLprocessing(Amb,P)
%% SPL calculation

% SPL of each harmonic for each component

SPL.Vm = 20*log10(2*abs(P.Vm)/Amb.pref); % Thickness
SPL.Lm = 20*log10(2*abs(P.Lm)/Amb.pref); % Lift
SPL.Dm = 20*log10(2*abs(P.Dm)/Amb.pref); % Drag
SPL.loadm = 20*log10(2*abs(P.Dm+P.Lm)/Amb.pref); % Drag+lift

SPL.V = 20*log10(sqrt(sum((2*abs(P.Vm)).^2))/Amb.pref); %Total noise due to thickness
SPL.L = 20*log10(sqrt(sum((2*abs(P.Lm)).^2))/Amb.pref); %Total noise due to lift
SPL.D = 20*log10(sqrt(sum((2*abs(P.Dm)).^2))/Amb.pref); %Total noise due to drag

SPL.loading = 20*log10(sqrt(sum((2*abs(P.Lm+P.Dm)).^2))/Amb.pref); %Total noise due to loading
SPL.total = 20*log10(sqrt(sum((2*abs(P.Totalm)).^2))/Amb.pref); %Total noise 