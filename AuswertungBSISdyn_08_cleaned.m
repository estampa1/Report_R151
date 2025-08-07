clear; close all;
tic

%testCases = ["Dyn1", "Dyn2", "Dyn3", "Dyn4", "Dyn5", "Dyn6", "Dyn7", "AdditionalTestCase1", "AdditionalTestCase2"];

%testCases = ["Dyn3", "Dyn4", "Dyn5", "Dyn6", "Dyn7", "AdditionalTestCase1", "AdditionalTestCase2"];
%testCases = "AdditionalTestCase2";


% testCases = "AdditionalTestCase1";
testCases = "Dyn4";
%testCases = ["Dyn4", "AdditionalTestCase2"];
% testCases = ["Dyn1", "Dyn2", "Dyn3", "Dyn5", "Dyn6", "Dyn7", "AdditionalTestCase1"];
printPlots = 1;
printPDF = 1;

VIN = "Mercedes Sprinter – VIN: W1V5KD3Z2SP730819";

for i = 1:length(testCases)
    testCase = testCases(i);
    fprintf("\n==> Bearbeite %s\n", testCase);

    switch testCase
            %% == Dyn1: VUT:10 Target: 20 db: da:
    
        case "Dyn1"
            %filePath = "C:\Users\G00550\Desktop\Elias\Auswertung R151 Sprinter\schmaler korrigiert\dyn1\V4_T21_R11.txt"; % 
            filePath = "C:\Users\G00550\Desktop\Elias\Auswertung R151 Sprinter\schmaler korrigiert\dyn1\r10\V4_T21_R10.txt";
            % Zielwerte und Toleranz
            da = -44.4; % da
            db = -15.8; % db
            dc = -15.0;
            dd = -26.1;
            tolDa = 0.5;
            tol = 0.5;
            
            % === Parameter ===
            speedVUT = 10;              % km/h
            speedTarget = 20;           % km/h
            %<bsFront = 1.9;              % m
            %bsHeck = -3;                % m
            targetAccDistance = 10.66;  % m
            VUTCP = 6; % Aufprallstelle am VUT [m]
            yTargetResult = -2.5;
            lateralExtension = false;
            
            yTargetDes = abs(yTargetResult + 1.25);
            
            scenarioString = string(sprintf("Dynamic Test Case 1 - VUT %.1f km/h - Target %.1f km/h - %.2f m - %.2f m", speedVUT, speedTarget, yTargetDes, VUTCP));
    
                %% == Dyn2: VUT:10 Target: 20 db: da:
        case "Dyn2"
       
            filePath = "C:\Users\G00550\Desktop\Elias\Auswertung R151 Sprinter\schmaler korrigiert\dyn2\V4_T22_R3.txt";
            
            % Zielwerte und Toleranz
            da = -44.4; % da
            db = -22; % db
            dc = -15.0;
            dd = -38.4;
            tolDa = 0.5;
            tol = 0.5;
            
            % === Parameter ===
            speedVUT = 10;              % km/h
            speedTarget = 20;           % km/h
            %bsFront = 1.9;              % m
            %bsHeck = -3;                % m
            targetAccDistance = 10.66;  % m
            VUTCP = 0; % Aufprallstelle am VUT [m]
            yTargetResult = -2.5;
            yTargetDes = abs(yTargetResult + 1.25);
            lateralExtension = false;
            scenarioString = string(sprintf("Dynamic Test Case 2 - VUT %.1f km/h - Target %.1f km/h - %.2f m - %.2f m", speedVUT, speedTarget, yTargetDes, VUTCP));
    
                %% == Dyn3: VUT:20 Target: 20 db: da:
        case "Dyn3"
            filePath = "C:\Users\G00550\Desktop\Elias\Auswertung R151 Sprinter\schmaler korrigiert\dyn3\V4_T23_R7.txt";
            
            % === Parameter ===
            speedVUT = 20;              % km/h
            speedTarget = 20;           % km/h
            %bsFront = 1.9;              % m
            %bsHeck = -3;                % m
            targetAccDistance = 10.66;  % m
            VUTCP = 6; % Aufprallstelle am VUT [m]
            yTargetResult = -2.5;
            yTargetDes = abs(yTargetResult + 1.25);
            
            % Zielwerte und Toleranz
            da = -44.4; % da
            db = -38.3; % db
            dc = -38.3;
%             dd = -100;
%             dd = -60 - targetAccDistance + 1;
            d_lat = 1.25;
            tolDa = 0.5;
            tol = 0.5;
            lateralExtension = false;
            scenarioString = string(sprintf("Dynamic Test Case 3 - VUT %.1f km/h - Target %.1f km/h - %.2f m - %.2f m", speedVUT, speedTarget, yTargetDes, VUTCP));
    
                %% == Dyn4: VUT:10 Target: 20 db: da:
        case "Dyn4"
            %filePath = "C:\Users\G00550\Desktop\Elias\Auswertung R151 Sprinter\schmaler korrigiert\dyn4\V4_T24_R10.txt";
            %filePath = "C:\Users\G00550\Desktop\Elias\Auswertung R151 Sprinter\schmaler korrigiert\dyn4\R8\V4_T24_R8.txt";
            
            %filePath = "C:\Users\G00550\Desktop\Exporte\Dyn4\V9_T50_R3.txt";               %verwendeter run
            
            % filePath = "C:\Users\G00550\Desktop\Exporte\Dyn4\V9_T50_R2.txt";
            %filePath = "C:\Users\G00550\Desktop\Exporte\Dyn4\V9_T50_R1.txt";
            
            filePath = "E:\run files 29.07.2025 bisis\Results\Test dyn 4\V3_T50_R1.txt";
            
            
            % Zielwerte und Toleranz pass
           
            
            % % Zielwerte und Toleranz
            da = -22.2; % da
            db = -43.5; % db
            dc = -15.0;
            dd = -37.2;
            tolDa = 0.5;
            tol = 0.5;
            
            % === Parameter ===
            speedVUT = 20;              % km/h
            speedTarget = 10;           % km/h
            %bsFront = 1.9;              % m
            %bsHeck = -3;                % m
            targetAccDistance = 10.66;  % m
            VUTCP = 0; % Aufprallstelle am VUT [m]
            yTargetResult = -5.5;
            yTargetDes = abs(yTargetResult + 1.25);
            lateralExtension = false;
            scenarioString = string(sprintf("Dynamic Test Case 4 - VUT %.1f km/h - Target %.1f km/h - %.2f m - %.2f m", speedVUT, speedTarget, yTargetDes, VUTCP));
            
            %% == Dyn5: VUT:10 Target: 20 db: da:
        case "Dyn5"        
            filePath = "C:\Users\G00550\Desktop\Elias\Auswertung R151 Sprinter\schmaler korrigiert\dyn5\V4_T25_R1.txt";
            
            % Zielwerte und Toleranz
            da = -22.2; % da
            db = -19.8; % db
            dc = -19.8;
            dd = -75;
            tolDa = 0.5;
            tol = 0.5;
            
            % === Parameter ===
            speedVUT = 10;              % km/h
            speedTarget = 10;           % km/h
            %bsFront = 1.9;              % m
            %bsHeck = -3;                % m
            targetAccDistance = 10.66;  % m
            VUTCP = 0; % Aufprallstelle am VUT [m]
            yTargetResult = -5.5;
            yTargetDes = abs(yTargetResult + 1.25);
            lateralExtension = false;
            scenarioString = string(sprintf("Dynamic Test Case 5 - VUT %.1f km/h - Target %.1f km/h - %.2f m - %.2f m", speedVUT, speedTarget, yTargetDes, VUTCP));
            
            %% == Dyn6: VUT:10 Target: 20 db: da:
        case "Dyn6"        
            filePath = "C:\Users\G00550\Desktop\Elias\Auswertung R151 Sprinter\schmaler korrigiert\dyn6\V4_T26_R2.txt";
            
            % Zielwerte und Toleranz
            da = -44.4; % da
            db = -14.7; % db
            dc = -15.0;
            dd = -28;
            tolDa = 0.5;
            tol = 0.5;
            
            % === Parameter ===
            speedVUT = 10;              % km/h
            speedTarget = 20;           % km/h
            %bsFront = 1.9;              % m
            %bsHeck = -3;                % m
            targetAccDistance = 10.66;  % m
            VUTCP = 6; % Aufprallstelle am VUT [m]
            yTargetResult = -5.5;
            yTargetDes = abs(yTargetResult + 1.25);
            lateralExtension = false;
            scenarioString = string(sprintf("Dynamic Test Case 6 - VUT %.1f km/h - Target %.1f km/h - %.2f m - %.2f m", speedVUT, speedTarget, yTargetDes, VUTCP));
            
            %% == Dyn7: VUT:10 Target: 20 db: da:
        case "Dyn7"        
            filePath = "C:\Users\G00550\Desktop\Elias\Auswertung R151 Sprinter\schmaler korrigiert\dyn7\V4_T27_R8.txt";
            
            % Zielwerte und Toleranz
            da = -44.4; % da
            db = -17.7; % db
            dc = -15.0;
            dd = -34;
            tolDa = 0.5;
            tol = 0.5;
            
            % === Parameter ===
            speedVUT = 10;              % km/h
            speedTarget = 20;           % km/h
            %bsFront = 1.9;              % m
            %bsHeck = -3;                % m
            targetAccDistance = 10.66;  % m
            VUTCP = 3; % Aufprallstelle am VUT [m]
            yTargetResult = -5.5;
            yTargetDes = abs(yTargetResult + 1.25);
            lateralExtension = false;
            scenarioString = string(sprintf("Dynamic Test Case 7 - VUT %.1f km/h - Target %.1f km/h - %.2f m - %.2f m", speedVUT, speedTarget, yTargetDes, VUTCP));
            
            %% == Dyn1 Child Dummy: VUT:10 Target: 20 db: da:
        case "AdditionalTestCase1"       
            filePath = "C:\Users\G00550\Desktop\Elias\Auswertung R151 Sprinter\schmaler korrigiert\dyn1 - child\V4_T43_R10.txt";
            % filePath = "C:\Users\G00550\Desktop\Elias\Auswertung R151 Sprinter\schmaler korrigiert\dyn1 - child\R6\V4_T43_R6.txt";
            
        
            % Zielwerte und Toleranz
            da = -44.4; % da
            db = -15.8; % db
            dc = -15.0;
            dd = -26.1;
            tolDa = 0.5;
            tol = 0.5;
            
            % === Parameter ===
            speedVUT = 10;              % km/h
            speedTarget = 20;           % km/h
            %<bsFront = 1.9;              % m
            %bsHeck = -3;                % m
            targetAccDistance = 5.66;  % m
            VUTCP = 6; % Aufprallstelle am VUT [m]
            yTargetResult = -2.5;
            yTargetDes = abs(yTargetResult + 1.25);
            lateralExtension = true;
            scenarioString = string(sprintf("Dynamic Test Case 1 (Child Dummy) - VUT %.1f km/h - Target %.1f km/h - %.2f m - %.2f m", speedVUT, speedTarget, yTargetDes, VUTCP));
            
            %% == Dyn4 Child Dummy: VUT:10 Target: 20 db: da:
        case "AdditionalTestCase2"       
