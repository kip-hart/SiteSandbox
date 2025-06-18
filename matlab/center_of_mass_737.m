%% Center of Mass of a 737
% **Dr. Kip Hart**
%
% 17 June 2025
%
% This script calculates the center of mass of a Boeing 737
% in several scenarios. Mass values are in kilograms.
% Distances are in meters from the nose of the aircraft.
%
% The center of mass equation is given by:
% $$ \bar{x} = \frac{\sum_i m_i x_i}{\sum_i m_i} $$

%% Givens
% The values below are taken from the table in the problem statement.

% Empty Weight
empty_mass = 41e3;
empty_dist = 16.7;

% Crew and Equipment
crew_equip_mass = 340;
cerw_equip_dist = 5;

% Passengers
pax_mass = 15e3;
pax_dist = 17.5;

% Cargo
cargo_mass = 1000;
cargo_dist = 18.0;

% Fuel
fuel_mass = 20e3;
fuel_dist = 13.5;

%% Question 1
% Where is the center of mass of the aircraft?
mass_total = empty_mass + crew_equip_mass + pax_mass + cargo_mass + fuel_mass;
weighted_sum = empty_mass*empty_dist + crew_equip_mass*cerw_equip_dist + pax_mass*pax_dist + cargo_mass*cargo_dist + fuel_mass*fuel_dist;

center_of_mass = weighted_sum / mass_total

%% Question 2
% When the aircraft runs out of fuel, where will the center of mass be?
mass_total_q2 = mass_total - fuel_mass;
weighted_sum_q2 = weighted_sum - fuel_mass*fuel_dist;

center_of_mass_q2 = weighted_sum_q2 / mass_total_q2

%% Question 3
% If the aircraft needs to be ferried to another airport,
% with no passengers or cargo, where is the center of mass?
mass_total_q3 = mass_total - pax_mass - cargo_mass;
weighted_sum_q3 = weighted_sum - pax_mass*pax_dist - cargo_mass*cargo_dist;

center_of_mass_q3 = weighted_sum_q3 / mass_total_q3
