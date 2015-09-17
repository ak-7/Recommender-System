function FINAL_WT = normalizing(R_matrix)

MAX_WT = zeros(138,1);
MAX_WT = max(R_matrix,[],2);

FINAL_WT = zeros(138,130);

for count=1:138,
    FINAL_WT(count,:) = R_matrix(count,:)/MAX_WT(count);
end %for