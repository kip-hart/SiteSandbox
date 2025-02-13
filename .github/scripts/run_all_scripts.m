function run_all_scripts(directory)
    % Get the list of all files and folders in the directory
    files = dir(directory);
    
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
        elseif strcmp(ext, '.m') && ~isFunction(fullPath)
            run_single_script(fullPath);
        end
    end
end

function flag = isFunction(fullPath)
    % Read the first line of the file
    fid = fopen(fullPath, 'r');
    firstLine = fgetl(fid);
    fclose(fid);

    flag = contains(strtrim(firstLine), 'function');
end

function run_single_script(fullPath)
    dyPath = diary_filename(fullPath);
    
    diary('off'); % Ensure any open diary is closed
    diary(dyPath);
    
    try
        run(fullPath);
    catch ME
        fprintf('Error running %s: %s\n', fullPath, ME.message);
    end
    
    diary('off'); % Ensure diary is closed
end

function dyPath = diary_filename(fullPath)
    [path, name, ext] = fileparts(fullPath);
    dyPath = fullfile(path, [name '.diary']);
end
