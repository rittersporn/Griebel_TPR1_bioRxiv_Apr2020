Metaplots display averaged distribution of the read density across the specified genomic loci.
The metaplots are centered around the transcription start site with 2 kb up- and downstream.
Orientation of the gene (+/- strand) is considered.
The confidence interval (alpha=0.01) around the lines is obtained by bootstrapping (1000 times).
The read density is shown as RPM (reads per million).

If your gene set of interest does not overlap with the control sets, there is an indication of TPR1 enrichment at these genes.
To test this further, please use the bigwig file provided as a part of this preprint and examine TPR1 enrichment at your genes of interest in the IGV browser.

On the plot "input_norm.pdf" the confidence intervals are absent since the lines are obtained by subtracting
RPM values for TPR1-GFP input from RPM values for TPR1 ChIP-seq. This simple 'normalization' should be used only as indication.
For proper normalization, one should normalize read density per gene, but it is not possible in the current 'metagene' version. 
