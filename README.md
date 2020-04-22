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

### introduction

We prepared two R scripts to help the research community to access TPR1 ChIP seq data without a need to process raw reads. Metaplots reveal general patterns in the distribution of chromatin features at the genes of interest. As a part of this preprint, we provide access only to TPR1-GFP ChIP-seq data.

In its heart, the functionality presented here has the R package 'metagene'. Although the package does not produce plots like deepTools does, it offers a simple and an accessible way to look into a range of ChIP-seq data in a matter of minutes using a regular personal computer (MacOS or Windows). If your gene set of interest turns out to be enriched for binding events by certain TFs or for histone marks as seen on the metaplots generated with 'metagene', one could follow this up in more details (e.g. using deepTools).

There is a plan (~summer 2020) to extend this functionality to other ChIP-seq experiments. They will include ChIP-seq data produced in Parker laboratory and being prepared for release as well as publicly available data for critical TFs and chromatin marks processed by Parker group. In this case, one will have an opportunity to generate metaplots for ~40 histone marks and TFs within ~20-30 minutes simply by running R scripts on a personal computer. In this context, the TPR1 ChIP-seq data released in this preprint serve as "Versuchskaninnchen" for providing access to the community. If you want to learn which of the ~40 chromatin features are enriched at your gene sets of interest before the full release, let us know. We are happy to support your research. The processed ChIP-seq datasets currently include ChIP-seq in Arabidopsis for H3K4me3, H3K36me3, H3K27me3, H3K9ac, H3K9me2, H2Aub, MYC2, MED25, PolII, PolV, SARD1, WRKY TFs.

### how to use (short version, after the 1st use)

Inside of the directory R_metagene_TPR1

1. Save a list of genes of interest in a TXT tab-delimited separate file in the directory ./gene_sets . Use the file "TPR1_targets.txt" as an example. You can save multiple files - one per gene set.

2. Run "01_Preparation_BED_files.R"

3. Run "02_Drawing_metaplots_TPR1.R"

4. Check the directory ./metaplots for results.


### how to use (long version, for the first time use)

1. Download this repository (green button "Clone or download")

2. Navigate to the directory "R_metagene_TPR1"

3. Open RStudio with R version >=3.6 (was tested on RStudio v1.1.463 on Windows 10 and v1.2.5042 on MacOS Catalina). RStudio is preferred for the correct work of scripts since setting of the working directory is made with RStudio API 'rstudioapi::getActiveDocumentContext()'

4. Install the package 'metagene' from Bioconductor (BiocManager::install("metagene")) and its dependencies

5. Insatll other required libraries: 'BiocGenerics' (BiocManager::install("BiocGenerics")), 'stringr', 'knitr' and 'ggplot2'

6. Download files with alignments "TPR1_WT.bam", "TPR1_WT.bam.bai", "TPR1_WT_input.bam", "TPR1_WT_input.bam.bai" from GEO submission accompanying the preprint (GEO accession number XXX) ~2Gb

7. Place the downloaded files inside of the copied directory ./bam_bai/TPR1/ 

8. Test run, step 1. Open the script "01_Preparation_BED_files.R" select everything and run it.

At this step, coordinates of regions to plot for the genes of interest are saved in separate files (so-called, BED files) - one per gene set. Gene sets are stored as individual tab-delimited TXT files inside of the directory ./gene_sets (input for the script). The output BED files are saved in ./bed_files . Once you run the script, you should have 3 files in ./bed_files : (1) initial BED file for all Arabidopsis genes "metagene_BED_gene_TAIR10.bed", (2) BED file for for all TPR1 bound genes ("TPR1_targets.bed") and (3) a BED file for 'randomly' selected 2000 Arabidopsis genes "TAIR_2000.bed"

9. Test run, step 2. Open the script "02_Drawing_metaplots_TPR1.R", select everything and run it.

Here, BED files generated in step 1 provide coordinates of genomic regions (genes) to parse read count information stored in the downloaded BAM files. You will get a couple of warning messages "In normalizePath(path.expand(path), winslash, mustWork) : <...> The system cannot find the file specified". This is normal behaviour for 'metagene' (see 'metagene' manual). As a result, you should get three files in the directory ./metaplots : (1) "TPR1_WT.pdf", (2) "input_TPR1_WT.pdf" and (3) "input_norm.pdf". They should the same as in ./expected_metaplots with the exception that the line for TAIR_2000 gene set might look slightly different. This is because the TAIR_2000 set is generated again after each run of "01_Preparation_BED_files.R".

10. Once the test run looks good, you are good to prepare metaplots for your gene sets of interest. For that, create a TXT file with <2000 AGI codes and save it in ./gene_sets under the name "my_genes.txt" or other name. Please use file "TPR1_targets.txt" in ./gene_sets as examples (tab-delimited format). You can visualize multiple gene sets on one metaplot. For that place multiple TXT files in ./gene_sets - one gene set per a TXT tab-delimited file. Names of the files will be used to label curves on the resulting metaplot.

11. Resulting metaplots are saved into the directory ./metaplots


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
