clear; close all;

printPlots = 1;


set(0, 'DefaultAxesFontSize', 10);     % Achsenbeschriftungen
set(0, 'DefaultTextFontSize', 10);     % Titel, Labels, usw.
set(0, 'DefaultLegendFontSize', 10);   % Legenden

%% === Pfad zur Messdatei ===
%filePath = "C:\Users\G00550\Desktop\Elias\Auswertung R151 Sprinter\schmaler korrigiert\statisch 2\V4_T31_R3.txt";
%filePath = "C:\Users\G00550\Desktop\Elias\Auswertung R151 Sprinter\schmaler korrigiert\statisch 2\Run2\V4_T31_R2.txt";
%filePath = "C:\Users\G00550\Desktop\Elias\Auswertung R151 Sprinter\schmaler korrigiert\statisch 2\R1\V4_T31_R1.txt";

%filePath = "C:\Users\G00550\Desktop\Elias\Auswertung R151 Sprinter\schmaler korrigiert\Statisch 2_2\V4_T44_R2.txt";
%filePath = "C:\Users\G00550\Desktop\Elias\Auswertung R151 Sprinter\schmaler korrigiert\Statisch 2_2\R1\V4_T44_R1.txt";

% Dateien 2907
%filePath = "C:\Users\G00550\Desktop\Exporte\Statisch2\V9_T57_R3.txt";
%filePath = "C:\Users\G00550\Desktop\Exporte\Statisch2\V9_T57_R2.txt";
filePath = "C:\Users\G00550\Desktop\Exporte\Statisch2\V9_T57_R1.txt";

%% === Parameter ===
speedVUT = 0;               % km/h
speedTarget = 20;           % km/h
targetStartDistance = -44.44;  % m 

% Zielwerte und Toleranz
% da = -44.4; % da
lip = -7.77;

yTargetResult = -2.75;
yVUTResult = -1.01;

xRefTarget = 0.793;
yRefTarget = 0.25;
yRefTarget_Extension = 1.08;
xRefVUT = 1.027;
yRefVUT = -1.01;

% === Toleranzen ===
targetTol = 0.5;    % Target ± 0.5 km/h
tolLatTarget = 0.2;
tolDa = 0.5;
tol = 0.5;
lateralExtension = false;

%% === Inputs PDF ===
VIN = "Mercedes Sprinter – VIN: W1V5KD3Z2SP730819";

scenarioString = string(sprintf("Static Test Case 2 (Longitudinal) - Target: %.1f km/h - lat. Distance: 2.75 m", speedTarget));

logoImage = imread("C:\Users\G00550\Desktop\Elias Daten\MATLAB\LOGO\logoDekra2800.png");

% Schwellenwert für "fast schwarz" (z. B. bei Kompression)
threshold = 90;

% Maske für (nahezu) schwarze Pixel
mask = all(logoImage < threshold, 3);

% Alle schwarzen Pixel weiß setzen (RGB = 255,255,255)
logoImage(repmat(mask, [1 1 3])) = 255;
logoImage = imresize(logoImage, 20, 'bilinear');  % Faktor 2, glättend


%% === Datei einlesen ===
fid = fopen(filePath, 'r');
if fid == -1, error('Datei konnte nicht geöffnet werden.'); end
lines = textscan(fid, '%s', 'Delimiter', '\n'); fclose(fid);
lines = lines{1};
headerLineIndex = find(contains(lines, 'Point'), 1, 'last');
rawHeader = strsplit(lines{headerLineIndex}, '\t');
cleanHeader = strrep(rawHeader, '"', '');
opts = delimitedTextImportOptions("NumVariables", numel(cleanHeader));
opts.DataLines = [headerLineIndex + 3, Inf];
opts.Delimiter = '\t';
opts.VariableNames = matlab.lang.makeValidName(cleanHeader);
opts.VariableTypes(:) = {'double'};
opts.ExtraColumnsRule = 'ignore';
opts.ConsecutiveDelimitersRule = 'split';
opts = setvaropts(opts, opts.VariableNames, 'DecimalSeparator', ',');
data = readtable(filePath, opts);

dateRun = lines(3, 1);
dateRun = erase(dateRun, 'Date=');

%% === Zuordnung Signale ===
    
time = data.Time;
speed_vut = data.Speed;

if ismember('OtherVehicleForwardVelocity', data.Properties.VariableNames) && mean(data.OtherVehicleForwardVelocity, 'omitnan') > 0
    v_target = data.OtherVehicleForwardVelocity;
elseif ismember('HeadTrackerForwardVelocity', data.Properties.VariableNames) && mean(data.HeadTrackerForwardVelocity, 'omitnan') > 0
    v_target = data.HeadTrackerForwardVelocity;
elseif ismember('HeadTrackerForwardVelocity_refPoint_', data.Properties.VariableNames) && mean(data.HeadTrackerForwardVelocity_refPoint_, 'omitnan') > 0
    v_target = data.HeadTrackerForwardVelocity_refPoint_;
elseif ismember('Object1ForwardVelocity', data.Properties.VariableNames) && mean(data.Object1ForwardVelocity, 'omitnan') > 0
    v_target = data.Object1ForwardVelocity;
elseif ismember('Object2ForwardVelocity', data.Properties.VariableNames) && mean(data.Object2ForwardVelocity, 'omitnan') > 0
    v_target = data.Object2ForwardVelocity;
elseif ismember('Object3ForwardVelocity', data.Properties.VariableNames) && mean(data.Object3ForwardVelocity, 'omitnan') > 0
    v_target = data.Object3ForwardVelocity;
elseif ismember('Object4ForwardVelocity', data.Properties.VariableNames) && mean(data.Object4ForwardVelocity, 'omitnan') > 0
    v_target = data.Object4ForwardVelocity;
elseif ismember('Object5ForwardVelocity', data.Properties.VariableNames) && mean(data.Object5ForwardVelocity, 'omitnan') > 0
    v_target = data.Object5ForwardVelocity;
elseif ismember('Object6ForwardVelocity', data.Properties.VariableNames) && mean(data.Object6ForwardVelocity, 'omitnan') > 0
    v_target = data.Object6ForwardVelocity;
elseif ismember('Object7ForwardVelocity', data.Properties.VariableNames) && mean(data.Object7ForwardVelocity, 'omitnan') > 0
    v_target = data.Object7ForwardVelocity;
elseif ismember('Object8ForwardVelocity', data.Properties.VariableNames) && mean(data.Object8ForwardVelocity, 'omitnan') > 0
    v_target = data.Object8ForwardVelocity;
