%% Import the Base Image
Base = imread('cover.jpg');
figure, imshow(Base);
title('Base Image');

%% Import the Message Image
Message = imread('hide.jpg');

%% Resize the message and base image to the same size
Message = imresize(Message, [size(Base, 1), size(Base, 2)]);

%% Extract the 7th and 8th bits from the Message image
Bit7 = bitget(Message(:,:,1), 7);
Bit8 = bitget(Message(:,:,1), 8);

%% Set the 1st and 2nd bits of the New image with the extracted bits
New = Base;
New(:,:,1) = bitset(New(:,:,1), 1, Bit8);
New(:,:,1) = bitset(New(:,:,1), 2, Bit7);

%% Save the Image file
figure, imshow(New);
title('Image with hidden message');
figure, imshowpair(Base, New, 'montage');
title('Base image & Encrypted Image (from left)');

imwrite(New, 'MsgIm.bmp');
