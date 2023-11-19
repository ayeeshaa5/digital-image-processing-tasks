% Load your image
image = imread('img.jpg');
lap=[-1 -1 -1 ; -1 8 -1 ; -1 -1 -1];
[r,c]=size(image);
b=zeros(r,c);
filteri=imfilter(image,lap);
imshow(filteri);

        