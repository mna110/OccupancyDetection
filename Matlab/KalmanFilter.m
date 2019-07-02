%% 
%Kalman Filter Design Preliminary
%Author: Hasnain Cheena 

deltaT = 0.001;
Ts = deltaT;
%state space model
A = [0 1 0 0;
    2/(deltaT)^2 -2/deltaT 0 0;
    0 0 0 1;
    0 0 2/(deltaT)^2 -2/deltaT];

B = [0 0;
    -2/(deltaT)^2 0;
    0 0;
    0 -2/(deltaT)^2];

C = [1 1 1 0];

D = 0;
%plant model
plant = ss(A,B,C,D,Ts);

%observability
observabilityMatrix = obsv(A,C);
observabilityCheck = det(observabilityMatrix);
    
%process and measurement covariances
W = 1;
V = 1;

%discrete kalman filter
[kalmf, L, P, M] = kalman(plant, W,V);
outputEstimate = kalmf(1,:);