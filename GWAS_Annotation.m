clear; close all; clc;

Disease = {'ADHD.xlsx'};

addpath('./Output_txt_files');
addpath('./GWAS catalog data');

input_names_txt= cell(1,25);
input_names_mat= cell(1,25);

for p = 1:25
    
       input_names_txt{p} = strcat('Results (chr',num2str(p),...
               ' vs chr',num2str(p), ' BinSize=10000).csv','.txt');
       input_names_mat{p} = strcat('./chr_vs_chr_com', '/', 'Results (chr',num2str(p),...
        ' vs chr',num2str(p), ' BinSize=10000).csv.COMTY.mat');

end
for h = 1:15   
    disease = readtable(Disease{h});
    A = cell(1,2);
    A{1} = disease.CHR_ID;
    A{2} = disease.CHR_POS;
    
    for p = 1:25
        
         Count = cell(1,25);
   
         Data = readtable(input_names_txt{p});
         L = length(Data.Var1);
         data = zeros(L,4);
         data(:,1) = Data.Var1;
         data(:,2) = Data.Var2;
         data(:,3) = Data.Var3;
         data(:,4) = Data.Var4;
         
         clear Data;
         
         load(input_names_mat{p});        
         Size_ind = find(COMTY.SIZE{end} > 1);
         N = Size_ind(end);
         
         counter = zeros(1,N);
         
         ind = find(A{1} == p);

         for i = 1:N
             index = find(data(:,4) == i);
             for j = 1:length(ind)
                 for k = 1:length(index)
                     if A{2}(ind(j)) >= data(index(k),2) && A{2}(ind(j)) <= data(index(k),3)
                         counter(i) = counter(i) + 1;
                     end
                 end
             end
         end
          Count{p} = counter;
    end
    
    save(strcat('./GWAS_Counter', '/', Disease{h}, '.mat'), 'Count');
    clear Count;
    
end
         
         
% for i=1:length(disease.CHR_ID)
%     if isempty(disease.CHR_ID{i})==1
%        disease.CHR_ID{i}='NaN';
%     end
% end
  
   
   
   
   
   
   