% Generate numPoints points in 3-D
numPoints = 50;
x = rand(3,numPoints);
y = rand(3,numPoints)+[10;10;10];

%Generate a 3-D Rotation matrix based on the Quaternion representation of
%SO(3)
a = .25;  b = .25;  c = .5;  d = sqrt(1-a^2-b^2-c^2);
Theta = Rotation(a, b, c, d);
a2 = .1; b2 = .7; c2 = .5; d2 = sqrt(1-a2^2-b2^2-c2^2);
Theta2 = Rotation(a2,b2,c2,d2);
%Theta = eye(3);
%Theta2=eye(3);

%Generate a Translation vector in 3-D
t = .05*rand(3,1);
t2 = .05*rand(3,1);
%t = [0; 0; 0];
%t2 = [0;0;0];

%Projection matrix which selects the first two rows of a matrix
P = [1 0 0; 0 1 0];

%Initial 3-D point cloud x is allowed to evolve over time according to the
%rigid motion described by Theta*(\dot)+t.  Below corresponds to taking
%a video consisting of numFrames still images.  The "trajectory vectors"
%corresponding to the motion of the feature points over time are the
%columns of Y.
numFrames = 60;
Y = P*x;
x2 = x;
Z = P*y;
y2 = y;
for i = 1:numFrames
    x2 = Theta*x2+t;
    y2 = Theta2*y2+t2;
    Y = [Y; P*x2];
    Z = [Z; P*y2];
end

Final_Data = [Y Z];

%Display the rank of the generated synthetic data
disp(rank(Final_Data));


%% Notes:
%For testing, if you play around with the commented out lines, you will be
%able to get any rank from 4 to 8.
    