%             filePath = "C:\Users\G00550\Desktop\Elias\Auswertung R151 Sprinter\schmaler korrigiert\dyn4 -child\V4_T45_R4.txt";
            
           
            % Testruns (alle fails da-db, warning signal...)
            %filePath = "C:\Users\G00550\Desktop\Elias\Auswertung R151 Sprinter\schmaler korrigiert\dyn4 -child\R3\V4_T45_R3.txt";
            % filePath = "C:\Users\G00550\Desktop\Elias\Auswertung R151 Sprinter\schmaler korrigiert\dyn4 -child\R2\V4_T45_R2.txt";
            %filePath = "C:\Users\G00550\Desktop\Elias\Auswertung R151 Sprinter\schmaler korrigiert\dyn4 -child\R1\V4_T45_R1.txt";
            
            
%             filePath = "C:\Users\G00550\Desktop\Exporte\add2\V10_T58_R1.txt";
%             filePath = "C:\Users\G00550\Desktop\Exporte\add2\V10_T58_R2.txt";
            filePath = "C:\Users\G00550\Desktop\Exporte\add2\V10_T58_R3.txt";
%             filePath = "C:\Users\G00550\Desktop\Exporte\add2\V10_T58_R4.txt";
            
            % % Zielwerte und Toleranz
            da = -22.2; % da
            db = -43.5; % db
            dc = -15.0;
            dd = -37.2;
            tolDa = 0.5;
            tol = 0.5;
            
            % === Parameter ===
            speedVUT = 20;              % km/h
            speedTarget = 10;           % km/h
            %bsFront = 1.9;              % m
            %bsHeck = -3;                % m
            targetAccDistance = 10.66;  % m
            VUTCP = 0; % Aufprallstelle am VUT [m]
            yTargetResult = -5.5;
            yTargetDes = abs(yTargetResult + 1.25);
            lateralExtension = true;
            scenarioString = string(sprintf("Dynamic Test Case 4 (Child Dummy) - VUT %.1f km/h - Target %.1f km/h - %.2f m - %.2f m", speedVUT, speedTarget, yTargetDes, VUTCP));
            
    end        

    
    close all;
    set(groot, 'defaultAxesFontSize', 10);       % Schriftgröße für Achsenbeschriftungen
    set(groot, 'defaultTextFontSize', 10);       % Schriftgröße für Titel, Labels, Text-Objekte

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
    
    %% === Sammlung notwendiger Variablen ===
    
    %Überflüssig
%     t_start_plot = -2;
%     t_end_plot = t_rel(idx_end) + 2;
%     idx_plot_start = find 
%     idx_plot_end = 
%     
    
    %% t_0 und t_end
    % === t₀-Ermittlung ===
    x_target_start = x_target(1);
    travelledDist_target = x_target - x_target_start;
    sprintf("Target Startpunkt = %.2f", x_target_start)
    
    idx_t0 = find(travelledDist_target >= targetAccDistance, 1, 'first');
    if isempty(idx_t0)
        error('Target hat keine Distanz von %.2f m zurückgelegt.', targetAccDistance);
    end
    t_0 = time(idx_t0);
    criterionUsed = sprintf('Target travelled %.2f m along Path', targetAccDistance);
    
    % === t_end-Ermittlung ===
    idx_end = find(x_vut > 1, 1, 'first');
    if isempty(idx_end)
        t_end = t_0 + 8;
    else
        t_end = max(t_0 + 8, time(idx_end));
    end
    
    fprintf('t_0 = %.3f s (%s), t_{end} = %.3f s\n', t_0, criterionUsed, t_end);
    t_rel = time - t_0;
    
    % === X-Positionen zu t_0 und t_end ===
    x_vut_t0 = x_vut(idx_t0);
    x_vut_tend = x_vut(idx_end);
    
    x_target_t0 = x_target(idx_t0);
    x_target_tend = x_target(idx_end);
    
    travelledDist_vut = x_vut - x_vut(1);
    
    %% 

    yTargetResultRef = yTargetResult + yRefTarget - yRefVUT;
    yVUTResultRef = 0;
    
    % === Toleranzprüfungen ===
    withinTolSpeedVUT = all(abs(speed_vut(t_rel >= 0 & t_rel <= (t_end - t_0)) - speedVUT) <= tolSpeedVUT);
    withinTolSpeedTarget = all(abs(speed_target(t_rel >= 0 & t_rel <= (t_end - t_0)) - speedTarget) <= tolSpeedTarget);
    
    % Stelle sicher, dass dc und dd korrekt sortiert sind
    x_start = min(dc, dd);
    x_end = max(dc, dd);
    
    % Index des ersten Auftretens (==1) im gefilterten Signal
    idx_firstWarning = find(warnsignal_filtered, 1, 'first');
    
    % Ist ein erster Aktivierungsindex vorhanden?
    if ~isempty(idx_firstWarning)
        % Position zum Zeitpunkt der ersten Aktivierung
        x_first = x_vut(idx_firstWarning);
    
        % Prüfen, ob diese Position im gewünschten Bereich liegt
        if x_first >= x_start && x_first <= x_end
            color_shade = [0.7 1.0 0.7];  % hellgrün (korrekt)
        else
            color_shade = [1.0 0.8 0.8];  % hellrot (zu früh oder zu spät)
        end
    else
        % Falls gar kein 1 im Signal gefunden wurde
        color_shade = [1.0 0.8 0.8];  % hellrot
    end
    
    
%     % Erstes Auftreten von 1 im gefilterten Warnsignal
%     idx_firstWarning = find(warnsignal_filtered, 1, 'first');
    
    % if ~isempty(idx_firstWarning)
    %     x_first = x_vut(idx_firstWarning);
    % 
    %     % Punkt markieren
    %     plot(x_first, 1, 'ko', 'MarkerFaceColor', 'k', 'DisplayName', 'First Signal Activation');
    % 
    %     % Beschriftung des Punktes (z. B. oberhalb)
    %     text(x_first, 1.05, sprintf('%.1f m', x_first), ...
    %         'HorizontalAlignment', 'right', ...
    %         'VerticalAlignment', 'middle', ...
    %         'FontSize', 8, 'Color', 'k');
    % end
    
    
%     pos_target = data.Object1XPositionReference;  % Target Position (rot)
%     pos_vut = data.ThisVehicleXPositionReference; % VUT Position (blau)
%     time = t_rel_plot;

    
%     travelledDist_target = data.OtherVehicleXPositionReference - data.OtherVehicleXPositionReference(1);

    travelledDist_targetTest = x_target_tend - x_target_t0;
    travelledDist_targetTestEnd = targetAccDistance + travelledDist_targetTest;
    
    vutDistTest = x_vut_tend-x_vut_t0;
    vutDistTestEnd = x_vut(idx_end)-x_vut(1); 
    vutXstartabs = x_vut_t0 - x_vut(1);
    vutXendabs= vutXstartabs+ vutDistTest;    
    vutDistEnd = travelledDist_vut(idx_end);

 % x_vut_t0 = -23.37
 % vutXstartabs = abs(x_vut_start - vut_t_end)
 % 

    %% === Logo laden ===
    
    logoImage = imread("C:\Users\G00550\Desktop\Elias Daten\MATLAB\LOGO\logoDekra2800.png");

    % Falls das Logo z. B. als PNG eingelesen wurde
    % logoImage: [Height x Width x 3] RGB

    % Schwellenwert für "fast schwarz" (z. B. bei Kompression)
    threshold = 90;

    % Maske für (nahezu) schwarze Pixel
    mask = all(logoImage < threshold, 3);

    % Alle schwarzen Pixel weiß setzen (RGB = 255,255,255)
    logoImage(repmat(mask, [1 1 3])) = 255;
    logoImage = imresize(logoImage, 20, 'bilinear');  % Faktor 2, glättend

    
    %% === Notwendige Größen für Plots ===
    if strcmp(testCase, ['Dyn3', 'Dyn5'])
        dd = x_target_start + 0.1;
    end
    
    
    t_plot_start = -2;
    [~, idx_plot_start] = min(abs(t_rel - (-2)));
    t_plot_end = t_end - t_0 + 2;
    [~, idx_plot_end] = min(abs(t_rel - t_plot_end)); 
    idx_plot = find(t_rel >= t_plot_start & t_rel <= t_plot_end);
    
    
    %% Sammelplot 1 
    figure(1001); clf;
    
    % === Subplot 1_1: VUT Speed ===
    subplot(3,1,1); hold on; grid on;
    
    xfill = [0, t_end - t_0];
    yfill_vut = [speedVUT - tolSpeedVUT, speedVUT + tolSpeedVUT];
    fill([xfill fliplr(xfill)], ...
         [yfill_vut(1) yfill_vut(1) yfill_vut(2) yfill_vut(2)], ...
         withinTolSpeedVUT*[0.7 1 0.7] + ~withinTolSpeedVUT*[1 0.8 0.8], ...
         'FaceAlpha', 0.5, 'EdgeColor', 'none');
    
    plot(t_rel, speed_vut, 'b', 'LineWidth', 1.5);
    
    xline(0, '--k', 't_0', 'LabelVerticalAlignment', 'bottom', 'LabelHorizontalAlignment', 'left');
    xline(t_end - t_0, '--k', 't_{end}', 'LabelVerticalAlignment', 'bottom', 'LabelHorizontalAlignment', 'left');
    
    xlabel('Time since t_0 [s]');
    ylabel('VUT Speed [km/h]');
    %title({'Vehicle Under Test (VUT) Speed'; ['t_0: ' criterionUsed]});
    ylim([speedVUT - tolSpeedVUT - 1, speedVUT + tolSpeedVUT + 1]);
    xlim([t_plot_start, t_plot_end]);
    %legend('VUT Tolerance', 'VUT Speed', 't_0', 't_{end}', 'Location', 'best');
    
    % === Subplot 1_2: VUT Speed ===
    subplot(3,1,2); hold on; grid on;
    
    yfill_target = [speedTarget - tolSpeedTarget, speedTarget + tolSpeedTarget];
    fill([xfill fliplr(xfill)], ...
         [yfill_target(1) yfill_target(1) yfill_target(2) yfill_target(2)], ...
         withinTolSpeedTarget*[0.7 1 0.7] + ~withinTolSpeedTarget*[1 0.8 0.8], ...
         'FaceAlpha', 0.5, 'EdgeColor', 'none');
    
    plot(t_rel, speed_target, 'r', 'LineWidth', 1.5);
    
    xline(0, '--k', 't_0', 'LabelVerticalAlignment', 'bottom', 'LabelHorizontalAlignment', 'left');
    xline(t_end - t_0, '--k', 't_{end}', 'LabelVerticalAlignment', 'bottom', 'LabelHorizontalAlignment', 'left');
    
    xlabel('Time since t_0 [s]');
    ylabel('Target Speed [km/h]');
    %title({'Target Vehicle Speed'; ['t_0: ' criterionUsed]});
    ylim([speedTarget - tolSpeedTarget - 0.2, speedTarget + tolSpeedTarget + 0.2]);
    xlim([t_plot_start, t_plot_end]);
    %legend('Target Tolerance', 'Target Speed', 't_0', 't_{end}', 'Location', 'best');
    
    % === Subplot 1_3: VUT Speed ===
    subplot(3,1,3); hold on; grid on;
    
