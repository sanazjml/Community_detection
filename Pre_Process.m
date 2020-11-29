%%% Set some necessary parameters (Necessary!)

chromosomes='chromosomes.txt';
hg='dixon_2M_10000_abs.bed';
bin_size=10^4;
chrom_num = 25;

%%% Louvain parameters for undirected and weighted matrices 
s = 1;
self = 1;
debug = 1;
verbose = 1;

%%% Background color of plots
Back_color = 'Black';            % Change it to your favorite background color of plots 
                                 % by simply writing its name

%%% Annotating setting
Annotating = 'off';              % Turn annotating 'on' or 'off' as you prefer

%%% Setting of Communities plots  

Chr_number = 22;  % Please select your desired Chr to plot its graphs

%%% You can change elements of below cell array to get your desired graphs
Comm_Plot = {'Top N largest Communities'};                     %set 'Whole Chromosome' in this part in order to 
                                                         %have a plot for whole Chromosome 

if any(strcmp(Comm_Plot,'Top N largest Communities'))
    Top_N_largest_Communities = 2;   % Feel free to plot N largest Communities
end

if any(strcmp(Comm_Plot,'Greater than a Threshold'))
    Threshold = 524;                   % Feel free to plot Communities with size greater than Threshold
end

if any(strcmp(Comm_Plot,'Desired Communities'))
    Desired_Communities = [1 2]; % Feel free to plot your desired Communities
end

if any(strcmp(Comm_Plot,'Communities_labels = a:b'))
    Communities_labels = 1:2;        % Feel free to plot communities with labels = a:b
end



    
