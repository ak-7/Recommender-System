
R_FISM = FISM_test();
R_CB   = CB_learn();
R_Demo = Demo_test();

M_FISM = normalizing(R_FISM);
M_CB   = normalizing(R_CB);
M_Demo = normalizing(R_Demo);

wf   = 0.8;
wcb  = 0.1;
wd   = 0.1;

M_FINAL = wf*M_FISM + wcb*M_CB + wd*M_Demo;

[X_wt,Y_item] = sort(M_FINAL, 2,'descend');