n=3;
fname=floor(n/2);
a=imread('img.jpg');
[r,c]=size(a);
b=zeros(r,c);
for i=1+fname:1:r-fname
    for j=1+fname:1:c-fname
        myN= a(i-fname:i+fname,j-fname:j+fname);
        minValue=min(myN(:));
        b(i,j)=minValue;
    end
end
figure;
subplot(1,2,1),imshow(a,[]),title('original');
subplot(1,2,2),imshow(b,[]),title('filtered image of min filter');

