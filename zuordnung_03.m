clear; 

% Hauptordner, in dem die Dateien liegen
mainFolder = "C:\Users\G00550\Desktop\TestEinlesen";

%% === Eingangsgrößen ===
    tolSpeedVUT = 2;         % VUT ± 2 km/h
    tolSpeedTarget = 0.5;    % Target ± 0.5 km/h
    tolLatTarget = 0.2;
    tolLatVUT = 0.5;
    
    xRefTarget = 0.793;
    yRefTarget = 0.25;
    yRefTarget_Extension = 1.08;
    xRefVUT = 1.027;
    yRefVUT = -1.01;
    lateralExtension = false;

% Testfälle mit zugehörigen Parametern (vereinfachte Darstellung)
testCaseLibrary = struct(...
    'Dyn1', struct('speedVUT',10,'speedTarget',20,'da',-44.4,'db',-15.8),...
    'Dyn2', struct('speedVUT',10,'speedTarget',20,'da',-44.4,'db',-22),...
    'Dyn3', struct('speedVUT',20,'speedTarget',20,'da',-44.4,'db',-38.3),...
    'Dyn4', struct('speedVUT',20,'speedTarget',10,'da',-22.2,'db',-43.5),...
    'Dyn5', struct('speedVUT',10,'speedTarget',10,'da',-22.2,'db',-19.8),...
    'Dyn6', struct('speedVUT',10,'speedTarget',20,'da',-44.4,'db',-14.7),...
    'Dyn7', struct('speedVUT',10,'speedTarget',20,'da',-44.4,'db',-17.7),...
    'Add1', struct('speedVUT',10,'speedTarget',20,'da',-44.4,'db',-15.8),...
    'Add2', struct('speedVUT',20,'speedTarget',10,'da',-22.2,'db',-43.5)...
);

% Alle .txt-Dateien rekursiv suchen
files = dir(fullfile(mainFolder, '**', '*.txt'));

% Toleranzen
speedTol = 0.5; % km/h
daTol = 0.5;     % m
dbTol = 0.5;     % m




%% === Eingangsgrößen ===
tolSpeedVUT = 2;         % VUT ± 2 km/h
tolSpeedTarget = 0.5;    % Target ± 0.5 km/h
tolLatTarget = 0.2;
tolLatVUT = 0.5;

xRefTarget = 0.793;
yRefTarget = 0.25;
yRefTarget_Extension = 1.08;
xRefVUT = 1.027;
yRefVUT = -1.01;
lateralExtension = false;



% Alle .txt-Dateien rekursiv suchen
files = dir(fullfile(mainFolder, '**', '*.txt'));

% Toleranzen
speedTol = 0.5; % km/h
tolDist = 0.5;     % m


