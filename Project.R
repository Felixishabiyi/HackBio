#Downloading the airway_metadata dataset
airway_metadata <- read.csv("C:/Users/Administrator/Downloads/HackBio/airway_metadata.csv")
View(airway_metadata)

#Downloading the airway_scaledcounts dataset
airway_scaledcounts <- read.csv("C:/Users/Administrator/Downloads/HackBio/airway_scaledcounts.csv")
View(airway_scaledcounts)

#Extracting the genes
gen = airway_scaledcounts$ensgene

#loading the tidyverse package
library(tidyverse)

#Loading the dplyr library
library(dplyr)

#Creating the metadata
meta = data.frame(id = identi,
                  depth=colSums(airway_scaledcounts[,2:ncol(airway_scaledcounts)])) %>%
  left_join(airway_metadata)
View(meta)

#Loading DESeq2
library(DESeq2)

#creatung a DESeq2 datasetmatrix
ddd <- DESeqDataSetFromMatrix(countData = airway_scaledcounts,
                              colData = airway_metadata,
                              design = ~ dex, tidy = T)
#Running the model
ddd <- DESeq(ddd)

#Preparaing the data for DESeq Analysis
final_result <- results(ddd, tidy=T)
head(final_result)
View(final_result)

#Cleaning the data by removing the rows the NA
final_new = na.omit(final_result)
View(final_new)

#Loading the annotation database
library(org.Hs.eg.db)

#Converting the ensemble genes ID to gene symbols
keytypes(org.Hs.eg.db)
columns(org.Hs.eg.db)
final_new$Symbols <- mapIds(org.Hs.eg.db,
                            keys = final_new$row,
                            keytype = "ENSEMBL",
                            column = "SYMBOL")
View(final_new)

#scattered plots to show the upregulated and the down regulated genes
with(final_new, plot(x=log2FoldChange, y = -log10(padj),
                       pch = 20, col = "black"))
     
with(subset(final_new, abs(log2FoldChange) > 4), text(x=log2FoldChange, y = -log10(padj),
                                        pch=20, col="blue", labels=Symbols))

with(subset(final_new, -log10(padj) > 40), text(x=log2FoldChange, y = -log10(padj),
                                            pch=20, col="blue", labels=Symbols))
mtext('Treated Vs Control')
View(final_new)



#To read Methylation data
methyl <- read.csv("C:/Users/Administrator/Downloads/HackBio/Methylatio_450_Score_Bronchial_Asthma_5_Patients.csv", sep = "\t")
View(methyl)

#To remove rows with empty gene and island columns
#methyl = methyl[!(methyl$Gene==""),]
#methyl = methyl[!(methyl$Island==""),]
View(methyl)

#Calculating the methylation mean score of the samples obtained from the five patients
methyl$Mean = rowMeans(methyl[,c(2,3,4,5,6)])
View(methyl)

#Filtering the methylation data based on the upregulated and downregualated gene
#New_methyl_data <- methyl %>% filter_all(any_vars(. %in% c('SPARCL1','PER1','MAOA',
                                                           #'ARHGEF2','ZBTB16','ALOX15',
                                                           #'ANGPTL7','LOC102724788')))
New_methyl_data <- methyl %>% filter_all(any_vars(. %in% c('SPARCL1','ARHGEF2',
                                                           'STOM','KCTD12',
                                                           'ALOX15B',
                                                           'FAM107A')))
View(New_methyl_data)

#Grouping the Data based on the gene name
by_gene <- group_by(New_methyl_data, Gene)
summarise(New_methyl_data, overall_mean = mean(Mean))
MethylVGene <- summarise(by_gene, overall_mean = mean(Mean))
View(MethylVGene)

#ploting the gene vs overall methylation mean
barplot(MethylVGene$overall_mean,width=1,names= MethylVGene$Gene, ylim = c(0,0.8),
        ylab = "Mean Methylation Score", xlab = "Genes",col = ifelse(MethylVGene$overall_mean < 0.3,"orange","blue"))
mtext("Methylation Vs Genes")

#Functional enrichment analysis

#Installing packages for Functional Enrichment

BiocManager::install("clusterProfiler")

BiocManager::install("AnnotationDbi")

BiocManager::install("org.Hs.eg.db")

#Loading library
library("clusterProfiler")
library("AnnotationDbi")
library("org.Hs.eg.db")

View(final_new)

#setting the rows greater than 4 to the morethan4 variable
Morethan4 <- final_new[final_new$log2FoldChange > 2,]
View(Morethan4)
genes4 <- Morethan4$row

#running the our ensemble id through the enrichGo to get the biological process it affects
GO_result4 <- enrichGO(gene = genes4, OrgDb = "org.Hs.eg.db", keyType = "ENSEMBL",
                       ont = "BP")

#setting into dataframe
as.data.frame(GO_result4)
View(GO_result4)
#plotting into barplot to visualize data
fit <- plot(barplot(GO_result4, showCategory = 20), 
            main = "Functional Enrichment of Upregulated expressed Genes")


#setting the rows greater than 4 to the less than -4 variable
downreg <- final_new[final_new$log2FoldChange < -2,]
View(downreg)
downgene <- Morethan4$row

#running the our ensemble id through the enrichGo to get the biological process it affects
GO_resultdown <- enrichGO(gene = downgene, OrgDb = "org.Hs.eg.db", keyType = "ENSEMBL",
                       ont = "BP")

as.data.frame(GO_resultdown)
View(GO_resultdown)

#Visualizing our data
fitdown <- plot(barplot(GO_resultdown, showCategory = 20))
