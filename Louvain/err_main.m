clear
close all

load('../MatrixResult/my_t_test2_r_20_250k_matrix')

[m,n,k] = size(err);
for i=1:k
    i
    A = err(:,:,i);
    
    s = 1;
    self = 1;
    debug = 1;
    verbose = 1;
    
    [COMTY{i},ending{i}] = cluster_jl(A,s,self,debug,verbose);
end