elseif ismember('Object9ForwardVelocity', data.Properties.VariableNames) && mean(data.Object9ForwardVelocity, 'omitnan') > 0
    v_target = data.Object9ForwardVelocity;
elseif ismember('Object10ForwardVelocity', data.Properties.VariableNames) && mean(data.Object10ForwardVelocity, 'omitnan') > 0
    v_target = data.Object10ForwardVelocity;
    elseif ismember('Object1ForwardVelocity_refPoint_', data.Properties.VariableNames) && mean(data.Object1ForwardVelocity_refPoint_, 'omitnan') > 0
    v_target = data.Object1ForwardVelocity_refPoint_;
elseif ismember('Object2ForwardVelocity_refPoint_', data.Properties.VariableNames) && mean(data.Object2ForwardVelocity_refPoint_, 'omitnan') > 0
    v_target = data.Object2ForwardVelocity_refPoint_;
elseif ismember('Object3ForwardVelocity_refPoint_', data.Properties.VariableNames) && mean(data.Object3ForwardVelocity_refPoint_, 'omitnan') > 0
    v_target = data.Object3ForwardVelocity_refPoint_;
elseif ismember('Object4ForwardVelocity_refPoint_', data.Properties.VariableNames) && mean(data.Object4ForwardVelocity_refPoint_, 'omitnan') > 0
    v_target = data.Object4ForwardVelocity_refPoint_;
elseif ismember('Object5ForwardVelocity_refPoint_', data.Properties.VariableNames) && mean(data.Object5ForwardVelocity_refPoint_, 'omitnan') > 0
    v_target = data.Object5ForwardVelocity_refPoint_;
elseif ismember('Object6ForwardVelocity_refPoint_', data.Properties.VariableNames) && mean(data.Object6ForwardVelocity_refPoint_, 'omitnan') > 0
    v_target = data.Object6ForwardVelocity_refPoint_;
elseif ismember('Object7ForwardVelocity_refPoint_', data.Properties.VariableNames) && mean(data.Object7ForwardVelocity_refPoint_, 'omitnan') > 0
    v_target = data.Object7ForwardVelocity_refPoint_;
elseif ismember('Object8ForwardVelocity_refPoint_', data.Properties.VariableNames) && mean(data.Object8ForwardVelocity_refPoint_, 'omitnan') > 0
    v_target = data.Object8ForwardVelocity_refPoint_;
elseif ismember('Object9ForwardVelocity_refPoint_', data.Properties.VariableNames) && mean(data.Object9ForwardVelocity_refPoint_, 'omitnan') > 0
    v_target = data.Object9ForwardVelocity_refPoint_;
elseif ismember('Object10ForwardVelocity_refPoint_', data.Properties.VariableNames) && mean(data.Object10ForwardVelocity_refPoint_, 'omitnan') > 0
    v_target = data.Object10ForwardVelocity_refPoint_;
else
    error('Kein gültiges Signal für v_target gefunden.');
end
speed_target = v_target * 3.6;


% Y-Position VUT Front Axle
possibleFields_vut_y = {
    'YPositionFrontAxle'
    'MpYPositionFrontAxle'
    'YPosition'
    'ActualY_frontAxle_'
    'ActualY_frontAxle__1'
    % ggf. weitere mögliche Namen ergänzen
};

y_vut_frontAxle = [];  % Standardwert / leere Initialisierung

for i = 1:numel(possibleFields_vut_y)
    field = possibleFields_vut_y{i};
    if ismember(field, data.Properties.VariableNames)
        vals = data.(field);
        valid = ~isnan(vals);
        if sum(vals(valid) ~= 0) / sum(valid) >= 0.10
            y_vut_frontAxle = vals;
            break;
        end
    end
end

if isempty(y_vut_frontAxle)
    error('Kein gültiges Signal für y_vut_frontAxle gefunden.');
end


% X-Position VUT Front Axle
possibleFields_vut = {
    'XPositionFrontAxle'
    'MpXPositionFrontAxle'
    'XPosition'
    'ActualX_frontAxle_'
    'ActualX_frontAxle__1'
    % ggf. weitere mögliche Namen ergänzen
};

x_vut_frontAxle = [];  % Standardwert / leere Initialisierung

for i = 1:numel(possibleFields_vut)
    field = possibleFields_vut{i};
    if ismember(field, data.Properties.VariableNames)
        vals = data.(field);
        valid = ~isnan(vals);
        if sum(vals(valid) ~= 0) / sum(valid) >= 0.10
            x_vut_frontAxle = vals;
            break;
        end
    end
end

if isempty(x_vut_frontAxle)
    error('Kein gültiges Signal für x_vut_frontAxle gefunden.');
end

% X-Position Target Front Axle
possibleFields = {
    'OtherVehicleXPositionFrontAxle'
    'HeadTrackerXPositionFrontAxle'
    'HeadTrackerActualX_frontAxle_'
    'Object1ActualX_frontAxle_'
    'Object2ActualX_frontAxle_'
    'Object3ActualX_frontAxle_'
    'Object4ActualX_frontAxle_'
    'Object5ActualX_frontAxle_'
    'Object6ActualX_frontAxle_'
    'Object7ActualX_frontAxle_'
    'Object8ActualX_frontAxle_'
    'Object9ActualX_frontAxle_'
    'Object10ActualX_frontAxle_'
    'Object1XPositionFrontAxle'
    'Object2XPositionFrontAxle'
    'Object3XPositionFrontAxle'
    'Object4XPositionFrontAxle'
    'Object5XPositionFrontAxle'
    'Object6XPositionFrontAxle'
    'Object7XPositionFrontAxle'
    'Object8XPositionFrontAxle'
    'Object9XPositionFrontAxle'
    'Object10XPositionFrontAxle'
};

x_target_frontAxle = [];  % Standardwert / leere Initialisierung

for i = 1:numel(possibleFields)
    field = possibleFields{i};
    if ismember(field, data.Properties.VariableNames)
        vals = data.(field);
        valid = ~isnan(vals);
        if sum(vals(valid) ~= 0) / sum(valid) >= 0.10
            x_target_frontAxle = vals;
            break;
        end
    end
end

if isempty(x_target_frontAxle)
    error('Kein gültiges Signal für x_target_frontAxle gefunden.');
end 

