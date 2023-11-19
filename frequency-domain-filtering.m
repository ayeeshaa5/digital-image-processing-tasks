% Load your image
image = imread('img.jpg');

% Convert the image to grayscale if it's not already in grayscale
if size(image, 3) == 3
    image = rgb2gray(image);
end

% Perform the 2D Fast Fourier Transform (FFT)
fft_image = fft2(double(image));

% Shift the zero frequency components to the center
fft_image = fftshift(fft_image);

% Define the dimensions of the frequency domain image
[M, N] = size(fft_image);

% Define the rmin and rmax values (radius values)
rmin = 10; % Minimum radius
rmax = 50; % Maximum radius

% Create a filter mask to allow only the specified frequency components
filter_mask = zeros(M, N);

% Calculate the center of the frequency domain
center_x = M / 2;
center_y = N / 2;

% Create the filter mask
for x = 1:M
    for y = 1:N
        distance = sqrt((x - center_x)^2 + (y - center_y)^2);
        if (distance >= rmin && distance <= rmax)
            filter_mask(x, y) = 1; % Allow this frequency component
        end
    end
end

% Apply the filter to the frequency domain image
filtered_fft_image = fft_image .* filter_mask;

% Shift the zero frequency components back to their original position
filtered_fft_image = ifftshift(filtered_fft_image);

% Perform the inverse FFT to obtain the filtered image
filtered_image = ifft2(filtered_fft_image);

% Display the filtered image
imshow(uint8(abs(filtered_image)), []);
