# Installation
## Follow https://bioconductor.org/packages/release/bioc/html/DESeq2.html
install.packages("BiocManager")
## use domestic mirror
BiocManager::install("DESeq2", site_repository="https://mirrors.tuna.tsinghua.edu.cn/bioconductor")
  
library("DESeq2")
help(package="DESeq2")

# Read data
counts <- read.csv("counts.csv", row.names = "ENSAMBLE.Gene.ID")
head(counts)
summary(counts)

group <- read.csv("metadata.csv")

# make DESeq2 dataframe
dds <- DESeqDataSetFromMatrix(countData = counts,
                              colData = group,
                              design = ~ Group)
dds

# filter 0
dds <- dds[rowSums(counts(dds)) > 1, ]
dds

# standard analysis
dds <- DESeq(dds)
res <- results(dds, contrast = c("Group", "Kidney", "Liver"))

# output
write.table(res,"result.csv", sep = ",", row.names = TRUE)
head(res)

# Valcano plot
data <- read.csv("result.csv", header = TRUE)
head(data)

data$color <- ifelse(data$padj<0.05 & abs(data$log2FoldChange)>= 1.5,ifelse(data$log2FoldChange > 1,'red','blue'),'gray')
color <- c(red = "red",gray = "gray",blue = "blue")

p <- ggplot(data, aes(log2FoldChange, -log10(padj), col = color)) +
  geom_point() +
  theme_bw() +
  scale_color_manual(values = color) +
  labs(x="log2 (fold change)",y="-log10 (q-value)") +
  geom_hline(yintercept = -log10(0.05), lty=4,col="grey",lwd=0.6) +
  geom_vline(xintercept = c(-1.5, 1.5), lty=4,col="grey",lwd=0.6) +
  theme(legend.position = "none",
        panel.grid=element_blank(),
        axis.title = element_text(size = 16),
        axis.text = element_text(size = 14))
p


## Extract gene name
upregulated <- subset(data, log2FoldChange>1.5 & padj<0.01)
summary(upregulated)

downregulated <- subset(data, log2FoldChange<(-1.5) & padj<0.01)
summary(downregulated)

write.table(row.names(upregulated), "upregulated_gene.txt", row.names = FALSE)
write.table(row.names(downregulated), "downregulated_gene.txt", row.names = FALSE)
