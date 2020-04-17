Metaplots display averaged distribution of the read density across the specified genomic loci.
The metaplots are centered around the transcription start site with 2 kb up- and downstream.
Orientation of the gene (+/- strand) is considered.
The confidence interval (alpha=0.01) around the lines is obtained by bootstrapping (1000 times).
The read density is shown as RPM (reads per million).

If your gene set of interest does not overlap with the negative control set(s), there is an indication of TPR1 enrichment at these genes.
How good is your enrichment? Is it as strong as for the positive control (TPR1_targets)? Then, it is likely that many of your genes among the TPR1 bound genes in Supplemental Data 2. If the curve for genes of your interest is between the negative (TAIR_2000) and positive (TPR1_targets) controls, it is possible that most of your queried genes show a relatively weak enrichment that was not picked up by the peak caller QuEST.
To further evaluate TPR1 enrichment at the genes you are interested in, use the bigwig file provided as a part of this preprint and examine TPR1 enrichment at your individual genes of interest in the IGV browser.

On the plot "input_norm.pdf" the confidence intervals are absent since the lines are obtained by subtracting
RPM values for TPR1-GFP input from RPM values for TPR1 ChIP-seq. This simple 'normalization' should be used only as indication.
For proper normalization, one should normalize read density per gene, but it is not possible in the current 'metagene' version. 