%     warnsignal = data.CanDecode2;
%     %warnsignal = data.CanDecode4;
%     windowSize = 5; % Anzahl Samples (z. B. bei 100 Hz = 50 ms)
%     warnsignal_smooth = movmean(warnsignal, windowSize);
%     warnsignal_filtered = warnsignal_smooth > 0.5; % wieder binär machen
    
    plot(t_rel, warnsignal, 'Color', [0.8 0.8 0.8], 'LineWidth', 1, 'DisplayName', 'Raw Signal');
    hold on; grid on;
    plot(t_rel, warnsignal_filtered, 'k', 'LineWidth', 1.5, 'DisplayName', 'Filtered Signal');
    
    xline(0, '--k', 't_0', 'LabelVerticalAlignment', 'bottom', 'LabelHorizontalAlignment', 'left','DisplayName', 't_{0} = Test Start');
    xline(t_end - t_0, '--k', 't_{end}', 'LabelVerticalAlignment', 'bottom', 'LabelHorizontalAlignment', 'left', 'DisplayName', 't_{End} = Test End');
    
    %legend('Location','northwest');
    xlabel('Time since t_0 [s]');
    ylabel('Warning Signal');
    %title('Filtered Warning Signal');
    xlim([t_plot_start, t_plot_end]);
    ylim([-0.1, 1.1]);
    yticks([0 1]);
    %legend('Location','northwest');
    %yticklabels({'No Signal', 'Signal activated'});
    
    if printPlots == 1
        filename = sprintf("%s_Plot1", testCase);
        % === Speicherpfad (z. B. in Unterordner "plots") ===
        outputFolder = "C:\Users\G00550\Desktop\Elias\Ausgabe_Plots_BSIS_Auswertung";
        if ~exist(outputFolder, "dir")
            mkdir(outputFolder);
        end
        
        % Erzeuge den vollständigen Pfad inkl. Dateiendung
        filePNG = fullfile(outputFolder, filename + ".png");
        filePDF = fullfile(outputFolder, filename + ".pdf");
        
        
        % Jetzt korrekt exportieren
        exportgraphics(gcf, filePNG, 'Resolution', 900);
        exportgraphics(gcf, filePDF, 'ContentType', 'vector', 'Resolution', 900);
    end
    
    
    if printPDF == 1
        %----------------------------------------------------------------------
        % 1) Speicherpfad und Dateinamen definieren
        %----------------------------------------------------------------------
        filename     = sprintf("%s_Plot4", testCase);
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
        if ishandle(1001)
            figSrc = figure(1001);  % vorhandene Plot-Figure
            % komplette Achsen und Inhalte in neue Figure kopieren
            axChildren = findall(figSrc, 'Type', 'axes');
            %newPanel = uipanel(layoutFig, 'Units', 'normalized', 'Position', [0 0 1 0.7]);
            for i = 1:numel(axChildren)
%                 newAxes = copyobj(axChildren(i), newPanel);
                newAxes = copyobj(axChildren(i), layoutFig);
                set(newAxes, 'Units', 'normalized');
                % automatisch anordnen: hier ggf. anpassen für perfekte Platzierung
                origPos = get(axChildren(i), 'Position');
                newPos = origPos;
                newPos(1) = origPos(1)-0.06;  % x-Position
                newPos(2) = origPos(2)*0.85-0.07;  % y-Position
                newPos(3) = origPos(3)*1.17;  % Breite
                newPos(4) = origPos(4)*1.05;  % Höhe
                set(newAxes, 'FontSize', 10);  % z. B. einheitlich für alle Achsen
                set(newAxes, 'Position', newPos);
                set(newAxes, 'Color', 'w');
%                 set(newAxes, 'Color', 'w');  % Hier explizit auf Weiß setzen
            end
        else
            warning("Figure 1009 existiert nicht – Sammelplot konnte nicht übernommen werden.");
        end

        %----------------------------------------------------------------------
        % 6) PDF exportieren
        %----------------------------------------------------------------------
        print(layoutFig, '-dpdf', '-fillpage', filePDF);

    end

    
    
    
    
    
   
    %% Sammelplot 4
    
    figure(1004); clf;
    
    % === Subplot 3_1: VUT Speed ===
    subplot(4,1,1); hold on; grid on;
    
    xfill = [x_vut_t0, x_vut_tend];
    yfill_vut = [speedVUT - tolSpeedVUT, speedVUT + tolSpeedVUT];
    fill([xfill fliplr(xfill)], ...
         [yfill_vut(1) yfill_vut(1) yfill_vut(2) yfill_vut(2)], ...
         withinTolSpeedVUT*[0.7 1 0.7] + ~withinTolSpeedVUT*[1 0.8 0.8], ...
         'FaceAlpha', 0.5, 'EdgeColor', 'none');
    
    plot(x_vut, speed_vut, 'b', 'LineWidth', 1.5);
    
    %xline(0, '--k', 't_0', 'LabelVerticalAlignment', 'bottom', 'LabelHorizontalAlignment', 'left');
    %xline(t_end - t_0, '--k', 't_{end}', 'LabelVerticalAlignment', 'bottom', 'LabelHorizontalAlignment', 'left');
    xline(x_vut_t0, '--k', 't_0', 'LabelVerticalAlignment', 'bottom', 'LabelHorizontalAlignment', 'left');
    xline(x_vut_tend, '--k', 't_{end}', 'LabelVerticalAlignment', 'bottom', 'LabelHorizontalAlignment', 'left');
    
    xlabel('Distance to Crashpoint [m]');
    %ylabel('VUT Speed [km/h]');
    % title({'Vehicle Under Test (VUT) Speed'; ['t_0: ' criterionUsed]});
    %title({'Vehicle Under Test (VUT) Speed'});
    ylim([speedVUT - tolSpeedVUT - 1, speedVUT + tolSpeedVUT + 1]);
%     xlim([x_vut_t0-5, x_vut_tend+5]);
    xlim([x_vut(idx_plot_start), x_vut(idx_plot_end)]);
    %legend('Tolerance (+/- 2,0 km/h)', 'VUT Speed', 't_0', 't_{end}', 'Location', 'best');
    
    % === Subplot 3_2: VUT Speed ===
    subplot(4,1,2); hold on; grid on;
    xfill = [travelledDist_vut(idx_t0), travelledDist_vut(idx_end)];
%     xfill = [vutXstartabs, vutXendabs];
    yfill_vut = [speedVUT - tolSpeedVUT, speedVUT + tolSpeedVUT];
    fill([xfill fliplr(xfill)], ...
         [yfill_vut(1) yfill_vut(1) yfill_vut(2) yfill_vut(2)], ...
         withinTolSpeedVUT*[0.7 1 0.7] + ~withinTolSpeedVUT*[1 0.8 0.8], ...
         'FaceAlpha', 0.5, 'EdgeColor', 'none');
    
    plot(travelledDist_vut, speed_vut, 'b', 'LineWidth', 1.5);
    
    %xline(0, '--k', 't_0', 'LabelVerticalAlignment', 'bottom', 'LabelHorizontalAlignment', 'left');
    %xline(t_end - t_0, '--k', 't_{end}', 'LabelVerticalAlignment', 'bottom', 'LabelHorizontalAlignment', 'left');
    xline(travelledDist_vut(idx_t0), '--k', 't_0', 'LabelVerticalAlignment', 'bottom', 'LabelHorizontalAlignment', 'left');
    xline(travelledDist_vut(idx_end), '--k', 't_{end}', 'LabelVerticalAlignment', 'bottom', 'LabelHorizontalAlignment', 'left');
    
    xlabel('Travelled Distance VUT [m]');
    ylabel('VUT Speed [km/h]', 'VerticalAlignment','bottom', 'HorizontalAlignment','left');
    % title({'Vehicle Under Test (VUT) Speed'; ['t_0: ' criterionUsed]});
    %title({'Vehicle Under Test (VUT) Speed'});
    ylim([speedVUT - tolSpeedVUT - 1, speedVUT + tolSpeedVUT + 1]);
    %xlim([vutXstartabs-5, vutXendabs+5]);
    xlim([travelledDist_vut(idx_plot_start), travelledDist_vut(idx_plot_end)]);
    %legend('Tolerance (+/- 2,0 km/h)', 'VUT Speed', 't_0', 't_{end}', 'Location', 'best');
    
    
    % === Subplot 3_3: VUT Speed ===
    subplot(4,1,3); hold on; grid on;
    
    xfill_target = [x_target_t0, x_target_tend];
    yfill_target = [speedTarget - tolSpeedTarget, speedTarget + tolSpeedTarget];
    fill([xfill_target fliplr(xfill_target)], ...
         [yfill_target(1) yfill_target(1) yfill_target(2) yfill_target(2)], ...
         withinTolSpeedTarget*[0.7 1 0.7] + ~withinTolSpeedTarget*[1 0.8 0.8], ...
         'FaceAlpha', 0.5, 'EdgeColor', 'none');
    
    plot(x_target, speed_target, 'r', 'LineWidth', 1.5);
    
    xline(x_target_t0, '--k', 't_0', 'LabelVerticalAlignment', 'bottom', 'LabelHorizontalAlignment', 'left');
    xline(x_target_tend, '--k', 't_{end}', 'LabelVerticalAlignment', 'bottom', 'LabelHorizontalAlignment', 'left');
    
    xlabel('Distance to Crashpoint [m]');
    ylabel('Target Speed [km/h]', 'VerticalAlignment','bottom', 'HorizontalAlignment','right');
    %title({'Target Speed over Distance'; ['t_0: ' criterionUsed]});
    ylim([speedTarget - tolSpeedTarget - 0.2, speedTarget + tolSpeedTarget + 0.2]);
    xlim([x_target(idx_plot_start), x_target(idx_plot_end)]);
    %legend('Tolerance (+/- 0,5 km/h)', 'Target Speed', 't_0', 't_{end}', 'Location', 'north');
    
    % === Subplot 3_4: VUT Speed ===
    subplot(4,1,4); hold on; grid on;
    
    xfill_target = [targetAccDistance, travelledDist_targetTestEnd];
    yfill_target = [speedTarget - tolSpeedTarget, speedTarget + tolSpeedTarget];
    fill([xfill_target fliplr(xfill_target)], ...
         [yfill_target(1) yfill_target(1) yfill_target(2) yfill_target(2)], ...
         withinTolSpeedTarget*[0.7 1 0.7] + ~withinTolSpeedTarget*[1 0.8 0.8], ...
         'FaceAlpha', 0.5, 'EdgeColor', 'none');
    
    plot(travelledDist_target, speed_target, 'r', 'LineWidth', 1.5);
    
    xline(targetAccDistance, '--k', 't_0', 'LabelVerticalAlignment', 'bottom', 'LabelHorizontalAlignment', 'left');
    xline(travelledDist_targetTestEnd, '--k', 't_{end}', 'LabelVerticalAlignment', 'bottom', 'LabelHorizontalAlignment', 'left');
    
    xlabel('Travelled Distance Target [m]');
    %ylabel('Target Speed [km/h]');
    %title({'Target Speed over Distance'; ['t_0: ' criterionUsed]});
    ylim([speedTarget - tolSpeedTarget - 0.2, speedTarget + tolSpeedTarget + 0.2]);
