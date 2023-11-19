% Load your image
image = imread('lens.png');

% Convert the image to grayscale if it's not already in grayscale
if size(image, 3) == 3
    image = rgb2gray(image);
end

% Define the Sobel kernels for horizontal and vertical edges
sobel_horizontal = [-1 -2 -1; 0 0 0; 1 2 1];
sobel_vertical = [-1 0 1; -2 0 2; -1 0 1];

% Apply the Sobel kernels using convolution
gradient_x = conv2(double(image), sobel_horizontal, 'same');
gradient_y = conv2(double(image), sobel_vertical, 'same');

% Compute the gradient magnitude
gradient_magnitude = sqrt(gradient_x.^2 + gradient_y.^2);

% Optionally, you can also compute the gradient direction
gradient_direction = atan2d(gradient_y, gradient_x);

% Display the gradient magnitude or any other results
imshow(uint8(gradient_magnitude)); % Convert to uint8 for display
