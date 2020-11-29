%%% Initialization
clear; close all; clc;

Pre_Process;

addpath('./chr_vs_chr_data');

addpath('./Louvain')

addpath('./GraphPlot_tool')

addpath('./Plotting')

addpath('./Saving')

%%% Read chromosomes.txt file and produce a chrom_box array
read_chrom;

%%% Chromosome to community correspondence
chr_to_com;

%%% Community detection for each chromosome
input_names = cell(1,25);
for i = 1:25
    
   input_names{i} = strcat('Results (chr',num2str(i),...
       ' vs chr',num2str(i), ' BinSize=10000).csv');
 
   [A, ind_frag, min_num] = read_chr_vs_chr(input_names{i}, i);

   %%% Implement Louvain algorithm 
   tic
   fprintf('Louvain algorithm is started for chromosome %d, please wait.\n\n ', i);
   [COMTY,ending] = cluster_jl(A,s,self,debug,verbose);
   fprintf('Louvain algorithm is ended for chromosome %d.\n\n ', i);
   toc
   
   save(strcat('./chr_vs_chr_com', '/', input_names{i}, '.COMTY.mat'), 'COMTY')
   fprintf('COM structure for chromosome %d has been saved \n in chr_vs_chr_com folder.\n\n ', i);
   
   ComCell = cell(1,max(COMTY.COM{end}));
   for p = 1:max(COMTY.COM{end})
       ComCell{p} = ind_frag(COMTY.COM{end}==p);
   end
   save(strcat('./chr_vs_chr_com', '/', input_names{i}, '.ComCell.mat'), 'ComCell')
   fprintf('COM cell including cells according to Coms has been saved \n in chr_vs_chr_com folder.\n\n ');
   
   tic
   frag(ind_frag,4)=COMTY.COM{end};
   fileID = fopen(strcat('./Output_txt_files', '/',input_names{i},'.txt'),'w');
   fprintf(fileID,'%6s %42s\n','Chr','Community_num');
   fprintf(fileID,'%6d %12d %12d %16d\n',frag(ind_frag,:)');
   fclose(fileID);
   fprintf('The txt file for chromosome %d has been saved in \n Output_txt_files folder.\n\n ', i);
   toc
   
end

%%% Community Visulaization 
Chr_name = strcat('Results (chr',num2str(Chr_number),...
           ' vs chr',num2str(Chr_number), ' BinSize=10000).csv');
       
load(strcat('./chr_vs_chr_com', '/', Chr_name, '.COMTY.mat'));

fprintf('Plotting your graphs, it may take some seconds...\n\n ');

if any(strcmp(Comm_Plot,'Whole Chromosome'))
    
    Plotting_Whole_Chromosome

    % Save whole Chromosome in a txt file
    % Saving_Whole_Chromosome

end

if any(strcmp(Comm_Plot,'Top N largest Communities'))
    
    Plotting_Top_N_largest_Communities

    % Save Top N largest Communities in distinct txt files
      Saving_Top_N_largest_Communities

end

if any(strcmp(Comm_Plot,'Greater than a Threshold'))
    
    Plotting_Greater_than_a_Threshold

    % Save Communities with size reater than a Threshold in distinct txt files
    % Saving_Greater_than_a_Threshold
    
end

if any(strcmp(Comm_Plot,'Desired Communities'))
    
    Plotting_Desired_Communities

    % Save Desired Communities in distinct txt files
    % Saving_Desired_Communities
   
end

if any(strcmp(Comm_Plot,'Communities_labels = a:b'))
    
    Plotting_Communities_labels_a_b

    % Save Desired labeled Communities in distinct txt files
    % Saving_Communities_labels_a_b

end

fprintf('\n\nThe program has been terminated.\n\n')

