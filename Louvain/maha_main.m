clear
close all

data = 'ERR25_500k';
load(strcat('../../Data/',data,'.mat'));

m_weight = sum(sum(A))/nnz(A);
cutVal = m_weight;
A(A<cutVal) = 0;

s = 1;
self = 1;
debug = 1;
verbose = 1;

[COMTY,ending] = cluster_jl(A,s,self,debug,verbose);
