% Read the image
A = double(imread('lowContrast.jpg'));
% Get the size of the image
[r, c] = size(A);

% Find the minimum and maximum intensity values
rmin = min(min(A));
rmax = max(max(A));

% Compute the intensity difference
diff = rmax - rmin;

% Adjust the contrast of the image
B = uint8((double(A) - rmin) / diff * 255);

% Display the original and adjusted images
figure;
subplot(2, 2, 1);
imshow(A);
title('Original Image');

subplot(2, 2, 2);
imshow(B, []);
title('Adjusted Image');

% Plot the histogram of the original image
subplot(2, 2, 3);
histogram(A(:), 'BinLimits', [0, 255], 'Normalization', 'probability');
title('Histogram of Original Image');
xlabel('Intensity Levels');
ylabel('Probability');

% Plot the histogram of the adjusted image
subplot(2, 2, 4);
histogram(B(:), 'BinLimits', [0, 255], 'Normalization', 'probability');
title('Histogram of Adjusted Image');
xlabel('Intensity Levels');
ylabel('Probability');
