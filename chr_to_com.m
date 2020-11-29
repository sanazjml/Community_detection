fid = fopen(strcat('./Data', '/', hg)); 
tline = fgetl(fid);
i = 1;
frag = zeros(chrom_box(end),4);
while ischar(tline)
    fragi = sscanf(tline, '%s\t%d\t%ddddddddddddddd');    
    frag(i,2) = fragi(end-1);
    frag(i,3) = fragi(end);
    tline = fgetl(fid);
    i = i + 1;
end
fclose(fid);


for i=1:25
    frag(chrom_box(i)+1:chrom_box(i+1),1)=i;
end

% num_com=length(unique(COMTY.COM{end}));
% 
% 
% frag(:,4)=COMTY.COM{end};
