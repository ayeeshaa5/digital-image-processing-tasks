a=imread('C:\Users\HP\Pictures\Saved Pictures\imagef.jpeg');
%convert colored image to gray else doule it
if size(a,3)==3
    b=rgb2gray(a);
else
    b=double(a);
end
filter=5;
sigma=1;
gaussianFilter=fspecial('gaussian', filter,sigma);
gaussianFilter=gaussianFilter/sum(gaussianFilter(:));
filterImage=conv2(b, gaussianFilter,'same');
figure;
subplot(1,2,1), imshow(b,[]),title('original');
subplot(1,2,2),imshow(filterImage,[]),title('fitered');
