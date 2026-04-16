%% sensitivity_sir.m
% Parameter sensitivity and vaccination scenarios for SIR model
clear; clc; close all;
%% Common parameters
N     = 1e6;     % Total population
gamma = 0.10;    % Recovery rate (per day)
tspan = [0 160]; % Simulation time (days)
beta_values = [0.10, 0.30, 0.60];  % Different infection rates
colors = lines(numel(beta_values));
I0 = 1;          % Initial infected (same for all)
R0_init = 0;     % Initial recovered (no vaccination in this part)
%% 1) Effect of different beta values (no vaccination)
figure;
hold on; grid on;
for k = 1:numel(beta_values)
    beta = beta_values(k);
    S0 = N - I0 - R0_init;
    y0 = [S0; I0; R0_init];

    params.N     = N;
    params.beta  = beta;
    params.gamma = gamma;

    [t, y] = ode45(@(t,y) sir_ode(t,y,params), tspan, y0);
    I = y(:,2);

    plot(t, I / N * 100, 'Color', colors(k,:), 'LineWidth', 1.5, ...
        'DisplayName', sprintf('\\beta = %.2f, R_0 = %.2f', beta, beta/gamma));
end
xlabel('Time (days)');
ylabel('Infectious (% of population)');
title('Effect of Infection Rate \\beta on Epidemic Curve');
legend('Location', 'best');
%% 2) Effect of vaccination
% Assume a fraction v of the population is vaccinated at t=0
v = 0.40;   % 40% vaccinated
beta = 0.30;
% Scenario A: no vaccination
S0_A   = N - I0;   % almost everyone susceptible
R0_A   = 0;
y0_A   = [S0_A; I0; R0_A];

% Scenario B: 40% vaccinated (moved directly to R)
S0_B   = (1 - v) * N - I0;
R0_B   = v * N;
y0_B   = [S0_B; I0; R0_B];
params.N     = N;
params.beta  = beta;
params.gamma = gamma;
[tA, yA] = ode45(@(t,y) sir_ode(t,y,params), tspan, y0_A);
[tB, yB] = ode45(@(t,y) sir_ode(t,y,params), tspan, y0_B);
I_A = yA(:,2);
I_B = yB(:,2);
figure;
plot(tA, I_A / N * 100, 'r', 'LineWidth', 1.5, 'DisplayName', 'No vaccination'); hold on;
plot(tB, I_B / N * 100, 'g', 'LineWidth', 1.5, ...
     'DisplayName', sprintf('Vaccination v = %.0f%%', 100*v));
grid on;
xlabel('Time (days)');
ylabel('Infectious (% of population)');
title('Effect of Vaccination on Epidemic Curve');
legend('Location', 'best');
%% Print peak infection for both scenarios
[I_A_max, idx_A] = max(I_A);
t_A_peak = tA(idx_A);
[I_B_max, idx_B] = max(I_B);
t_B_peak = tB(idx_B);
fprintf('\nNo vaccination: peak infected = %.0f (%.2f%%) at t = %.1f days\n', ...
        I_A_max, 100*I_A_max/N, t_A_peak);
fprintf('With vaccination (%.0f%%): peak infected = %.0f (%.2f%%) at t = %.1f days\n', ...
        100*v, I_B_max, 100*I_B_max/N, t_B_peak);