for f = 1:length(files)
    filePath = fullfile(files(f).folder, files(f).name);
    fprintf('\nLade Datei: %s\n', filePath);

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
        warning('Kein gültiges Signal für v_target gefunden.');
        v_target = zeros(height(data), 1);  % Null-Vektor der gleichen Länge wie data
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
        warning('Kein gültiges Warnsignal gefunden.');
        warnsignal = zeros(height(data), 1);
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
    
    % === Funktionen zum Extrahieren von Parametern ===

    n = height(data);
    idx_q3_start = floor(n * 1/2);
    idx_q3_end = floor(n * 3/4);
    
    values_q3_vut_speed = speed_vut(idx_q3_start:idx_q3_end);
    speed_mean_vut = abs(round(mean(values_q3_vut_speed)/2)*2);
    
    values_q3_target_speed = speed_target(idx_q3_start:idx_q3_end);
    speed_mean_target = abs(ceil(mean(values_q3_target_speed)/5)*5);
    
    if speed_mean_target > 20
        speed_mean_target = 20;
    end
    
    if speed_mean_vut < 1
        finalCandidates = [];
        
        if speed_mean_target < 10 && abs(y_target(1)) > 10
            %remainig = 'Static2';
            finalCandidates = {'Static1'};
        else
            %remainig = 'Static1';
            finalCandidates = {'Static2'};
        end
        
        fprintf("--> Eindeutig zugeordnet : %s\n", finalCandidates{1});

    else
    
        % === Schritt 2: Schrittweise Eingrenzung ===
        testCaseNames = fieldnames(testCaseLibrary);
        remaining = testCaseNames;

        % Schritt 1: speedVUT
        remaining = filterBy(remaining, testCaseLibrary, 'speedVUT', speed_mean_vut, speedTol);
        fprintf("  Nach speedVUT (%.2f): %s\n", speed_mean_vut, strjoin(remaining, ", "));

        % Schritt 2: speedTarget
        remaining = filterBy(remaining, testCaseLibrary, 'speedTarget', speed_mean_target, speedTol);
        fprintf("  Nach speedTarget (%.2f): %s\n", speed_mean_target, strjoin(remaining, ", "));

        if numel(remaining) == 1
            fprintf("--> Zugeordnet zu Testfall: %s\n", remaining{1});
        elseif isempty(remaining)
            fprintf("--> Kein passender Testfall gefunden!\n");
        else
            fprintf("--> Mehrdeutige Zuordnung möglich: %s\n", strjoin(remaining, ", "));
        end


            %% Schritt 3: da-db-Check
        finalCandidates = {};
        for i = 1:numel(remaining)
            tcName = remaining{i};
            tcParams = testCaseLibrary.(tcName);
            da = tcParams.da;
            db = tcParams.db;

            % Zeitpunkte ermitteln
            [~, idx_da] = min(abs(x_target - da));
            [~, idx_db] = min(abs(x_vut - db));
            t_da = time(idx_da);
            t_db = time(idx_db);


            % Toleranz-Zeitfenster um da für das Target
            idx_in_tol = find(x_target >= (da - daTol) & x_target <= (da + daTol));
            if isempty(idx_in_tol)
                continue;  % keine gültige Toleranzzeit für Target
            end

            t_tol_start = time(idx_in_tol(1));
            t_tol_end = time(idx_in_tol(end));

            % Ist t_db innerhalb des Target-Toleranzzeitfensters?
            if t_db >= t_tol_start && t_db <= t_tol_end
                finalCandidates{end+1} = tcName;
            end
        end
        
        % Ausgabe nach da-db-Check
        if numel(finalCandidates) == 1
            fprintf("--> Eindeutig zugeordnet über da-db-Check: %s\n", finalCandidates{1});
        elseif isempty(finalCandidates)
            fprintf("--> Keiner der Kandidaten erfüllt den da-db-Check.\n");
        else
            fprintf("--> Mehrdeutige Kandidaten nach da-db-Check: %s\n", strjoin(finalCandidates, ", "));
            
            if ismember('Dyn4', finalCandidates)
                if abs(mean(y_target_frontAxle)) > 4.5
                    finalCandidates = finalCandidates(2);
                    fprintf("--> Eindeutig zugeordnet über lateralen Abstand: %s\n", strjoin(finalCandidates, ", "));
                else
                    finalCandidates = finalCandidates(1);
                    fprintf("--> Eindeutig zugeordnet über lateralen Abstand: %s\n", strjoin(finalCandidates, ", "));
                end
            else
                if abs(mean(y_target_frontAxle)) > 3.4
                    finalCandidates = finalCandidates(2);
                    fprintf("--> Eindeutig zugeordnet über lateralen Abstand: %s\n", strjoin(finalCandidates, ", "));
                else
                    finalCandidates = finalCandidates(1);
                    fprintf("--> Eindeutig zugeordnet über lateralen Abstand: %s\n", strjoin(finalCandidates, ", "));
                end
            end
        end


    end
    
end

% === Filterfunktion ===
function filtered = filterBy(names, lib, field, value, tol)
    filtered = {};
    for i = 1:numel(names)
        tc = lib.(names{i});
        if isfield(tc, field) && abs(tc.(field) - value) < tol
            filtered{end+1} = names{i};
        end
    end
end




