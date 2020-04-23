#### script to select genes associated with TPR1 binding sites ####

# read TPR1 binding peaks
peak_info <- read.delim("TPR1_peak_annotation.txt", sep = "\t", dec = ".", header = TRUE)

# nr of peaks associated with unique annotated genes
# using only Nearest Promoter ID or Annotation column will miss potential genes associated with the peak
# the solution is to combine geneIDs from both columns
# the difference between these two columns is observed when the peak has a TTS annotation
peak_AGI_all <- unique(c(substr(peak_info$Nearest.PromoterID[peak_info$Distance.to.TSS >= -3000], start = 1, stop = 9),
                         substr(gene_peaks$Annotation, start = regexpr("AT", gene_peaks$Annotation), stop = regexpr("AT", gene_peaks$Annotation)+8)))
peak_AGI_all <- peak_AGI_all[grep("ATM", peak_AGI_all, invert = TRUE)] # remove mitochondrial genes
peak_AGI_all <- peak_AGI_all[grep("ATC", peak_AGI_all, invert = TRUE)] # remove chloroplast genes


length(peak_AGI_all) # number of genes associated with TPR1

# write geneIDs into the files
write.table(peak_AGI_all, "TPR1_bound_genes.txt", col.names = FALSE, row.names = FALSE, quote = FALSE)
