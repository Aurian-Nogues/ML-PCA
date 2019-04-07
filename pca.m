function [U, S] = pca(X)
%PCA Run principal component analysis on the dataset X
%   [U, S, X] = pca(X) computes eigenvectors of the covariance matrix of X
%   Returns the eigenvectors U, the eigenvalues (on diagonal) in S
%

% define some variables
[m, n] = size(X);

% to be returned
U = zeros(n);
S = zeros(n);

%compute covariance matrix
Sigma = 1/m * X'*X;

%run SVD to get eigenvalues of covariance matrix
%U is principal components matrix, S is diagonal matrix
[U, S, V] = svd(Sigma);

end
