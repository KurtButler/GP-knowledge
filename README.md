# Trustworthy Prediction with Gaussian Process Knowledge Scores
This repository contains the code for our project on Gaussian process knowledge scores, which was accepted for publication at [EUSIPCO 2025](https://eusipco2025.org/). Knowledges scores are a new technique to quantify the confidence of a Bayesian model's predictions. You can find more information in our article preprint. 

> Probabilistic models are often used to make predictions in regions of the data space where no observations are available, but it is not always clear whether such predictions are well-informed by previously seen data. In this paper, we propose a knowledge score for predictions from Gaussian process regression (GPR) models that quantifies the extent to which observing data have reduced our uncertainty about a prediction. The knowledge score is interpretable and naturally bounded between 0 and 1. We demonstrate in several experiments that the knowledge score can  anticipate when predictions from a GPR model are accurate, and that this anticipation improves performance in tasks such as anomaly detection, extrapolation, and missing data imputation.

## Description
This repository contains Matlab code that implements knowledge score analysis for Gaussian process regression (GPR) models. Our main contribution is a simple function, `knowledge(gp,X)`, that computes knowledge scores for the GPR model `gp` for each location in the matrix `X` alongside the predictive mean and standard deviation. Computing predictions using this function calls the `predict(gp,X)` function that is native to Matlab, and then additionally computes the variance reduction scores for each prediction.

A minimal demo
```matlab
%% Generate data
% Training data
X_train = rand(15,1);
y_train = X_train + 0.1*randn(15,1);

% Test data
X_pred= linspace(0,2,30)';

%% Train model and compute predictions
% Fit GPR model 
gp = fitrgp(X_train,y_train);

% Make predictions
[y_pred,y_std,G_scores] = knowledge(gp,X_pred);

%% Plot results
subplot(2,1,1)
plot(X_train,y_train,'ro', X_pred,y_pred,'b-')
quick_patch(X_pred,y_pred,2*y_std,'b') % Adds shaded region for GPR predictions
title('GPR Model')
xlabel('x')
ylabel('y')

subplot(2,1,2)
plot(X_pred,G_scores,'b-')
title('Knowledge scores')
xlabel('x')
ylabel('G(x,D)')
```
