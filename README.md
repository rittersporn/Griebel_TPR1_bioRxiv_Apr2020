# Griebel et al bioRxiv Apr 2020, doi
# Title
# Initial description of Arabidopsis TPR1 ChIP-seq data

The repository contains scripts and other materials that were used during preparation of this preprint.

## selection of TPR1 bound genes

TPR1 bound genes were selected from the peak annotation file ("TPR1_peak_annotation.txt" as in Supplemental Data 1) using R script "TPR1_bound_genes_selection.R". In brief, unique AGI codes were taken from the column "Annotation" and "Nearest promoterID" and they together define "TPR1 bound genes".

input - ./input_files/TPR1_peak_annotation.txt (Supplemental Data 1)

place the file "TPR1_peak_annotation.txt" and the script into one directory, run the script in R

expected output - a list of 1441 TPR1-GFP bound genes (file "TPR1_bound_genes.txt", as in ./output_files/TPR1_bound_genes.txt, Supplemental Data 2)


## preparation of metaplots for gene sets of interest

We prepared two R scripts to enable the research community to access our TPR1 ChIP seq data without a need to process raw reads. In our opinion, metaplots help to reveal general patterns in the distribution of chromatin features at the genes of interest. As a part of this preprint, we provide access only to TPR1-GFP ChIP-seq data.

There is a plan (~summer-autumn 2020) to extend this functionality to other ChIP-seq experiments. They will include ChIP-seq data produced in Parker laboratory and being prepared for release and publicly available data for critical TFs and chromatin marks processed by Parker group. In this case, one will have an opportunity to generate metaplots for ~40 histone marks and TFs within ~20-30 minutes simply by running R scripts on a personal computer. In this regard, the TPR1 ChIP-seq data released in this preprint serve as "Versuchskaninnchen" for providing access to the community. If you want to learn which of the ~40 chromatin features are enriched at your gene sets of interest, let us know. We are happy to support your research. They include Arabidopsis data for H3K4me3, H3K36me3, H3K27me3, H3K9ac, H3K9me2, H2Aub, MYC2, MED25, PolII, PolV, SARD1, WRKY TFs.

In its heart, the functionality presented here has the 'metagene' package for R. Although the package does not produce plots as deepTools for ChIP-seq datasets, it offers a simple and an accessible way to look into a range of ChIP-seq data in a matter of minutes using a regular personal computer (MacOS or Windows). If your gene set of interest turns out to be enriched for binding events by certain TFs or for histone marks as seen on the metaplots generated with 'metagene', one could follow this up in more details (e.g. using deepTools).

### Words of caution:
#### 'metagene' vs. deepTools

The functionality provided here relies on the R package 'metagene'. Scaling and normalization procedures in 'metagene' are different from and are not as extensive as in deepTools. Therefore, metaplots obtained with 'metagene' and deepTools look different. Also, 'metagene' does not have the option to scale the gene models. That is why in the case of scripts here, you would get an enrichment profile around the transcription start site (TSS) rather than over the whole gene models.

#### normalization of TPR1 ChIP-seq signal to input on the resulting metaplot "input_norm.pdf"

In contrast to deepTools, 'metagene' does not offer a per-gene normalization to input as it is done in deepTools. The input-normalized profile on the plot "input_norm.pdf" represents a result of simple subtraction of averaged RPM values for gene sets in TPR1 ChIP-seq and sequenced input samples. This is not optimal, because normalization should be performed per gene and not for a gene set as a whole. Still, this gives a very good idea whether your gene set has any evidence of TPR1 binding.

#### control gene sets

As in any experiment, it is important to compare your gene sets of interest to controls. By default, we provide two controls:

1) TPR1 bound genes (Supplemental Data 1 in the preprint, "TPR1_targets" on the plots)

2) a 'random' subset of 2000 Arabidopsis genes ("TAIR_2000" on the plots; 'random' because nothing is truly random).

A standard personal computer (~8 Gb RAM) does not have enough memory to parse data for all Arabidopsis genes. However, the 2000 'random' genes should give a good idea about the background enrichment levels. In each run of the script "01_Preparation_BED_files.R", the 2000 genes are selected again, therefore the final line for them on the metaplots will change slightly.

Since you have a possibility to provide sets of genes, include your might want to include your own controls (e.g. selected to have a basal expression level similar to the test set), but the 'random' 2000 genes is a good starting point.
