# Week 7

setwd("/Users/cmdb/qb25-answers/week7")
library(tidyverse)
library(tidyr)
library(dplyr)
library(matrixStats)
library(ggplot2)

### Exercise 1
spradling_data <- as.matrix(read.table("read_matrix.tsv"))
data_top500 <- rowSds(spradling_data) %>% order(decreasing = TRUE) %>% head(500)

data_500 <- spradling_data[data_top500 , ]
transposed_data <- t(data_500)
pca_results <- prcomp(transposed_data)

pca_plot = tibble(PC1=pca_results$x[ , 1],
                 PC2=pca_results$x[ , 2],
                 sample_names = rownames(transposed_data))

# fixing the PCA plot
spradling_data[ , c(12,13)] <- spradling_data[ , c(13,12)]

data_top500 <- rowSds(spradling_data) %>% order(decreasing = TRUE) %>% head(n=500)

data_500 <- spradling_data[data_top500 , ]

transposed_data <-t(data_500)
pca_results = prcomp(transposed_data)

pca_plot = tibble(PC1=pca_results$x[ , 1],
                  PC2=pca_results$x[ , 2],
                  sample_names= rownames(transposed_data))

separate_data<- separate(pca_plot,col= sample_names, into= c("tissue", "replicate"), sep = "_")

ggplot(separate_data, aes(PC1, PC2, color=tissue, shape=replicate)) +
  geom_point(size=3)

ggsave("ex1_CorrectedPCAplot.png")

# bar chart
separate_data<- separate(pca_plot,col= sample_names, into= c("tissue", "replicate"), sep = "_")

ggplot(separate_data, aes(PC1, PC2, color=tissue, shape=replicate)) +
  geom_point(size=3)

ggsave("ex1_PCAplot.png")

pca_barchart <- tibble(PC=seq(1,nrow(transposed_data),1),
                       sd=summary(pca_results)$sdev) %>%
  mutate(norm_var=sd^2/sum(sd^2)) %>%
  mutate(cum_var=cumsum(norm_var))

ggplot(data = pca_summary, aes(x=PC, y=norm_var)) +
  geom_col() +
  labs(y = "Percent variance explained")

ggsave("ex1_barchart.png")

### Exercise 2
combined = spradling_data[,seq(1, 21, 3)]
combined = combined + spradling_data[,seq(2, 21, 3)]
combined = combined + spradling_data[,seq(3, 21, 3)]
combined = combined / 3

data_stdh <- rowSds(combined)
data_std <- combined[data_stdh>1,]

set.seed(42)
kmeans_results <- kmeans(data_std, centers=12, nstart=100)
cluster_labels <- kmeans_results$cluster

sorted <- order(cluster_labels)

sorted_data <- data_std[sorted , ]

sorted_clusters <- cluster_labels[sorted]

heatmap(sorted_data, Rowv=NA, Colv=NA, RowSideColors=RColorBrewer::brewer.pal(12,"Paired")[sorted_clusters], ylab="Gene")

ggsave("ex2_heatmap.png")

### Exercise 3
cluster2_genes <- rownames(data_std)[cluster_labels == 2] 
cluster7_genes <- rownames(data_std)[cluster_labels == 7]

write.table(cluster2_genes,
            file = "cluster2_genes.txt",
            quote = FALSE,
            row.names = FALSE,
            col.names = FALSE)

write.table(cluster7_genes,
            file = "cluster7_genes.txt",
            quote = FALSE,
            row.names = FALSE,
            col.names = FALSE)