%     xlim([targetAccDistance - 10, travelledDist_targetTestEnd+10]);
    xlim([travelledDist_target(idx_plot_start), travelledDist_target(idx_plot_end)]);
    %legend('Tolerance (+/- 0,5 km/h)', 'Target Speed', 't_0', 't_{end}', 'Location', 'north');
    
    if printPDF == 1
        filename = sprintf("%s_Plot4", testCase);
        % === Speicherpfad (z. B. in Unterordner "plots") ===
        outputFolder = "C:\Users\G00550\Desktop\Elias\Ausgabe_Plots_BSIS_Auswertung";
        if ~exist(outputFolder, "dir")
            mkdir(outputFolder);
        end
        
        % Erzeuge den vollständigen Pfad inkl. Dateiendung
        filePNG = fullfile(outputFolder, filename + ".png");
        filePDF = fullfile(outputFolder, filename + ".pdf");
        
        
        % Jetzt korrekt exportieren
        exportgraphics(gcf, filePNG, 'Resolution', 900);
        exportgraphics(gcf, filePDF, 'ContentType', 'vector', 'Resolution', 900);
    end
    
    
%     if printPlots == 1
%         %----------------------------------------------------------------------
%         % 1) Speicherpfad und Dateinamen definieren
%         %----------------------------------------------------------------------
%         filename     = sprintf("%s_Plot_Test_1004", testCase);
%         outputFolder = "C:\Users\G00550\Desktop\Elias Daten\MATLAB\R151 Auswertung\Entwicklung\PDF_Ausgabe_Test";
%         if ~exist(outputFolder, "dir"); mkdir(outputFolder); end
%         filePDF = fullfile(outputFolder, filename + ".pdf");
% 
%         %----------------------------------------------------------------------
%         % 2) Neue Layout-Figure (A4 quer)
%         %----------------------------------------------------------------------
%         layoutFig = figure('Units', 'centimeters', ...
%                            'Position', [2 2 29.7 21], ...
%                            'PaperUnits', 'centimeters', ...
%                            'PaperSize', [29.7 21], ...
%                            'Color', 'w');
% 
%         %----------------------------------------------------------------------
%         % 3) TestCase-Text (oben links)
%         %----------------------------------------------------------------------
% %         annotation(layoutFig, 'textbox', [0.05 0.75 0.5 0.1], ...
% %             "String", testCase, ...
% %             "FontSize", 14, ...
% %             "FontWeight", "bold", ...
% %             "LineStyle", "none", ...
% %             "HorizontalAlignment", "left");
% 
%         % === Zeile 1: UN - R151 ===
%         annotation(layoutFig, 'textbox', [0.05 0.9 0.5 0.05], ...
%             "String", 'UN - R151', ...
%             "FontSize", 20, ...
%             "FontWeight", "bold", ...
%             "LineStyle", "none", ...
%             "HorizontalAlignment", "left");
% 
%         % === Zeile 2: Testfallbezeichnung (z. B. Car-to-Car CCRs_20kmh_50m) ===
%         annotation(layoutFig, 'textbox', [0.05 0.85 0.8 0.05], ...
%             "String", scenarioString, ...
%             "FontSize", 14, ...
%             "FontWeight", "normal", ...
%             "LineStyle", "none", ...
%             "HorizontalAlignment", "left");
%         
%         % === Zeile 3: VIN ===
%         annotation(layoutFig, 'textbox', [0.05 0.82 0.5 0.05], ...
%             "String", VIN, ...
%             "FontSize", 12, ...
%             "FontWeight", "normal", ...
%             "LineStyle", "none", ...
%             "HorizontalAlignment", "left");
% 
%         % === Zeile 4: Datum der Messung ===
%         annotation(layoutFig, 'textbox', [0.05 0.79 0.5 0.05], ...
%             "String", dateRun, ...
%             "FontSize", 12, ...
%             "FontWeight", "normal", ...
%             "LineStyle", "none", ...
%             "HorizontalAlignment", "left");
% 
%         %----------------------------------------------------------------------
%         % 4) Logo einfügen (oben rechts)
%         %----------------------------------------------------------------------
% %         axLogo = axes(layoutFig, 'Position', [0.75 0.78 0.2 0.18]);
% %         imshow(logoImage, 'Parent', axLogo);
% %         axis(axLogo, 'off');
% 
%         % RGB-Logo sicherstellen (falls Graustufenbild geladen wurde)
%         if size(logoImage,3) == 1
%             logoImage = repmat(logoImage, [1 1 3]);  % Grau -> RGB
%         end
% 
%         % Logo-Achse mit 'image' anzeigen (nicht imshow!)
%         axLogo = axes(layoutFig, 'Position', [0.7 0.9 0.25 0.09]);
%         image(axLogo, logoImage); 
%         axis(axLogo, 'off');
% %         axLogo.YDir = 'normal';  % notwendig, da 'image' Y-Achse invertieren kann
% 
% 
%         %----------------------------------------------------------------------
%         % 5) Sammelplot übernehmen
%         % -> Sicherstellen, dass die Figure existiert
%         %----------------------------------------------------------------------
%         if ishandle(1004)
%             figSrc = figure(1004);  % vorhandene Plot-Figure
%             % komplette Achsen und Inhalte in neue Figure kopieren
%             axChildren = findall(figSrc, 'Type', 'axes');
%             %newPanel = uipanel(layoutFig, 'Units', 'normalized', 'Position', [0 0 1 0.7]);
%             for i = 1:numel(axChildren)
% %                 newAxes = copyobj(axChildren(i), newPanel);
%                 newAxes = copyobj(axChildren(i), layoutFig);
%                 set(newAxes, 'Units', 'normalized');
%                 % automatisch anordnen: hier ggf. anpassen für perfekte Platzierung
%                 origPos = get(axChildren(i), 'Position');
%                 newPos = origPos;
%                 newPos(1) = origPos(1)-0.06;  % x-Position
%                 newPos(2) = origPos(2)*0.85-0.07;  % y-Position
%                 newPos(3) = origPos(3)*1.17;  % Breite
%                 newPos(4) = origPos(4)*1.05;  % Höhe
% 
%                 set(newAxes, 'Position', newPos);
%                 set(newAxes, 'Color', 'w');
% %                 set(newAxes, 'Color', 'w');  % Hier explizit auf Weiß setzen
%             end
%         else
%             warning("Figure 1009 existiert nicht – Sammelplot konnte nicht übernommen werden.");
%         end
% 
%         %----------------------------------------------------------------------
%         % 6) PDF exportieren
%         %----------------------------------------------------------------------
%         print(layoutFig, '-dpdf', '-fillpage', filePDF);
% 
%     end

    
    
    
    %% Sammelplot 6
    figure(1006); clf;
    
    % === Subplot 2_1: VUT Speed ===
    subplot(3,1,1); hold on; grid on;
    
    % X-Position mit negativem Vorzeichen (relativ zum Crashpunkt)
%     x_vut = data.ThisVehicleXPositionReference;
    % warnsignal = data.CanDecode2;
    %warnsignal = data.CanDecode4;
    
    
%     windowSize = 5; % Anzahl Samples (z. B. bei 100 Hz = 50 ms)
%     warnsignal_smooth = movmean(warnsignal, windowSize);
%     warnsignal_filtered = warnsignal_smooth > 0.5; % wieder binär machen
    
    ylim([-0.1 1.1]);
    yl = ylim;
    
    
    % Stelle sicher, dass dc und dd korrekt sortiert sind
    x_start = min(dc, dd);
    x_end = max(dc, dd);
    
    
%     % Index des ersten Auftretens (==1) im gefilterten Signal
%     idx_firstWarning = find(warnsignal_filtered, 1, 'first');
%     
%     % Ist ein erster Aktivierungsindex vorhanden?
%     if ~isempty(idx_firstWarning)
%         % Position zum Zeitpunkt der ersten Aktivierung
%         x_first = x_vut(idx_firstWarning);
%     
%         % Prüfen, ob diese Position im gewünschten Bereich liegt
%         if x_first >= x_start && x_first <= x_end
%             color_shade = [0.7 1.0 0.7];  % hellgrün (korrekt)
%         else
%             color_shade = [1.0 0.8 0.8];  % hellrot (zu früh oder zu spät)
%         end
%     else
%         % Falls gar kein 1 im Signal gefunden wurde
%         color_shade = [1.0 0.8 0.8];  % hellrot
%     end
    
    p4_1_2 = fill([x_start x_end x_end x_start], [yl(1) yl(1) yl(2) yl(2)], ...
         color_shade, 'EdgeColor', 'none', 'FaceAlpha', 0.5, ...
         'DisplayName', 'Signal Activation Check');
    
    
    % xline(x_vut_t0, '--k', 't_0', 'LabelVerticalAlignment', 'middle', 'LabelHorizontalAlignment', 'left','DisplayName', 't_{0} = Test Start', 'FontSize', 10);
    xline(x_vut_tend, '--k', 't_{end}', 'LabelVerticalAlignment', 'middle', 'LabelHorizontalAlignment', 'left','DisplayName', 't_{End} = Test End', 'FontSize', 10);
    
    xline(dd, '-k', sprintf('FIP = %.1f m', dd), 'LabelVerticalAlignment', 'top', 'LabelHorizontalAlignment', 'left','DisplayName', 'd_{d} = FIP', 'LineWidth', 0.5, 'FontSize', 10);
    xline(dc, '-k', sprintf('LIP = %.1f m', dc), 'LabelVerticalAlignment', 'bottom', 'LabelHorizontalAlignment', 'right', 'DisplayName', 'd_{c} = LIP','LineWidth', 0.5, 'FontSize', 10);
    
    
    plot(x_vut, warnsignal, 'Color', [0.5 0.5 0.5], 'DisplayName', 'Raw Signal');
    hold on; grid on;
    p4_1_1 = plot(x_vut, warnsignal_filtered, 'b', 'LineWidth', 1.5, 'DisplayName', 'Filtered Signal');
    
