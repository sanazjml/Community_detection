clear all
chrom_num = 25;
hg_file='chromosomes.txt';
fid = fopen(hg_file); 
tline = fgetl(fid);
i = 1;
chrom_size = zeros(1,chrom_num);
while ischar(tline)
    chroms = sscanf(tline, '%s\t%d');    %%% %s Read series of characters, until find white space. %d reads numbers in Base 10
                                         %%% A = sscanf(str, format) reads data from string str, converts it according to the format, 
                                         %%%  and returns the results in array A. 
    chrom_size(i) = chroms(end);
    tline = fgetl(fid);
    i = i + 1;
end
fclose(fid);

chrom_box = ceil(chrom_size/bin_size); 
chrom_box = cumsum(chrom_box);   %%cumulative sum of an array
chrom_box = [0 chrom_box];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
save('chrome_box.mat');
clear all
hg='dixon_2M_1000000_abs.bed';
fid = fopen(hg); 
tline = fgetl(fid);
i = 1;
frag = zeros(chrom_box(end),2);
while ischar(tline)
    fragi = sscanf(tline, '%s\t%d\t%ddddddddddddddd');    %%% %s Read series of characters, until find white space. %d reads numbers in Base 10
                                         %%% A = sscanf(str, format) reads data from string str, converts it according to the format, 
                                         %%%  and returns the results in array A. 
    frag(i,1) = fragi(end-1);
     frag(i,2) = fragi(end);
     tline = fgetl(fid);
    i = i + 1;
end
fclose(fid);
dlmwrite('myFile.txt',frag,'delimiter','\t','precision',9);