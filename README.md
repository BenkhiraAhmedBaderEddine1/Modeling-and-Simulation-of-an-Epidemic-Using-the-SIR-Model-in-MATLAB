Modeling and Simulation of an Epidemic Using the SIR Model in MATLAB

Abstract
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
In this project, a computational framework for modeling infectious disease dynamics is developed using the classical Susceptible–Infectious–Recovered (SIR) model implemented in MATLAB. The system is formulated as a set of coupled nonlinear ordinary differential equations and solved numerically using the adaptive Runge–Kutta method (ode45).

The study systematically investigates the influence of key epidemiological parameters, particularly the infection rate (β) and recovery rate (γ), through sensitivity analysis. Special emphasis is placed on the basic reproduction number (R₀ = β/γ) as a critical threshold governing epidemic behavior. Simulation results demonstrate how variations in these parameters significantly affect the peak infection magnitude, timing of the outbreak, and overall epidemic progression.

Additionally, a vaccination strategy is incorporated by modifying initial population conditions, enabling quantitative evaluation of its impact on disease spread. The results clearly illustrate the effectiveness of vaccination in reducing peak infections and, under certain conditions, preventing epidemic outbreaks entirely.

This project highlights the effectiveness of MATLAB as a tool for numerical simulation, data visualization, and analysis of dynamical systems. It also demonstrates how mathematical modeling can provide valuable insights into real-world epidemiological phenomena and support decision-making in public health interventions.
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
1. Introduction   :
-------------------
Infectious diseases can spread rapidly in a population and cause significant health, social, and economic impact. Understanding how an epidemic evolves over time is important for designing effective control strategies such as vaccination, social distancing, and isolation. Mathematical models provide a simplified but insightful way to analyze disease dynamics.

One of the most fundamental models in epidemiology is the SIR model, which divides the population into three compartments:

S(t) – Susceptible individuals who can catch the disease
I(t) – Infectious individuals who can transmit the disease
R(t) – Recovered (or removed) individuals who are no longer infectious
In this project, the SIR model is implemented in MATLAB to simulate an epidemic in a closed population. By changing model parameters such as the infection rate and recovery rate, and by simulating the effect of vaccination, we can visualize and understand how these parameters affect the spread of the disease.

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
1.1 Problem Statement  :
-------------------------
The problem addressed in this project is to:

Implement the SIR model in MATLAB.
Simulate the epidemic evolution over time for different parameter values.
Analyze how changes in parameters and initial conditions affect the epidemic curve (number of infected over time).
Demonstrate how vaccination (reducing the susceptible population at the start) can reduce peak infections.

1.2 Objectives  : 
--------------------
The main objectives of this project are:

To derive and implement the SIR model equations in MATLAB.
To use numerical methods (ode45) to solve the system of ODEs.
To generate and analyze plots of susceptible, infectious, and recovered individuals over time.
To perform parameter sensitivity analysis by varying the infection rate.
To model a simple vaccination strategy and compare the results with the baseline scenario.

2. Theory        :  
--------------------
2.1 SIR Model Equations:
-------------------------
We consider a closed population of constant size 

N, divided into three compartments:

S(t): number of susceptible individuals at time 

I(t): number of infectious individuals at time 

R(t): number of recovered (or removed) individuals at time 

The total population is:

N=S(t)+I(t)+R(t)
The SIR model is described by the following system of nonlinear ODEs:
dt/dS =−β*(SI/N)
 
dI/dt=β*((SI/N)− γI)
dR/dt=γI
where:
β is the infection rate (per day), representing the effective contact rate between susceptible and infectious individuals.
2.2 Basic Reproduction Number R0
An important quantity is the basic reproduction number:
R0= γ/β
If R0 >1, each infectious individual infects more than one person on average, and an epidemic can occur.
If R0<1, the infection dies out.
In the simulations, we will compute  R0 and study how changing β affects the epidemic.



--------------------------------------------------------
##  3. Methodology

### 3.1 Tools and Environment

