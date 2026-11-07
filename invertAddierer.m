function Ua = invertAddierer(Ui, R)
% Funktion invertAddierer
% Autor            : Ihr Name
% Erstellungsdatum : 07.11.2026
% Beschreibung     : Berechnet die zeitlich veraenderliche Ausgangsspannung
%                    Ua eines invertierenden Addierers:
%                    -Ua = RN/R1*U1 + RN/R2*U2 + ... + RN/Rn*Un
% Input            : Matrix Ui (Dimension m, n);
%                    Vektor R (Dimension n+1, 1);
% Output           : Vektor Ua (Dimension m, 1);

    %% Eingangspruefung
    % R muss ein Spaltenvektor sein und Ui muss genau eine Spalte
    % weniger haben, als R Zeilen hat (n Eingangswiderstaende + RN)
    if ~iscolumn(R) || size(Ui, 2) ~= size(R, 1) - 1
        error('Die Dimensionen stimmen nicht überein!');
    end

    %% Initialisierung
    % Ein Eintrag pro Zeitpunkt (= Anzahl der Zeilen von Ui)
    Ua = zeros(size(Ui, 1), 1);

    % Rueckkopplungswiderstand RN ist der letzte Eintrag von R
    RN = R(end);

    %% Iterative Berechnung der invertierten Summe
    % Schleife ueber alle Eingangsspannungen (Spalten von Ui).
    % In jedem Durchlauf wird der Beitrag RN/Rk * Uk fuer alle
    % Zeitpunkte gleichzeitig vom bisherigen Wert von Ua abgezogen
    % (Minus wegen der Invertierung).
    for k = 1:size(Ui, 2)
        Ua = Ua - RN / R(k) * Ui(:, k);
    end
end