%     % Erstes Auftreten von 1 im gefilterten Warnsignal
%     idx_firstWarning = find(warnsignal_filtered, 1, 'first');
    
    if ~isempty(idx_firstWarning)
        x_first = x_vut(idx_firstWarning);
    
        % Punkt markieren
        plot(x_first, 1, 'ko', 'MarkerFaceColor', 'k', 'DisplayName', 'First Signal Activation');
    
        % Beschriftung des Punktes (z. B. oberhalb)
        text(x_first, 1.05, sprintf('%.2f m', x_first), ...
            'HorizontalAlignment', 'left', ...
            'VerticalAlignment', 'bottom', ...
            'FontSize', 10, 'Color', 'k');
    end
    
    
    xlabel('X-Position VUT [m]');
    ylabel('Warning Signal');
    %title('Warning signal over VUT distance');
    ylim([-0.1 1.1]);
    yticks([0 1]);
    %legend('Location','northwest');
    %yticklabels({'No Signal', 'Signal activated'});
    xlim([dd-4, x_vut_tend + 4]);
    %legend([p4_1_1, p4_1_2], {'Warning Signal', 'Correct Activation'}, 'Location', 'east');
    
    % === Subplot 2_2: Target Speed ===
    subplot(3,1,2); hold on; grid on;
    
    

    withinTol9Ref = all(abs(y_vut(x_vut >= x_vut_t0 & x_vut <= x_vut_tend) - yVUTResultRef) <= tolLatVUT);
    
    
    % Toleranzschlauch (Plot 9)
    fill([x_vut_t0, x_vut_tend, x_vut_tend, x_vut_t0], ...
         [yVUTResultRef + tolLatVUT, yVUTResultRef + tolLatVUT, ...
          yVUTResultRef - tolLatVUT, yVUTResultRef - tolLatVUT], ...
         withinTol9Ref*[0.7 1 0.7] + ~withinTol9Ref*[1 0.8 0.8], ...
         'EdgeColor', 'none', 'FaceAlpha', 0.5, 'DisplayName', 'Toleranzbereich');
    
    plot(x_vut, y_vut, 'b', 'LineWidth', 1.5);
    xline(x_vut_t0, '--k', 't_0', 'LabelVerticalAlignment', 'bottom', 'LabelHorizontalAlignment', 'left');
    xline(x_vut_tend, '--k', 't_{end}', 'LabelVerticalAlignment', 'bottom', 'LabelHorizontalAlignment', 'left');
    
    xlabel('X-Position VUT [m]');
    ylabel('Y-Position VUT [m]');
    %title('Y position of the VUT over X position of the VUT');
    ylim([yVUTResultRef - tolLatVUT - 0.5, yVUTResultRef + tolLatVUT + 0.5])
    yl = ylim;
    yticks(yl(1):0.5:yl(2))
%     xlim([x_vut_t0-10, x_vut_tend+10]);
    xlim([x_vut(idx_plot_start), x_vut(idx_plot_end)]);
    %legend('VUT trajectory', 'Location', 'best');
    
    % === Subplot 2_3: VUT Speed ===
    subplot(3,1,3); hold on; grid on;
    
%     y_target = y_target + yRefTarget - yRefVUT - 0.01;
%     yTargetResultRef = yTargetResult + yRefTarget - yRefVUT - 0.01;

    withinTol7Ref = all(abs(y_target(x_target >= x_target_t0 & x_target <= x_target_tend) - yTargetResultRef) <= tolLatTarget);
    
    fill([x_target_t0, x_target_tend, x_target_tend, x_target_t0], ...
         [yTargetResultRef + tolLatTarget, yTargetResultRef + tolLatTarget, ...
          yTargetResultRef - tolLatTarget, yTargetResultRef - tolLatTarget], ...
         withinTol7Ref*[0.7 1 0.7] + ~withinTol7Ref*[1 0.8 0.8], ...
         'EdgeColor', 'none', 'FaceAlpha', 0.5, 'DisplayName', 'Toleranzbereich');
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    plot(x_target, y_target, 'r', 'LineWidth', 1.5);

    xline(x_target_t0, '--k', 't_0', 'LabelVerticalAlignment', 'bottom', 'LabelHorizontalAlignment', 'left');
    xline(x_target_tend, '--k', 't_{end}', 'LabelVerticalAlignment', 'bottom', 'LabelHorizontalAlignment', 'left');
    
    xlabel('X-Position Target [m]');
    ylabel('Y-Position Target [m]');
    %title('Y position of the target over X position of the target');
    ylim([yTargetResultRef - tolLatTarget - 0.2, yTargetResultRef + tolLatTarget + 0.2])
    xlim([x_target_t0-10, x_target_tend+10]);
    xlim([x_target(idx_plot_start), x_target(idx_plot_end)]);
    yl = ylim;
    yticks(yl(1):0.2:yl(2))
    %legend('Target trajectory', 'Location', 'best');
    
    if printPlots == 1
        filename = sprintf("%s_Plot6", testCase);
        % === Speicherpfad (z. B. in Unterordner "plots") ===
        outputFolder = "C:\Users\G00550\Desktop\Elias\Ausgabe_Plots_BSIS_Auswertung";
        if ~exist(outputFolder, "dir")
            mkdir(outputFolder);
        end
        
        % Erzeuge den vollständigen Pfad inkl. Dateiendung
        filePNG = fullfile(outputFolder, filename + ".png");
        filePDF = fullfile(outputFolder, filename + ".pdf");
        
        
        % Jetzt korrekt exportieren
        exportgraphics(gcf, filePNG, 'Resolution', 900);
        exportgraphics(gcf, filePDF, 'ContentType', 'vector', 'Resolution', 900);
    end
    
    if printPDF == 1
        %----------------------------------------------------------------------
        % 1) Speicherpfad und Dateinamen definieren
        %----------------------------------------------------------------------
        filename     = sprintf("%s_Plot1", testCase);
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
        if ishandle(1006)
            figSrc = figure(1006);  % vorhandene Plot-Figure
            % komplette Achsen und Inhalte in neue Figure kopieren
            axChildren = findall(figSrc, 'Type', 'axes');
            %newPanel = uipanel(layoutFig, 'Units', 'normalized', 'Position', [0 0 1 0.7]);
            for i = 1:numel(axChildren)
%                 newAxes = copyobj(axChildren(i), newPanel);
                newAxes = copyobj(axChildren(i), layoutFig);
                set(newAxes, 'Units', 'normalized');
                % automatisch anordnen: hier ggf. anpassen für perfekte Platzierung
                origPos = get(axChildren(i), 'Position');
                newPos = origPos;
                newPos(1) = origPos(1)-0.06;  % x-Position
                newPos(2) = origPos(2)*0.85-0.07;  % y-Position
                newPos(3) = origPos(3)*1.17;  % Breite
                newPos(4) = origPos(4)*1.05;  % Höhe
                set(newAxes, 'FontSize', 10);  % z. B. einheitlich für alle Achsen
                set(newAxes, 'Position', newPos);
                set(newAxes, 'Color', 'w');
%                 set(newAxes, 'Color', 'w');  % Hier explizit auf Weiß setzen
            end
        else
            warning("Figure 1009 existiert nicht – Sammelplot konnte nicht übernommen werden.");
        end

        %----------------------------------------------------------------------
        % 6) PDF exportieren
        %----------------------------------------------------------------------
        print(layoutFig, '-dpdf', '-fillpage', filePDF);

    end



    %% Sammelplot 8
    figure(1008); clf;
    
    % === Subplot 2_1: VUT Speed ===
    subplot(3,1,1); hold on; grid on;
    
%     y_vut = y_vut - yRefVUT;
%     yVUTResultRef = yVUTResult - yRefVUT;
    
    withinTol8Ref = all(abs(y_vut(t_rel >= 0 & t_rel <= (t_end - t_0)) - yVUTResultRef) <= tolLatVUT);
    
    fill([0, t_end - t_0, t_end - t_0, 0], ...
         [yVUTResultRef + tolLatVUT, yVUTResultRef + tolLatVUT, ...
          yVUTResultRef - tolLatVUT, yVUTResultRef - tolLatVUT], ...
         withinTol8Ref*[0.7 1 0.7] + ~withinTol8Ref*[1 0.8 0.8], ...
         'EdgeColor', 'none', 'FaceAlpha', 0.5, 'DisplayName', 'Toleranzbereich');
    
    
    plot(t_rel, y_vut, 'b', 'LineWidth', 1.5);
    xline(0, '--k', 't_0', 'LabelVerticalAlignment', 'bottom', 'LabelHorizontalAlignment', 'left');
    xline(t_end - t_0, '--k', 't_{end}', 'LabelVerticalAlignment', 'bottom', 'LabelHorizontalAlignment', 'left');
    
    xlabel('Time since t_0 [s]');
    ylabel('Y-Position VUT [m]');
    %title({'Y position of the VUT over time'; ['t_0: ' criterionUsed]});
    ylim([yVUTResultRef - tolLatVUT - 0.5, yVUTResultRef + tolLatVUT + 0.5])
    yl = ylim;
    yticks(yl(1):0.5:yl(2))
    xlim([t_plot_start, t_plot_end]);
    % legend('VUT Y position', 't_0', 't_{end}', 'Location', 'best');
    
    % === Subplot 2_2: VUT Speed ===
    subplot(3,1,2); hold on; grid on;
    
