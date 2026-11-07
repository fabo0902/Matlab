%% Skript zum Testen der Funktion invertAddierer
clear; close all; clc;

%% Zeitvektor
t = linspace(0, 1e-3, 2001)';            % 2001 Werte von 0 s bis 1 ms (Spaltenvektor)

%% Eingangsspannungen
% Sinus zwischen 0 V und 5 V: Offset 2.5 V + Amplitude 2.5 V
f1 = 1e3;                                % Frequenz U1: 1 kHz
f2 = 2e3;                                % Frequenz U2: 2 kHz
f3 = 3e3;                                % Frequenz U3: 3 kHz

U1 = 2.5 + 2.5 * sin(2 * pi * f1 * t);
U2 = 2.5 + 2.5 * sin(2 * pi * f2 * t);
U3 = 2.5 + 2.5 * sin(2 * pi * f3 * t);

%% Eingangsmatrix (2001 x 3): jede Spalte ist ein Eingangssignal
Ui = [U1, U2, U3];

%% Widerstaende: R1, R2, R3, RN
R = [10e3; 15e3; 20e3; 5e3];

%% Ausgangsspannung berechnen
Ua = invertAddierer(Ui, R);

%% Plot
figure;

% Oben: Eingangsspannungen
subplot(2, 1, 1);
plot(t * 1e3, Ui, 'LineWidth', 1.5);
grid on;
xlabel('Zeit t in ms');
ylabel('Spannung U in V');
title('Eingangsspannungen des invertierenden Addierers');
legend('f_1 = 1 kHz', 'f_2 = 2 kHz', 'f_3 = 3 kHz', 'Location', 'eastoutside');

% Unten: Ausgangsspannung
subplot(2, 1, 2);
plot(t * 1e3, Ua, 'k', 'LineWidth', 1.5);
grid on;
xlabel('Zeit t in ms');
ylabel('Spannung U_a in V');
title('Ausgangsspannung des invertierenden Addierers');
