clearvars
clc
UserInput
inputHanson
%% Harmonics
m = 1:2; %harmonic

%% calculate acoustic pressure
P = hanson(Amb,prop,op,obs,dep,m);

%% post-processing
% steps = 500;
% t = timeSignal(prop,op,obs,m,P,steps);
% plot(t.range,t.p)
% hold on

SPL = SPLprocessing(Amb,P);