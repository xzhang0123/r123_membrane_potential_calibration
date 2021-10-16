function obj_fmincon=r123_fun(x,I)

%% Global variables
global alfa T R R123o F Ve Wx z beta
F = 0.096484;    % Faraday constant kJ mol^{-1} mV^{-1},  [coulomb/mole]
                               
k0 = 8.15e4;
r0 = R123o;


%%
re=1e-8*x(1);       % Dye Con outside mitochondra
Dfi=x(2);           % Membrane potential
rx=re*exp(z*F*Dfi/(R*T)); % Nernst eq.  % Dye Con in tne matrix

Ie=calculateI0(re);  % Dye intensity outside mitochondra
Ix=calculateI0(rx);  % Dye intensity mitochondrial matrix
I0=calculateI0(r0);  % Initial Dye intensity

obj1=I-(Ve*Ie+Wx*Ix+beta*k0*alfa*(re+rx)/2)/(Ve*I0);  % eq 8 from Huang paper
obj2=1e8*(Ve*r0/(Ve+alfa/2+(Wx+alfa/2)*exp(z*F*Dfi/(R*T)))-re); %MASS balance eq 11

obj_fmincon=abs(obj1^2)+abs(obj2^2);


% F =0.096484
% R =8.314e-3
% T = 310.15
% C0 = 1e-6
% Ve = 1000;       
% Wx = 1;
% 
% 
% def Con2Int(C):
%     k=1
%     k0 = 8.15e4
%     k1 = 5.16e4
%     k2 = 1.01e6
%     k3 = 3.91e12
%     I = k0*C/(1+k1*C+k2*C**2+k3*C**3)
%     return I
% 
% I0 = Con2Int(C0)
% Ie = Con2Int(Ce)
% Ix = Con2Int(Cx)
% I = (Ve*Ie + Vx*Ix + beta*k0*alfa *(Ce+Cx)/2 )/(Ve*I0)
% Cx = Ce*exp(F*Dfi/(R*T))
% Ve*Ce + Vx*Cx +alfa *(Ce+Cx)/2 =Ve*C0