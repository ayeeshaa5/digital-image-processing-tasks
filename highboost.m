n = 5;
siz = floor(n/2);
A = double(rgb2gray(imread('download.jpg')));  % Convert A to double
figure;
imshow(uint8(A));  % Display as uint8

[R, C] = size(A);
B = zeros(R, C);

% Apply blur
for i = 1+siz:R-siz
    for j = 1+siz:C-siz
        myImage = A(i-siz:i+siz, j-siz:j+siz);
        myValue = sum(myImage(:)) / (n^2);  % Simple average blur
        B(i, j) = myValue;
    end
end

figure;
imshow(uint8(B));  % Display as uint8

% Adjust the loop ranges to avoid modifying the borders
for i = 1:siz
    B(i, :) = B(siz+1, :);
    B(R-i+1, :) = B(R-siz, :);
    B(:, i) = B(:, siz+1);
    B(:, C-i+1) = B(:, C-siz);
end

% Subtract blurred image from the original for sharpening
C = (2.*A) - B;
%C = A.*B;



% Display the sharpened image
figure;
imshow(uint8(C));  % Convert back to uint8 for display
