# Griebel et al bioRxiv Apr 2020, doi
# Title
# Initial description of Arabidopsis TPR1 ChIP-seq data

The repository contains scripts and other materials that were used during preparation of this preprint.

## Content
### selection of TPR1 bound genes

TPR1 bound genes were selected from the peak annotation file ("TPR1_peak_annotation.txt") using R script "TPR1_bound_genes_selection.R". In brief, unique AGI codes were taken from the column "Annotation" and "Nearest promoterID" and they together define "TPR1 bound genes".

input - ./input_files/TPR1_peak_annotation.txt (Supplemental Data 1)

place the file "TPR1_peak_annotation.txt" and the script into one directory, run the script in R

expected output - a list of 1441 TPR1-GFP bound genes (file "TPR1_bound_genes.txt", as in ./output_files/TPR1_bound_genes.txt, Supplemental Data 2)


### preparation of metaplots for the gene sets of interest

We prepared two R scripts to enable the research community to access our data without a need to process raw sequencing reads.
In our opinion, metaplots help to reveal general patterns in the chromatin profiles of genes of interest.
As a part of this preprint, we provide access only to TPR1-GFP ChIP-seq data, however there is a plan to extend this to other ChIP-seq data (Parker lab ChIP-seq data being prepared for release and publicly available data for critical TFs and chromatin marks).

#### Word of caution:
The provided functionality to prepare metaplots relies on the R package "metagene". Scaling and normalization procedures to check enrichment of the chromatin mark or a transcription (co)regulator are different from and are not as extensive as in deepTools. Therefore, metaplots obtained with metagene and deepTools look different. To get a high-quality metaplot, we encourage to use deepTools. Nevertheless, the metagene package runs in the R environment and, our opinion, offers a simple and an accessible to "wet-lab" way to look into a range of ChIP-seq data.
