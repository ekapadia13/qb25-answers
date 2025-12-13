# Week 8

setwd("/Users/cmdb/qb25-answers/week8")
library(DESeq2)
library(tidyverse)
library(broom)

# Exercise 1
# 1.1
gtex_metadata <- read_delim("gtex_metadata_downsample.txt") #subjects = colummns, genes = rows
gtex_wbc <- read_delim("gtex_whole_blood_counts_downsample.txt")
gene_locations <- read_delim("gene_locations.txt")

gtex_wbc <- column_to_rownames(gtex_wbc, var = "GENE_NAME") 
gtex_wbc[1:5 , ]
gtex_metadata[1:5 , ]

# 1.2
gtex_metadata <- column_to_rownames(gtex_metadata, var = "SUBJECT_ID")
colnames(gtex_wbc) == rownames(gtex_metadata)

dds <- DESeqDataSetFromMatrix(countData = gtex_wbc,
                                colData = gtex_metadata,
                                design = ~ SEX + AGE + DTHHRDY )

# 1.3
vsd <- vst(dds)
plotPCA(vsd, intgroup = "SEX")
ggsave("ex1_PCA_SEX.png")

plotPCA(vsd, intgroup = "AGE")
ggsave("ex1_PCA_AGE.png")

plotPCA(vsd, intgroup = "DTHHRDY")
ggsave("ex1_PCA_DTHHRDY.png")

# The proportion of variance in the gene expression data explained by the first two principle components is 48 + 7 = 55%. 
# PC1 seems to be associated with the type of death (i.e. natural causes versus ventilator)
# PC2 seems to be associated with male versus female

# Exercise 2
# 2.1
vsd_df <- assay(vsd) %>% t() %>% as_tibble()

vsd_df <- bind_cols(gtex_metadata, vsd_df)

m1 <- lm(formula = WASH7P ~ DTHHRDY + AGE + SEX, data = vsd_df) %>% summary() %>% tidy()
m1
# WASH7P does not show significant evidence of sex-differential expression. The p value is greater than 0.05

m2 <- lm(formula = SLC25A47 ~ DTHHRDY + AGE + SEX, data = vsd_df) %>% summary() %>% tidy()
m2
#ANSWER TO QUESTION:
# SLC25A47 does show evidence of sex-differential expression. The p value is smaller than 0.05. The direction is up in males

# 2.2
dds <- DESeq(dds)

# 2.3
res <- results(dds, name = "SEX_male_vs_female")  %>%
  as_tibble(rownames = "GENE_NAME")

FDR_10 <- results(dds, name = "SEX_male_vs_female")  %>%
  as_tibble(rownames = "GENE_NAME")%>%
  filter(padj < 0.1)
FDR_10
# There are 262 genes which exhibit differential expression between males and females at a 10 % FDR.

merged <- left_join(res, gene_locations, by = "GENE_NAME")

merged <- merged %>% arrange(padj)
head(merged)
# chrY encodes the genes that are most strongly up-regulated in males.
# chrX encodes the genes that are most strongly up-regulated in females.
# There are more male upregulated genes near the top of the list.
# The p values match significant versus non significant, showing that these could be consistent
# This analysis illustrates the trade off between false positives and false negatives, where stringent FDRs reduces false positives but increases false negatives while lenient FDRs do the opposite. Samples sizes and effect sizes improves the power to detect true differences.

# 2.4
res2 <- results(dds, name = "DTHHRDY_ventilator_case_vs_fast_death_of_natural_causes")  %>%
  as_tibble(rownames = "GENE_NAME")
FDR_10_2 <- results(dds, name = "DTHHRDY_ventilator_case_vs_fast_death_of_natural_causes")  %>%
  as_tibble(rownames = "GENE_NAME")%>%
  filter(padj < 0.1)
FDR_10_2
# There are 16,069 genes which exhibit differential expression according to death classification at a 10% FDR.

# 2.5
metadata_shuffled <- gtex_metadata
metadata_shuffled$SEX <- sample(metadata_shuffled$SEX, replace = FALSE)

dds_shuffled <- DESeqDataSetFromMatrix(countData = gtex_wbc,
                                       colData = metadata_shuffled,
                                       design = ~ SEX + AGE + DTHHRDY)
dds_shuffled <- DESeq(dds_shuffled)

res_shuffled <- results(dds_shuffled, name = "SEX_male_vs_female") %>%
  as_tibble(rownames= "GENE_NAME")

FDR_10_shuffled <- res_shuffled %>%
  filter(padj < 0.1)
# 36 genes appear significant in this permuted analysis at 10% FDR. The number of significant genes from the real analysis was 262. 
# This suggests that the FDR threshold does not produces a large number of false positives in large-scale RNA-seq experiments.

# Exercise 3
res <- results(dds, name = "SEX_male_vs_female") %>%
  as_tibble(rownames = "GENE_NAME") %>%
  mutate(neg_log1_padj = -log10(padj),
        significant = if_else(padj < 0.1 & abs(log2FoldChange)>1, "significant", "not significant"))

ggplot(res, aes(x= log2FoldChange, y = neg_log1_padj)) +
  geom_point(aes(color = significant)) +
  scale_color_manual(values = c("significant" = "pink", "not significant" = "pink4"))+
  labs(
    title = "Volcano Plot of Differential Expression Between Males and Females",
    x = "log2(Fold Change)",
    y = "-log10 (Adjusted p-value)")

ggsave("ex3.png")
