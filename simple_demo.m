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
quick_patch(X_pred,y_pred,2*y_std,'b')
title('GPR model')
xlabel('x')
ylabel('y')

subplot(2,1,2)
plot(X_pred,G_scores,'b-')
title('Knowledge scores')
xlabel('x')
ylabel('G(x,D)')