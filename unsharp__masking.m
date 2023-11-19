% Define the filter kernel
custom_filter = [1 0 0 0 1; 0 1 1 1 0; 0 1 1 1 0; 0 1 1 1 0; 1 0 0 0 1];
custom_filter1 = [-1 0 1; -1 0 1;-1 0 1];
custom_filter2 = [-1 -1 -1; 0 0 0;1 1 1];
custom_filter3 = [1 -2 -1; 1 -2 -1;1 -2 -1];
custom_filter5 = 1/9*(eye(9));

eye9=eye(9);
% Load your image
image = imread('C:\Users\HP\Pictures\Saved Pictures\img1.jfif');
image1= imread('img.jpg');
image2= imread('myimg.jpeg');

% Apply the filter to the image
filtered_image = imfilter(image, custom_filter5);

% Display the filtered image
imshow(filtered_image);
