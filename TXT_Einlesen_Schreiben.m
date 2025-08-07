% =========================================================================
% adjustAndOverwriteMeasurementTXT.m
% Liest strukturierte Messdaten, passt bestimmte Spalten an und schreibt
% sie im exakt gleichen Format zurück.
% =========================================================================

% === 1. Pfad zur Datei ===
filePath = "C:\Users\G00550\Desktop\V4_T43_R10_V5.txt";  % <-- hier Pfad anpassen

tempFilePath = 'Temp_Messdaten.txt';

% === Textzeilen einlesen ===
fid = fopen(filePath, 'r');
if fid == -1, error('Datei konnte nicht geöffnet werden.'); end
lines = textscan(fid, '%s', 'Delimiter', '\n'); fclose(fid);
lines = lines{1};

% === Headerzeile finden ===
headerLineIndex = find(contains(lines, 'Point'), 1, 'last');
header = strrep(strsplit(lines{headerLineIndex}, '\t'), '"', '');
nCols = numel(header);
dataStartIndex = headerLineIndex + 3;

% === Originaldatenzeilen als Text merken ===
dataLinesOriginal = lines(dataStartIndex:end);

% === Daten mit Formatierungs-Optionen einlesen (für Rechnen) ===
opts = delimitedTextImportOptions("NumVariables", nCols);
opts.DataLines = [dataStartIndex, Inf];
opts.Delimiter = '\t';
opts.VariableNames = matlab.lang.makeValidName(header);
opts.VariableTypes(:) = {'double'};
opts.ExtraColumnsRule = 'ignore';
opts.ConsecutiveDelimitersRule = 'split';
opts = setvaropts(opts, opts.VariableNames, 'DecimalSeparator', ',');

data = readtable(filePath, opts);

% === Bearbeitung deiner gewünschten Spalten ===
if ismember('OtherVehicleForwardVelocity', data.Properties.VariableNames)
    data.OtherVehicleForwardVelocity = ...
        (data.OtherVehicleForwardVelocity * 3.62 + 0.21) / 3.6;
end
if ismember('Object1ForwardVelocity', data.Properties.VariableNames)
    data.Object1ForwardVelocity = ...
        (data.Object1ForwardVelocity * 3.62 + 0.21) / 3.6;
end

% === Neue Daten in Original-Zeilen einsetzen ===
editedLines = dataLinesOriginal;
for i = 1:height(data)
    originalValues = strsplit(dataLinesOriginal{i}, '\t');
    for j = 1:nCols
        colName = matlab.lang.makeValidName(header{j});
        if strcmp(colName, 'OtherVehicleForwardVelocity') || strcmp(colName, 'Object1ForwardVelocity')
            newVal = strrep(num2str(data{i,j}, '%.15g'), '.', ',');
            originalValues{j} = newVal;
        end
    end
    editedLines{i} = strjoin(originalValues, '\t');
end

% === Neue Datei schreiben ===
fid = fopen(tempFilePath, 'w');
if fid == -1, error('Temporäre Datei konnte nicht erstellt werden.'); end

% Header & Meta-Zeilen wiederherstellen
for i = 1:(dataStartIndex - 1)
    fprintf(fid, '%s\n', lines{i});
end

% Bearbeitete Datenzeilen schreiben
for i = 1:length(editedLines)
    fprintf(fid, '%s\n', editedLines{i});
end
fclose(fid);

% Alte Datei überschreiben
movefile(tempFilePath, filePath, 'f');
disp('✔ Datei erfolgreich überschrieben – Werte angepasst, Format erhalten.');