- **Software:** MATLAB (R20xx or later)  
- **Numerical Solver:** `ode45` (Runge–Kutta method)  
- **Operating System:** Windows / macOS / Linux  
- **Toolboxes:** No additional toolboxes required  

---

### 3.2 Model Implementation

The implementation of the SIR model follows these main steps:

- **Parameter Definition**
  - Total population: `N`
  - Infection rate: `β` (per day)
  - Recovery rate: `γ` (per day)
  - Initial conditions: `S(0)`, `I(0)`, `R(0)`

- **ODE Function**
  - A MATLAB function `sir_ode.m` is implemented to compute:
    - `dS/dt`
    - `dI/dt`
    - `dR/dt`
  - Based on current state variables and model parameters

- **Numerical Solution**
  - The system is solved using MATLAB’s `ode45` solver over a defined time span (e.g., 0–160 days)

- **Visualization**
  - Plot `S(t)`, `I(t)`, `R(t)`:
    - As absolute values
    - As percentages of total population

- **Parameter Sensitivity**
  - Simulations are repeated with different values of `β` to analyze system behavior

- **Vaccination Modeling**
  - Vaccination is modeled by reducing the initial susceptible population and increasing the recovered population

---

### 3.3 Program Flow

1. Initialize parameters and initial conditions  
2. Call `ode45` with the SIR model function  
3. Extract solution vectors `S(t)`, `I(t)`, `R(t)`  
4. Generate plots with proper labels and legends  
5. Repeat simulations for different parameters (sensitivity + vaccination scenarios)  

---

## 📊 4. Results

### 4.1 Baseline Scenario

Example parameters:

- `N = 1,000,000`
- `β = 0.30 day⁻¹`
- `γ = 0.10 day⁻¹`
- `R₀ = 3`
- `I(0) = 1`, `R(0) = 0`, `S(0) = N - 1`

**Observed behavior:**
- Susceptible population decreases over time  
- Infectious population rises, reaches a peak, then declines  
- Recovered population increases monotonically and stabilizes  

**Key metrics:**
- Peak number (or percentage) of infected individuals  
- Time at which peak infection occurs  

---

### 4.2 Effect of Infection Rate (β)

Simulated values:

- `β = 0.10`, `0.30`, `0.60`

**Observations:**
- Lower `β` → smaller and delayed peak  
- Higher `β` → larger and earlier peak  

 Demonstrates strong sensitivity of epidemic dynamics to infection rate  

---

### 4.3 Effect of Vaccination

Vaccination fraction: `v = 40%`

- **Without vaccination:**
  - `S(0) = N - 1`, `R(0) = 0`

- **With vaccination:**
  - `S(0) = 0.6N - 1`
  - `R(0) = 0.4N`

**Observations:**
- Significant reduction in peak infections  
- Epidemic can be suppressed if effective `R₀ < 1`  

---

##  5. Discussion

The simulation results confirm key theoretical properties of the SIR model:

- The basic reproduction number `R₀` acts as a threshold:
  - `R₀ > 1` → epidemic occurs  
  - `R₀ < 1` → infection dies out  

- Increasing `β`:
  - Leads to faster spread  
  - Produces higher and earlier infection peaks  

- Vaccination:
  - Reduces susceptible population  
  - Lowers effective `R₀`  
  - Can prevent epidemic outbreaks  

### Limitations of the Model

- Assumes homogeneous mixing of the population  
- Ignores births, natural deaths, and spatial effects  
- Does not consider age structure  
- Assumes permanent immunity after recovery  

Despite these simplifications, the model provides valuable insight into epidemic dynamics and control strategies.

---

##  6. Conclusion

This project successfully implemented and simulated the SIR epidemic model using MATLAB. The system of nonlinear ODEs was solved using the `ode45` solver, enabling analysis of disease dynamics under different conditions.

Key outcomes:

- Demonstrated how mathematical models describe real-world phenomena  
- Showed the impact of infection rate and vaccination on epidemic behavior  
- Highlighted MATLAB’s capability for simulation and visualization  

### Future Work