% Y-Position Target Front Axle
possibleFields = {
    'OtherVehicleYPositionFrontAxle'
    'HeadTrackerYPositionFrontAxle'
    'HeadTrackerActualY_frontAxle_'
    'Object1YPosition_frontAxle_'
    'Object2YPosition_frontAxle_'
    'Object3YPosition_frontAxle_'
    'Object4YPosition_frontAxle_'
    'Object5YPosition_frontAxle_'
    'Object6YPosition_frontAxle_'
    'Object7YPosition_frontAxle_'
    'Object8YPosition_frontAxle_'
    'Object9YPosition_frontAxle_'
    'Object10YPosition_frontAxle_'
    'Object1YPositionFrontAxle'
    'Object2YPositionFrontAxle'
    'Object3YPositionFrontAxle'
    'Object4YPositionFrontAxle'
    'Object5YPositionFrontAxle'
    'Object6YPositionFrontAxle'
    'Object7YPositionFrontAxle'
    'Object8YPositionFrontAxle'
    'Object9YPositionFrontAxle'
    'Object10YPositionFrontAxle'
};

y_target_frontAxle = [];  % Standardwert / leere Initialisierung

for i = 1:numel(possibleFields)
    field = possibleFields{i};
    if ismember(field, data.Properties.VariableNames)
        vals = data.(field);
        valid = ~isnan(vals);
        if sum(vals(valid) ~= 0) / sum(valid) >= 0.10
            y_target_frontAxle = vals;
            break;
        end
    end
end

if isempty(y_target_frontAxle)
    error('Kein gültiges Signal für y_target_frontAxle gefunden.');
end

% Warnsignal-Suche: erst Einzelnamen, dann nummerierte Namen
warnsignal = [];
usedSignalName = '';

% Zuerst statische Kandidaten ohne Nummern prüfen
staticCandidates = {
    'Video'
    'CANUserDefined1_Video_'
};
for i = 1:numel(staticCandidates)
    varName = staticCandidates{i};
    if ismember(varName, data.Properties.VariableNames)
        vals = data.(varName);
        if mean(vals, 'omitnan') > 0
            warnsignal = vals;
            usedSignalName = varName;
            break;
        end
    end
end

% Falls kein Treffer: nun dynamische Namen mit Ziffern prüfen
if isempty(warnsignal)
    % Liste von Signal-Pattern (Prefixe mit Ziffernbereich)
    warnPatterns = {
        'CanDecode', 1:11
        'CANUserDefined', 1:2
        'CAN', 1:32
    };

    for p = 1:size(warnPatterns, 1)
        prefix = warnPatterns{p, 1};
        indices = warnPatterns{p, 2};

        for i = indices
            varName = sprintf('%s%d', prefix, i);
            if ismember(varName, data.Properties.VariableNames)
                vals = data.(varName);
                if mean(vals, 'omitnan') > 0
                    warnsignal = vals;
                    usedSignalName = varName;
                    break;
                end
            end
        end
        if ~isempty(warnsignal)
            break;
        end
    end
end

% Fehler oder Bestätigung
if isempty(warnsignal)
    error('Kein gültiges Warnsignal gefunden.');
else
    fprintf('Verwendetes Warnsignal: %s\n', usedSignalName);
end

warnsignal = warnsignal ~= 0;
% Nachbearbeitung (glätten und binär machen)
windowSize = 5;  % z. B. 50 ms bei 100 Hz
warnsignal_smooth = movmean(warnsignal, windowSize);
warnsignal_filtered = warnsignal_smooth > 0.5;

%% === Berechnung notwendiger Größen ===
    x_target = x_target_frontAxle + xRefTarget;
    if lateralExtension
        warning("Berechnungen berücksichtigen den seitlichen Ausleger!")
        y_target_cos = y_target_frontAxle + yRefTarget_Extension;
    else    
        y_target_cos = y_target_frontAxle + yRefTarget;
    end
    y_target = y_target_cos - yRefVUT;
    x_vut = x_vut_frontAxle + xRefVUT;
    y_vut_cos = y_vut_frontAxle + yRefVUT;
    y_vut = y_vut_frontAxle;

%% === t₀-Ermittlung: Target hat Beschleunigungsweg 5,66 m zurückgelegt ===
x_target_start = x_target(1);
travelledDist_target = x_target - x_target_start;

idx_t0 = find(x_target >= targetStartDistance, 1, 'first');
if isempty(idx_t0)
    error('Target hat Startdistanz von %.2f m nicht erreicht.', targetStartDistance);
end
t_0 = time(idx_t0);
criterionUsed = sprintf('Target hat Startdistanz von %.2f m erreicht.', targetStartDistance);

% === t_end-Ermittlung ===
idx_end = find(x_target > 0, 1, 'first');
if isempty(idx_end)
    error('t_{end} konnte nicht ermittelt werden.');
end
t_end = time(idx_end);

fprintf('t_0 = %.3f s (%s), t_{end} = %.3f s\n', t_0, criterionUsed, t_end);

% === Zeitbereich definieren ===
t_plot_start = -2;
t_plot_end = t_end - t_0 + 2;
t_rel = time - t_0;
idx_plot = find(t_rel >= t_plot_start & t_rel <= t_plot_end);


% === Toleranzprüfungen ===
withinTolTarget = all(abs(speed_target(t_rel >= 0 & t_rel <= (t_end - t_0)) - speedTarget) <= targetTol);

% X-Positionen
x_vut_t0 = x_vut(idx_t0);
x_vut_tend = x_vut(idx_end);

x_target_t0 = x_target(idx_t0);
x_target_tend = x_target(idx_end);

xfill = [0, t_end - t_0];
% yfill_vut = [speedVUT - vutTol, speedVUT + vutTol];


%% Sammelplot 1: Zeit
figure(991); clf;

% === Subplot 1_1: Speed ===
subplot(3,1,1); hold on; grid on;

yfill_target = [speedTarget - targetTol, speedTarget + targetTol];
p1_1_2 =    fill([xfill fliplr(xfill)], ...
            [yfill_target(1) yfill_target(1) yfill_target(2) yfill_target(2)], ...
            withinTolTarget*[0.7 1 0.7] + ~withinTolTarget*[1 0.8 0.8], ...
            'FaceAlpha', 0.5, 'EdgeColor', 'none');

p1_1_1 = plot(t_rel, speed_target, 'r', 'LineWidth', 1.5);

