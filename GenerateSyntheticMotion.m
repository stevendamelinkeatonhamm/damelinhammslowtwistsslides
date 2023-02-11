% Generate numPoints points in 3-D
numPoints = 100;
x = rand(3,numPoints);

%Generate a 3-D Rotation matrix based on the Quaternion representation of
%SO(3)
q1 = quaternion.randRot(1);
q2 = quaternion.randRot(1);
Theta = RotationMatrix(q1);
Theta2 = RotationMatrix(q2);
%Theta = eye(3);

%Generate a Translation vector in 3-D
t = .05*rand(3,1);
t2 = .1*rand(3,1);
%t = [0; 0; 0];

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
for i = 1:numFrames
    x2 = Theta*x2+t;
    Y = [Y; P*x2];
end
%for i = numFrames/2:numFrames
%    x2 = Theta2*x2+t2;
%    Y = [Y; P*x2];
%end

%Display the rank of the generated synthetic data
disp(rank(Y));


%% Notes:
%For testing, if the line Theta = eye(3); is uncommented (i.e. no rotation
%is used), then rank(Y)=3.

%If the line t = [0; 0; 0]; is uncommented (i.e. no translation is used),
%then rank(Y)=3;

%If both are uncommented (still motion), then rank(Y)=2 as expected since
%then Y corresponds to feature points that do not move at all over the
%frames
    