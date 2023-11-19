n = 3;
fname = floor(n/2);
A = imread('img.jpg');
[R, C] = size(A);
B = zeros(R, C);

for i = 1 + fname : 1 : R - fname
    for j = 1 + fname : 1 : C - fname
        myN = A(i-fname:i+fname, j-fname:j+fname);
        maxValue = max(myN(:));
        B(i, j) = maxValue;
    end
end

figure; imshow(B,[]);
