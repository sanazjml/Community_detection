if nc ~= 0
   Comit=cell(1,nc);
   com_in=cell(1,nc);
   for i=1:length(Comit)
       Comit{i}=find(COMTY.COM{end}==i);
       Comit{i} = Comit{i} + min_num - 1;
       com_in{i}=frag(Comit{1,i}(1):Comit{1,i}(end),:);
       fileID = fopen(strcat('./Output_txt_files', '/','Com_selected_by_Threshold_',...
                     num2str(i),'.txt'),'w');
       fprintf(fileID,'%6s %42s\n','Chr','Community_num');
       fprintf(fileID,'%6d %12d %12d %16d\n',com_in{i}');
       fclose(fileID);
    end
end