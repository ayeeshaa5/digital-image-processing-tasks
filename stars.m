n=3;
fname=floor(n/2);
A=imread('stars.jpg');%add image path
[R,C]=size(A);
B=zeros(R,C);
for i=1+fname:1:R-fname
    for j=1+fname:1:R-fname
        myN=A(i-fname:i+fname, j-fname:j+fname);
        myNR= reshape(myN,1,[]);
        myNRS=sum(myNR);
        myValue=myNRS/(2*fname+1)^2;
        B(i,j)=myValue;
    end
end

for i=1:1:R
    for j=1:1:C
        if(B(i,j)<127)
            B(i,j)=0;
        else 
            B(i,j)=255;
        end
    end
end
figure;
imshow(B,[]);
            
            