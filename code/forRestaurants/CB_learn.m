function PredictR = CB_learn()

    data     = load('train5.txt');
    user_id = data(:,1);
    item_id = data(:,2);
    rating  = data(:,3);
    
    x = length(rating);
    T = zeros(138,130);

    for k = 1:x
        T(user_id(k,1),item_id(k,1)) = rating(k,1);
    end
    
    load('X.mat');

    iter    = 0;
    maxIter = 5;
    l       = 0.01;
    a       = 0.1;
    m       = 130;

    W       = randi(5,138,6);
    count   = 1;

    while iter<maxIter
        for item_id = 1:138
            for j = 1:130,
                if(T(item_id,j)>0),
                    count = count + 1;
                    temp = W(item_id,1);
                    W(item_id,1) = W(item_id,1)-(a)*(W(item_id,:)*transpose(X(j,:))-T(item_id,j));
                    temp2 = W(item_id,1);
                    W(item_id,1) = temp;
                    W(item_id,:) = W(item_id,:) - (a)*((W(item_id,:)*transpose(X(j,:))) - T(item_id,j))*X(j,:) - (l)*W(item_id,:);
                    W(item_id,1) = temp2;
                end %if
            end %for inner
        end %for outer
        iter = iter + 1;
    end
    
    PredictR = W*transpose(X);
end