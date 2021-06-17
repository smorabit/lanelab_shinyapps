ui <- navbarPage("Syage et al J Virology 2020", theme = shinytheme("cyborg"),
  tabPanel("Page1",
    sidebarLayout(
      sidebarPanel(width=2,
        # select categorical variable
        selectInput(
          inputId = 'category1',
          label = "select categorical variable 1",
          choices = c("cond", "seurat_clusters"),
          selected = "seurat_clusters"
        ),
        # select categorical variable 2
        selectInput(
          inputId = 'category2',
          label = "select categorical variable 2",
          choices = c("cond", 'seurat_clusters'),
          selected = "cond"
        )
      ),
      mainPanel(
        fluidRow(
          column(6,
            # umap by variable 1
            plotOutput("DimPlot1")
          ),
          column(6,
            # umap by variable 2
            plotOutput('DimPlot2')
          )
        )
      )
    )
  ),
  tabPanel("Page2")
)
