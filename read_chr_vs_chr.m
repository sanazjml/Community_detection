function [A , ind_frag, min_num] = read_chr_vs_chr(chr_name, i)
tic

fprintf('Importing Data for chr %d, Please wait...\n\n', i);

data = readtable(chr_name);
min_num = min(data.locus1);
DATA = cell(1,3);
DATA{1} = data.locus1 - min_num + 1;
DATA{2} = data.locus2 - min_num + 1;
DATA{3} = data.readCount;

dim = max(max(DATA{1}),max(DATA{2}));

A = sparse(DATA{1},DATA{2},DATA{3},dim,dim);

ind_frag = min_num:max(max(data.locus1),max(data.locus2));
clear data; clear DATA;

fprintf('Data for chr %d have been completely loaded.\n\n ', i);

toc
end