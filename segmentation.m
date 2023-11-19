
originalImage = imread('img.jpg');

if size(originalImage, 3) == 3
    grayImage = rgb2gray(originalImage);
else
    grayImage = double(originalImage);
end

blurredImage = imgaussfilt(grayImage, 2);

threshold = 0.5;  
binaryImage = double(blurredImage > threshold);

binaryImage = cast(binaryImage, class(grayImage));

segmentedImage = grayImage .* binaryImage;

figure;
subplot(2, 2, 1), imshow(originalImage), title('Original Image');
subplot(2, 2, 2), imshow(blurredImage, []), title('Blurred Image');
subplot(2, 2, 3), imshow(binaryImage, []), title('Binary Image');
subplot(2, 2, 4), imshow(segmentedImage, []), title('Segmented Image');
