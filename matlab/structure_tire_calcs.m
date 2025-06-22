units_mini

tire.width = 255*U.mm;
tire.aspect_ratio = 0.45;
tire.construction = 'R';
tire.rim_diameter = 21*U.in;
tire.max_load = 2094;  % lb
tire.weight = 31;  % lb

height = tire.width * tire.aspect_ratio;
total_diameter = tire.rim_diameter + height;

total_diameter / U.in
