ui <- tagList(
  theme = shinythemes::themeSelector(),
  navbarPage("Syage et al J Virology 2020", # theme = 'cerulean'
    tabPanel("Page1",
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
    tabPanel("Page2",
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
              plotOutput("FeaturePlotCondition", height='200px') #, height='800px', width='900px')
            )
          ),
          fluidRow(
            column(12,
              plotOutput("DimPlotCondition", height='800px', width='800px')
            )
          )

        )
      )
    ),
    tabPanel("Page3",
      sidebarLayout(
        sidebarPanel(width=2,
          selectizeInput(
            inputId='dotgenes',
            label='select genes',
            choices=rownames(seurat_obj),
            selected='Csf1r',
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
    )
  )
)
