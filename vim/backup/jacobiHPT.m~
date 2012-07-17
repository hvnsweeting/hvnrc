%by FamiHug at FAMILUG.com tested on Octave 3.4.2
function nghiem = jacobiHPT(A, b, k)
%Giai HPT bang phuong phap Jacobi
%Ax = b
%x = Bx + g

%Dat do chinh xac mac dinh
format

%Comment 2 dong duoi de co the nhap ma tran tu ngoai vao
A = [4 0.24 -0.08; 0.09 3 -0.15; 0.04 -0.08 4]
b = [8 9 20]'

%Xap xi dau = 0
X = zeros(size(b));

duongcheo = diag(A)
A = A - diag(duongcheo) %diag(diag(A)) = ma tran chi chua duong cheo cua A

%Dat do chinh xac 7 chu so sau dau phay
output_precision(8) 

%Giai bang pp Jacobi
for i=1:k
	printf('Lan lap thu %d\n', i);
	X = (b - A * X) ./ duongcheo
end

nghiem = X;
end
