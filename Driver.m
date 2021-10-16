%% Clear workspace
clear all; close all; clc;

%% Decleration of Global Variables
global alfa T R R123o F Ve Wx z beta
F = 0.096484;    % Faraday constant kJ mol^{-1} mV^{-1}, Faraday 's constant [coulomb/mole]
T = 310.15;      % Tempreture K                                 
R = 8.314e-3;    % Gas constant [kJ/K/mol]
R123o = 1e-6;    % Initial dye concentration (For our work is 1uM, for the paper it is 200e-9)
beta = 0.33;     % from the paper
alfa = 4.49;     % from the paper
Ve = 1000;       % Buffer volum
% Ve = 4*273;    % Buffer volum base on the paper
Wx = 1;
z = 1;

%% Read the data
disp('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~');
Dataset_number = '>> Enter the number of dataset you want to read:\n>> '; 
Dataset_number = input(Dataset_number);     Coloumn_numbers = 2*Dataset_number;
Data = xlsread('Data_10_08_2019',1);
start = 5;      steps = 5;     
for ii = 1:2:Coloumn_numbers
    Time(:,ii) = Data(5:end,ii);
    L = length(Time(:,ii)); 
    Intensity(:,ii) = Data(start:end,ii+1);    
    Mean_Intensity = mean(Intensity(L-60:L,ii));
    Normalized_Intensity(:,ii) = Intensity(:,ii)/Mean_Intensity;          % Normalized to Uncoupler state 
    Delta_Psi(:,ii) = r2fi(Normalized_Intensity(start:steps:end,ii));     % Convert intensity to membrane potential  
    figure(ii);
    subplot(2,1,1);
    plot(Time(start:steps:end,ii)/60,Normalized_Intensity(start:steps:end,ii),'m');
    legend('KO-Sham-Ht');
    xlabel('Time (min)')
    ylabel('Normailized R123 intensity')
    subplot(2,1,2);
    plot(Time(start:steps:end,ii)/60,Delta_Psi(:,ii),'m');
    xlabel('Time (min)')
    ylabel('Membrane potential (mV)')
end