xline(0, '--k', 't_0', 'LabelVerticalAlignment', 'bottom', 'LabelHorizontalAlignment', 'left');
% xline(0, '--k', 't_0 @ -44,44 m', 'LabelVerticalAlignment', 'bottom', 'LabelHorizontalAlignment', 'left');
xline(t_end - t_0, '--k', 't_{end}', 'LabelVerticalAlignment', 'bottom', 'LabelHorizontalAlignment', 'left');

xlabel('Time since t_0 [s]');
ylabel('Target Speed [km/h]');
%title({'Target Vehicle Speed'; ['t_0: ' criterionUsed]});
ylim([speedTarget - targetTol - 0.5, speedTarget + targetTol + 0.55]);
xlim([-1, t_end - t_0 + 1]);
%legend('Target Tolerance', 'Target Speed', 't_0', 't_{end}', 'Location', 'best');
%legend([p1_1_1, p1_1_2], {'Target Speed', 'Tolerance'}, 'Location', 'north');

% === Subplot 1_2:  Speed ===
subplot(3,1,2); hold on; grid on;


withinTol6 = all(abs(y_target(t_rel >= 0 & t_rel <= (t_end - t_0)) - yTargetResult) <= tolLatTarget);

p1_2_2 = fill([0, t_end - t_0, t_end - t_0, 0], ...
     [yTargetResult + tolLatTarget, yTargetResult + tolLatTarget, ...
      yTargetResult - tolLatTarget, yTargetResult - tolLatTarget], ...
     withinTol6*[0.7 1 0.7] + ~withinTol6*[1 0.8 0.8], ...
     'EdgeColor', 'none', 'FaceAlpha', 0.5, 'DisplayName', 'Toleranzbereich');

p1_2_1 = plot(t_rel, y_target, 'r', 'LineWidth', 1.5);
xline(0, '--k', 't_0', 'LabelVerticalAlignment', 'bottom', 'LabelHorizontalAlignment', 'left');
% xline(0, '--k', 't_0 @ -44,44 m', 'LabelVerticalAlignment', 'bottom', 'LabelHorizontalAlignment', 'left');
xline(t_end - t_0, '--k', 't_{end}', 'LabelVerticalAlignment', 'bottom', 'LabelHorizontalAlignment', 'left');

xlabel('Time since t_0 [s]');
ylabel('Lat. Pos. Target [m]');
%title({'Y position of the target over time'; ['t_0: ' criterionUsed]});
xlim([-1, t_end - t_0 + 1]);
%legend('Target Y position', 't_0', 't_{end}', 'Location', 'best');
%legend([p1_2_1, p1_2_2], {'Target Y-Position', 'Tolerance'}, 'Location', 'north');
ylim([yTargetResult - tolLatTarget - 0.1, yTargetResult + tolLatTarget + 0.2])
yt = -2.95:0.2:-2.55;
yticks(yt);  % Y-Ticks setzen
yticklabels(arrayfun(@(y) sprintf('%.2f', y), yt, 'UniformOutput', false));  % Format erzwingen
%legend([p1_2_1, p1_2_2], {'Target Y-Position', 'Tolerance'}, 'Location', 'north');

% === Subplot 1_3:  Speed ===
subplot(3,1,3); hold on; grid on;

% Kurven plotten
plot(t_rel, x_target, 'r', 'LineWidth', 1.5);
plot(t_rel, x_vut, 'b', 'LineWidth', 1.5);

% X-Linien für t_0 und t_end
xline(0, '--k', 't_0', 'LabelVerticalAlignment', 'bottom', 'LabelHorizontalAlignment', 'left');
% xline(0, '--k', 't_0 @ -44,44 m', 'LabelVerticalAlignment', 'bottom', 'LabelHorizontalAlignment', 'left');
xline(t_end - t_0, '--k', 't_{end}', 'LabelVerticalAlignment', 'bottom', 'LabelHorizontalAlignment', 'left');

% Achsen, Labels, Titel, Legende
xlabel('Time since t_0 [s]');
ylabel('X-Position [m]');
%title('X positions of target and VUT with tolerance range');
legend({'Target', 'VUT'}, 'Location', 'east');
% xlim([t_plot_start, t_plot_end]);
xlim([-1, t_end - t_0 + 1]);



if printPlots == 1
    %----------------------------------------------------------------------
    % 1) Speicherpfad und Dateinamen definieren
    %----------------------------------------------------------------------
    filename     = sprintf("Static2_Plot2");
    outputFolder = "C:\Users\G00550\Desktop\Elias Daten\MATLAB\R151 Auswertung\Entwicklung\PDF_Ausgabe_Test";
    if ~exist(outputFolder, "dir"); mkdir(outputFolder); end
    filePDF = fullfile(outputFolder, filename + ".pdf");

    %----------------------------------------------------------------------
    % 2) Neue Layout-Figure (A4 quer)
    %----------------------------------------------------------------------
    layoutFig = figure('Units', 'centimeters', ...
                       'Position', [2 2 29.7 21], ...
                       'PaperUnits', 'centimeters', ...
                       'PaperSize', [29.7 21], ...
                       'Color', 'w');

    %----------------------------------------------------------------------
    % 3) TestCase-Text (oben links)
    %----------------------------------------------------------------------
%         annotation(layoutFig, 'textbox', [0.05 0.75 0.5 0.1], ...
%             "String", testCase, ...
%             "FontSize", 14, ...
%             "FontWeight", "bold", ...
%             "LineStyle", "none", ...
%             "HorizontalAlignment", "left");

    % === Zeile 1: UN - R151 ===
    annotation(layoutFig, 'textbox', [0.05 0.9 0.5 0.05], ...
        "String", 'UN - R151', ...
        "FontSize", 20, ...
        "FontWeight", "bold", ...
        "LineStyle", "none", ...
        "HorizontalAlignment", "left");

    % === Zeile 2: Testfallbezeichnung (z. B. Car-to-Car CCRs_20kmh_50m) ===
    annotation(layoutFig, 'textbox', [0.05 0.85 0.8 0.05], ...
        "String", scenarioString, ...
        "FontSize", 14, ...
        "FontWeight", "normal", ...
        "LineStyle", "none", ...
        "HorizontalAlignment", "left");

    % === Zeile 3: VIN ===
    annotation(layoutFig, 'textbox', [0.05 0.82 0.5 0.05], ...
        "String", VIN, ...
        "FontSize", 12, ...
        "FontWeight", "normal", ...
        "LineStyle", "none", ...
        "HorizontalAlignment", "left");

    % === Zeile 4: Datum der Messung ===
    annotation(layoutFig, 'textbox', [0.05 0.79 0.5 0.05], ...
        "String", dateRun, ...
        "FontSize", 12, ...
        "FontWeight", "normal", ...
        "LineStyle", "none", ...
        "HorizontalAlignment", "left");

    %----------------------------------------------------------------------
    % 4) Logo einfügen (oben rechts)
    %----------------------------------------------------------------------
