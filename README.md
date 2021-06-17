# Install required libraries:

```

# install shiny stuff
packages <- c('tidyverse' 'optparse', 'shiny', 'shinyjs', 'viridis', 'RColorBrewer',
'cowplot', 'patchwork', 'ggpubr')
install.packages(packages)

# install Seurat
install.pacakges('Seurat')

```

# How to run on your local environment

We have included a script to easily test the shiny app locally on your computer in `run-app-local.R`.
This script takes three arguments, the path to the script containing the user interface (ui), `--ui`,
the path to the script containing the server, `--server`, and the port number allowing you to
access the app on your web browser with a specific port `--port`. You can use `-h` help option
to see the three options.

Here is an example:

```

Rscript --vanilla run-app-local.R \
    --ui /path/to/shinyapp/ui.R \
    --server /path/to/shinyapp/server.R \
    --seurat /path/to/shinyapp/data/seurat.rds \
    --port 2222

```

Then the app will launch and you can check it on your web browser at: `http://127.0.0.1:2222/`
