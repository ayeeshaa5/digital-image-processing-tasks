A = imread('lowcontrast.jfif');
[r, c] = size(A);
rmin = min(min(A));
rmax = max(max(A));
diff = rmax - rmin;

B = zeros(r, c, 'uint8');

for i = 1:r
    for j = 1:c
        B(i, j) = ((A(i, j) - rmin/ (rmax-rmin)) * 255);
    end
end

figure;
imshow(B, []);