%         axLogo = axes(layoutFig, 'Position', [0.75 0.78 0.2 0.18]);
%         imshow(logoImage, 'Parent', axLogo);
%         axis(axLogo, 'off');

    % RGB-Logo sicherstellen (falls Graustufenbild geladen wurde)
    if size(logoImage,3) == 1
        logoImage = repmat(logoImage, [1 1 3]);  % Grau -> RGB
    end

    % Logo-Achse mit 'image' anzeigen (nicht imshow!)
    axLogo = axes(layoutFig, 'Position', [0.7 0.9 0.25 0.09]);
    image(axLogo, logoImage); 
    axis(axLogo, 'off');
%         axLogo.YDir = 'normal';  % notwendig, da 'image' Y-Achse invertieren kann


    %----------------------------------------------------------------------
    % 5) Sammelplot übernehmen
    % -> Sicherstellen, dass die Figure existiert
    %----------------------------------------------------------------------
    if ishandle(991)
        figSrc = figure(991);  % vorhandene Plot-Figure
        % komplette Achsen und Inhalte in neue Figure kopieren
        axChildren = findall(figSrc, 'Type', 'axes');
        legChildren = findall(figSrc, 'Type', 'legend');

        for i = 1:numel(axChildren)
            % Finde ggf. zugehörige Legende
            legForThisAxes = [];
            for j = 1:numel(legChildren)
                if legChildren(j).PlotChildren(1).Parent == axChildren(i)
                    legForThisAxes = legChildren(j);
                    break;
                end
            end

            % Wenn eine zugehörige Legende gefunden wurde:
            if ~isempty(legForThisAxes)
                newObjs = copyobj([axChildren(i), legForThisAxes], layoutFig);
                newAxes = newObjs(1);  % kopierte Achse
                newLeg = newObjs(2);   % kopierte Legende
            else
                newAxes = copyobj(axChildren(i), layoutFig);
            end

            % Position der Achse anpassen
            set(newAxes, 'Units', 'normalized');
%             origPos = get(axChildren(i), 'Position');
%             newPos = origPos;
%             newPos(1) = origPos(1)-0.06;
%             newPos(2) = origPos(2)*0.85-0.07;
%             newPos(3) = origPos(3)*1.17;
%             newPos(4) = origPos(4)*1.05;
            origPos = get(axChildren(i), 'Position');
            newPos = origPos;
            newPos(1) = origPos(1)-0.06;  % x-Position
            newPos(2) = origPos(2)*0.82-0.03;  % y-Position
            newPos(3) = origPos(3)*1.17;  % Breite
            newPos(4) = origPos(4)*0.86;  % Höhe
            set(newAxes, 'FontSize', 10);  % z. B. einheitlich für alle Achsen
            set(newAxes, 'Position', newPos);
            set(newAxes, 'Color', 'w');
            set(newAxes, 'Toolbar', []);  % Toolbar entfernen
            set(newAxes, 'FontSize', 12);  % z. B. einheitlich für alle Achsen
            set(newLeg, 'Box', 'off', 'Color', 'none', 'Location', 'east');
        end
    else
        warning("Figure 991 existiert nicht – Sammelplot konnte nicht übernommen werden.");
    end

    %----------------------------------------------------------------------
    % 6) PDF exportieren
    %----------------------------------------------------------------------
    print(layoutFig, '-dpdf', '-fillpage', filePDF);

end



%% Sammelplot 2: Zeit
figure(992); clf;

% === Subplot 2_1: Speed ===
subplot(3,1,1); hold on; grid on;


withinTol7 = all(abs(y_target(x_target >= x_target_t0 & x_target <= x_target_tend) - yTargetResult) <= tolLatTarget);

p2_1_2 = fill([x_target_t0, x_target_tend, x_target_tend, x_target_t0], ...
     [yTargetResult + tolLatTarget, yTargetResult + tolLatTarget, ...
      yTargetResult - tolLatTarget, yTargetResult - tolLatTarget], ...
     withinTol7*[0.7 1 0.7] + ~withinTol7*[1 0.8 0.8], ...
     'EdgeColor', 'none', 'FaceAlpha', 0.6, 'DisplayName', 'Toleranzbereich');

p2_1_1 = plot(x_target, y_target, 'r', 'LineWidth', 1.5);

xline(x_target_t0, '--k', 't_0', 'LabelVerticalAlignment', 'bottom', 'LabelHorizontalAlignment', 'left','DisplayName', 't_{0} = Test Start');
% xline(x_target_t0, '--k', 't_0 @ -44,44 m', 'LabelVerticalAlignment', 'middle', 'LabelHorizontalAlignment', 'left','DisplayName', 't_{0} = Test Start');
xline(x_target_tend, '--k', 't_{end}', 'LabelVerticalAlignment', 'bottom', 'LabelHorizontalAlignment', 'left');

xlabel('X-Position Target [m]');
ylabel('Lat. Pos. Target [m]');
%title('Y position of the target over X position of the target');
%legend('Target trajectory', 'Location', 'best');
%legend([p2_1_1, p2_1_2], {'Target Y-Position', 'Tolerance'}, 'Location', 'north');
xlim([x_target_t0-5, x_target_tend+5]);
ylim([yTargetResult - tolLatTarget - 0.1, yTargetResult + tolLatTarget + 0.15]);
yt = -2.95:0.2:-2.55;
yticks(yt);  % Y-Ticks setzen
yticklabels(arrayfun(@(y) sprintf('%.3f', y), yt, 'UniformOutput', false));  % Format erzwingen

% === Subplot 2_2: Signal ===
subplot(3,1,2); hold on; grid on;

xfill_target = [x_target_t0, x_target_tend];
yfill_target = [speedTarget - targetTol, speedTarget + targetTol];
p2_2_2 = fill([xfill_target fliplr(xfill_target)], ...
     [yfill_target(1) yfill_target(1) yfill_target(2) yfill_target(2)], ...
     withinTolTarget*[0.7 1 0.7] + ~withinTolTarget*[1 0.8 0.8], ...
     'FaceAlpha', 0.6, 'EdgeColor', 'none');

p2_2_1 = plot(data.Object1XPositionReference, data.Object1ForwardVelocity * 3.6, 'r', 'LineWidth', 1.5);


