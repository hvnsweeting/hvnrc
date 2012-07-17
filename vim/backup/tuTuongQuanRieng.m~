%By FamiHug at FAMILUG.com  Sun Dec 11 22:14:44 ICT 2011
function [diagva] = tuTuongQuanRieng(vr, h)
%Cho vector dau vao la cac tu tuong quan mau, 
%Tra ve vector a chua tu tuong quan rieng thu 1 - > thu k.
clc; close all; 
format;
h = h - 1; %Do cong thuc tinh a(k+1, k+1) nen neu giu nguyen h, ta se thu kq ah+1h+1

vr = [0.81 0.43 0.07 -0.17 -0.27 -0.21 -0.04 0.16 0.23 0.31]
n = size(vr, 2);
va = zeros(h + 1, h + 1);
va(1, 1) = vr(1, 1); %k = 0

for k=1:h
	va(k + 1, k + 1) = (vr(1, k + 1) - sum(vr(1, 1:k) .* va(k, k:-1:1))) / (1 - sum(vr(1, 1:k) .* va(k, 1:k)));
	va(k + 1, 1:k) = va(k, 1:k) - va(k + 1, k + 1) .* va(k, k:-1:1);
end

disp(va);
diagva = diag(va);
end
