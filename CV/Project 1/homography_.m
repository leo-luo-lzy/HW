function H = homography_(Pt2,Pt1)
n = size(Pt1,1);
disp('Pt1')
disp(Pt1)
disp('Pt2')
disp(Pt2)
disp('n')
disp(n)
mean1 = mean(Pt1);
disp('mean1')
disp(mean1)
mean2 = mean(Pt2);
disp('mean2')
disp(mean2)
Temp1 = Pt1 - repmat(mean1,n,1);
disp('Temp1')
disp(Temp1)
Temp2 = Pt2 - repmat(mean2,n,1);
disp('Temp2')
disp(Temp2)
Temp1 = sqrt(sum(Temp1.^2,2));
disp('Temp1')
disp(Temp1)
Temp2 = sqrt(sum(Temp2.^2,2));
disp('Temp2')
disp(Temp2)
s1 = n*sqrt(2)/sum(Temp1,1);
disp('s1')
disp(s1)
s2 = n*sqrt(2)/sum(Temp2,1);
disp('s2')
disp(s2)
t1xy = -s1*mean1;
t2xy = -s2*mean2;

T1 = [s1 0 t1xy(1);0 s1 t1xy(2);0 0 1];
disp('T1')
disp(T1)

T2 = [s2 0 t2xy(1);0 s2 t2xy(2);0 0 1];
disp('T2')
disp(T2)
TPt1 = zeros(n,2);
TPt2 = zeros(n,2);
for(i=1:n)
    Temp = T1*[Pt1(i,:)';1];
    TPt1(i,:) = Temp(1:2)';
    Temp = T2*[Pt2(i,:)';1];
    TPt2(i,:) = Temp(1:2)';
end
A = zeros(2*n,9);
for(i=1:n)
    A(2*i-1:2*i,:)=...
        [TPt2(i,:) 1 0 0 0 -TPt1(i,1)*[TPt2(i,:) 1];...
0 0 0 TPt2(i,:) 1 -TPt1(i,2)*[TPt2(i,:) 1]];
end
disp('A')
disp(A)
[U S V] = svd(A);
disp('V')
disp(V)
h = V(:,end);
H_hat = reshape(h,[3 3]);
err=norm(A-U*S*V')/norm(A)
disp('H_hat')
disp(H_hat)
H_hat = H_hat';
H = T1\H_hat*T2;
end