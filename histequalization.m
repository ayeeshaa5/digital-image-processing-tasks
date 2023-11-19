% Read and display the image
original_image_gray = imread('lowContrast.jpg');
figure;
imshow(original_image);
title('Original Image');

% Convert to grayscale and double precision
%original_image_gray = rgb2gray(original_image);



% Calculate histogram
[numPixels, grayLevels] = imhist(original_image_gray);

pdf = numPixels / sum(numPixels);
cdf = cumsum(pdf);

% Perform histogram equalization
new_intensity = uint8(255 * cdf);
equalized_image = zeros(size(original_image_gray));

for i = 1:size(original_image_gray, 1)
    for j = 1:size(original_image_gray, 2)
        equalized_image(i, j) = new_intensity(original_image_gray(i, j) + 1);
    end
end

% Display equalized image
figure;
imshow(equalized_image);
title('Equalized Image');

% Plot histograms and CDF
figure;
subplot(2,2,1);
bar(grayLevels, pdf);
title('Original Image Histogram');
xlabel('Intensity Levels');
ylabel('Probability');

% Normalized histogram
subplot(2,2,2);
bar(grayLevels, pdf, 'BarWidth', 1);
title('Normalized Histogram');
xlabel('Intensity Levels');
ylabel('Normalized Probability');
ylim([0, 1]);

% Enable hold for the current axes
hold on;

% CDF graph
subplot(2,1,2);
plot(grayLevels, cdf);
title('CDF of Original Image');
xlabel('Intensity Levels');
ylabel('CDF');
xlim([0, 255]);
ylim([0, 1]);

% Connect corresponding points with a line
plot(grayLevels, pdf, 'r--');  % Adjust the line style and color as needed

% Disable hold to prevent further additions to the current axes hold off;

