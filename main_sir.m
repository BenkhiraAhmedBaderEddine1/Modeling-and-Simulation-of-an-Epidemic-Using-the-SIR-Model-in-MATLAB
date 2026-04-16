%% SIR Model - Single File Version (NO separate files needed)
clear; clc; close all;
%% Parameters
N     = 1e6;     % Total population
beta  = 0.30;    % Infection rate
gamma = 0.10;    % Recovery rate
R0_value = beta / gamma;
fprintf('Basic reproduction number R0 = %.2f\n', R0_value);
%% Initial conditions
I0 = 1;
R0_init = 0;
S0 = N - I0 - R0_init;
y0 = [S0; I0; R0_init];
tspan = [0 160];
%% Solve ODE
[t,y] = ode45(@sir_ode, tspan, y0);
S = y(:,1);
I = y(:,2);
R = y(:,3);
%% Peak infection
[I_max, idx] = max(I);
t_peak = t(idx);
fprintf('Peak infected = %.0f (%.2f%%) at t = %.1f days\n', ...
        I_max, 100*I_max/N, t_peak);
%% Plot numbers
figure;
plot(t,S,'b','LineWidth',2); hold on;
plot(t,I,'r','LineWidth',2);
plot(t,R,'g','LineWidth',2);
grid on;
xlabel('Time (days)');
ylabel('Population');
legend('Susceptible','Infected','Recovered');
title('SIR Model');
%% ODE FUNCTION (must be at END of script)
function dydt = sir_ode(t,y)
N     = 1e6;
beta  = 0.30;
gamma = 0.10;
S= y(1);
I = y(2);
R = y(3);
dSdt = -beta*S*I/N;
dIdt = beta*S*I/N - gamma*I;
dRdt = gamma*I;
dydt = [dSdt; dIdt; dRdt];
end