%     y_target = y_target + yRefTarget - yRefVUT - 0.01;
%     yTargetResultRef = yTargetResult + yRefTarget - yRefVUT - 0.01;
    
    withinTol6Ref = all(abs(y_target(t_rel >= 0 & t_rel <= (t_end - t_0)) - yTargetResultRef) <= tolLatTarget);
    
    fill([0, t_end - t_0, t_end - t_0, 0], ...
         [yTargetResultRef + tolLatTarget, yTargetResultRef + tolLatTarget, ...
          yTargetResultRef - tolLatTarget, yTargetResultRef - tolLatTarget], ...
         withinTol6Ref*[0.7 1 0.7] + ~withinTol6Ref*[1 0.8 0.8], ...
         'EdgeColor', 'none', 'FaceAlpha', 0.5, 'DisplayName', 'Toleranzbereich');
    
    plot(t_rel, y_target, 'r', 'LineWidth', 1.5);
    
    xline(0, '--k', 't_0', 'LabelVerticalAlignment', 'bottom', 'LabelHorizontalAlignment', 'left');
    xline(t_end - t_0, '--k', 't_{end}', 'LabelVerticalAlignment', 'bottom', 'LabelHorizontalAlignment', 'left');
    
    
    xlabel('Time since t_0 [s]');
    ylabel('Y-Position Target [m]');
    %title({'Y position of the target over time'; ['t_0: ' criterionUsed]});
    xlim([t_plot_start, t_plot_end]);
    ylim([yTargetResultRef - tolLatTarget - 0.2, yTargetResultRef + tolLatTarget + 0.2])
    
    % legend('Target Y position', 't_0', 't_{end}', 'Location', 'best');
    yl = ylim;
    yticks(yl(1):0.2:yl(2))
    
    % === Subplot 2_3: VUT Speed ===
    subplot(3,1,3); hold on; grid on;
    
    % Plot der beiden Kurven
    h_target = plot(time, x_target, 'r', 'LineWidth', 1.5); % Target
    h_vut = plot(time, x_vut, 'b', 'LineWidth', 1.5);        % VUT
    
    % Marker-Zeitpunkte berechnen
    [~, idx_da1] = min(abs(x_target - da));
    [~, idx_db1] = min(abs(x_vut - db));
    t_da1 = time(idx_da1);
    t_db1 = time(idx_db1);
    
    % Toleranzintervall anhand VUT (db)
    % in_tol_idx1 = find(x_vut >= (db - tol) & x_vut <= (db + tol));
    in_tol_idx1 = find(x_target >= (da - tol) & x_target <= (da + tol));
    %in_tol_idx1 = find(t_db1 >= (t_tol_start1) & t_db1 <= (t_tol_end1));

    if isempty(in_tol_idx1)
        t_tol_start1 = NaN;
        t_tol_end1 = NaN;
        fill_color = [1 0.7 0.7]; % rot bei Fehler
    else
        t_tol_start1 = time(in_tol_idx1(1));
        t_tol_end1 = time(in_tol_idx1(end));
        if t_db1 >= t_tol_start1 && t_db1 <= t_tol_end1
            fill_color = [0.7 1 0.7]; % grün
        else
            fill_color = [1 0.7 0.7]; % rot
        end
    end
    
    % Toleranz-Schlauch
    yl = ylim;
    x_fill1 = [t_tol_start1 t_tol_end1 t_tol_end1 t_tol_start1];
    y_fill1 = [yl(1) yl(1) yl(2) yl(2)];
    if ~any(isnan([t_tol_start1 t_tol_end1]))
        h_fill = fill(x_fill1, y_fill1, fill_color, 'FaceAlpha', 0.5, 'EdgeColor', 'none');
        uistack(h_fill, 'bottom');
    end
    
    % Vertikale Linien mit beschriftung (aligned + middle)
    y_da1 = x_target(idx_da1);
    y_tol_start1 = interp1(time, x_target, t_tol_start1, 'linear', 'extrap');
    y_tol_end1 = interp1(time, x_target, t_tol_end1, 'linear', 'extrap');
    
%     xline(t_da1, '--k', sprintf('d_{a} @ %.1f m', y_da1), ...
%         'LabelOrientation', 'aligned', 'LabelVerticalAlignment', 'middle', 'FontSize', 12);
%     
%     xline(t_db1, '--k', sprintf('d_{b}'), ...
%         'LabelOrientation', 'aligned', 'LabelVerticalAlignment', 'middle', 'FontSize', 12);
%     
    xline(t_tol_start1, ':k', sprintf('%.1f m', y_tol_start1), ...
        'LabelOrientation', 'aligned', 'LabelVerticalAlignment', 'middle', 'FontSize', 12);
    plot(t_tol_start1, y_tol_start1, 'k.', 'MarkerSize', 15, 'LineWidth', 2);
    
    xline(t_tol_end1, ':k', sprintf('%.1f m', y_tol_end1), ...
        'LabelOrientation', 'aligned', 'LabelHorizontalAlignment', 'left', 'LabelVerticalAlignment', 'middle', 'FontSize', 12);
    plot(t_tol_end1, y_tol_end1, 'k.', 'MarkerSize', 15, 'LineWidth', 2);
    
    % xline(0, '--k', 't_0', ...
    %     'LabelOrientation', 'aligned', 'LabelVerticalAlignment', 'middle', 'LabelHorizontalAlignment', 'left', 'FontSize', 12);
    % 
    % xline(t_end - t_0, '--k', 't_{end}', ...
    %     'LabelOrientation', 'aligned', 'LabelVerticalAlignment', 'middle', 'LabelHorizontalAlignment', 'left', 'FontSize', 12);
    
    % Marker und Text
    plot(t_da1, da, 'k.', 'MarkerSize', 15, 'LineWidth', 2);
    text(t_da1, da, sprintf(' d_{a} = %.1f m', da), 'VerticalAlignment', 'top', 'HorizontalAlignment', 'left', 'FontSize', 12);
    
    plot(t_db1, db, 'k.', 'MarkerSize', 15, 'LineWidth', 2);
    text(t_db1, db, sprintf(' d_{b} = %.1f m', db), 'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'left', 'FontSize', 12);
    
    % Achsen & Legende
    xlabel('Time since t_0 [s]');
    ylabel('X-Position [m]');
    %title('Positionen von Target (rot) und VUT (blau) mit Toleranzprüfung');
    
    %legend([h_target, h_vut, h_fill], {'Target Position', 'VUT Position', 'Toleranzbereich'}, 'Location', 'northeast');
    legend([h_target, h_vut], {'Target', 'VUT'}, 'Location', 'best');
    
    % Plotbereich
    xlim([t_tol_start1 - 0.05, t_tol_end1 + 0.05]);
    ylim([min(da, db) - 5, max(da, db) + 5]);
%     xlim([t_da1 - 0.3, t_da1 + 0.3]);
    yticks(yl(1):5:yl(2))
    yt = yticks;
    yticklabels( arrayfun(@(y) sprintf('%.2f', y), yt, 'UniformOutput', false) );
    
    if printPlots == 1
        filename = sprintf("%s_Plot8", testCase);
        % === Speicherpfad (z. B. in Unterordner "plots") ===
        outputFolder = "C:\Users\G00550\Desktop\Elias\Ausgabe_Plots_BSIS_Auswertung";
        if ~exist(outputFolder, "dir")
            mkdir(outputFolder);
        end
        
        % Erzeuge den vollständigen Pfad inkl. Dateiendung
        filePNG = fullfile(outputFolder, filename + ".png");
        filePDF = fullfile(outputFolder, filename + ".pdf");
        
        
        % Jetzt korrekt exportieren
        exportgraphics(gcf, filePNG, 'Resolution', 900);
        exportgraphics(gcf, filePDF, 'ContentType', 'vector', 'Resolution', 900);
    end    
    
    if printPDF == 1
        %----------------------------------------------------------------------
        % 1) Speicherpfad und Dateinamen definieren
        %----------------------------------------------------------------------
        filename     = sprintf("%s_Plot3", testCase);
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
        if ishandle(1008)
            figSrc = figure(1008);  % vorhandene Plot-Figure
            % komplette Achsen und Inhalte in neue Figure kopieren
            axChildren = findall(figSrc, 'Type', 'axes');
            legChildren = findall(figSrc, 'Type', 'legend');
            %newPanel = uipanel(layoutFig, 'Units', 'normalized', 'Position', [0 0 1 0.7]);
%             for i = 1:numel(axChildren)
% %                 newAxes = copyobj(axChildren(i), newPanel);
%                 newAxes = copyobj(axChildren(i), layoutFig); 
%                 set(newAxes, 'Units', 'normalized');
%                 % automatisch anordnen: hier ggf. anpassen für perfekte Platzierung
%                 origPos = get(axChildren(i), 'Position');
%                 newPos = origPos;
%                 newPos(1) = origPos(1)-0.06;  % x-Position
%                 newPos(2) = origPos(2)*0.85-0.07;  % y-Position
%                 newPos(3) = origPos(3)*1.17;  % Breite
%                 newPos(4) = origPos(4)*1.05;  % Höhe
%                 set(newAxes, 'Position', newPos);
%                 set(newAxes, 'Color', 'w');
% 
%             end



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
                newPos(1) = origPos(1)-0.06;
                newPos(2) = origPos(2)*0.85-0.07;
                newPos(3) = origPos(3)*1.17;
                newPos(4) = origPos(4)*1.05;
                set(newAxes, 'Position', newPos);
                set(newAxes, 'Color', 'w');
                set(newAxes, 'Toolbar', []);  % Toolbar entfernen
                set(newAxes, 'FontSize', 10);  % z. B. einheitlich für alle Achsen
                set(newLeg, 'Box', 'off', 'Color', 'none', 'Location', 'east');


            end
            
        else
            warning("Figure 1005 existiert nicht – Sammelplot konnte nicht übernommen werden.");
        end

        %----------------------------------------------------------------------
        % 6) PDF exportieren
        %----------------------------------------------------------------------
        print(layoutFig, '-dpdf', '-fillpage', filePDF);

    end

     %% Sammelplot 9
    
    figure(1009); clf;
    
    % === Subplot 3_1: VUT Speed ===
    subplot(4,1,1); hold on; grid on;
    
    xfill = [x_vut_t0, x_vut_tend];
    yfill_vut = [speedVUT - tolSpeedVUT, speedVUT + tolSpeedVUT];
