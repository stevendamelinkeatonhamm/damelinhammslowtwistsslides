function [Y,R,T] = Generate1Motion(numPoints,numFrames,numRTs)

%Function generates motion for numPoints features on a single rigid object
%(the unit cube) for a video lasting for numFrames frames. The point cloud
%undergoes numRTs Rotation + Translations evenly divided over the frames.
%The resulting data matrix Y consists of columns which are the "trajectory"
%vectors of the initial point cloud and its motion over time.

% Generate numPoints points in 3-D
x = rand(3,numPoints);

%Check number of rotations/translations
if (numRTs > numFrames)
    disp('Error, number of Rotations + Translations must be at most the number of Frames');
end
%Captures how many frames each R+T lasts; it happens uniformly, except that
%if numFrames/numRTs is not an integer, then any extra is put at the final
%R_T
lengthRT = round(numFrames/numRTs);

%Generate numRotations 3-D Rotation matrices based on the Quaternion representation of
%SO(3)
for i=1:numRTs
    Theta{i} = RotationMatrix(quaternion.randRot(1));
    t{i} = .1*rand(3,1);
end

%Projection matrix which selects the first two rows of a matrix
P = [1 0 0; 0 1 0];

%Initial 3-D point cloud x is allowed to evolve over time according to the
%rigid motion described by Theta*(\dot)+t.  Below corresponds to taking
%a video consisting of numFrames still images.  The "trajectory vectors"
%corresponding to the motion of the feature points over time are the
%columns of Y.
Y = P*x;
x2 = x;
for i = 1:(numFrames-1)
    j = min(ceil(i/lengthRT),numRTs);
    x2 = Theta{j}*x2+t{j};
    Y = [Y; P*x2];
end

R = Theta;
T = t;

end

