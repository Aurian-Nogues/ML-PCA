% script to run PCA on demo data set

%% Initialization
clear ; close all; clc
fprintf('Loading data... \n')
load ('demo_data.mat');

%====== visualize data =====
fprintf('Visualising data... \n')
plot(X(:, 1), X(:, 2), 'bo');
axis([0.5 6.5 2 8]); axis square;

%====== run Principal component analysis =====

fprintf('\nRunning PCA on example dataset.\n\n');
%normalize data
[X_norm, mu, sigma] = featureNormalize(X);
%  Run PCA
[U, S] = pca(X_norm);

input('Press enter')
%  Draw the eigenvectors centered at mean of data. These lines show the
%  directions of maximum variations in the dataset.
fprintf('Drawing eigenvectors (dimension of maximum variation)... \n')
hold on;
drawLine(mu, mu + 1.5 * S(1,1) * U(:,1)', '-k', 'LineWidth', 2);
drawLine(mu, mu + 1.5 * S(2,2) * U(:,2)', '-k', 'LineWidth', 2);
hold off;

input('Press enter')
%==== dimension reduction =====
%  Plot the normalized dataset (returned from pca)
fprintf('Plotting normalised dataset... \n')
plot(X_norm(:, 1), X_norm(:, 2), 'bo');
axis([-4 3 -4 3]); axis square

fprintf('Projecting data on K=1 dimensions... \n')
%  Project the data onto K = 1 dimension
K = 1;
Z = projectData(X_norm, U, K);

X_rec  = recoverData(Z, U, K);

input('Press enter')
fprintf('Connecting projected points to original points... \n')
%  Draw lines connecting the projected points to the original points
hold on;
plot(X_rec(:, 1), X_rec(:, 2), 'ro');
for i = 1:size(X_norm, 1)
    drawLine(X_norm(i,:), X_rec(i,:), '--k', 'LineWidth', 1);
end
hold off





