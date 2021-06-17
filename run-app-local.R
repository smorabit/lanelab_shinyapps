library(shiny)
library(optparse)
library(Seurat)
library(shinyjs)
library(shinythemes)

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


# source the ui and server files:
source(opt$ui)
source(opt$server)

# load seurat obj
print(paste0('Loading ', opt$seurat))
seurat_obj <- readRDS(opt$seurat)
print('Done!')

shiny::shinyApp(
  ui=ui,
  server=server,
  options=list(port=opt$port)
)
