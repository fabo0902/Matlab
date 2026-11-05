%% Skript zum Testen der Funktion VerbraucherLeistung
clear; close all; clc;

%% Initialisierung der Parameter
U0 = 20;                          % Quellenspannung in V
Ri = 10;                          % Innenwiderstand in Ohm
Rl = linspace(0, 100, 2001)';     % Lastwiderstand: 2001 Werte von 0 bis 100 Ohm (Spaltenvektor)

%% Berechnung von Leistung und Wirkungsgrad
[Pl, eff] = VerbraucherLeistung(Ri, Rl, U0);

%% Plot
figure;

% Linke Y-Achse: Leistung im Verbraucher (rot)
yyaxis left
plot(Rl / Ri, Pl, 'r', 'LineWidth', 2);
ylabel('Leistung P_L in W');
ax = gca;
ax.YColor = 'r';                  % Achsenfarbe passend zur Kurve

% Rechte Y-Achse: Wirkungsgrad (blau)
yyaxis right
plot(Rl / Ri, eff, 'b', 'LineWidth', 2);
ylabel('Wirkungsgrad \eta in %');
ax.YColor = 'b';

% Gemeinsame Beschriftung
xlabel('Widerstandsverhältnis R_L / R_i');
title('Leistung und Wirkungsgrad in Abhängigkeit vom Lastwiderstand');
legend('Leistung P_L', 'Wirkungsgrad \eta', 'Location', 'east');
grid on;
