ui <- tagList(
  # theme = shinythemes::themeSelector(),
  navbarPage("Syage et al J Virology 2020", theme = shinytheme('cosmo'),
    tabPanel("Clusters",
      sidebarLayout(
        sidebarPanel(width=2,

          # select gene
          selectizeInput(
            inputId='vlngene1',
            label='select gene',
            choices=rownames(seurat_obj),
            selected='Cst7',
            multiple=FALSE
          )
        ),
        mainPanel(
          fluidRow(
            column(12,
              # umap by variable 1
              plotOutput("DimPlot1", height='600px', width='100%')
            )
          ),
          fluidRow(
            column(12,
              plotOutput('VlnPlot1')
            )
          )
        )
      )
    ),
    tabPanel("Timepoints",
      sidebarLayout(
        sidebarPanel(width=2,
          # select gene
          selectizeInput(
            inputId='featuregene1',
            label='select gene',
            choices=rownames(seurat_obj),
            selected='Cst7',
            multiple=FALSE
          )
        ),
        mainPanel(
          fluidRow(
            column(12,
              plotOutput("FeaturePlotCondition", height='300px') #, height='800px', width='900px')
            )
          ),
          fluidRow(
            column(12,
              plotOutput("DimPlotCondition") #, height='400px')
            )
          )

        )
      )
    ),
    tabPanel("Dotplot",
      sidebarLayout(
        sidebarPanel(width=2,
          selectizeInput(
            inputId='dotgenes',
            label='select genes',
            choices=rownames(seurat_obj),
            selected=dotplot_genes,
            multiple=TRUE
          )
        ),
        mainPanel(
          fluidRow(
            column(12,
              plotOutput("DotPlot1")
            )
          )
        )
      )
    ),
    tabPanel("Publication",
      h2('Abstract'),
      p("Intracranial (i.c.) infection of susceptible C57BL/6 mice with the neu- rotropic JHM strain of mouse hepatitis virus (JHMV) (a member of the Coronaviridae family) results in acute encephalomyelitis and viral persistence associated with an immune-mediated demyelinating disease. The present study was undertaken to bet- ter understand the molecular pathways evoked during innate and adaptive immune responses as well as the chronic demyelinating stage of disease in response to JHMV infection of the central nervous system (CNS). Using single-cell RNA sequenc- ing analysis (scRNAseq) on flow-sorted CD45-positive (CD45⫹
) cells enriched from
brains and spinal cords of experimental mice, we demonstrate the heterogeneity of the immune response as determined by the presence of unique molecular signa- tures and pathways involved in effective antiviral host defense. Furthermore, we identify potential genes involved in contributing to demyelination as well as remy- elination being expressed by both microglia and macrophages. Collectively, these findings emphasize the diversity of the immune responses and molecular networks at defined stages following viral infection of the CNS."),
a(href="https://doi.org/10.1128/JVI.01295-20", "Check out our full study in the Journal of Virology"),
a(imageOutput('JVLogo'), href="https://doi.org/10.1128/JVI.01295-20"),



    )
  )
)