% % Beschriftung des Punktes (z. B. oberhalb)
text(x_target_t0 + 0.3, speedTarget + targetTol + 0.2, sprintf('Target Speed at 44.44 m: %.2f km/h', speed_target(idx_t0)), ...
    'HorizontalAlignment', 'left', ...
    'VerticalAlignment', 'bottom', ...
    'FontSize', 10, 'Color', 'k');

xline(x_target_t0, '--k', 't_0', 'LabelVerticalAlignment', 'bottom', 'LabelHorizontalAlignment', 'left','DisplayName', 't_{0} = Test Start');
% xline(x_target_t0, '--k', 't_0 @ -44,44 m', 'LabelVerticalAlignment', 'middle', 'LabelHorizontalAlignment', 'left','DisplayName', 't_{0} = Test Start');
xline(x_target_tend, '--k', 't_{end}', 'LabelVerticalAlignment', 'bottom', 'LabelHorizontalAlignment', 'left');

%xlabel('Distance to Crashpoint [m]');
xlabel('X-Position Target [m]');
ylabel('Target Speed [km/h]');
%title({'Target Speed over Distance'; ['t_0: ' criterionUsed]});
ylim([speedTarget - targetTol - 0.4, speedTarget + targetTol + 0.5]);
%xlim([x_target_t0-11, x_target_tend+10]);
xlim([x_target_t0-5, x_target_tend+5]);
%legend('Tolerance (+/- 0,5 km/h)', 'Target Speed', 't_0', 't_{end}', 'Location', 'north');
%legend([p2_2_1, p2_2_2], {'Target Speed', 'Tolerance'}, 'Location', 'north');


% === Subplot 2_3: Signal ===
subplot(3,1,3); hold on; grid on;


% Stelle sicher, dass dc und dd korrekt sortiert sind
%x_start = lip;
lip = lip;

% Logischer Indexbereich im Positionsvektor (x_target) zwischen dc und dd
idx_region = x_target <= lip;

% Überprüfen, ob innerhalb dieses Bereichs das gefilterte Warnsignal 1 ist
if any(warnsignal_filtered(idx_region))
    color_shade = [0.7 1.0 0.7];  % hellgrün
    % Farbfläche zeichnen (nur Hintergrund)
    yl = ylim;  % aktueller Y-Achsenbereich
    p2_3_2 = fill([x_target_t0 lip lip x_target_t0], [yl(1) yl(1) yl(2) yl(2)], ...
     color_shade, 'EdgeColor', 'none', 'FaceAlpha', 0.5, 'DisplayName', 'Correct Signal Activation');
else
    color_shade = [1.0 0.8 0.8];  % hellrot
    yl = ylim;  % aktueller Y-Achsenbereich
    p2_3_2 = fill([x_target_t0 lip lip x_target_t0], [yl(1) yl(1) yl(2) yl(2)], ...
     color_shade, 'EdgeColor', 'none', 'FaceAlpha', 0.5, 'DisplayName', 'Incorrect Signal Activation');
end

xline(x_target_t0, '--k', 't_0', 'LabelVerticalAlignment', 'middle', 'LabelHorizontalAlignment', 'left','DisplayName', 't_{0} = Test Start');
% xline(x_target_t0, '--k', 't_0 @ -44,44 m', 'LabelVerticalAlignment', 'middle', 'LabelHorizontalAlignment', 'left','DisplayName', 't_{0} = Test Start');
xline(x_target_tend, '--k', 't_{end}', 'LabelVerticalAlignment', 'middle', 'LabelHorizontalAlignment', 'left','DisplayName', 't_{End} = Test End');
xline(lip, '--k', 'LIP @ -7.77m', 'LabelVerticalAlignment', 'middle', 'LabelHorizontalAlignment', 'left','DisplayName', 'LIP @ 7.77 m');




plot(x_target, warnsignal, 'Color', [0.5 0.5 0.5], 'DisplayName', 'Raw Signal');
hold on; grid on;
p2_3_1 = plot(x_target, warnsignal_filtered, 'b', 'LineWidth', 1.5, 'DisplayName', 'Filtered Signal');

% Erstes Auftreten von 1 im gefilterten Warnsignal
firstIdx = find(warnsignal_filtered, 1, 'first');

if ~isempty(firstIdx)
    x_first = x_target(firstIdx);

    % Punkt markieren
    plot(x_first, 1, 'ko', 'MarkerFaceColor', 'k', 'DisplayName', 'First Signal Activation');

    % Beschriftung des Punktes (z. B. oberhalb)
    text(x_first - 0.2, 1.05, sprintf('%.1f m', x_first), ...
        'HorizontalAlignment', 'right', ...
        'VerticalAlignment', 'top', ...
        'FontSize', 10, 'Color', 'k');
end


xlabel('X-Position Target [m]');
ylabel('Warning Signal');
%title('Warning signal over VUT distance');
ylim([-0.1 1.1]);
yticks([0 1]);
%legend('Location','northwest');
%yticklabels({'No Signal', 'Signal activated'});
xlim([x_target_t0-5, x_target_tend+5]);
%legend([p2_3_1, p2_3_2], {'Warning Signal', 'Correct Activation'}, 'Location', 'southeast');


if printPlots == 1
    %----------------------------------------------------------------------
    % 1) Speicherpfad und Dateinamen definieren
    %----------------------------------------------------------------------
    filename     = sprintf("Static2_Plot1");
    outputFolder = "C:\Users\G00550\Desktop\Elias Daten\MATLAB\R151 Auswertung\Entwicklung\PDF_Ausgabe_Test";
    if ~exist(outputFolder, "dir"); mkdir(outputFolder); end
    filePDF = fullfile(outputFolder, filename + ".pdf");

    %----------------------------------------------------------------------
    % 2) Neue Layout-Figure (A4 quer)
    %----------------------------------------------------------------------
    layoutFig = figure('Units', 'centimeters', ...
                       'Position', [2 2 29.7 21], ...
                       'PaperUnits', 'centimeters', ...
                       'PaperSize', [29.7 21], ...
                       'Color', 'w');

    %----------------------------------------------------------------------
    % 3) TestCase-Text (oben links)
    %----------------------------------------------------------------------
