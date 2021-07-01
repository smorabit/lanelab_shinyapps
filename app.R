library(shiny)
library(optparse)
library(Seurat)
library(shinyjs)
library(shinythemes)
library(patchwork)
library(tidyverse)



# load seurat object:
seurat_obj <- readRDS('data/J-Virology/AS_Seurat_Object_JVirol.rds')

# add cluster name column:
seurat_obj$celltype <- Idents(seurat_obj)
umap_colors <- readRDS('data/J-Virology/UMAP_cols_Idents_JVirol.rds')

names(umap_colors) <- levels(Idents(seurat_obj))

umap_theme <- theme(
  axis.line=element_blank(),
  axis.text.x=element_blank(),
  axis.text.y=element_blank(),
  axis.ticks=element_blank(),
  axis.title.x=element_blank(),
  axis.title.y=element_blank(),
  panel.background=element_blank(),
  panel.border=element_blank(),
  panel.grid.major=element_blank(),
  panel.grid.minor=element_blank()
)


# get gene expression matrix:
exp_mat <- GetAssayData(seurat_obj, slot='data')

# dotplot default genes from the paper:
dotplot_genes <- c(
  'Cd3e', 'Cd4', 'Cd8a', 'Lat', 'Pdcd1', 'Gzmb', 'Bcl2', 'Xcl1', 'Ncr1', 'Kirb1c',
  'Klre1', 'Cd79a', 'Iglc3', 'Ms4a1', 'Cd19', 'Jchain', 'F13a1', 'Hp', 'Gsr', 'Cd300a',
  'Ms4a6d', 'Cybb', 'Tgfbi', 'Slamf7', 'Isg20', 'Smox', 'Apoe', 'Ms4a7', 'Cd81', 'Tmem119',
  'Sparc', 'P2ry12', 'Ccl2', 'S100a9', 'S100a8', 'Camp', 'Ly6g', 'H2-Ab1', 'Ifitm1', 'Cd86',
  'Siglech', 'Klk1', 'Cd300c'
)

source('ui.R')
source('server.R')

shinyApp(ui=ui, server=server)
