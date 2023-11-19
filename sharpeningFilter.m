n = 3;
fname = floor(n/2);
A = imread('img.jpg');
[R, C, D] = size(A);
B = zeros(R, C, D);

% Step 1: Calculate the average using a moving window
for i = 1 + fname : 1 : R - fname
    for j = 1 + fname : 1 : C - fname
        for k = 1:D
            myN = A(i-fname:i+fname, j-fname:j+fname, k);
            myNR = reshape(myN, 1, []);
            myNRS = sum(myNR);
            myvalue = myNRS / (2 * fname + 1)^2;
            B(i, j, k) = myvalue;
        end
    end
end

% Step 2: Apply sharpening filter by convolution for each channel
sharpeningKernel = [0, -1, 0; -1, 5, -1; 0, -1, 0];

sharpenedImage = zeros(size(B));

for k = 1:D
    sharpenedImage(:,:,k) = conv2(B(:,:,k), sharpeningKernel, 'same');
end

% Clip values to the valid range [0, 255]
sharpenedImage = min(max(sharpenedImage, 0), 255);

% Display the results
figure;
subplot(1, 3, 1), imshow(A), title('Original Image');
subplot(1, 3, 2), imshow(uint8(B)), title('Averaged Image');
subplot(1, 3, 3), imshow(uint8(sharpenedImage)), title('Sharpened Image');
