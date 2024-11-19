figure;
hold on;
axis equal;

% Step 1: Set the background to a very light gray
fill([-6 6 6 -6], [-6 -6 12 12], [0.95 0.95 0.95], 'EdgeColor', 'none');

% Step 2: Banana shape
theta = linspace(-pi/2, pi/2, 100);  
x_banana = 3 * sin(theta);           
y_banana = 1.5 * cos(theta) + 0.5;  

% Step 3: Apply +35 degree rotation matrix (counterclockwise)
theta_deg = 35;  
theta_rad = deg2rad(theta_deg); 
R_plus_35 = [cos(theta_rad) -sin(theta_rad); sin(theta_rad) cos(theta_rad)];  

coords = R_plus_35 * [x_banana; y_banana];  

% Step 4: Flip the y-coordinates to move the curve to the bottom
x_rot = coords(1, :); 
y_rot = -coords(2, :) + 5; 

% Step 5: Shift the banana to the center (adjusting both x and y positioning)
x_shift = 0; 
y_shift = 3;

% Apply the shifts
x_rot_centered = x_rot + x_shift; 
y_rot_centered = y_rot + y_shift; 

% Step 6: Draw the rotated and centered banana with deep yellow color
fill(x_rot_centered, y_rot_centered, [1.0 0.8 0.0], 'EdgeColor', 'none');  

% Step 7: Create tape along the slope of y=-x, but rotated 53 degrees (2 degrees more left)

tape_length = 5;  
tape_width = 0.9;  

x_tape = [-tape_length/2, tape_length/2, tape_length/2, -tape_length/2];  
y_tape = [-tape_width/2, -tape_width/2, tape_width/2, tape_width/2];  

theta_deg_tape = 53;  
theta_rad_tape = deg2rad(theta_deg_tape); 
R_tape = [cos(theta_rad_tape) -sin(theta_rad_tape); sin(theta_rad_tape) cos(theta_rad_tape)];  

coords_tape = R_tape * [x_tape; y_tape];  

% Step 8: Set the tape position and move it down a bit
x_tape_centered = coords_tape(1, :) - 0.76;  
y_tape_centered = coords_tape(2, :) + 6.9;  

% Step 9: Draw the tape in gray color
fill(x_tape_centered, y_tape_centered, [0.7 0.7 0.7], 'EdgeColor', 'none');  % Gray tape color

axis([-6 6 0 12]);
axis off;
hold off;
