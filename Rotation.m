function Theta = Rotation(a,b,c,d)
%Input are scalar parameters a,b,c,d such that a^2+b^2+c^2+d^2 = 1
%Output is a 3x3 general rotation matrix Theta
Theta = [a^2+b^2-c^2-d^2 2*b*c-2*a*d 2*b*d+2*a*c; 2*b*c+2*a*d a^2-b^2+c^2-d^2  2*c*d-2*a*b; 2*b*d-2*a*c 2*c*d+2*a*b a^2-b^2-c^2+d^2];
end

