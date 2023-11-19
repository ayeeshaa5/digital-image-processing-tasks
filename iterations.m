n = 3;
fname = floor(n/2);
A=imread('C:\Users\HP\Pictures\Saved Pictures\stars.jpg');
[R,C] = size(A);
num_iterations = 200;

for i = 1:num_iterations
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
    A = B;
end
 figure;
imshow(B,[]);
