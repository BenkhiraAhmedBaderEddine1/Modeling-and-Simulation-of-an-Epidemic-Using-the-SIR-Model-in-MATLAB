function dydt = sir_ode(t, y, params)

S = y(1);
I = y(2);
R = y(3);

N     = params.N;
beta  = params.beta;
gamma = params.gamma;

dSdt = -beta * S * I / N;
dIdt =  beta * S * I / N - gamma * I;
dRdt =  gamma * I;

dydt = [dSdt; dIdt; dRdt];

end
