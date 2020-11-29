Comit=cell(1,Top_N_largest_Communities);
com_in=cell(1,Top_N_largest_Communities);
for i=1:length(Comit)
    Comit{i} = find(COMTY.COM{end}==i);
    Comit{i} = Comit{i} + min_num - 1;
    com_in{i} = frag(Comit{i},:);
    fileID = fopen(strcat('./Output_txt_files', '/','Top',...
        num2str(max(COMTY.COM{end})),'_Com_',num2str(i),'.txt'),'w');
    fprintf(fileID,'%6s %42s\n','Chr','Community_num');
    fprintf(fileID,'%6d %12d %12d %16d\n',com_in{1,i}');
    fclose(fileID);
end