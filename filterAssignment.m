n = 3;
fname = floor(n/2);
A = imread('img.jpg');
[R,C] = size(A);
B = zeros(R,C);

for i=1+fname:1:R-fname
    for j=1+fname:1:R-fname
        myN = A(i-fname:i+fname,j-fname:j+fname);
        myNR = reshape(myN,1, []);
        myNRS = sum(myNR);
        myvalue = myNRS/(2 * fname + 1)^2;
        B(i,j) = myvalue;
    end
end
figure;
imshow(B,[]);

lap=[0 0 0; 0 1 0 ; 0 0 0];
filteri=imfilter(B,lap);
imshow(filteri);



