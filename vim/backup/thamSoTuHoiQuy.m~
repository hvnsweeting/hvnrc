function [va] = thamSoTuHoiQuy(vr, p)
vr = [0.81 0.43 0.07 -0.17 -0.27]
vr = vr(1,1:p)
n = size(vr, 2);

%Tao matran toeplit
R = eye(n, n);
for i=1:n
	R(i, i+1:n) = vr(1, 1:n-i);
end
temp = triu(R, 1)';
R += temp

va = R \ vr'; %Giai he Yule-Walker
end

