function X_fism = FISM_test()

data    = load('train5.txt');
user_id = data(:,1);
item_id = data(:,2);
rating  = data(:,3);
rating  = rating + ones(length(rating),1);

R = sparse(user_id, item_id, rating, 138, 130, length(user_id));
R = logical(R);
v = ones(1,138);
w = ones(1,130);
Predict = FISMrmse_learn(R, 130, 138, 200, v, w, 0.4);

%%%%FISM SORT
X_fism = ones(138,130);
X_fism = ones(138,130)-abs(X_fism-Predict);

end %function