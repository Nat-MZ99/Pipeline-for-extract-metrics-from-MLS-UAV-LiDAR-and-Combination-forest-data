% Definir o caminho principal para a pasta raiz onde treeqsm.m está localizado
mainPath = 'D:/TreeQSM/src';

% Verificar se o arquivo treeqsm.m existe no caminho principal
if exist(fullfile(mainPath, 'treeqsm.m'), 'file') ~= 2
    error('O arquivo treeqsm.m não foi encontrado no caminho especificado: %s', mainPath);
end

% Adicionar a pasta principal e todas as subpastas ao caminho do MATLAB
addpath(genpath(mainPath));

% Salvar o caminho atualizado
savepath;

% Mostrar uma mensagem de confirmação
disp('O caminho principal e todas as subpastas foram adicionados ao caminho do MATLAB e salvos.');