engine_code = 3;

switch engine_code
    case 1
        engine_type = 'Solid';
    case {2, 3}
        engine_type = 'Liquid';
    case 4
        engine_type = 'Electric';
    otherwise
        engine_type = 'Unknown';
end

disp(engine_type)
