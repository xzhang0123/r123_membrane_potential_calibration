function I0=calculateI0(C)
% k = 1.1;      % Xiao parameter for lung
k = 1;          % can be altered for better fitting
k0= k*8.15e4;   % parameter obtained from fitting in the Huang paper for Heart
k1=5.16e4;      % parameter obtained from fitting in the Huang paper for Heart
k2=1.01e6;      % parameter obtained from fitting in the Huang paper for Heart
k3=3.91e12;     % parameter obtained from fitting in the Huang paper for Heart

% Equation 3 in Huang Ann Biomed Eng. 2007 July ; 35(7): 1276–1285.
% I: is observed intensity
% C: is R123 concentration
I0=k0*C/(1+k1*C+k2*C^2+k3*C.^3); % Io is the intensity at time 0 with no mito present (baseline)

end