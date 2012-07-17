%by FamiHug at FAMILUG.com tested on Octave 3.2.4
function nghiem = lapSeidelHPT(A, b, times) 
%Giai HPT A=b bang phuong phap lap Seidel, tra ve nghiem sau times lan lap

%format output precision
format %set to default
%Ma tran nhap san de tien cho tinh toan
A = [4 0.24 -0.08; 0.09 3 -0.15; 0.04 -0.08 4]
b = [8 9 20]'

%Khoi tao Alpha, Beta
Alpha = zeros(size(A));
Beta = zeros(size(b));

%Tao 1 so bien huu ich
n = size(Beta, 1)

%Tinh Alpha,Beta
for i=1:size(A,2)
	Alpha(i,:) = A(i,:) ./ A(i,i);
	Beta(i) = b(i) ./ A(i,i);
end

Alpha = eye(size(A)) - Alpha

%Tach alpha thanh 1 matran tam giac duoi Alpha1(ko chua diag) va matran tam giac tren Alpha2
Alpha1 = tril(Alpha,-1) %triangular lower
Alpha2 = triu(Alpha) % triangular upper

%Khoi tao gia tri nghiem can tra ve
nghiem = zeros(size(b));

%Chon xap xi dau X0 = Beta
X = Beta

%chinh xac toi 7 chu so sau dau phay
output_precision(8)

%Lap Seidel - forward substitution
for i=1:times
	for j=1:n
		X(j) = (Alpha1(j, :) * X) + Alpha2(j,:) * X + Beta(j);
	end
	fprintf('Sau %d lan lap : \n', i)
	disp(X)
end

nghiem = X;
end

