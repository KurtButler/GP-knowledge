function [y_pred,y_std,G_scores] = knowledge(gp,X_pred)
%KNOWLEDGE compute variance reduction knowledge scores for GPR
%   23 June 2025
%   
%   Compute the variance reduction GP knowledge score for GP kernels
%   available in Matlab's GP toolbox.

% Compute raw GPR predictions
[y_pred,y_std] = predict(gp,X_pred);

% Compute knowledge scores
G_scores = 1- ((y_std).^2  - gp.Sigma^2)/gp.KernelInformation.KernelParameters(end).^2;
end

