function run_all_scripts(directory)
    % Get the list of all files and folders in the directory
    files = dir(directory);

    % Make a fake plot with legend, first one seems weird
    plot([0, 1], [0, 1])
    hold on
    plot([0, 1], [0, 1,])
    hold off
    legend('foo', 'bar')
    close

    % Loop through each item in the directory
    for i = 1:length(files)
        % Skip '.' and '..' directories
        if strcmp(files(i).name, '.') || strcmp(files(i).name, '..')
            continue;
        end
        
        % Get the full path of the item
        fullPath = fullfile(directory, files(i).name);
        [~, ~, ext] = fileparts(fullPath);
        
        % If the item is a folder, recursively call the function
        if files(i).isdir
            run_all_scripts(fullPath);
        elseif strcmp(ext, '.m')
            fprintf('Running %s\n', fullPath);
            run_single_script(fullPath);
        end
    end
end

function run_single_script(fullPath)
    [path, name, ~] = fileparts(fullPath);
    dyPath = fullfile(path, [name '.diary']);
    
    % Ensure any open diary is closed before opening a new one
    diary('off');
    diary(dyPath);
    
    try
        run(fullPath);
    catch ME
        fprintf('Error running %s: %s\n', fullPath, ME.message);
    end
    
    % Ensure the diary is closed after running the script
    diary('off');

    % Save current figures
    FigList = findobj(allchild(0), 'flat', 'Type', 'figure');
    if ~isempty(FigList)
        FolderName = fullfile('figures', path, name)
        mkdir(FolderName);
    end

    for iFig = 1:length(FigList)
        FigHandle = FigList(iFig);
        FigName   = ['Figure_' num2str(iFig) '.png']
        saveas(FigHandle, fullfile(FolderName, FigName));
    end

    close all
end
