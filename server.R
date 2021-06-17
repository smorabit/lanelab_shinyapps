server <- function(input, output) {

  output$DimPlot1 <- renderPlot({
    DimPlot(seurat_obj, group.by=input$category1) + DarkTheme()
  })

  output$DimPlot2 <- renderPlot({
    DimPlot(seurat_obj, group.by=input$category2)
  })

}
