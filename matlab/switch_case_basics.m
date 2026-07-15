status_code = 2;

switch status_code
    case 1
        disp('Nominal')
    case 2
        disp('Warning')
    case 3
        disp('Critical')
    otherwise
        disp('Unknown status code')
end
