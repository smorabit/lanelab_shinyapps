server <- function(input, output) {

  output$DimPlot1 <- renderPlot({
    DimPlot(seurat_obj, label=TRUE, cols=umap_colors)
  })

  output$FeaturePlotCondition <- renderPlot({

      # get min and max expression for this gene:
      expression_range <- range(exp_mat[input$featuregene1,])

      # p <- FeaturePlot(seurat_obj, split.by='cond', features=input$featuregene1, order=TRUE, combine=FALSE)
      # return(wrap_plots(p, ncol=2))
      p <- FeaturePlot(seurat_obj, split.by='cond', features=input$featuregene1, order=TRUE, combine=FALSE)

      for(i in 1:3){
        p[[i]] <- p[[i]] + NoLegend() + umap_theme + ggtitle('')
      }
      p[[4]] <- p[[4]] + umap_theme

      wrap_plots(p, ncol=4) &
      scale_color_gradient(low = "gray", high = "blue", limits = expression_range) &
      plot_annotation(title=input$featuregene1)

  })

  output$DimPlotCondition <- renderPlot({
    DimPlot(seurat_obj, split.by='cond', label=FALSE, cols=umap_colors, ncol=2) + theme(legend.position='bottom')
  })


  output$DotPlot1 <- renderPlot({
    DotPlot(seurat_obj, features=input$dotgenes)
  })

  output$VlnPlot1 <- renderPlot({
    VlnPlot(seurat_obj, features=input$vlngene1, pt.size=0, cols=umap_colors) + NoLegend()
  })

}
