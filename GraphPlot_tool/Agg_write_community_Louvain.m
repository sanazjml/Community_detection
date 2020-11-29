function [] = Agg_write_community_Louvain(com_addr, COMTY )

%%% Select best result and write it to file

[~,m]= max(COMTY.MOD);
com = COMTY.COM{m}; 
com_num = max(com);

if ~exist(com_addr, 'dir')
    mkdir(com_addr);
end
des_file = strcat(com_addr,'/','com.txt');
if exist(des_file, 'file')==2
  delete(des_file);
end
for i=1:com_num
    com_mem = find(com == i);
    if length(com_mem)> 1
        com_mem = [i,com_mem];
        dlmwrite(des_file,com_mem,'delimiter','\t','-append');
    end
end



end

