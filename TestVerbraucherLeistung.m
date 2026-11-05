%% Skript zum Testen der Funktion VerbraucherLeistung
clear; close all; clc;

%% Initialisierung der Parameter
U0 = 20;                          % Quellenspannung in V
Ri = 10;                          % Innenwiderstand in Ohm
Rl = linspace(0, 100, 2001)';     % Lastwiderstand: 2001 Werte von 0 bis 100 Ohm (Spaltenvektor)

%% Berechnung von Leistung und Wirkungsgrad
[Pl, eff] = VerbraucherLeistung(Ri, Rl, U0);

%% Punkt maximaler Leistung bestimmen
[M, I] = max(Pl);                 % Maximalleistung M und zugehoeriger Index I
x_max = Rl(I) / Ri;               % Widerstandsverhaeltnis am Maximum

%% Plot
figure;

% Linke Y-Achse: Leistung im Verbraucher (rot)
yyaxis left
h1 = plot(Rl / Ri, Pl, 'r', 'LineWidth', 2);
hold on;
% Maximalleistung als roter Punkt markieren
h3 = plot(x_max, M, 'ro', 'MarkerSize', 8, 'MarkerFaceColor', 'r');
% Beschriftung des Maximums
text(x_max, M, sprintf('  P_{max} = %.2f W', M), ...
    'Color', 'r', 'VerticalAlignment', 'bottom', 'FontWeight', 'bold');
ylabel('Leistung P_L in W');
ylim([0, 1.15 * M]);              % etwas Platz ueber dem Maximum fuer den Text
ax = gca;
ax.YColor = 'r';                  % Achsenfarbe passend zur Kurve

% Rechte Y-Achse: Wirkungsgrad (blau)
yyaxis right
h2 = plot(Rl / Ri, eff, 'b', 'LineWidth', 2);
hold on;
% Wirkungsgrad am Punkt maximaler Leistung als blauer Punkt markieren
h4 = plot(x_max, eff(I), 'bs', 'MarkerSize', 8, 'MarkerFaceColor', 'b');
% Beschriftung des Wirkungsgrads
text(x_max, eff(I), sprintf('  \\eta = %.1f %%', eff(I)), ...
    'Color', 'b', 'VerticalAlignment', 'top', 'FontWeight', 'bold');
ylabel('Wirkungsgrad \eta in %');
ax.YColor = 'b';

% Gestrichelte senkrechte Linie durch den Punkt maximaler Leistung
xline(x_max, 'k--', sprintf('R_L / R_i = %.2f', x_max), ...
    'LabelVerticalAlignment', 'middle');

% Gemeinsame Beschriftung
xlabel('Widerstandsverhältnis R_L / R_i');
title('Leistung und Wirkungsgrad in Abhängigkeit vom Lastwiderstand');
legend([h1, h2, h3, h4], ...
    {'Leistung P_L', 'Wirkungsgrad \eta', 'Maximalleistung', ...
     'Wirkungsgrad bei P_{max}'}, 'Location', 'east');
grid on;
