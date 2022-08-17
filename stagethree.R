#The dataset used were downloaded through google cloud shell from the ncbi
#gene expression ominibus which was later downloaded to my device


#Installing Bioconductor
if (!require("BiocManager", quietly = TRUE))
  install.packages("BiocManager")
BiocManager::install(version = "3.15")


#using bioconductor to install packages
BiocManager::install("edgeR")
BiocManager::install("DESeq2")
BiocManager::install("tidyverse")
BiocManager::install("reshape2")
BiocManager::install("dendextend")


#loading the libraries
library(edgeR)
library(DESeq2)
library(tidyverse)
library(reshape2)
library(dendextend)

#loading the readr library
library(readr)

#importing the data
SraRunTable <- read_csv("C:/Users/Administrator/Downloads/HackBio/stage3/SraRunTable.txt")
View(SraRunTable)


#cleaning the columns name
colnames(SraRunTable) = gsub(" \\(exp\\)","",colnames(SraRunTable))
View(SraRunTable)

#replacing the - and + in the cell type columns with _minus and _plus
SraRunTable$Cell_type = gsub("\\-","_minus",SraRunTable$Cell_type)
SraRunTable$Cell_type = gsub("\\+","_plus",SraRunTable$Cell_type)
View(SraRunTable)

#casting the names of the respective htseq.txt file into a list (file_list)
file_list <- list.files(path="/Users/Administrator/Downloads/HackBio/stage3/counts",full.names = T)
View(file_list)

#To extract the symbols of the htseq.txt files from path and passing it into accession variable
accession = gsub(".*/Users/Administrator/Downloads/HackBio/stage3/counts/\\s*|\\_.*$","",file_list)

#To extract the genes names from the file_list and passing it into genes variable
genes <- read.table(file_list[1], header=FALSE, sep = "\t")[,1]

#to extract the values from the second column of all the htseq.txt files
counts <- do.call(cbind,lapply(file_list,function(fn)read.table(fn,header=FALSE,sep = "\t")[,2]))

#setting the column names of the counts dataframe to the actual names passed into accession variable
colnames(counts) = accession

#creating a new dataframe
counts = data.frame(SYMBOLS=genes,counts)

View(counts)

#To view the statistics provided by the htseq
View(tail(counts))

#removing the htseq stat at the end
counts = counts[!c(grepl("__no_feature",counts$SYMBOLS)|
                   grepl("__ambiguous",counts$SYMBOLS)|
                   grepl("__too_low_aQual",counts$SYMBOLS)|
                     grepl("__not_aligned",counts$SYMBOLS)|
                     grepl("__alignment_not_unique",counts$SYMBOLS)), ]

#viewing the tail
View(tail(counts))

#Installing the dplyr package to enable the %>% for piping.
install.packages("dplyr")

library(dplyr)

#creating a new metadata frame
metadata = data.frame(GEO_Accession = accession,
                      depth = colSums(counts[,2:ncol(counts)]) ) %>%
  left_join(SraRunTable)
View(metadata)

#Loading the ggplot library
library(ggplot2)

#Installing the cowplot package
install.packages("cowplot")

#loading the cowplot library
library(cowplot)

#Plots to show the cell type
metadata %>% 
  ggplot(aes(x=accession,y=depth,fill=Mouse_ID)) +
  geom_col() +
  facet_wrap(~Cell_type, scales="free_y")+
  coord_flip()+
  ggtitle("cell type")

#Plots to show the treatment types
metadata %>% 
  ggplot(aes(x=accession,y=depth,fill=Mouse_ID)) +
  geom_col() +
  facet_wrap(~treatment, scales="free_y")+
  coord_flip()+
  ggtitle("treatment")

#To use the EdgeR Package
#Normalization and Filtering
dgList <- DGEList(counts=counts[,-1],
                 genes=counts$SYMBOLS,
                 group=metadata$source_name)


#Counts per million
countspermillion <- cpm(dgList)
summary(countspermillion)