%         annotation(layoutFig, 'textbox', [0.05 0.75 0.5 0.1], ...
%             "String", testCase, ...
%             "FontSize", 14, ...
%             "FontWeight", "bold", ...
%             "LineStyle", "none", ...
%             "HorizontalAlignment", "left");

    % === Zeile 1: UN - R151 ===
    annotation(layoutFig, 'textbox', [0.05 0.9 0.5 0.05], ...
        "String", 'UN - R151', ...
        "FontSize", 20, ...
        "FontWeight", "bold", ...
        "LineStyle", "none", ...
        "HorizontalAlignment", "left");

    % === Zeile 2: Testfallbezeichnung (z. B. Car-to-Car CCRs_20kmh_50m) ===
    annotation(layoutFig, 'textbox', [0.05 0.85 0.8 0.05], ...
        "String", scenarioString, ...
        "FontSize", 14, ...
        "FontWeight", "normal", ...
        "LineStyle", "none", ...
        "HorizontalAlignment", "left");

    % === Zeile 3: VIN ===
    annotation(layoutFig, 'textbox', [0.05 0.82 0.5 0.05], ...
        "String", VIN, ...
        "FontSize", 12, ...
        "FontWeight", "normal", ...
        "LineStyle", "none", ...
        "HorizontalAlignment", "left");

    % === Zeile 4: Datum der Messung ===
    annotation(layoutFig, 'textbox', [0.05 0.79 0.5 0.05], ...
        "String", dateRun, ...
        "FontSize", 12, ...
        "FontWeight", "normal", ...
        "LineStyle", "none", ...
        "HorizontalAlignment", "left");

    %----------------------------------------------------------------------
    % 4) Logo einfügen (oben rechts)
    %----------------------------------------------------------------------
%         axLogo = axes(layoutFig, 'Position', [0.75 0.78 0.2 0.18]);
%         imshow(logoImage, 'Parent', axLogo);
%         axis(axLogo, 'off');

    % RGB-Logo sicherstellen (falls Graustufenbild geladen wurde)
    if size(logoImage,3) == 1
        logoImage = repmat(logoImage, [1 1 3]);  % Grau -> RGB
    end

    % Logo-Achse mit 'image' anzeigen (nicht imshow!)
    axLogo = axes(layoutFig, 'Position', [0.7 0.9 0.25 0.09]);
    image(axLogo, logoImage); 
    axis(axLogo, 'off');
%         axLogo.YDir = 'normal';  % notwendig, da 'image' Y-Achse invertieren kann


    %----------------------------------------------------------------------
    % 5) Sammelplot übernehmen
    % -> Sicherstellen, dass die Figure existiert
    %----------------------------------------------------------------------
    if ishandle(992)
        figSrc = figure(992);  % vorhandene Plot-Figure
        % komplette Achsen und Inhalte in neue Figure kopieren
        axChildren = findall(figSrc, 'Type', 'axes');
        %newPanel = uipanel(layoutFig, 'Units', 'normalized', 'Position', [0 0 1 0.7]);
        for i = 1:numel(axChildren)
%                 newAxes = copyobj(axChildren(i), newPanel);
            newAxes = copyobj(axChildren(i), layoutFig);
            set(newAxes, 'Units', 'normalized');
            % automatisch anordnen: hier ggf. anpassen für perfekte Platzierung
            origPos = get(axChildren(i), 'Position');
%             newPos = origPos;
%             newPos(1) = origPos(1)-0.06;  % x-Position
%             newPos(2) = origPos(2)*0.85-0.07;  % y-Position
%             newPos(3) = origPos(3)*1.17;  % Breite
%             newPos(4) = origPos(4)*1;  % Höhe
            newPos(1) = origPos(1)-0.06;  % x-Position
            newPos(2) = origPos(2)*0.82-0.03;  % y-Position
            newPos(3) = origPos(3)*1.17;  % Breite
            newPos(4) = origPos(4)*0.86;  % Höhe
            set(newAxes, 'FontSize', 10);  % z. B. einheitlich für alle Achsen
            set(newAxes, 'Position', newPos);
            set(newAxes, 'Color', 'w');
%                 set(newAxes, 'Color', 'w');  % Hier explizit auf Weiß setzen
        end
    else
        warning("Figure 992 existiert nicht – Sammelplot konnte nicht übernommen werden.");
    end

    %----------------------------------------------------------------------
    % 6) PDF exportieren
    %----------------------------------------------------------------------
    print(layoutFig, '-dpdf', '-fillpage', filePDF);

end


% === Plot 5b: Abweichung X-Position mit Toleranzschlauch ===
figure(51); clf; hold on; grid on;

% === Logik zur Prüfung, ob Toleranz eingehalten wird ===
% X-Bereichsmaske: nur Werte innerhalb des Toleranzbereichs prüfen
x_range_mask = x_target >= x_target_t0 & ...
               x_target <= x_target_tend;

% Y-Abweichung zwischen Target und VUT
y_diff = abs(y_target(x_range_mask) - yTargetResult);

% Prüfen, ob ALLE Abweichungen innerhalb der Toleranz liegen
if all(abs(y_diff) <= tolLatTarget)
    color_shade = [0.8 1 0.8];  % hellgrün (Toleranz eingehalten)
else
    color_shade = [1.0 0.8 0.8];  % hellrot (mindestens ein Punkt außerhalb)
end

% Toleranzschlauch zeichnen
fill([x_target_t0, x_target_tend, x_target_tend, x_target_t0], ...
     [yTargetResult + tolLatTarget, yTargetResult + tolLatTarget, yTargetResult - tolLatTarget, yTargetResult - tolLatTarget], ...
     color_shade, 'EdgeColor', 'none', 'FaceAlpha', 0.5, ...
     'DisplayName', '±0.2 m Toleranz');

xline(x_target_t0, '--k', 't_0', 'LabelVerticalAlignment', 'bottom', 'LabelHorizontalAlignment', 'left');
xline(x_target_tend, '--k', 't_{end}', 'LabelVerticalAlignment', 'bottom', 'LabelHorizontalAlignment', 'left');

p51_1 = plot(x_target, y_target, 'r', 'LineWidth', 1.5);
p51_2 = plot(x_target, y_vut, 'b', 'LineWidth', 1.5);


xlabel('X-Position [m]');
ylabel('Y-Position [m]');
%title({'Target lateral deviation'});
xlim([x_target_t0-7, x_target_tend+7]);
ylim([yTargetResult-0.5, 0.5]); % Ggf. anpassen

% Reguläre Ticks
yt = -2:0.5:0;

% Zusätzliche Ticks sicherstellen
extraTicks = [0, -2.75, -2.75 + 0.2, -2.75 - 0.2];

