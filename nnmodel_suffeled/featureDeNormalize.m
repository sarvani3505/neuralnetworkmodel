function [X] = featureDeNormalize(X_norm,mu,sigma)
X = X_norm .* sigma + mu;
end