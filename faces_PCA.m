% this script runs a PCA dimension reduction on pictures of faces

fprintf('\nLoading face dataset.\n\n');

%  Load Face dataset
load ('faces.mat')

%  Display the first 100 faces in the dataset
displayData(X(1:100, :));
input('Press enter')

%====== calculate eigenvalues =====

%  Run PCA and visualize the eigenvectors which are in this case eigenfaces
%  We display the first 36 eigenfaces.
%
fprintf(['\nRunning PCA on face dataset.\n' ...
         '(this might take a minute or two ...)\n\n']);

%normalize data
[X_norm, mu, sigma] = featureNormalize(X);
%  Run PCA
[U, S] = pca(X_norm);
%  Visualize the top 36 eigenvectors found
fprintf('Vizualising top 36 eigenvectors... \n')
displayData(U(:, 1:36)');
input('Press enter')

% === dimension reduction for faces ===
%  Project images to the eigen space using the top k eigenvectors 
fprintf('\nDimension reduction for face dataset.\n\n');

K = 100;
Z = projectData(X_norm, U, K);


% ======= visualization of faces after PCA dimension reduction
%  Project images to the eigen space using the top K eigen vectors and 
%  visualize only using those K dimensions
%  Compare to the original input, which is also displayed
input('Press enter')
fprintf('\nVisualizing the projected (reduced dimension) faces.\n\n');

K = 100;
X_rec  = recoverData(Z, U, K);
% Display normalized data
subplot(1, 2, 1);
displayData(X_norm(1:100,:));
title('Original faces');
axis square;

% Display reconstructed data from only k eigenfaces
subplot(1, 2, 2);
displayData(X_rec(1:100,:));
title('Recovered faces');
axis square;
input('Press enter')



