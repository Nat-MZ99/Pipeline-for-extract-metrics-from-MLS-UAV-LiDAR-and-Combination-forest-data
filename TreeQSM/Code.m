% Defina a pasta onde serão salvos os resultados:
resultsPath = 'D:/Estagio/03_Processamento/01_MLS/.teste/TreeQSM/';

% List all .las files in the folder
lasFiles = dir('D:/Estagio/03_Processamento/01_MLS/.teste/*.las');

% Loop through each .las file
for fileIdx = 1:numel(lasFiles)
    try
        % Get the full file path
        filePath = fullfile(lasFiles(fileIdx).folder, lasFiles(fileIdx).name);

        % Read the LAS file
        lasReader = lasFileReader(filePath);
        ptCloud = readPointCloud(lasReader);
        P = ptCloud.Location;

        % Extract the desired name from the file name (assuming the file name format is consistent)
        [~, fileName, ~] = fileparts(lasFiles(fileIdx).name);
        %nameParts = strsplit(fileName, '_'); % Assuming file names are separated by underscores

        % Define other inputs
        inputs = define_input(P, 1, 1, 1);
        inputs.OnlyTree = 0;
        inputs.plot = 1; % 0 no plot, 1 plot QSM, 2 + função de afilamento
        inputs.name = fileName; %nameParts{1}; % Set inputs.name to the desired name
        %inputs.Tria = 1

        % Print the filename (inputs.name) for this iteration
        disp(['Filename for this iteration: ', inputs.name]);

        % Perform your QSM computation here using inputs and P
        QSM = treeqsm(P, inputs, resultsPath);

        % You can do further processing or save the results here

    catch ME
        % Print the error message and continue with the next file
        disp(['Error processing file: ', lasFiles(fileIdx).name]);
        disp(['Error message: ', ME.message]);
        continue; % Continue to the next iteration
    end
end