%% Skript zum Testen der Funktion invertAddierer
clear; close all; clc;

%% Test 1: von Hand nachrechenbar
Ui = [1 2;
      3 4];                 % 2 Zeitpunkte, 2 Eingaenge
R  = [10; 20; 10];          % R1 = 10, R2 = 20, RN = 10
Ua = invertAddierer(Ui, R)  % Erwartet: [-2; -5]

%% Test 2: zeitlich veraenderliche Signale
f1 = 100;                   % Frequenz U1 in Hz
f3 = 500;                   % Frequenz U3 in Hz
t  = linspace(0, 0.01, 500)';            % 10 ms, 500 Zeitpunkte

U1 = sin(2 * pi * f1 * t);               % Sinus, Amplitude 1 V
U2 = 0.5 * ones(size(t));                % Gleichspannung 0.5 V
U3 = 0.2 * sin(2 * pi * f3 * t);         % Sinus, Amplitude 0.2 V
Ui = [U1, U2, U3];                       % jede Spalte = ein Eingang

R  = [1e3; 2e3; 1e3; 10e3];              % R1, R2, R3, RN
Ua = invertAddierer(Ui, R);

figure;
plot(t * 1e3, Ui, t * 1e3, Ua, 'LineWidth', 2);
grid on;
xlabel('t in ms');
ylabel('U in V');
title('Invertierender Addierer');
legend('U_1', 'U_2', 'U_3', 'U_a');
