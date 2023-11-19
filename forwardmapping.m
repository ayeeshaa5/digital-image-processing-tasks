% Load the source image
source_image = imread('img.jpg');  % Load your source image

% Define the scaling and translation factors
scale_x = 1.5;  % Scale factor in the x-direction
scale_y = 1.5;  % Scale factor in the y-direction
translate_x = 50;  % Translation in the x-direction
translate_y = 50;  % Translation in the y-direction

% Get the size of the source image
[height, width, ~] = size(source_image);

% Calculate the size of the destination image
dest_height = round(height * scale_y);
dest_width = round(width * scale_x);

% Create a destination image filled with zeros (black)
dest_image = zeros(dest_height, dest_width, 3);  % 3 indicates it's an RGB image

% Apply forward mapping
for dest_x = 1:dest_width
    for dest_y = 1:dest_height
        % Calculate the corresponding source coordinates
        source_x = round((dest_x - translate_x) / scale_x);
        source_y = round((dest_y - translate_y) / scale_y);

        % Check if the source coordinates are within the source image bounds
        if source_x >= 1 && source_x <= width && source_y >= 1 && source_y <= height
            % Copy the pixel from the source image to the destination image
            dest_image(dest_y, dest_x, :) = source_image(source_y, source_x, :);
        end
    end
end

% Display the destination image
imshow(uint8(dest_image));
