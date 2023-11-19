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

% Calculate the magnitude and scale it for visualization
magnitude = abs(fft_image);
magnitude = log(1 + magnitude); % Apply a logarithmic scale for better visualization

% Display the magnitude of the frequency domain image
imshow(magnitude, []);
