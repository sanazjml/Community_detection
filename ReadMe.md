## Community detection of Hi-C interaction data, community visualization and annotation

This repository includes implementation of Louvain community detection algorithm [https://github.com/GenLouvain/GenLouvain] for Hi-C data, and community
visualization through modified FRKK (Fruchterman-Reingold, Kamada-Kawai) algorithm presented by Amanda et al. [https://github.com/olvb/nodesoup].


### Pre_Process.m  


1. Input Parameters should be set in Pre-Process.m file.   

2. A chromosome.txt file and also an input matrix.bed file should be provided in "Data" folder.  

3. Your input data should be the output of HiC-Pro pipeline as significant interactions of Hi-C data  
 
   (Please go to https://github.com/nservant/HiC-Pro for HiC-Pro implementation). It should be noted  

   that due the large scale Hi-C data, we should provide HiC-Pro output for each individual chromosome   

   with file name "Results (chr22 vs chr22 BinSize=10000)" for example.    

4. One is able to change the Louvain algorithm parameters based on your network just by referring to   

   "cluster_jl.m" file in Louvain folder. Its default works for weighted networks efficiently.  

5. Background color of your plots (visualization of communities) should be set in 'Back_color'.  

6. By turning "Annotating" on or off in Pre_Process.m file, you will be provided with graphs with or without   
  
   node labeling respectively.  

7. In "Setting of Communities plots" part of Pre_Process.m file, you should set the number of desired  
  
   chromosome to plot. In following commands, you can choose the 'Whole_chromosome' or a   

   selection of that to plot in your graphs.


### Main.m   
    
1. You can run Main.m file without any changes if you are working on all chromosomes (you have the significant   

   interactions of all 25 chromosomes in mentioned folder).  

2. If you would like to run the algorithm just for one chromosome, you need to change "i = 1:25" to "i=22" in line 24 of Main.m file.  

3. Detected communities for each input matrix would be saved in "chr_vs_chr_com" folder.  

4. "Plotting" and "Saving" folders contain m.files related to plot and save the the visualizations.
    
    ![alt text](https://github.com/sanazjml/Community_detection/blob/master/graph%20of%205%20Mb%20base%20pair%20Hi-C%20data.png)  
    ![alt text](https://github.com/sanazjml/Community_detection/blob/master/Top2_Com%20graph%20for%20chr%2022%20of%2010%20Kb%20base%20pair%20Hi-C%20data.png)

5. Also a correspondence between chromosome number, its detected communities and fragments of genome which it encompasses will be provided as txt format file in "Output_txt_files" folder.
  

 #### GWAS-Annotation.m   

1. You should insert the name of your desired diseases in "Disease={}". The GWAS data sets of our studied diseases  

   exist in "GWAS catalog data" folder.

2. You can run GWAS-Annotation.m file without any changes if you are working on all chromosomes (you have the significant   

   interactions of all 25 chromosomes in mentioned folder).  

3. If you would like to run the algorithm just for one chromosome, you need to change "p = 1:25" to "p=22" in lines 11 and 25. Also  

   you can change "h = 1:15" in line 19 for considering specified diseases in your GWAS data sets 
   
4. The overlap of GWAS data set for each selected disease and detected communities of each   

   chromosome will be counted and saved as an array in "GWAS_Counter" folder.  



