%by FamiHug at FAMILUG.com
function nghiem = phuongPhapLapDon(A, b, time)
%Dau vao la ma tran A, vecto b, so lan lap.
%Dau ra la nghiem cua bai toan nhan duoc sau so lan lap nhap vao

%Comment dong nay de co the tinh bai toan nhap tu ngoai
A = [4 0.24 -0.08; 0.09 3 -0.15; 0.04 -0.08 4]
b = [8 9 20]'

%Khoi tao nghiem can tra ve
nghiem = zeros(size(b));

%m - so hang, n - so cot
m = size(A, 1);
n = size(A, 2);

Beta = b;
for i=1:size(A,1)
	Beta(i,1) = b(i,1) ./ (A(i,i));
	A(i,:) ./= A(i,i);
end

Alpha = eye(size(A)) - A
Beta = Beta
temp = abs(Alpha);

%Tim chuan hang
vectorChuanHang = sum(temp,2)
chuanHang = max(vectorChuanHang)

X0 = zeros(m, 1);
X = X0;
if chuanHang < 1
	for i=1:time
		fprintf('Lap lan thu %d\n', i)
		X = Alpha * X + Beta
	end
end

nghiem = X;
end
