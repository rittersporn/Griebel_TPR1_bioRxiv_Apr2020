# Griebel et al bioRxiv Apr 2020, doi
# Title
# Initial description of Arabidopsis TPR1 ChIP-seq data

The repository contains scripts and other materials that were used during preparation of this preprint.

## Content
### selection of TPR1 bound genes

TPR1 bound genes were selected from the peak annotation file ("TPR1_peak_annotation.txt") using R script "TPR1_bound_genes_selection.R". In brief, unique AGI codes are selected from the column "Annotation" and "Nearest promoterID".

input - ./input_files/TPR1_peak_annotation.txt (Supplemental Data 1)

place the file "TPR1_peak_annotation.txt" and the script into one directory, run the script in R

expected output - a list of 1441 TPR1-GFP bound genes (file "TPR1_bound_genes.txt", as in ./output_files/TPR1_bound_genes.txt, Supplemental Data 2)



