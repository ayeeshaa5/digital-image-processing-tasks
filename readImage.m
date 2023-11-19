%% Import the image with hidden message
Im = imread('MsgIm.bmp');
imshow(Im, [0, 3]);

%% Extract the 1st and 2nd bits of Im
Bit1 = bitget(Im(:,:,1), 1);
Bit2 = bitget(Im(:,:,1), 2);

%% Combine both bits into a single image
CombinedBits = Bit1 + (Bit2 * 2);  % Combine 1st and 2nd bits

%% Display the combined bits
imshow(CombinedBits, [0, 3]);
title('1st and 2nd Bits');
