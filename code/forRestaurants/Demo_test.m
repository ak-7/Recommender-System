function FINAL_R = Demo_test()

data       = load('demonewdb.txt');
c_id       = data(:,1);
smoker     = data(:,2);
dress      = data(:,3);
amb        = data(:,4);
trans      = data(:,5);
mar        = data(:,6);
reli       = data(:,7);
act        = data(:,8);
budg       = data(:,9);

m          = length(c_id);
simi       = zeros(m,m);
iter       = 130;

for p=1:m
    for k=1:m
        if smoker(k,1)==smoker(p,1)
            dis1=2;
        else
            dis1=0;
        end
        
        if dress(k,1)==dress(p,1)
            dis2=0;
        else
            dis2=2;
        end
        
        if amb(k,1)==amb(p,1)
            dis3=0;
        else
            dis3=2;
        end
        
        if trans(k,1)==trans(p,1)
            dis4=0;
        else
            dis4=2;
        end
        
        if mar(k,1)==mar(p,1)
            dis5=0;
        else
            dis5=2;
        end
        
        if reli(k,1)==reli(p,1)
            dis6=0;
        else
            dis6=2;
        end
    
        if act(k,1)==act(p,1)
            dis7=0;
        else
            dis7=2;
        end
    
        if budg(k,1)==budg(p,1)
            dis8=0;
        else
            dis8=2;
        end
        
        simi(k,p)=8-sqrt(dis1^2+dis2^2+dis3^2+dis4^2+dis5^2+dis6^2+dis7^2+dis8^2);
    end
end

data    = load('final_cfratings.txt');
user_id = data(:,1);
item_id = data(:,2);
rating  = data(:,3);

x   = length(rating);
Rtg = zeros(m,iter);

for k = 1:x
    Rtg(user_id(k,1),item_id(k,1)) = rating(k,1);
end

FINAL_R = zeros(138,130);

for p=1:m,
    for j=1:iter,
        FINAL_R(p,j) = max(simi(:,p).*Rtg(:,j));
    end %for items
end %for users

FINAL_R=FINAL_R/8;

for k=1:x
    FINAL_R(user_id(k,1),item_id(k,1)) = rating(k,1);
end

end %function