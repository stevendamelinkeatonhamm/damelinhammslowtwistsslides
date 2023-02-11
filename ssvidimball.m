function [idim, SSV, dataSSV, dense] = ssvidimball(data, poi, scales, varargin)
%========================================================================== 
% Syntax
%       [idim, SSV, dataSSV, dense] = ssvidimball(data, poi, scales)
%       [idim, SSV, dataSSV, dense] = ssvidimball(data, poi, scales, varargin)
%
% ssvidimball -- Squared Singular Value Intrinsic DIMension using eps-BALLS
%       This function computes the Intrinsic Dimension and Squared Singular 
%       Value Energy function (SSV) obtained by summing the squared 
%       normalized singular values for each ball of radius 2^(s) where s is
%       specified in the scale range vector. The matrix dataSSV defines the
%       graph of the function. The SSV contribution for a ball is not 
%       computed if the ball has < cuttoff pts.   
%==========================================================================
% Inputs: 
%       data    - m x n matrix: rows are the data points.
%       poi     - p x n matrix: rows points of interest, subset of data.
%       scales  - vector that specifies scale range. SVD is computed for
%                 balls of radius 2^s, where s in scales
%       cutoff  - scalar, minimum number of points in each ball. The SSV 
%                 contribution for a ball is not computed if the ball has 
%                 < cuttoff pts. The default value is 10. 
% 
% Outputs:   
%       idim    - intrinsic dimension for each point in poi. 
%       SSV 	- sum of squared eigenvalues of each ball across scales
%       dataSSV - m x n+1 matrix [data,SSV].
%       dense   - index vector indicating which data points have > cutoff
%                 balls at all points in the scale range.
%
% Example: The following command compute the intrinsic dimension for each
% point so poi = data for the specified set of scales.
%
% W = bugGenerateRandomSubspaceDataFast(3, [1 2], [1000, 1000]);
% scales = [4:-.05:1.5]; 
% idim = ssvidimball(W', W', scales);
% figure; scatter3(W(1,:),W(2,:),W(3,:),3,idim);
%
%==========================================================================
% Reference : Peter Jones & Linda Ness [cite]
% Author   	: P. Medina
% Created	: July 17, 2017 at WiSDM
% Revised	: July 18, 2017 by L. Ness (input cutoff and compute dense)
%             July 19, 2017 by K. Yacoubou Djima (cleanup and optimization)
%             May 29, 2019 by KYD
%==========================================================================

% Check if cutoff value if given
c = length(varargin);
if c > 1
	cutoff = varargin{1};
else
    cutoff = 1;
end

thres = .95;

% Declare sizes and initialize matrices and parameters
[n, ~] = size(poi);
SSV = zeros(n,1);
dense = ones(n,1);
balls = cell(n,length(scales));
kintdim = ones(n,length(scales));

% Normalize data 
ndata = normalize(data); % normalized data
npoi = normalize(poi);   % points of interest

% Compute SVD and SSV energy
for s = 1:length(scales)
    r = 2^(-scales(s));
    [idx, ~] = rangesearch(ndata, npoi, r);
    for i = 1:n    
       p = npoi(i,:);
       balls{i,s} = ndata(idx{i},:);
       B = balls{i,s};
       if size(B,1) > cutoff
         BN = (B - ones(size(B,1),1)*p)/r   ; %% r=2^{-s} %%
         S = svd(BN);
         SSV(i) = SSV(i) + sum(S.^2);
         % Intrinsic Dimension Computation        
       l = 1;
       totS = sum(S.^2);
       E = S(1,1).^2/totS;
       while E <= thres
             kintdim(i,s) = l;
             E = sum(S(1:l).^2)/totS;
             l = l + 1;  
       end
       else
           dense(i,1) = 0;
       end
    end    
end


% Compute intrinsic dimension by taking the mean over eps-balls
idim = round(mean(kintdim,2));


% Format data for output
dataSSV  = [poi,SSV];

% Subroutine NORMALIZE
function xx = normalize(X)
% This subroutine centers the data about it means and put all points
% in a unit ball

[t,~] = size(X);
MEAN = mean(X);
%size(MEAN)
%Xmean = zeros(1,length(MEAN));
%for m = 1:length(MEAN)
%    Xmean(1,m) = MEAN(m);
%end
%xmean = MEAN(:,1);
%ymean = MEAN(:,2);
%zmean = MEAN(:,3);

% Center data around mean
means = ones(t,1)*MEAN;
cent_data = X - means;
maxnorm = max(sqrt(sum(cent_data.^2,2)));

% Put data in unit ball
xx = cent_data/maxnorm;
end


end