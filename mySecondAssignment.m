function mySecondAssignment(filename, n)
    % Initialize path
    path = filename;
    
    % Read the image
    originalImage = imread(path);
    figure; imshow(originalImage);
    
    % Check if image is RGB, then convert it to grayscale; otherwise, double it
    if size(originalImage, 3) == 3
        grayImage = rgb2gray(originalImage);
    else
        grayImage = double(originalImage);
    end
    
    % Apply salt and pepper noise
    noisyImage = imnoise(grayImage, 'salt & pepper',0.05);
    
    % Display the noisy image
    figure;
    subplot(1, 1, 1), imshow(noisyImage, []), title('Noisy Image');
    
    % Averaging filter
    fname = floor(n/2);
    [R, C] = size(noisyImage);
    averagedImage = zeros(R, C);
    
    for i = 1 + fname:1:R - fname
        for j = 1 + fname:1:C - fname
            myN = noisyImage(i - fname:i + fname, j - fname:j + fname);
            myNR = reshape(myN, 1, []);
            myNRS = sum(myNR);
            myvalue = myNRS / (2 * fname + 1)^2;
            averagedImage(i, j) = myvalue;
        end
    end
    
    % Display the averaged image
    figure;
    subplot(1, 1, 1), imshow(averagedImage, []), title('Averaged Image');
    
    % Save the averaged filter image to a directory
    
    saveas(gcf,'denoisedimage_averaging.bmp'); 
    
    % Median filter
    medianFilterImage = zeros(R, C);
    
    for i = 1 + fname : 1 : R - fname
        for j = 1 + fname : 1 : C - fname
            myN = noisyImage(i-fname:i+fname, j-fname:j+fname);
            medianValue = median(myN(:));
            medianFilterImage(i, j) = medianValue;
        end
    end
    
    
    % Display the median filtered image
    figure;
    subplot(1, 1, 1), imshow(medianFilterImage, []), title('Median Filtered Image');
    
    % Save the median filter image to a directory
    saveas(gcf,'denoisedimage_median.bmp'); 
end