%     fill([xfill fliplr(xfill)], ...
%          [yfill_vut(1) yfill_vut(1) yfill_vut(2) yfill_vut(2)], ...
%          withinTolSpeedVUT*[0.7 1 0.7] + ~withinTolSpeedVUT*[1 0.8 0.8], ...
%          'FaceAlpha', 0.5, 'EdgeColor', 'none');
     fill([xfill fliplr(xfill)], ...
         [yfill_vut(1) yfill_vut(1) yfill_vut(2) yfill_vut(2)], ...
         withinTolSpeedVUT*[0.7 1 0.7] + ~withinTolSpeedVUT*[0.7 1 0.7], ...
         'FaceAlpha', 0.5, 'EdgeColor', 'none');
    
    speedVUTFiltered = movmean(speed_vut, 10);
  
    plot(x_vut, speedVUTFiltered, 'b', 'LineWidth', 1.5);
    
    %xline(0, '--k', 't_0', 'LabelVerticalAlignment', 'bottom', 'LabelHorizontalAlignment', 'left');
    %xline(t_end - t_0, '--k', 't_{end}', 'LabelVerticalAlignment', 'bottom', 'LabelHorizontalAlignment', 'left');
    xline(x_vut_t0, '--k', 't_0', 'LabelVerticalAlignment', 'bottom', 'LabelHorizontalAlignment', 'left');
    xline(x_vut_tend, '--k', 't_{end}', 'LabelVerticalAlignment', 'bottom', 'LabelHorizontalAlignment', 'left');
    
    xlabel('Distance to Crashpoint [m]');
    %ylabel('VUT Speed [km/h]');
    % title({'Vehicle Under Test (VUT) Speed'; ['t_0: ' criterionUsed]});
    %title({'Vehicle Under Test (VUT) Speed'});
    ylim([speedVUT - tolSpeedVUT - 1, speedVUT + tolSpeedVUT + 1]);
    xlim([x_vut_t0-5, x_vut_tend+5]);
    %legend('Tolerance (+/- 2,0 km/h)', 'VUT Speed', 't_0', 't_{end}', 'Location', 'best');
    
    % === Subplot 3_2: VUT Speed ===
    subplot(4,1,2); hold on; grid on;
    
    xfill = [vutXstartabs, vutXendabs];
    yfill_vut = [speedVUT - tolSpeedVUT, speedVUT + tolSpeedVUT];
    fill([xfill fliplr(xfill)], ...
         [yfill_vut(1) yfill_vut(1) yfill_vut(2) yfill_vut(2)], ...
         withinTolSpeedVUT*[0.7 1 0.7] + ~withinTolSpeedVUT*[1 0.8 0.8], ...
         'FaceAlpha', 0.5, 'EdgeColor', 'none');
    
    plot(travelledDist_vut, data.Speed, 'b', 'LineWidth', 1.5);
    
    %xline(0, '--k', 't_0', 'LabelVerticalAlignment', 'bottom', 'LabelHorizontalAlignment', 'left');
    %xline(t_end - t_0, '--k', 't_{end}', 'LabelVerticalAlignment', 'bottom', 'LabelHorizontalAlignment', 'left');
    xline(vutXstartabs, '--k', 't_0', 'LabelVerticalAlignment', 'bottom', 'LabelHorizontalAlignment', 'left');
    xline(vutXendabs, '--k', 't_{end}', 'LabelVerticalAlignment', 'bottom', 'LabelHorizontalAlignment', 'left');
    
    xlabel('Travelled Distance VUT [m]');
    ylabel('VUT Speed [km/h]', 'VerticalAlignment','bottom', 'HorizontalAlignment','left');
    % title({'Vehicle Under Test (VUT) Speed'; ['t_0: ' criterionUsed]});
    %title({'Vehicle Under Test (VUT) Speed'});
    ylim([speedVUT - tolSpeedVUT - 1, speedVUT + tolSpeedVUT + 1]);
    xlim([vutXstartabs-5, vutXendabs+5]);
    %legend('Tolerance (+/- 2,0 km/h)', 'VUT Speed', 't_0', 't_{end}', 'Location', 'best');
    
    
    % === Subplot 3_3: VUT Speed ===
    subplot(4,1,3); hold on; grid on;
    
    xfill_target = [x_target_t0, x_target_tend];
    yfill_target = [speedTarget - tolSpeedTarget, speedTarget + tolSpeedTarget];
    fill([xfill_target fliplr(xfill_target)], ...
         [yfill_target(1) yfill_target(1) yfill_target(2) yfill_target(2)], ...
         withinTolSpeedTarget*[0.7 1 0.7] + ~withinTolSpeedTarget*[1 0.8 0.8], ...
         'FaceAlpha', 0.5, 'EdgeColor', 'none');
    
    speedTargetFiltered = movmean(speed_target, 25); 
    plot(x_target, speedTargetFiltered, 'r', 'LineWidth', 1.5);
    
    xline(x_target_t0, '--k', 't_0', 'LabelVerticalAlignment', 'bottom', 'LabelHorizontalAlignment', 'left');
    xline(x_target_tend, '--k', 't_{end}', 'LabelVerticalAlignment', 'bottom', 'LabelHorizontalAlignment', 'left');
    
    xlabel('Distance to Crashpoint [m]');
    ylabel('Target Speed [km/h]', 'VerticalAlignment','bottom', 'HorizontalAlignment','right');
    %title({'Target Speed over Distance'; ['t_0: ' criterionUsed]});
    ylim([speedTarget - tolSpeedTarget - 0.2, speedTarget + tolSpeedTarget + 0.2]);
    xlim([x_target_t0-10, x_target_tend+10]);
    %legend('Tolerance (+/- 0,5 km/h)', 'Target Speed', 't_0', 't_{end}', 'Location', 'north');
    
    % === Subplot 3_4: VUT Speed ===
    subplot(4,1,4); hold on; grid on;
    
    xfill_target = [targetAccDistance, travelledDist_targetTestEnd];
    yfill_target = [speedTarget - tolSpeedTarget, speedTarget + tolSpeedTarget];
    fill([xfill_target fliplr(xfill_target)], ...
         [yfill_target(1) yfill_target(1) yfill_target(2) yfill_target(2)], ...
         withinTolSpeedTarget*[0.7 1 0.7] + ~withinTolSpeedTarget*[1 0.8 0.8], ...
         'FaceAlpha', 0.5, 'EdgeColor', 'none');
    
    plot(travelledDist_target, speed_target, 'r', 'LineWidth', 1.5);
    
    xline(targetAccDistance, '--k', 't_0', 'LabelVerticalAlignment', 'bottom', 'LabelHorizontalAlignment', 'left');
    xline(travelledDist_targetTestEnd, '--k', 't_{end}', 'LabelVerticalAlignment', 'bottom', 'LabelHorizontalAlignment', 'left');
    
    xlabel('Travelled Distance Target [m]');
    %ylabel('Target Speed [km/h]');
    %title({'Target Speed over Distance'; ['t_0: ' criterionUsed]});
    ylim([speedTarget - tolSpeedTarget - 0.2, speedTarget + tolSpeedTarget + 0.2]);
    xlim([targetAccDistance - 10, travelledDist_targetTestEnd+10]);
    %legend('Tolerance (+/- 0,5 km/h)', 'Target Speed', 't_0', 't_{end}', 'Location', 'north');
    
    if printPlots == 1
        filename = sprintf("%s_Plot4", testCase);
        % === Speicherpfad (z. B. in Unterordner "plots") ===
        outputFolder = "C:\Users\G00550\Desktop\Elias\Ausgabe_Plots_BSIS_Auswertung";
        if ~exist(outputFolder, "dir")
            mkdir(outputFolder);
        end
        
        % Erzeuge den vollständigen Pfad inkl. Dateiendung
        filePNG = fullfile(outputFolder, filename + ".png");
        filePDF = fullfile(outputFolder, filename + ".pdf");
        
        
        % Jetzt korrekt exportieren
        exportgraphics(gcf, filePNG, 'Resolution', 900);
        exportgraphics(gcf, filePDF, 'ContentType', 'vector', 'Resolution', 900);
    end
    
