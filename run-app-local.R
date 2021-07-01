library(shiny)
library(optparse)
library(Seurat)
library(shinyjs)
library(shinythemes)
library(patchwork)
library(tidyverse)

option_list <- list(
  make_option(c('--ui'), type='character', default='ui.R', help='path to shiny ui file'),
  make_option(c('--server'), type='character', default='server.R', help='path to shiny server file'),
  make_option(c('--seurat'), type='character', default=NULL, help='path to seurat object .rds file'),
  make_option(c('--port'), type='numeric', default=4444, help='port to access the shiny app locally')
)

# parse arguments
opt_parser = OptionParser(option_list=option_list)
opt = parse_args(opt_parser)

print(opt)


# load seurat obj
print(paste0('Loading ', opt$seurat))
seurat_obj <- readRDS(opt$seurat)
print('Done!')

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

# source the ui and server files:
source(opt$ui)
source(opt$server)


shiny::shinyApp(
  ui=ui,
  server=server,
  options=list(port=opt$port)
)


# example call:
Rscript --vanilla run-app-local.R \
  --ui ui.R \
  --server server.R \
  --seurat data/J-Virology/AS_Seurat_Object_JVirol.rds \
  --port 3333
