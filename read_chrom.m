fid = fopen(strcat('./Data', '/', chromosomes)); 
tline = fgetl(fid);
i = 1;
chrom_size = zeros(1,chrom_num);
while ischar(tline)
    chroms = sscanf(tline, '%s\t%d');     
    chrom_size(i) = chroms(end);
    tline = fgetl(fid);
    i = i + 1;
end
fclose(fid);

chrom_box = ceil(chrom_size/bin_size); 
chrom_box = cumsum(chrom_box);   %%cumulative sum of an array
chrom_box = [0 chrom_box];