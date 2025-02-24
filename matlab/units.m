% ---------------------------------------------------------------------- %
%% Units function
%
% This function contains the unit conversion factors for metric and
% Imperial units. It demonstrates these concepts:
%
%   * Fuctions
%   * Structures
%   * Switch/case statements
%   * Defensive programming
%   * Help strings
%   * Raising errors
%
% Using this function in homework for other cases will help you avoid
% unit conversion mistakes! You will often encounter constants defined in
% metric, such as the universal gas constant, while working on a problem
% with givens that are Imperial. Don't let this be a barrier. Convert
% all your inputs to the same unit system, calculate your answer, and
% choose which units to use for your output.
%
% Author: Kip Hart // 23 FEB 2025
% ---------------------------------------------------------------------- %

function U = units(sys)
% UNITS  Unit conversion factors
%   U = units('metric') generates conversion factors to metric.
%   U = units('imperial') generates conversion factors to imperial.
%
%   To apply units to numbers, multiply the appropriate conversion factor.
%   To convert to a different unit, divide by the conversion factor.
%
%   Example usage:
%   U = units('metric');
%   dist = 10*U.FT
%
%   dist = 
%
%        3.048
%
%   dist/U.IN
%
%   ans =
%        120
%
%   Here, a distance is input in feet and saved in the dist variable in
%   meters. Calculatiions and formulas can be applied to this variable.
%   To output a variable in a specific unit, divide by that unit.
%
%   Source: <a href="matlab:
%   web('https://www.nist.gov/pml/special-publication-811/nist-guide-si-appendix-b-conversion-factors/nist-guide-si-appendix-b9')">NIST Guide to the SI, Appendix B.9</a>
%

    %% Load base units
    switch lower(sys)
        case 'metric'
            U = base_metric();
        case 'imperial'
            U = base_imperial();
        otherwise
            error('Unexpected input: %s', sys)
    end

    %% Additional Units
    U.G0     = 9.80665*U.M/U.S^2;
    U.LBM    = U.SLUG/(U.G0/(U.FT/U.S^2));

    %% Angle
    U.RAD    = 1;
    U.DEG    = pi*U.RAD/180;

    U.ARCMIN = U.DEG/60;
    U.ARCSEC = U.ARCMIN/60;

    %% Area
    U.ACRE   = (60*U.FT) * (660*U.FT);
    U.HA     = (100*U.M)^2;

    %% Electricity and Magnetism
    U.AMPERE = 1;
    U.MA     = 1e-3*U.AMPERE;
    U.C      = 1*U.AMPERE*U.S;
    
    U.V      = U.KG*U.M^2/(U.S^2*U.C);
    U.OHM    = U.V/U.AMPERE;
    U.H      = U.OHM*U.S;
    U.F      = U.C/U.V;

    U.WB     = U.V*U.S;
    U.T      = U.WB/U.M^2;

    %% Energy and Work
    U.J       = U.KG*U.M^2/U.S^2;
    U.KJ      = 1000*J;
    U.ERG     = 1e-7*U.J;
    
    U.CAL_IT  = 4.1868*U.J;
    U.CAL_TH  = 4.184*U.J;
    U.KCAL_IT = 1000*U.CAL_IT;
    U.KCAL_TH = 1000*U.CAL_TH;

    C_WATER_IT = U.CAL_IT/(U.KG*U.K);
    C_WATER_TH = U.CAL_TH/(U.KG*U.K);
    U.BTU_IT  = C_WATER_IT*U.LBM*U.R;
    U.BTU_TH  = C_WATER_TH*U.LBM*U.R;
    U.BFS     = U.BTU_IT/(U.FT^2*U.S);  % Heat Flux

    U.EV       = 1.602177e-19*U.J;
    U.TON_TNT  = 1e9*U.CAL_TH;

    %% Force
    U.N        = U.KG*U.M/U.S^2;
    U.LBF      = U.SLUG*U.FT/U.S^2;

    U.DYNE     = 1e-5*U.N;
    U.KIP      = 1e3*U.LBF;

    %% Frequency
    U.HZ       = 2*pi*U.RAD/U.S;

    %% Length
    U.ANGSTROM = 1e-10*U.M;
    U.NM       = 1e-9*U.M;
    U.UM       = 1e-6*U.M;
    U.MM       = 1e-3*U.M;
    U.CM       = 1e-2*U.M;
    U.KM       = 1e3*U.M;

    U.IN       = U.FT/12;
    U.MIL      = 1e-3*U.IN;
    U.YD       = 3*U.FT;
    U.KFT      = 1000*U.FT;
    U.MI       = 5280*U.FT;
    U.NMILE    = 6076.11549*U.FT;

    U.AU       = 149597870700*U.M;
    U.PARSEC   = U.AU/tan(U.ARCSEC/U.RAD);

    %% Mass
    U.GRAM   = 1e-3*U.KG;
    U.MG     = 1e-6*U.KG;

    U.OZ     = U.LBM/16;

    %% Power
    U.W      = U.J/U.S;
    U.HP     = 33000*U.FT*U.LBF/(60*U.S);

    %% Pressure or Stress
    U.PA     = U.N/U.M^2;
    U.MBAR   = 1e2*U.PA;
    U.KPA    = 1e3*U.PA;
    U.BAR    = 1e5*U.PA;
    U.MPA    = 1e6*U.PA;
    U.GPA    = 1e9*U.PA;

    U.PSI    = U.LBF/U.IN^2;
    U.PSF    = U.LBF/U.FT^2;
    U.KSI    = U.KIP/U.IN^2;

    U.ATM    = 101325*U.PA;
    U.TORR   = U.ATM/760;
    U.MMHG   = 133.322387415*U.PA;
    U.INHG   = U.MMHG*(U.IN/U.MM);
    U.CMH20  = 98.0665*U.PA;
    U.INH20  = U.CMH20*(U.IN/U.CM);

    %% Time
    U.MS     = 1e-3*U.S;
    U.MIN    = 60*U.S;
    U.HR     = 60*U.MIN;
    U.DAY    = 24*U.HR;
    U.YR     = 365*U.DAY;
    U.DAY_SIDEREAL = 86164.09*U.S;
    U.YR_SIDEREAL  = 3.155815e7*U.S;

    %% Velocity
    U.KMH    = U.KM/U.HR;
    
    U.FPS    = U.FT/U.S;
    U.MPH    = U.MI/U.HR;

    U.RPM    = U.HZ/60;

    %% Viscosity
    U.POISE  = 0.1*U.PA*U.S;
    U.CP     = U.PA*U.S/100;

    U.ST     = 1e-4*U.M^2/U.S;
    U.CST    = U.ST/100;

    %% Volume
    U.CC     = (U.CM)^3;
    U.ML     = U.CC;
    U.L      = 1000*U.ML;

    U.GAL    = 231*U.IN^3;
    U.BBL    = 42*U.GAL;
    U.QT     = U.GAL/4;
    U.PT     = U.QT/2;
    U.CUP    = U.PT/2;

    U.FLOZ   = U.GAL/128;
    U.TBSP   = U.FLOZ/2;
    U.TSP    = U.FLOZ/6;

end

function U = base_metric()
    U.KG     = 1;
    U.M      = 1;
    U.S      = 1;
    U.K      = 1;
    U.MOL    = 1;

    U.SLUG   = 1.459390e1*U.KG;
    U.FT     = 3.048006e-1*U.M;
    U.R      = 1.8*U.K;
    U.LBMOL  = 453.59237*U.MOL;
end

function U = base_imperial()
    U.SLUG   = 1;
    U.FT     = 1;
    U.S      = 1;
    U.R      = 1;
    U.LBMOL  = 1;

    U.KG   = U.SLUG/1.459390e1;
    U.M    = U.FT/3.048006e-1;
    U.K    = U.R/1.8;
    U.MOL  = U.LBMOL/453.59237;
end