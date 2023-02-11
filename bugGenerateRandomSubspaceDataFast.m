
% this function is meant to replace the object oriented bugGenerateRandomSubspaceData function
% this one performes much faster for generating large number of data
% Returns the data matrix W, ground truth vector G, and a cell array
% containing basis and corresponding data in the subspace defined by this
% basis such that S(i) = {[basis], [data]}, for example S{1}{1} returns the
% basis of the first subspace, S{1}{2} returns the data in the first
% subspace and so on...
% a sample usage is W = bugGenerateRandomSubspaceDataFast(3, [1 2], [50, 50])
% here 50 points are generated on a line and plane each which live in R3
%
% a.b. koku - 31.05.2016  - bugra.koku at gmail


function [W, G, S]= bugGenerateRandomSubspaceDataFast(AmbientDim, SubSpaceDim, NumData, normal_data)

    % if user prefers normal distribution, s/he should indicate, otherwise
    % default value is false, hence uniform distribution is used in
    % generating data
    if(exist('normal_data','var')==0)
        normal_data = false;
    end 
    
    S{1} = { [0], [0]}; % everything: basis vectors and data
    W = []; % data matrix
    G = []; % ground truth in case this will data will be used in clustering

    for i=1:length(SubSpaceDim)
        % create basis vectors for the current subspace
        basis = orth(rand(AmbientDim,SubSpaceDim(i)));
        % add data to the subspace via normal or uniform distribution
        if normal_data
            Wi = basis* (2* randn(SubSpaceDim(i),NumData(i)) - 1);
        else
            Wi = basis* (2* rand(SubSpaceDim(i),NumData(i)) - 1);
        end         
        % concatanate data in different subspaces
        W=[W Wi];
        
        G=[G i*ones(1,NumData(i))];
        S{i} = {[basis], [Wi]};
    end
end