%      if printPDF == 1
%         %----------------------------------------------------------------------
%         % 1) Speicherpfad und Dateinamen definieren
%         %----------------------------------------------------------------------
%         filename     = sprintf("%s_Plot_Test_1009_Signal_gefiltert", testCase);
%         outputFolder = "C:\Users\G00550\Desktop\Elias Daten\MATLAB\R151 Auswertung\Entwicklung\PDF_Ausgabe_Test";
%         if ~exist(outputFolder, "dir"); mkdir(outputFolder); end
%         filePDF = fullfile(outputFolder, filename + ".pdf");
% 
%         %----------------------------------------------------------------------
%         % 2) Neue Layout-Figure (A4 quer)
%         %----------------------------------------------------------------------
%         layoutFig = figure('Units', 'centimeters', ...
%                            'Position', [2 2 29.7 21], ...
%                            'PaperUnits', 'centimeters', ...
%                            'PaperSize', [29.7 21], ...
%                            'Color', 'w');
% 
%         %----------------------------------------------------------------------
%         % 3) TestCase-Text (oben links)
%         %----------------------------------------------------------------------
% %         annotation(layoutFig, 'textbox', [0.05 0.75 0.5 0.1], ...
% %             "String", testCase, ...
% %             "FontSize", 14, ...
% %             "FontWeight", "bold", ...
% %             "LineStyle", "none", ...
% %             "HorizontalAlignment", "left");
% 
%         % === Zeile 1: UN - R151 ===
%         annotation(layoutFig, 'textbox', [0.05 0.9 0.5 0.05], ...
%             "String", 'UN - R151', ...
%             "FontSize", 20, ...
%             "FontWeight", "bold", ...
%             "LineStyle", "none", ...
%             "HorizontalAlignment", "left");
% 
%         % === Zeile 2: Testfallbezeichnung (z. B. Car-to-Car CCRs_20kmh_50m) ===
%         annotation(layoutFig, 'textbox', [0.05 0.85 0.8 0.05], ...
%             "String", scenarioString, ...
%             "FontSize", 14, ...
%             "FontWeight", "normal", ...
%             "LineStyle", "none", ...
%             "HorizontalAlignment", "left");
%         
%         % === Zeile 3: VIN ===
%         annotation(layoutFig, 'textbox', [0.05 0.82 0.5 0.05], ...
%             "String", VIN, ...
%             "FontSize", 12, ...
%             "FontWeight", "normal", ...
%             "LineStyle", "none", ...
%             "HorizontalAlignment", "left");
% 
%         % === Zeile 4: Datum der Messung ===
%         annotation(layoutFig, 'textbox', [0.05 0.79 0.5 0.05], ...
%             "String", dateRun, ...
%             "FontSize", 12, ...
%             "FontWeight", "normal", ...
%             "LineStyle", "none", ...
%             "HorizontalAlignment", "left");
% 
%         %----------------------------------------------------------------------
%         % 4) Logo einfügen (oben rechts)
%         %----------------------------------------------------------------------
% %         axLogo = axes(layoutFig, 'Position', [0.75 0.78 0.2 0.18]);
% %         imshow(logoImage, 'Parent', axLogo);
% %         axis(axLogo, 'off');
% 
%         % RGB-Logo sicherstellen (falls Graustufenbild geladen wurde)
%         if size(logoImage,3) == 1
%             logoImage = repmat(logoImage, [1 1 3]);  % Grau -> RGB
%         end
% 
%         % Logo-Achse mit 'image' anzeigen (nicht imshow!)
%         axLogo = axes(layoutFig, 'Position', [0.7 0.9 0.25 0.09]);
%         image(axLogo, logoImage); 
%         axis(axLogo, 'off');
% %         axLogo.YDir = 'normal';  % notwendig, da 'image' Y-Achse invertieren kann
% 
% 
%         %----------------------------------------------------------------------
%         % 5) Sammelplot übernehmen
%         % -> Sicherstellen, dass die Figure existiert
%         %----------------------------------------------------------------------
%         if ishandle(1009)
%             figSrc = figure(1009);  % vorhandene Plot-Figure
%             % komplette Achsen und Inhalte in neue Figure kopieren
%             axChildren = findall(figSrc, 'Type', 'axes');
%             %newPanel = uipanel(layoutFig, 'Units', 'normalized', 'Position', [0 0 1 0.7]);
%             for i = 1:numel(axChildren)
% %                 newAxes = copyobj(axChildren(i), newPanel);
%                 newAxes = copyobj(axChildren(i), layoutFig);
%                 set(newAxes, 'Units', 'normalized');
%                 % automatisch anordnen: hier ggf. anpassen für perfekte Platzierung
%                 origPos = get(axChildren(i), 'Position');
%                 newPos = origPos;
%                 newPos(1) = origPos(1)-0.06;  % x-Position
%                 newPos(2) = origPos(2)*0.85-0.07;  % y-Position
%                 newPos(3) = origPos(3)*1.17;  % Breite
%                 newPos(4) = origPos(4)*1.05;  % Höhe
% 
%                 set(newAxes, 'Position', newPos);
%                 set(newAxes, 'Color', 'w');
% %                 set(newAxes, 'Color', 'w');  % Hier explizit auf Weiß setzen
%             end
%         else
%             warning("Figure 1009 existiert nicht – Sammelplot konnte nicht übernommen werden.");
%         end
% 
%         %----------------------------------------------------------------------
%         % 6) PDF exportieren
%         %----------------------------------------------------------------------
%         print(layoutFig, '-dpdf', '-fillpage', filePDF);
% 
%      end

    %% Sammelplot 1005
    
    figure(1005); clf;
    
    % === Subplot 1: VUT Speed ===
    subplot(4,1,1); hold on; grid on;
    
    xfill = [x_vut_t0, x_vut_tend];
    yfill_vut = [speedVUT - tolSpeedVUT, speedVUT + tolSpeedVUT];
    fill([xfill fliplr(xfill)], ...
         [yfill_vut(1) yfill_vut(1) yfill_vut(2) yfill_vut(2)], ...
         withinTolSpeedVUT*[0.7 1 0.7] + ~withinTolSpeedVUT*[1 0.8 0.8], ...
         'FaceAlpha', 0.5, 'EdgeColor', 'none');
    
    plot(x_vut, speed_vut, 'b', 'LineWidth', 1.5);
    
    %xline(0, '--k', 't_0', 'LabelVerticalAlignment', 'bottom', 'LabelHorizontalAlignment', 'left');
    %xline(t_end - t_0, '--k', 't_{end}', 'LabelVerticalAlignment', 'bottom', 'LabelHorizontalAlignment', 'left');
    xline(x_vut_t0, '--k', 't_0', 'LabelVerticalAlignment', 'bottom', 'LabelHorizontalAlignment', 'left');
    xline(x_vut_tend, '--k', 't_{end}', 'LabelVerticalAlignment', 'bottom', 'LabelHorizontalAlignment', 'left');
    
    xlabel('Distance to Crashpoint [m]');
    %ylabel('VUT Speed [km/h]');
    % title({'Vehicle Under Test (VUT) Speed'; ['t_0: ' criterionUsed]});
    %title({'Vehicle Under Test (VUT) Speed'});
    ylim([speedVUT - tolSpeedVUT - 1, speedVUT + tolSpeedVUT + 1]);
    xlim([x_vut_t0-5, x_vut_tend+5]);
    %legend('Tolerance (+/- 2,0 km/h)', 'VUT Speed', 't_0', 't_{end}', 'Location', 'best');
    
    % === Subplot 2: VUT Speed ===
    subplot(4,1,2); hold on; grid on;
    
    xfill = [vutXstartabs, vutXendabs];
    yfill_vut = [speedVUT - tolSpeedVUT, speedVUT + tolSpeedVUT];
    fill([xfill fliplr(xfill)], ...
         [yfill_vut(1) yfill_vut(1) yfill_vut(2) yfill_vut(2)], ...
         withinTolSpeedVUT*[0.7 1 0.7] + ~withinTolSpeedVUT*[1 0.8 0.8], ...
         'FaceAlpha', 0.5, 'EdgeColor', 'none');
    
    plot(travelledDist_vut, speed_vut, 'b', 'LineWidth', 1.5);
    
    %xline(0, '--k', 't_0', 'LabelVerticalAlignment', 'bottom', 'LabelHorizontalAlignment', 'left');
    %xline(t_end - t_0, '--k', 't_{end}', 'LabelVerticalAlignment', 'bottom', 'LabelHorizontalAlignment', 'left');
    xline(vutXstartabs, '--k', 't_0', 'LabelVerticalAlignment', 'bottom', 'LabelHorizontalAlignment', 'left');
    xline(vutXendabs, '--k', 't_{end}', 'LabelVerticalAlignment', 'bottom', 'LabelHorizontalAlignment', 'left');
    
    xlabel('Travelled Distance VUT [m]');
    ylabel('VUT Speed [km/h]', 'VerticalAlignment','bottom', 'HorizontalAlignment','left');
    % title({'Vehicle Under Test (VUT) Speed'; ['t_0: ' criterionUsed]});
    %title({'Vehicle Under Test (VUT) Speed'});
    ylim([speedVUT - tolSpeedVUT - 1, speedVUT + tolSpeedVUT + 1]);
    xlim([vutXstartabs-5, vutXendabs+5]);
    %legend('Tolerance (+/- 2,0 km/h)', 'VUT Speed', 't_0', 't_{end}', 'Location', 'best');
    
    
    % === Subplot 3: VUT Speed ===
    subplot(4,1,3); hold on; grid on;
    
    xfill_target = [x_target_t0, x_target_tend];
    yfill_target = [speedTarget - tolSpeedTarget, speedTarget + tolSpeedTarget];
    fill([xfill_target fliplr(xfill_target)], ...
         [yfill_target(1) yfill_target(1) yfill_target(2) yfill_target(2)], ...
         withinTolSpeedTarget*[0.7 1 0.7] + ~withinTolSpeedTarget*[1 0.8 0.8], ...
         'FaceAlpha', 0.5, 'EdgeColor', 'none');
    
    plot(x_target, speed_target, 'r', 'LineWidth', 1.5);
    
    xline(x_target_t0, '--k', 't_0', 'LabelVerticalAlignment', 'bottom', 'LabelHorizontalAlignment', 'left');
    xline(x_target_tend, '--k', 't_{end}', 'LabelVerticalAlignment', 'bottom', 'LabelHorizontalAlignment', 'left');
    
    xlabel('Distance to Crashpoint [m]');
%     ylabel('Target Speed [km/h]', 'VerticalAlignment','bottom', 'HorizontalAlignment','right');
    %title({'Target Speed over Distance'; ['t_0: ' criterionUsed]});
    %ylim([speedTarget - tolSpeedTarget - 0.2, speedTarget + tolSpeedTarget + 0.2]);
    xlim([x_target_t0-11, x_target_tend+10]);
    %legend('Tolerance (+/- 0,5 km/h)', 'Target Speed', 't_0', 't_{end}', 'Location', 'north');
    
    % === Subplot 4: VUT Speed ===
    subplot(4,1,4); hold on; grid on;
    
    xfill_target = [targetAccDistance, travelledDist_targetTestEnd];
    yfill_target = [speedTarget - tolSpeedTarget, speedTarget + tolSpeedTarget];
    fill([xfill_target fliplr(xfill_target)], ...
         [yfill_target(1) yfill_target(1) yfill_target(2) yfill_target(2)], ...
         withinTolSpeedTarget*[0.7 1 0.7] + ~withinTolSpeedTarget*[1 0.8 0.8], ...
         'FaceAlpha', 0.5, 'EdgeColor', 'none');
    
    plot(travelledDist_target, speed_target, 'r', 'LineWidth', 1.5);
    
    xline(targetAccDistance, '--k', 't_0', 'LabelVerticalAlignment', 'bottom', 'LabelHorizontalAlignment', 'left');
    xline(travelledDist_targetTestEnd, '--k', 't_{end}', 'LabelVerticalAlignment', 'bottom', 'LabelHorizontalAlignment', 'left');
    
    % Beschriftung des Punktes (z. B. oberhalb)
    text(targetAccDistance + 0.1, speedTarget + tolSpeedTarget, sprintf('Target Speed at %.2f m: %.2f km/h', targetAccDistance, speed_target(idx_t0)), ...
        'HorizontalAlignment', 'left', ...
        'VerticalAlignment', 'bottom', ...
        'FontSize', 10, 'Color', 'k');
    
    xlabel('Travelled Distance Target [m]');
    ylabel('Target Speed [km/h]', 'VerticalAlignment','bottom', 'HorizontalAlignment','left');
    %ylabel('Target Speed [km/h]');
    %title({'Target Speed over Distance'; ['t_0: ' criterionUsed]});
    ylim([speedTarget - tolSpeedTarget - 0.2, speedTarget + tolSpeedTarget + 0.2]);
    xlim([targetAccDistance - 11, travelledDist_targetTestEnd+10]);
    %legend('Tolerance (+/- 0,5 km/h)', 'Target Speed', 't_0', 't_{end}', 'Location', 'north');
    
    if printPDF == 1
        filename = sprintf("%s_Plot4", testCase);
        % === Speicherpfad (z. B. in Unterordner "plots") ===
        outputFolder = "C:\Users\G00550\Desktop\Elias\Ausgabe_Plots_BSIS_Auswertung";
        if ~exist(outputFolder, "dir")
            mkdir(outputFolder);
        end
        
        % Erzeuge den vollständigen Pfad inkl. Dateiendung
        filePNG = fullfile(outputFolder, filename + ".png");
        filePDF = fullfile(outputFolder, filename + ".pdf");
        
        
        % Jetzt korrekt exportieren
        exportgraphics(gcf, filePNG, 'Resolution', 900);
        exportgraphics(gcf, filePDF, 'ContentType', 'vector', 'Resolution', 900);
    end
    
    
    if printPlots == 1
        %----------------------------------------------------------------------
        % 1) Speicherpfad und Dateinamen definieren
        %----------------------------------------------------------------------
        filename     = sprintf("%s_Plot2", testCase);
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
        if ishandle(1005)
            figSrc = figure(1005);  % vorhandene Plot-Figure
            % komplette Achsen und Inhalte in neue Figure kopieren
            axChildren = findall(figSrc, 'Type', 'axes');
            %newPanel = uipanel(layoutFig, 'Units', 'normalized', 'Position', [0 0 1 0.7]);
            for i = 1:numel(axChildren)
%                 newAxes = copyobj(axChildren(i), newPanel);
                newAxes = copyobj(axChildren(i), layoutFig);
                set(newAxes, 'Units', 'normalized');
                % automatisch anordnen: hier ggf. anpassen für perfekte Platzierung
                origPos = get(axChildren(i), 'Position');
                newPos = origPos;
                newPos(1) = origPos(1)-0.06;  % x-Position
                newPos(2) = origPos(2)*0.85-0.07;  % y-Position
                newPos(3) = origPos(3)*1.17;  % Breite
                newPos(4) = origPos(4)*1.05;  % Höhe
                set(newAxes, 'FontSize', 10);  % z. B. einheitlich für alle Achsen
                set(newAxes, 'Position', newPos);
                set(newAxes, 'Color', 'w');
%                 set(newAxes, 'Color', 'w');  % Hier explizit auf Weiß setzen
            end
        else
            warning("Figure 1005 existiert nicht – Sammelplot konnte nicht übernommen werden.");
        end

        %----------------------------------------------------------------------
        % 6) PDF exportieren
        %----------------------------------------------------------------------
        print(layoutFig, '-dpdf', '-fillpage', filePDF);

    end

    
     
     
end



toc
