function [Y,R,T] = GenerateMotions(numPoints,numFrames,numRTs)

%Note: numPoints must be a vector with integer entries
numMotions = length(numPoints);

%Function generates motion for numPoints features on numMotions rigid
%objects for a video lasting for numFrames frames. The point cloud
%undergoes numRTs Rotation + Translations evenly divided over the frames.
%The resulting data matrix Y consists of columns which are the "trajectory"
%vectors of the initial point cloud and its motion over time.

% Generate numPoints points in 3-D. 
x{1} = rand(3,numPoints(1));
try
    for i = 2:numMotions
        x{i} = (i-1)*10*(randi([0,1])*2-1)*rand(3,numPoints(i));
    end
catch
    disp('Only one motion detected');
end
%Check number of rotations/translations
if (numRTs > numFrames)
    disp('Error, number of Rotations + Translations must be at most the number of Frames');
end
%lengthRT captures how many frames each R+T lasts; it happens uniformly, except that
%if numFrames/numRTs is not an integer, then any extra is put at the final
%R_T
lengthRT = round(numFrames/numRTs);

%Generate numRotations 3-D Rotation matrices based on the Quaternion representation of
%SO(3)
for i=1:numMotions
    for j = 1:numRTs
        Theta{i,j} = RotationMatrix(quaternion.randRot(1));
        t{i,j} = .1*rand(3,1);
    end
end

%Projection matrix which selects the first two rows of a matrix
P = [1 0 0; 0 1 0];

%Initial 3-D point cloud x is allowed to evolve over time according to the
%rigid motion described by Theta*(\dot)+t.  Below corresponds to taking
%a video consisting of numFrames still images.  The "trajectory vectors"
%corresponding to the motion of the feature points over time are the
%columns of Y.

for i = 1:numMotions
    Yaux{i} = P*x{i};
    temp{i} = x{i};
    for k = 1:(numFrames-1)
        j = min(ceil(k/lengthRT),numRTs);
        temp{i} = Theta{i,j}*temp{i}+t{i,j};
        Yaux{i} = [Yaux{i}; P*temp{i}];
    end
   
end

Y = cell2mat(Yaux);

R = Theta;
T = t;

end