- Extend to SEIR model (Susceptible–Exposed–Infectious–Recovered)  
- Include birth/death dynamics  
- Add spatial or age-based modeling  
- Fit the model to real epidemiological data  

---

##  7. References

- H. W. Hethcote, *The Mathematics of Infectious Diseases*, SIAM Review, 2000  
- MATLAB Documentation – Ordinary Differential Equations  
- D. J. Daley & J. Gani, *Epidemic Modelling: An Introduction*, Cambridge University Press  

---

##  MATLAB Code

Main project files:

- `main_sir.m` → Baseline simulation  
- `sir_ode.m` → SIR model equations  
- `sensitivity_sir.m` → Parameter analysis & vaccination scenarios
---------------------------------------------------------------
  COOOOOODES : -------------------------------------------------
----------------------------------------------------------------
---------------------------------------------------------------
for  main_sir.m : 


![image alt]([image_url](https://github.com/BenkhiraAhmedBaderEddine1/Modeling-and-Simulation-of-an-Epidemic-Using-the-SIR-Model-in-MATLAB/blob/a2f547e1e09561e740b15744d1a501b5df6b1a4e/Capture%20d%E2%80%99%C3%A9cran%202026-04-16%20190642.png))
![image alt]([[image_url](https://github.com/BenkhiraAhmedBaderEddine1/Modeling-and-Simulation-of-an-Epidemic-Using-the-SIR-Model-in-MATLAB/blob/a2f547e1e09561e740b15744d1a501b5df6b1a4e/Capture%20d%E2%80%99%C3%A9cran%202026-04-16%20190642.png)](https://github.com/BenkhiraAhmedBaderEddine1/Modeling-and-Simulation-of-an-Epidemic-Using-the-SIR-Model-in-MATLAB/blob/a2f547e1e09561e740b15744d1a501b5df6b1a4e/Capture%20d%E2%80%99%C3%A9cran%202026-04-16%20190710.png))
![image alt]([[image_url](https://github.com/BenkhiraAhmedBaderEddine1/Modeling-and-Simulation-of-an-Epidemic-Using-the-SIR-Model-in-MATLAB/blob/a2f547e1e09561e740b15744d1a501b5df6b1a4e/Capture%20d%E2%80%99%C3%A9cran%202026-04-16%20190642.png)](https://github.com/BenkhiraAhmedBaderEddine1/Modeling-and-Simulation-of-an-Epidemic-Using-the-SIR-Model-in-MATLAB/blob/a2f547e1e09561e740b15744d1a501b5df6b1a4e/Capture%20d%E2%80%99%C3%A9cran%202026-04-16%20190728.png))
![image alt]([[image_url](https://github.com/BenkhiraAhmedBaderEddine1/Modeling-and-Simulation-of-an-Epidemic-Using-the-SIR-Model-in-MATLAB/blob/a2f547e1e09561e740b15744d1a501b5df6b1a4e/Capture%20d%E2%80%99%C3%A9cran%202026-04-16%20190642.png)](https://github.com/BenkhiraAhmedBaderEddine1/Modeling-and-Simulation-of-an-Epidemic-Using-the-SIR-Model-in-MATLAB/blob/147bdad13da1902c00c4b517dbd2906ca4d28003/1.png))

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------for  sir_ode.m :

![image alt](https://github.com/BenkhiraAhmedBaderEddine1/Modeling-and-Simulation-of-an-Epidemic-Using-the-SIR-Model-in-MATLAB/blob/147bdad13da1902c00c4b517dbd2906ca4d28003/2.png)
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
for sensitivity_sir.m : 


![image alt]([[[image_url](https://github.com/BenkhiraAhmedBaderEddine1/Modeling-and-Simulation-of-an-Epidemic-Using-the-SIR-Model-in-MATLAB/blob/a2f547e1e09561e740b15744d1a501b5df6b1a4e/Capture%20d%E2%80%99%C3%A9cran%202026-04-16%20190642.png)](https://github.com/BenkhiraAhmedBaderEddine1/Modeling-and-Simulation-of-an-Epidemic-Using-the-SIR-Model-in-MATLAB/blob/147bdad13da1902c00c4b517dbd2906ca4d28003/1.png)](https://github.com/BenkhiraAhmedBaderEddine1/Modeling-and-Simulation-of-an-Epidemic-Using-the-SIR-Model-in-MATLAB/blob/147bdad13da1902c00c4b517dbd2906ca4d28003/3.png))


![image alt]([[[image_url](https://github.com/BenkhiraAhmedBaderEddine1/Modeling-and-Simulation-of-an-Epidemic-Using-the-SIR-Model-in-MATLAB/blob/a2f547e1e09561e740b15744d1a501b5df6b1a4e/Capture%20d%E2%80%99%C3%A9cran%202026-04-16%20190642.png)](https://github.com/BenkhiraAhmedBaderEddine1/Modeling-and-Simulation-of-an-Epidemic-Using-the-SIR-Model-in-MATLAB/blob/147bdad13da1902c00c4b517dbd2906ca4d28003/1.png)](https://github.com/BenkhiraAhmedBaderEddine1/Modeling-and-Simulation-of-an-Epidemic-Using-the-SIR-Model-in-MATLAB/blob/147bdad13da1902c00c4b517dbd2906ca4d28003/4.png))


![image alt]([[[image_url](https://github.com/BenkhiraAhmedBaderEddine1/Modeling-and-Simulation-of-an-Epidemic-Using-the-SIR-Model-in-MATLAB/blob/a2f547e1e09561e740b15744d1a501b5df6b1a4e/Capture%20d%E2%80%99%C3%A9cran%202026-04-16%20190642.png)](https://github.com/BenkhiraAhmedBaderEddine1/Modeling-and-Simulation-of-an-Epidemic-Using-the-SIR-Model-in-MATLAB/blob/147bdad13da1902c00c4b517dbd2906ca4d28003/1.png)](https://github.com/BenkhiraAhmedBaderEddine1/Modeling-and-Simulation-of-an-Epidemic-Using-the-SIR-Model-in-MATLAB/blob/main/5.png?raw=true))

![image alt]([[[image_url](https://github.com/BenkhiraAhmedBaderEddine1/Modeling-and-Simulation-of-an-Epidemic-Using-the-SIR-Model-in-MATLAB/blob/a2f547e1e09561e740b15744d1a501b5df6b1a4e/Capture%20d%E2%80%99%C3%A9cran%202026-04-16%20190642.png)](https://github.com/BenkhiraAhmedBaderEddine1/Modeling-and-Simulation-of-an-Epidemic-Using-the-SIR-Model-in-MATLAB/blob/147bdad13da1902c00c4b517dbd2906ca4d28003/1.png)](https://github.com/BenkhiraAhmedBaderEddine1/Modeling-and-Simulation-of-an-Epidemic-Using-the-SIR-Model-in-MATLAB/blob/main/6.png?raw=true))


![image alt]([[[[image_url](https://github.com/BenkhiraAhmedBaderEddine1/Modeling-and-Simulation-of-an-Epidemic-Using-the-SIR-Model-in-MATLAB/blob/a2f547e1e09561e740b15744d1a501b5df6b1a4e/Capture%20d%E2%80%99%C3%A9cran%202026-04-16%20190642.png)](https://github.com/BenkhiraAhmedBaderEddine1/Modeling-and-Simulation-of-an-Epidemic-Using-the-SIR-Model-in-MATLAB/blob/147bdad13da1902c00c4b517dbd2906ca4d28003/1.png)](https://github.com/BenkhiraAhmedBaderEddine1/Modeling-and-Simulation-of-an-Epidemic-Using-the-SIR-Model-in-MATLAB/blob/main/6.png?raw=true)](https://github.com/BenkhiraAhmedBaderEddine1/Modeling-and-Simulation-of-an-Epidemic-Using-the-SIR-Model-in-MATLAB/blob/147bdad13da1902c00c4b517dbd2906ca4d28003/7.png))