% Alle Ticks kombinieren, sortieren und duplikate entfernen
allTicks = unique([yt, extraTicks]);

% Ticks setzen
yticks(allTicks);

% Einheitliche Labels mit zwei Nachkommastellen
yticklabels(arrayfun(@(y) sprintf('%.2f', y), allTicks, 'UniformOutput', false));


% yt = -100:0.25:100;
% yticks(yt);  % Y-Ticks setzen
% yticklabels(arrayfun(@(y) sprintf('%.2f', y), yt, 'UniformOutput', false));  % Format erzwingen
%legend('X-Position Target', 'X-Position VUT', 'Tolerance +/- 0.2 m', 't_0 (@Target Distance 44.4 m)', 't_{end}', 'Location', 'best');
legend([p51_2, p51_1], {'VUT', 'Target'}, Location="east");

if printPlots == 1
    %----------------------------------------------------------------------
    % 1) Speicherpfad und Dateinamen definieren
    %----------------------------------------------------------------------
    filename     = sprintf("Static2_Plot3");
    outputFolder = "C:\Users\G00550\Desktop\Elias Daten\MATLAB\R151 Auswertung\Entwicklung\PDF_Ausgabe_Test";
    if ~exist(outputFolder, "dir"); mkdir(outputFolder); end
    filePDF = fullfile(outputFolder, filename + ".pdf");

    %----------------------------------------------------------------------
    % 2) Neue Layout-Figure (A4 quer)
    %----------------------------------------------------------------------
    layoutFig = figure('Units', 'centimeters', ...
                       'Position', [2 2 29.7 21], ...
                       'PaperUnits', 'centimeters', ...
                       'PaperSize', [29.7 21], ...
                       'Color', 'w');

    %----------------------------------------------------------------------
    % 3) TestCase-Text (oben links)
    %----------------------------------------------------------------------
%         annotation(layoutFig, 'textbox', [0.05 0.75 0.5 0.1], ...
%             "String", testCase, ...
%             "FontSize", 14, ...
%             "FontWeight", "bold", ...
%             "LineStyle", "none", ...
%             "HorizontalAlignment", "left");

    % === Zeile 1: UN - R151 ===
    annotation(layoutFig, 'textbox', [0.05 0.9 0.5 0.05], ...
        "String", 'UN - R151', ...
        "FontSize", 20, ...
        "FontWeight", "bold", ...
        "LineStyle", "none", ...
        "HorizontalAlignment", "left");

    % === Zeile 2: Testfallbezeichnung (z. B. Car-to-Car CCRs_20kmh_50m) ===
    annotation(layoutFig, 'textbox', [0.05 0.85 0.8 0.05], ...
        "String", scenarioString, ...
        "FontSize", 14, ...
        "FontWeight", "normal", ...
        "LineStyle", "none", ...
        "HorizontalAlignment", "left");

    % === Zeile 3: VIN ===
    annotation(layoutFig, 'textbox', [0.05 0.82 0.5 0.05], ...
        "String", VIN, ...
        "FontSize", 12, ...
        "FontWeight", "normal", ...
        "LineStyle", "none", ...
        "HorizontalAlignment", "left");

    % === Zeile 4: Datum der Messung ===
    annotation(layoutFig, 'textbox', [0.05 0.79 0.5 0.05], ...
        "String", dateRun, ...
        "FontSize", 12, ...
        "FontWeight", "normal", ...
        "LineStyle", "none", ...
        "HorizontalAlignment", "left");

    %----------------------------------------------------------------------
    % 4) Logo einfügen (oben rechts)
    %----------------------------------------------------------------------
%         axLogo = axes(layoutFig, 'Position', [0.75 0.78 0.2 0.18]);
%         imshow(logoImage, 'Parent', axLogo);
%         axis(axLogo, 'off');

    % RGB-Logo sicherstellen (falls Graustufenbild geladen wurde)
    if size(logoImage,3) == 1
        logoImage = repmat(logoImage, [1 1 3]);  % Grau -> RGB
    end

    % Logo-Achse mit 'image' anzeigen (nicht imshow!)
    axLogo = axes(layoutFig, 'Position', [0.7 0.9 0.25 0.09]);
    image(axLogo, logoImage); 
    axis(axLogo, 'off');
%         axLogo.YDir = 'normal';  % notwendig, da 'image' Y-Achse invertieren kann


    %----------------------------------------------------------------------
    % 5) Sammelplot übernehmen
    % -> Sicherstellen, dass die Figure existiert
    %----------------------------------------------------------------------
    if ishandle(51)
        figSrc = figure(51);  % vorhandene Plot-Figure
        % komplette Achsen und Inhalte in neue Figure kopieren
        axChildren = findall(figSrc, 'Type', 'axes');
        legChildren = findall(figSrc, 'Type', 'legend');

        for i = 1:numel(axChildren)
            % Finde ggf. zugehörige Legende
            legForThisAxes = [];
            for j = 1:numel(legChildren)
                if legChildren(j).PlotChildren(1).Parent == axChildren(i)
                    legForThisAxes = legChildren(j);
                    break;
                end
            end

            % Wenn eine zugehörige Legende gefunden wurde:
            if ~isempty(legForThisAxes)
                newObjs = copyobj([axChildren(i), legForThisAxes], layoutFig);
                newAxes = newObjs(1);  % kopierte Achse
                newLeg = newObjs(2);   % kopierte Legende
            else
                newAxes = copyobj(axChildren(i), layoutFig);
            end

            % Position der Achse anpassen
            set(newAxes, 'Units', 'normalized');
            origPos = get(axChildren(i), 'Position');
            newPos = origPos;
            newPos(1) = origPos(1)-0.04;
            newPos(2) = origPos(2)*0.85;
            newPos(3) = origPos(3)*1.13;
            newPos(4) = origPos(4)*0.8;
            set(newAxes, 'Position', newPos);
            set(newAxes, 'Color', 'w');
            set(newAxes, 'Toolbar', []);  % Toolbar entfernen
            set(newAxes, 'FontSize', 12);  % z. B. einheitlich für alle Achsen
            set(newLeg, 'Box', 'off', 'Color', 'none', 'Location', 'east');
        end
    else
        warning("Figure 51 existiert nicht – Sammelplot konnte nicht übernommen werden.");
    end

    %----------------------------------------------------------------------
    % 6) PDF exportieren
    %----------------------------------------------------------------------
    print(layoutFig, '-dpdf', '-fillpage', filePDF);

end
