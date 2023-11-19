% Load your image
image = imread('img.jpg');

% Convert the image to grayscale if it's not already in grayscale
if size(image, 3) == 3
    image = rgb2gray(image);
end

% Calculate the histogram of gray levels
histogram = imhist(image);

% Calculate the probability distribution
total_pixels = numel(image);
probability_distribution = histogram / total_pixels;

% Plot the probability distribution
figure;
bar(0:255, probability_distribution);
title('Probability Distribution of Gray Levels');
xlabel('Gray Level');
ylabel('Probability');

% Enhance the image using histogram equalization
enhanced_image = histeq(image);

% Display the enhanced image
figure;
imshow(enhanced_image);
title('Enhanced Image');

% Calculate the histogram of the enhanced image
enhanced_histogram = imhist(enhanced_image);

% Plot the histogram of the enhanced image
figure;
bar(0:255, enhanced_histogram);
title('Histogram of Enhanced Image');
xlabel('Gray Level');
ylabel('Frequency');