#Count check to determine the counts based on 1 in a million
countcheck <- countspermillion > 1
head(countcheck)

#filtered the dgList based on the countcheck
keep <- which(rowSums(countcheck) >= 10)
dgList <- dgList[keep,]
genes.filt = genes[keep]
length(genes.filt)

#Switching the DESeq
counts_filt = dgList$counts

#Creating a DESeq object
dds <- DESeqDataSetFromMatrix(countData = counts_filt,
                              colData = metadata,
                              design = ~ Cell_type + treatment)

#running the DESeq model
dds <- DESeq(dds)

#Visualizing the normalized counts obtained from the DESed Model
vsd <- vst(dds, blind=FALSE)
mat <- assay(vsd)
head(as.data.frame(mat))


#DESeq Analysis
HomeCagevNonshock = results(dds, contrast = c("treatment","HomeCage","Non Shock"), tidy = TRUE)
FearCondvNonshock = results(dds, contrast = c("treatment","Fear Conditioned","Non Shock"), tidy = TRUE)
FearCondvHomeCage = results(dds, contrast = c("treatment","Fear Conditioned","HomeCage"), tidy = TRUE)

#Reformatting results obatined from the DESeq analysis above
pval=0.5
ifc=1.5

#Home Vs Nonshock dataset
HomeCagevNonshock = HomeCagevNonshock %>%
  mutate(sig = ifelse(log2FoldChange > ifc & padj, "UP", (ifelse(log2FoldChange < -ifc & padj < pval, "DOWN","not sig")))) %>%
  mutate(SYMBOLS=genes.filt)

head(HomeCagevNonshock)

#Running the table function to view the proportion of the sig and not sig in the dataset
table(HomeCagevNonshock$sig)

#to extract the symbols of the genes that are significant
HomeCagevNonshock$SYMBOLS[!(HomeCagevNonshock$sig %in% "not sig")]

#Fearconditioned vs Non shock
FearCondvNonshock = FearCondvNonshock %>%
  mutate(sig = ifelse(log2FoldChange > ifc & padj, "UP", (ifelse(log2FoldChange < -ifc & padj < pval, "DOWN","not sig")))) %>%
  mutate(SYMBOLS=genes.filt)

head(FearCondvNonshock)

#Running the table function to view the proportion of the sig and not sig in the dataset
table(FearCondvNonshock$sig)

#Fearconditioned vs Home cage
FearCondvHomeCage = FearCondvHomeCage %>%
  mutate(sig = ifelse(log2FoldChange > ifc & padj, "UP", (ifelse(log2FoldChange < -ifc & padj < pval, "DOWN","not sig")))) %>%
  mutate(SYMBOLS=genes.filt)

head(FearCondvHomeCage)

#Running the table function to view the proportion of the sig and not sig in the dataset
table(FearCondvHomeCage$sig)

#Volcano plots for the Fearconditioned vs Home cage dataset
FearCondvHomeCage %>%
  filter(!(sig %in% NA)) %>%
  ggplot(aes(x=log2FoldChange,y=-log(padj), color=sig))+
  geom_point()+
  geom_vline(xintercept = -1.5)+
  geom_vline(xintercept = 1.5)+
  geom_hline(yintercept = -log(0.05))

#Volcano Plots for the Fearconditioned Vs Non shock  
FearCondvNonshock %>%
  filter(!(sig %in% NA)) %>%
  ggplot(aes(x=log2FoldChange,y=-log(padj), color=sig))+
  geom_point()+
  geom_vline(xintercept = -1.5)+
  geom_vline(xintercept = 1.5)+
  geom_hline(yintercept = -log(0.05))

#Volcano plots for Homacage vs Non shock
HomeCagevNonshock %>%
  filter(!(sig %in% NA)) %>%
  ggplot(aes(x=log2FoldChange,y=-log(padj), color=sig))+
  geom_point()+
  geom_vline(xintercept = -1.5)+
  geom_vline(xintercept = 1.5)+
  geom_hline(yintercept = -log(0.05))

save.image("DiffExpressResults.RData")