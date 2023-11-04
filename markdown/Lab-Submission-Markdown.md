Lab-Submission-Markdown.Rmd
================
Wisdom
2023-10-30

- [Student Details](#student-details)
- [Setup Chunk](#setup-chunk)
- [Used
  Datasets:iris,cars,ChickWeight](#used-datasetsiriscarschickweight)
  - [ggplot2 —-](#ggplot2--)
  - [caret —-](#caret--)
  - [mlbench —-](#mlbench--)
  - [R Markdown](#r-markdown)
  - [Including Plots](#including-plots)
- [A. Linear Algorithms —-](#a-linear-algorithms--)
  - [1. Linear Regression —-](#1-linear-regression--)
    - [1.a. Linear Regression using Ordinary Least Squares without caret
      —-](#1a-linear-regression-using-ordinary-least-squares-without-caret--)
- [The lm() function is in the stats package and creates a linear
  regression](#the-lm-function-is-in-the-stats-package-and-creates-a-linear-regression)
- [model using ordinary least squares
  (OLS).](#model-using-ordinary-least-squares-ols)
  - [2. Logistic Regression —-](#2-logistic-regression--)
    - [2.a. Logistic Regression without caret
      —-](#2a-logistic-regression-without-caret--)
      - [Load and split the dataset —-](#load-and-split-the-dataset--)
- [B. Non-Linear Algorithms —](#b-non-linear-algorithms-)

# Student Details

|                                              |           |
|----------------------------------------------|-----------|
| **Student ID Number**                        | …         |
| **Student Name**                             | …         |
| **BBIT 4.2 Group**                           | .WISDOM.. |
| **BI Project Group Name/ID (if applicable)** | …         |

# Setup Chunk

# Used Datasets:iris,cars,ChickWeight

## ggplot2 —-

## caret —-

## mlbench —-

``` r
knitr::opts_chunk$set(echo = TRUE)
```

## R Markdown

This is an R Markdown document. Markdown is a simple formatting syntax
for authoring HTML, PDF, and MS Word documents. For more details on
using R Markdown see <http://rmarkdown.rstudio.com>.

When you click the **Knit** button a document will be generated that
includes both content as well as the output of any embedded R code
chunks within the document. You can embed an R code chunk like this:

## Including Plots

You can also embed plots, for example:

Note that the `echo = FALSE` parameter was added to the code chunk to
prevent printing of the R code that generated the plot. \# If
renv::restore() did not install the “languageserver” package (required
to \# use R for VS Code), then it can be installed manually as follows
(restart R \# after executing the command):

``` r
.libPaths()
```

    ## [1] "C:/Users/25479/AppData/Local/R/win-library/4.3"
    ## [2] "C:/Program Files/R/R-4.3.1/library"

``` r
lapply(.libPaths(), list.files)
```

    ## [[1]]
    ##   [1] "abind"           "Amelia"          "arules"          "arulesViz"      
    ##   [5] "askpass"         "backports"       "base64enc"       "BayesFactor"    
    ##   [9] "bit"             "bit64"           "blob"            "brew"           
    ##  [13] "brio"            "broom"           "bslib"           "ca"             
    ##  [17] "cachem"          "Cairo"           "callr"           "car"            
    ##  [21] "carData"         "caret"           "cellranger"      "circlize"       
    ##  [25] "classInt"        "cli"             "clipr"           "clock"          
    ##  [29] "coda"            "collections"     "colorspace"      "colourpicker"   
    ##  [33] "combinat"        "commonmark"      "conflicted"      "contfrac"       
    ##  [37] "corrplot"        "covr"            "cowplot"         "cpp11"          
    ##  [41] "crayon"          "crosstalk"       "curl"            "cyclocomp"      
    ##  [45] "data.table"      "DBI"             "dbplyr"          "dendextend"     
    ##  [49] "desc"            "deSolve"         "diagram"         "diffobj"        
    ##  [53] "digest"          "dplyr"           "DT"              "dtplyr"         
    ##  [57] "e1071"           "ellipse"         "ellipsis"        "elliptic"       
    ##  [61] "emmeans"         "estimability"    "evaluate"        "factoextra"     
    ##  [65] "FactoMineR"      "fansi"           "farver"          "fastICA"        
    ##  [69] "fastmap"         "flashClust"      "fontawesome"     "forcats"        
    ##  [73] "foreach"         "formatR"         "formattable"     "fs"             
    ##  [77] "future"          "future.apply"    "gargle"          "gclus"          
    ##  [81] "generics"        "ggcorrplot"      "ggforce"         "ggplot2"        
    ##  [85] "ggpubr"          "ggraph"          "ggrepel"         "ggsci"          
    ##  [89] "ggsignif"        "glmnet"          "GlobalOptions"   "globals"        
    ##  [93] "glue"            "googledrive"     "googlesheets4"   "gower"          
    ##  [97] "graphlayouts"    "gridExtra"       "gtable"          "hardhat"        
    ## [101] "haven"           "highr"           "hms"             "htmltools"      
    ## [105] "htmlwidgets"     "httpuv"          "httr"            "hypergeo"       
    ## [109] "ids"             "igraph"          "ipred"           "isoband"        
    ## [113] "iterators"       "janeaustenr"     "jomo"            "jpeg"           
    ## [117] "jquerylib"       "jsonlite"        "kableExtra"      "kernlab"        
    ## [121] "klaR"            "knitr"           "labeling"        "labelled"       
    ## [125] "languageserver"  "later"           "lava"            "lazyeval"       
    ## [129] "leaps"           "LiblineaR"       "lifecycle"       "lintr"          
    ## [133] "listenv"         "lme4"            "lmtest"          "lubridate"      
    ## [137] "magick"          "magrittr"        "markdown"        "Matrix"         
    ## [141] "MatrixModels"    "memery"          "memoise"         "mice"           
    ## [145] "mime"            "miniUI"          "minqa"           "mitml"          
    ## [149] "mlbench"         "mockery"         "ModelMetrics"    "modelr"         
    ## [153] "multcompView"    "munsell"         "mvtnorm"         "naivebayes"     
    ## [157] "naniar"          "NHANES"          "nloptr"          "norm"           
    ## [161] "numDeriv"        "openssl"         "ordinal"         "pacman"         
    ## [165] "pan"             "parallelly"      "pbapply"         "pbkrtest"       
    ## [169] "permute"         "pillar"          "pkgbuild"        "pkgconfig"      
    ## [173] "pkgload"         "plotly"          "plumber"         "plyr"           
    ## [177] "png"             "polyclip"        "polynom"         "praise"         
    ## [181] "prettyunits"     "pROC"            "processx"        "prodlim"        
    ## [185] "progress"        "progressr"       "promises"        "proxy"          
    ## [189] "ps"              "purrr"           "qap"             "quantreg"       
    ## [193] "questionr"       "R.cache"         "R.methodsS3"     "R.oo"           
    ## [197] "R.utils"         "R6"              "radarchart"      "ragg"           
    ## [201] "randomForest"    "rappdirs"        "RColorBrewer"    "Rcpp"           
    ## [205] "RcppArmadillo"   "RcppEigen"       "readr"           "readxl"         
    ## [209] "recipes"         "registry"        "rematch"         "rematch2"       
    ## [213] "remotes"         "reprex"          "reshape2"        "rex"            
    ## [217] "rlang"           "rmarkdown"       "roxygen2"        "rprojroot"      
    ## [221] "RRF"             "rstatix"         "rstudioapi"      "rvest"          
    ## [225] "sass"            "scales"          "scatterplot3d"   "selectr"        
    ## [229] "seriation"       "shape"           "shiny"           "shinyBS"        
    ## [233] "shinycssloaders" "shinyjs"         "showtext"        "showtextdb"     
    ## [237] "SnowballC"       "sodium"          "sourcetools"     "SparseM"        
    ## [241] "SQUAREM"         "stringi"         "stringr"         "styler"         
    ## [245] "svglite"         "swagger"         "sys"             "sysfonts"       
    ## [249] "systemfonts"     "testthat"        "textshaping"     "tibble"         
    ## [253] "tidygraph"       "tidyr"           "tidyselect"      "tidytext"       
    ## [257] "tidyverse"       "timechange"      "timeDate"        "tinytex"        
    ## [261] "tokenizers"      "TSP"             "tweenr"          "tzdb"           
    ## [265] "ucminf"          "UpSetR"          "utf8"            "uuid"           
    ## [269] "vcd"             "vctrs"           "vegan"           "viridis"        
    ## [273] "viridisLite"     "visdat"          "visNetwork"      "vroom"          
    ## [277] "waldo"           "webshot"         "webutils"        "widyr"          
    ## [281] "withr"           "wordcloud2"      "xfun"            "xml2"           
    ## [285] "xmlparsedata"    "xtable"          "yaml"            "yarrr"          
    ## [289] "zoo"            
    ## 
    ## [[2]]
    ##  [1] "base"         "boot"         "class"        "cluster"      "codetools"   
    ##  [6] "compiler"     "datasets"     "foreign"      "graphics"     "grDevices"   
    ## [11] "grid"         "KernSmooth"   "lattice"      "MASS"         "Matrix"      
    ## [16] "methods"      "mgcv"         "nlme"         "nnet"         "parallel"    
    ## [21] "rpart"        "spatial"      "splines"      "stats"        "stats4"      
    ## [26] "survival"     "tcltk"        "tools"        "translations" "utils"

``` r
if (require("languageserver")) {
  require("languageserver")
} else {
  install.packages("languageserver", dependencies = TRUE,
                   repos = "https://cloud.r-project.org")
}
```

    ## Loading required package: languageserver

``` r
# STEP 1. Install and Load the Required Packages ----
## stats ----
if (require("stats")) {
  require("stats")
} else {
  install.packages("stats", dependencies = TRUE,
                   repos = "https://cloud.r-project.org")
}

## mlbench ----
if (require("mlbench")) {
  require("mlbench")
} else {
  install.packages("mlbench", dependencies = TRUE,
                   repos = "https://cloud.r-project.org")
}
```

    ## Loading required package: mlbench

``` r
## caret ----
if (require("caret")) {
  require("caret")
} else {
  install.packages("caret", dependencies = TRUE,
                   repos = "https://cloud.r-project.org")
}
```

    ## Loading required package: caret

    ## Loading required package: ggplot2

    ## Loading required package: lattice

``` r
## MASS ----
if (require("MASS")) {
  require("MASS")
} else {
  install.packages("MASS", dependencies = TRUE,
                   repos = "https://cloud.r-project.org")
}
```

    ## Loading required package: MASS

``` r
## glmnet ----
if (require("glmnet")) {
  require("glmnet")
} else {
  install.packages("glmnet", dependencies = TRUE,
                   repos = "https://cloud.r-project.org")
}
```

    ## Loading required package: glmnet

    ## Loading required package: Matrix

    ## Loaded glmnet 4.1-8

``` r
## e1071 ----
if (require("e1071")) {
  require("e1071")
} else {
  install.packages("e1071", dependencies = TRUE,
                   repos = "https://cloud.r-project.org")
}
```

    ## Loading required package: e1071

``` r
## kernlab ----
if (require("kernlab")) {
  require("kernlab")
} else {
  install.packages("kernlab", dependencies = TRUE,
                   repos = "https://cloud.r-project.org")
}
```

    ## Loading required package: kernlab

    ## 
    ## Attaching package: 'kernlab'

    ## The following object is masked from 'package:ggplot2':
    ## 
    ##     alpha

``` r
## rpart ----
if (require("rpart")) {
  require("rpart")
} else {
  install.packages("rpart", dependencies = TRUE,
                   repos = "https://cloud.r-project.org")
}
```

    ## Loading required package: rpart

# A. Linear Algorithms —-

## 1. Linear Regression —-

### 1.a. Linear Regression using Ordinary Least Squares without caret —-

# The lm() function is in the stats package and creates a linear regression

# model using ordinary least squares (OLS).

``` r
data("cars")
# Define an 80:20 train:test data split
set.seed(123) # for reproducibility
train_index <- createDataPartition(cars$Mileage, p = 0.8, list = FALSE)
cars_train <- cars[train_index, ]
cars_test <- cars[-train_index, ]

#### Train the model ----
cars_model_lm <- lm(Mileage ~ ., data = cars_train)

#### Display the model's details ----
print(cars_model_lm)
```

    ## 
    ## Call:
    ## lm(formula = Mileage ~ ., data = cars_train)
    ## 
    ## Coefficients:
    ## (Intercept)        Price     Cylinder        Doors       Cruise        Sound  
    ##   13741.928       -1.134     4322.587     2059.781      703.080     -313.785  
    ##     Leather        Buick     Cadillac        Chevy      Pontiac         Saab  
    ##    1496.468      528.358    12388.538    -1161.612    -3326.288    13498.224  
    ##      Saturn  convertible        coupe    hatchback        sedan        wagon  
    ##          NA    14099.493           NA    -8575.429    -5689.300           NA

``` r
#### Make predictions ----
predictions <- predict(cars_model_lm, newdata = cars_test)

#### Display the model's evaluation metrics ----
##### RMSE ----
rmse <- sqrt(mean((cars_test$Mileage - predictions)^2))
print(paste("RMSE =", sprintf(rmse, fmt = "%#.4f")))
```

    ## [1] "RMSE = 6968.8104"

``` r
##### SSR ----
ssr <- sum((cars_test$Mileage - predictions)^2)
print(paste("SSR =", sprintf(ssr, fmt = "%#.4f")))
```

    ## [1] "SSR = 7770291037.5007"

``` r
##### SST ----
sst <- sum((cars_test$Mileage - mean(cars_test$Mileage))^2)
print(paste("SST =", sprintf(sst, fmt = "%#.4f")))
```

    ## [1] "SST = 10139219727.9438"

``` r
##### R Squared ----
r_squared <- 1 - (ssr / sst)
print(paste("R Squared =", sprintf(r_squared, fmt = "%#.4f")))
```

    ## [1] "R Squared = 0.2336"

``` r
##### MAE ----
absolute_errors <- abs(predictions - cars_test$Mileage)
mae <- mean(absolute_errors)
print(paste("MAE =", sprintf(mae, fmt = "%#.4f")))
```

    ## [1] "MAE = 5348.6487"

## 2. Logistic Regression —-

### 2.a. Logistic Regression without caret —-

#### Load and split the dataset —-

``` r
data("cars")
# Define a 70:30 train:test data split of the dataset.
train_index <- createDataPartition(cars$Mileage,
                                   p = 0.7,
                                   list = FALSE)
cars_train <- cars[train_index, ]
cars_test <- cars[-train_index, ]

#### Train the model ----
cars_model_glm <- glm(Saab ~ ., data = cars_train, family = binomial(link = "logit"), control = glm.control(maxit = 100))

#### Display the model's details ----
print(cars_model_glm)
```

    ## 
    ## Call:  glm(formula = Saab ~ ., family = binomial(link = "logit"), data = cars_train, 
    ##     control = glm.control(maxit = 100))
    ## 
    ## Coefficients:
    ## (Intercept)        Price      Mileage     Cylinder        Doors       Cruise  
    ##   2.857e+01    8.606e-12    1.372e-12   -2.350e-08   -3.345e-08   -9.615e-09  
    ##       Sound      Leather        Buick     Cadillac        Chevy      Pontiac  
    ##   1.111e-08   -4.741e-09   -5.713e+01   -5.713e+01   -5.713e+01   -5.713e+01  
    ##      Saturn  convertible        coupe    hatchback        sedan        wagon  
    ##  -5.713e+01   -2.690e-07           NA    9.485e-08    9.129e-08           NA  
    ## 
    ## Degrees of Freedom: 563 Total (i.e. Null);  548 Residual
    ## Null Deviance:       464.1 
    ## Residual Deviance: 4.428e-10     AIC: 32

``` r
#### Make predictions ----
probabilities <- predict(cars_model_glm, cars_test[, 1:18],
                         type = "response")
```

    ## Warning in predict.lm(object, newdata, se.fit, scale = 1, type = if (type == :
    ## prediction from rank-deficient fit; attr(*, "non-estim") has doubtful cases

``` r
print(probabilities)
```

    ##            2           10           26           28           29           31 
    ## 3.925673e-13 1.000000e+00 1.000000e+00 1.000000e+00 1.000000e+00 1.000000e+00 
    ##           35           36           43           48           57           58 
    ## 1.000000e+00 1.000000e+00 1.000000e+00 1.000000e+00 1.000000e+00 1.000000e+00 
    ##           60           62           64           74           79           83 
    ## 1.000000e+00 3.925672e-13 3.925672e-13 3.925672e-13 3.925672e-13 3.925673e-13 
    ##           93           98          101          102          105          106 
    ## 3.925673e-13 3.925673e-13 3.925673e-13 3.925673e-13 3.925673e-13 3.925672e-13 
    ##          109          115          117          118          122          126 
    ## 3.925672e-13 3.925672e-13 3.925672e-13 3.925673e-13 3.925673e-13 3.925673e-13 
    ##          130          131          134          145          152          153 
    ## 3.925672e-13 3.925673e-13 3.925673e-13 3.925673e-13 3.925673e-13 3.925672e-13 
    ##          154          157          159          161          167          175 
    ## 3.925672e-13 3.925672e-13 3.925672e-13 3.925673e-13 3.925673e-13 3.925672e-13 
    ##          176          179          181          182          183          185 
    ## 3.925672e-13 3.925672e-13 3.925673e-13 3.925673e-13 3.925673e-13 3.925673e-13 
    ##          188          189          199          200          202          208 
    ## 3.925673e-13 3.925673e-13 3.925672e-13 3.925672e-13 3.925672e-13 3.925673e-13 
    ##          211          216          220          223          224          225 
    ## 3.925673e-13 1.000000e+00 1.000000e+00 1.000000e+00 1.000000e+00 1.000000e+00 
    ##          226          228          230          233          234          241 
    ## 1.000000e+00 1.000000e+00 1.000000e+00 1.000000e+00 1.000000e+00 3.925672e-13 
    ##          250          256          257          263          265          266 
    ## 3.925673e-13 3.925672e-13 3.925672e-13 3.925673e-13 3.925673e-13 3.925673e-13 
    ##          269          275          276          285          296          298 
    ## 3.925673e-13 3.925673e-13 3.925673e-13 3.925673e-13 3.925673e-13 3.925673e-13 
    ##          300          306          307          310          321          327 
    ## 3.925673e-13 3.925673e-13 3.925673e-13 3.925673e-13 3.925673e-13 3.925673e-13 
    ##          329          334          335          338          344          347 
    ## 3.925673e-13 3.925673e-13 3.925673e-13 3.925673e-13 3.925673e-13 3.925673e-13 
    ##          354          355          360          362          363          365 
    ## 3.925673e-13 3.925673e-13 3.925673e-13 3.925673e-13 3.925673e-13 3.925673e-13 
    ##          367          369          370          372          377          383 
    ## 3.925673e-13 3.925673e-13 3.925673e-13 3.925673e-13 3.925673e-13 3.925673e-13 
    ##          385          387          392          394          397          403 
    ## 3.925673e-13 3.925673e-13 3.925673e-13 3.925673e-13 3.925673e-13 3.925672e-13 
    ##          407          414          419          420          421          422 
    ## 3.925672e-13 3.925673e-13 3.925673e-13 3.925673e-13 3.925672e-13 3.925672e-13 
    ##          423          428          429          431          432          437 
    ## 3.925672e-13 3.925672e-13 3.925672e-13 3.925672e-13 3.925672e-13 3.925673e-13 
    ##          441          444          448          449          453          454 
    ## 3.925673e-13 3.925673e-13 3.925673e-13 3.925673e-13 3.925673e-13 3.925673e-13 
    ##          456          471          472          474          478          481 
    ## 3.925673e-13 3.925673e-13 3.925673e-13 3.925672e-13 3.925673e-13 3.925673e-13 
    ##          485          488          490          499          500          502 
    ## 3.925673e-13 3.925673e-13 3.925673e-13 3.925673e-13 3.925673e-13 3.925673e-13 
    ##          506          507          508          510          512          513 
    ## 3.925673e-13 3.925673e-13 3.925673e-13 3.925673e-13 3.925673e-13 3.925673e-13 
    ##          517          521          522          523          524          526 
    ## 3.925673e-13 3.925673e-13 3.925673e-13 3.925673e-13 3.925673e-13 3.925673e-13 
    ##          528          529          535          539          540          543 
    ## 3.925673e-13 3.925673e-13 3.925672e-13 3.925672e-13 3.925672e-13 3.925673e-13 
    ##          545          547          548          551          563          567 
    ## 3.925673e-13 3.925673e-13 3.925673e-13 3.925673e-13 3.925673e-13 3.925672e-13 
    ##          569          570          577          580          583          584 
    ## 1.000000e+00 1.000000e+00 1.000000e+00 1.000000e+00 1.000000e+00 1.000000e+00 
    ##          585          589          590          595          598          600 
    ## 1.000000e+00 1.000000e+00 3.925672e-13 3.925672e-13 3.925673e-13 3.925673e-13 
    ##          603          605          614          618          619          621 
    ## 3.925672e-13 3.925673e-13 3.925672e-13 3.925673e-13 3.925673e-13 3.925673e-13 
    ##          624          626          627          629          630          631 
    ## 3.925673e-13 3.925673e-13 3.925672e-13 3.925672e-13 3.925672e-13 3.925672e-13 
    ##          632          634          639          643          644          647 
    ## 3.925673e-13 3.925673e-13 3.925672e-13 3.925673e-13 3.925673e-13 3.925672e-13 
    ##          651          652          657          659          660          666 
    ## 3.925673e-13 3.925672e-13 1.000000e+00 1.000000e+00 1.000000e+00 3.925672e-13 
    ##          667          670          672          681          690          692 
    ## 3.925672e-13 3.925672e-13 3.925673e-13 3.925673e-13 3.925673e-13 3.925673e-13 
    ##          696          699          706          707          708          715 
    ## 3.925672e-13 3.925673e-13 3.925673e-13 3.925673e-13 3.925673e-13 3.925673e-13 
    ##          716          721          723          727          728          730 
    ## 3.925673e-13 3.925673e-13 3.925672e-13 3.925672e-13 3.925673e-13 3.925673e-13 
    ##          734          737          738          740          744          747 
    ## 3.925673e-13 3.925672e-13 3.925672e-13 3.925673e-13 3.925673e-13 3.925673e-13 
    ##          748          749          756          759          761          762 
    ## 3.925672e-13 3.925672e-13 3.925673e-13 3.925673e-13 3.925673e-13 3.925673e-13 
    ##          764          765          770          775          778          779 
    ## 3.925673e-13 3.925672e-13 3.925673e-13 3.925673e-13 3.925673e-13 3.925673e-13 
    ##          783          785          791          797          799          802 
    ## 3.925673e-13 3.925673e-13 3.925672e-13 3.925673e-13 3.925672e-13 3.925672e-13 
    ## attr(,"non-estim")
    ##   2  10  26  28  29  31  35  36  43  48  57  58  60  62  64  74  79  83  93  98 
    ##   1   2   3   4   5   6   7   8   9  10  11  12  13  14  15  16  17  18  19  20 
    ## 101 102 105 106 109 115 117 118 122 126 131 145 152 153 154 157 159 161 167 175 
    ##  21  22  23  24  25  26  27  28  29  30  32  34  35  36  37  38  39  40  41  42 
    ## 176 179 181 182 183 185 188 189 199 200 202 208 216 220 223 224 225 226 228 230 
    ##  43  44  45  46  47  48  49  50  51  52  53  54  56  57  58  59  60  61  62  63 
    ## 233 234 241 250 256 257 263 265 266 269 275 276 285 296 300 306 307 310 321 327 
    ##  64  65  66  67  68  69  70  71  72  73  74  75  76  77  79  80  81  82  83  84 
    ## 329 334 335 338 344 347 354 355 360 362 363 365 367 369 370 372 377 383 385 387 
    ##  85  86  87  88  89  90  91  92  93  94  95  96  97  98  99 100 101 102 103 104 
    ## 392 394 397 403 407 414 421 422 423 428 429 431 432 437 441 444 448 449 453 454 
    ## 105 106 107 108 109 110 113 114 115 116 117 118 119 120 121 122 123 124 125 126 
    ## 456 471 472 478 481 485 488 490 499 500 502 506 507 508 510 512 513 517 521 522 
    ## 127 128 129 131 132 133 134 135 136 137 138 139 140 141 142 143 144 145 146 147 
    ## 523 524 526 528 529 535 539 540 543 547 548 551 563 569 570 577 580 583 584 585 
    ## 148 149 150 151 152 153 154 155 156 158 159 160 161 163 164 165 166 167 168 169 
    ## 589 590 595 598 600 603 605 614 624 627 629 630 631 632 634 639 643 644 647 651 
    ## 170 171 172 173 174 175 176 177 181 183 184 185 186 187 188 189 190 191 192 193 
    ## 652 657 659 660 666 667 670 681 690 692 696 699 706 707 708 715 716 721 723 727 
    ## 194 195 196 197 198 199 200 202 203 204 205 206 207 208 209 210 211 212 213 214 
    ## 728 730 734 737 738 740 744 748 749 756 759 761 762 764 765 770 775 778 779 783 
    ## 215 216 217 218 219 220 221 223 224 225 226 227 228 229 230 231 232 233 234 235 
    ## 785 791 797 799 802 
    ## 236 237 238 239 240

``` r
predictions <- ifelse(probabilities > 0.5, "pos", "neg")
print(predictions)
```

    ##     2    10    26    28    29    31    35    36    43    48    57    58    60 
    ## "neg" "pos" "pos" "pos" "pos" "pos" "pos" "pos" "pos" "pos" "pos" "pos" "pos" 
    ##    62    64    74    79    83    93    98   101   102   105   106   109   115 
    ## "neg" "neg" "neg" "neg" "neg" "neg" "neg" "neg" "neg" "neg" "neg" "neg" "neg" 
    ##   117   118   122   126   130   131   134   145   152   153   154   157   159 
    ## "neg" "neg" "neg" "neg" "neg" "neg" "neg" "neg" "neg" "neg" "neg" "neg" "neg" 
    ##   161   167   175   176   179   181   182   183   185   188   189   199   200 
    ## "neg" "neg" "neg" "neg" "neg" "neg" "neg" "neg" "neg" "neg" "neg" "neg" "neg" 
    ##   202   208   211   216   220   223   224   225   226   228   230   233   234 
    ## "neg" "neg" "neg" "pos" "pos" "pos" "pos" "pos" "pos" "pos" "pos" "pos" "pos" 
    ##   241   250   256   257   263   265   266   269   275   276   285   296   298 
    ## "neg" "neg" "neg" "neg" "neg" "neg" "neg" "neg" "neg" "neg" "neg" "neg" "neg" 
    ##   300   306   307   310   321   327   329   334   335   338   344   347   354 
    ## "neg" "neg" "neg" "neg" "neg" "neg" "neg" "neg" "neg" "neg" "neg" "neg" "neg" 
    ##   355   360   362   363   365   367   369   370   372   377   383   385   387 
    ## "neg" "neg" "neg" "neg" "neg" "neg" "neg" "neg" "neg" "neg" "neg" "neg" "neg" 
    ##   392   394   397   403   407   414   419   420   421   422   423   428   429 
    ## "neg" "neg" "neg" "neg" "neg" "neg" "neg" "neg" "neg" "neg" "neg" "neg" "neg" 
    ##   431   432   437   441   444   448   449   453   454   456   471   472   474 
    ## "neg" "neg" "neg" "neg" "neg" "neg" "neg" "neg" "neg" "neg" "neg" "neg" "neg" 
    ##   478   481   485   488   490   499   500   502   506   507   508   510   512 
    ## "neg" "neg" "neg" "neg" "neg" "neg" "neg" "neg" "neg" "neg" "neg" "neg" "neg" 
    ##   513   517   521   522   523   524   526   528   529   535   539   540   543 
    ## "neg" "neg" "neg" "neg" "neg" "neg" "neg" "neg" "neg" "neg" "neg" "neg" "neg" 
    ##   545   547   548   551   563   567   569   570   577   580   583   584   585 
    ## "neg" "neg" "neg" "neg" "neg" "neg" "pos" "pos" "pos" "pos" "pos" "pos" "pos" 
    ##   589   590   595   598   600   603   605   614   618   619   621   624   626 
    ## "pos" "neg" "neg" "neg" "neg" "neg" "neg" "neg" "neg" "neg" "neg" "neg" "neg" 
    ##   627   629   630   631   632   634   639   643   644   647   651   652   657 
    ## "neg" "neg" "neg" "neg" "neg" "neg" "neg" "neg" "neg" "neg" "neg" "neg" "pos" 
    ##   659   660   666   667   670   672   681   690   692   696   699   706   707 
    ## "pos" "pos" "neg" "neg" "neg" "neg" "neg" "neg" "neg" "neg" "neg" "neg" "neg" 
    ##   708   715   716   721   723   727   728   730   734   737   738   740   744 
    ## "neg" "neg" "neg" "neg" "neg" "neg" "neg" "neg" "neg" "neg" "neg" "neg" "neg" 
    ##   747   748   749   756   759   761   762   764   765   770   775   778   779 
    ## "neg" "neg" "neg" "neg" "neg" "neg" "neg" "neg" "neg" "neg" "neg" "neg" "neg" 
    ##   783   785   791   797   799   802 
    ## "neg" "neg" "neg" "neg" "neg" "neg"

``` r
## 3. Linear Discriminant Analysis ----
### 3.a. Linear Discriminant Analysis without caret ----

#### Load and split the dataset ----

data("esoph")
# Define a 70:30 train:test data split of the dataset.
train_index <- createDataPartition(esoph$tobgp,
                                   p = 0.7,
                                   list = FALSE)
esoph_train <- esoph[train_index, ]
esoph_test <- esoph[-train_index, ]

#### Train the model ----
esoph_model_lda <- lda(tobgp ~ ., data = esoph_train)

#### Display the model's details ----
print(esoph_model_lda)
```

    ## Call:
    ## lda(tobgp ~ ., data = esoph_train)
    ## 
    ## Prior probabilities of groups:
    ##  0-9g/day     10-19     20-29       30+ 
    ## 0.2741935 0.2741935 0.2258065 0.2258065 
    ## 
    ## Group means:
    ##                agegp.L     agegp.Q     agegp.C       agegp^4     agegp^5
    ## 0-9g/day -1.195229e-01 -0.01283635 -0.05261336 -6.669961e-02  0.04446641
    ## 10-19    -6.327681e-02 -0.01283635 -0.06138226  8.893282e-02  0.02964427
    ## 20-29    -3.567800e-17 -0.10910895 -0.10647943 -8.524346e-17  0.06299408
    ## 30+       3.414939e-02 -0.06234797 -0.03194383  5.399492e-02 -0.13498731
    ##             alcgp.L     alcgp.Q       alcgp.C   ncases ncontrols
    ## 0-9g/day 0.01315334 -0.08823529  9.207339e-02 3.529412 19.058824
    ## 10-19    0.06576671  0.08823529  6.576671e-02 2.823529  7.294118
    ## 20-29    0.00000000 -0.07142857 -1.387779e-17 1.785714  4.714286
    ## 30+      0.03194383  0.07142857 -9.583148e-02 1.714286  1.785714
    ## 
    ## Coefficients of linear discriminants:
    ##                   LD1         LD2         LD3
    ## agegp.L    0.03537531  0.37249663  1.23519414
    ## agegp.Q   -2.02427843 -1.51857407  0.03690128
    ## agegp.C   -0.48697208 -1.22294041  0.47660749
    ## agegp^4    0.44231847 -0.78207405 -0.18890889
    ## agegp^5    0.20632376  0.50346990 -1.76917482
    ## alcgp.L   -1.61543636  0.07491854  0.29662981
    ## alcgp.Q   -0.17463338 -1.44818727 -0.22124407
    ## alcgp.C    0.44627149  0.44766074 -1.05181753
    ## ncases    -0.27896934 -0.28100497 -0.09237287
    ## ncontrols -0.11986415  0.02287586  0.03711729
    ## 
    ## Proportion of trace:
    ##    LD1    LD2    LD3 
    ## 0.9038 0.0660 0.0301

``` r
#### Make predictions ----
predictions <- predict(esoph_model_lda,
                       esoph_test[, 1:5])$class

#### Display the model's evaluation metrics ----
table(predictions, esoph_test$tobgp)
```

    ##            
    ## predictions 0-9g/day 10-19 20-29 30+
    ##    0-9g/day        4     1     0   0
    ##    10-19           3     2     1   1
    ##    20-29           0     2     2   5
    ##    30+             0     2     3   0

``` r
### 3.b.  Linear Discriminant Analysis with caret ----
#### Load and split the dataset ---
data("esoph")

# Define a 70:30 train:test data split of the dataset.
train_index <- createDataPartition(esoph$tobgp,
                                   p = 0.7,
                                   list = FALSE)
esoph_train <- esoph[train_index, ]
esoph_test <- esoph[-train_index, ]

#### Train the model ----
set.seed(7)

# We apply a Leave One Out Cross Validation resampling method
train_control <- trainControl(method = "LOOCV")
# We also apply a standardize data transform to make the mean = 0 and
# standard deviation = 1
esoph_caret_model_lda <- train(tobgp ~ .,
                                  data = esoph_train,
                                  method = "lda", metric = "Accuracy",
                                  preProcess = c("center", "scale"),
                                  trControl = train_control)

#### Display the model's details ----
print(esoph_caret_model_lda)
```

    ## Linear Discriminant Analysis 
    ## 
    ## 62 samples
    ##  4 predictor
    ##  4 classes: '0-9g/day', '10-19', '20-29', '30+' 
    ## 
    ## Pre-processing: centered (10), scaled (10) 
    ## Resampling: Leave-One-Out Cross-Validation 
    ## Summary of sample sizes: 61, 61, 61, 61, 61, 61, ... 
    ## Resampling results:
    ## 
    ##   Accuracy   Kappa      
    ##   0.2096774  -0.05596107

``` r
#### Make predictions ----
predictions <- predict(esoph_caret_model_lda,
                       esoph_test[, 1:5])

#### Display the model's evaluation metrics ----
confusion_matrix <-
  caret::confusionMatrix(predictions,
                         esoph_test[, 1:5]$tobgp)
print(confusion_matrix)
```

    ## Confusion Matrix and Statistics
    ## 
    ##           Reference
    ## Prediction 0-9g/day 10-19 20-29 30+
    ##   0-9g/day        3     2     0   0
    ##   10-19           4     1     1   2
    ##   20-29           0     4     3   3
    ##   30+             0     0     2   1
    ## 
    ## Overall Statistics
    ##                                           
    ##                Accuracy : 0.3077          
    ##                  95% CI : (0.1433, 0.5179)
    ##     No Information Rate : 0.2692          
    ##     P-Value [Acc > NIR] : 0.4001          
    ##                                           
    ##                   Kappa : 0.0769          
    ##                                           
    ##  Mcnemar's Test P-Value : NA              
    ## 
    ## Statistics by Class:
    ## 
    ##                      Class: 0-9g/day Class: 10-19 Class: 20-29 Class: 30+
    ## Sensitivity                   0.4286      0.14286       0.5000    0.16667
    ## Specificity                   0.8947      0.63158       0.6500    0.90000
    ## Pos Pred Value                0.6000      0.12500       0.3000    0.33333
    ## Neg Pred Value                0.8095      0.66667       0.8125    0.78261
    ## Prevalence                    0.2692      0.26923       0.2308    0.23077
    ## Detection Rate                0.1154      0.03846       0.1154    0.03846
    ## Detection Prevalence          0.1923      0.30769       0.3846    0.11538
    ## Balanced Accuracy             0.6617      0.38722       0.5750    0.53333

``` r
## 4. Regularized Linear Regression ----
### 4.a. Regularized Linear Regression Classification Problem without CARET ----
#### Load the dataset ----
data("iris")
x <- as.matrix(iris[, 1:4])
y <- as.matrix(iris[, 5])

#### Train the model ----
iris_model_glm <- glmnet(x, y, family = "multinomial", alpha = 0.5, lambda = 0.001)

#### Display the model's details ----
print(iris_model_glm)
```

    ## 
    ## Call:  glmnet(x = x, y = y, family = "multinomial", alpha = 0.5, lambda = 0.001) 
    ## 
    ##   Df  %Dev Lambda
    ## 1  4 94.62  0.001

``` r
#### Make predictions ----
predictions <- predict(iris_model_glm, x, type = "class")

#### Display the model's evaluation metrics ----
table(predictions, iris$Species)
```

    ##             
    ## predictions  setosa versicolor virginica
    ##   setosa         50          0         0
    ##   versicolor      0         48         1
    ##   virginica       0          2        49

``` r
### 4.b. Regularized Linear Regression Regression Problem without CARET ----
#### Load the dataset ----
data("ChickWeight")
ChickWeight$chas <- # nolint: object_name_linter.
  as.numeric(as.character(ChickWeight$weight))
x <- as.matrix(ChickWeight[, 1:3])
y <- as.matrix(ChickWeight[, 5])

#### Train the model ----
ChickWeight_model_glm <- glmnet(x, y, family = "gaussian",
                                   alpha = 0.5, lambda = 0.001)

#### Display the model's details ----
print(ChickWeight_model_glm)
```

    ## 
    ## Call:  glmnet(x = x, y = y, family = "gaussian", alpha = 0.5, lambda = 0.001) 
    ## 
    ##   Df %Dev Lambda
    ## 1  2  100  0.001

``` r
#### Make predictions ----
predictions <- predict(ChickWeight_model_glm, x, type = "link")

#### Display the model's evaluation metrics ----
mse <- mean((y - predictions)^2)
print(mse)
```

    ## [1] 9.054208e-07

``` r
##### RMSE ----
rmse <- sqrt(mean((y - predictions)^2))
print(paste("RMSE =", sprintf(rmse, fmt = "%#.4f")))
```

    ## [1] "RMSE = 0.0010"

``` r
##### SSR ----
ssr <- sum((y - predictions)^2)
print(paste("SSR =", sprintf(ssr, fmt = "%#.4f")))
```

    ## [1] "SSR = 0.0005"

``` r
##### SST ----
sst <- sum((y - mean(y))^2)
print(paste("SST =", sprintf(sst, fmt = "%#.4f")))
```

    ## [1] "SST = 2914555.9256"

``` r
##### R Squared ----
r_squared <- 1 - (ssr / sst)
print(paste("R Squared =", sprintf(r_squared, fmt = "%#.4f")))
```

    ## [1] "R Squared = 1.0000"

``` r
##### MAE ----
absolute_errors <- abs(predictions - y)
mae <- mean(absolute_errors)
print(paste("MAE =", sprintf(mae, fmt = "%#.4f")))
```

    ## [1] "MAE = 0.0007"

``` r
### 4.c. Regularized Linear Regression Classification Problem with CARET ----
#### Load and split the dataset ----
data("iris")

# Define a 70:30 train:test data split of the dataset.
train_index <- createDataPartition(iris$Species,
                                   p = 0.7,
                                   list = FALSE)
iris_train <- iris[train_index, ]
iris_test <- iris[-train_index, ]

#### Train the model ----
# We apply the 5-fold cross validation resampling method
set.seed(7)
train_control <- trainControl(method = "cv", number = 5)
iris_caret_model_glmnet <-
  train(Species ~ ., data = iris_train,
        method = "glmnet", metric = "Accuracy",
        preProcess = c("center", "scale"), trControl = train_control)

#### Display the model's details ----
print(iris_caret_model_glmnet)
```

    ## glmnet 
    ## 
    ## 105 samples
    ##   4 predictor
    ##   3 classes: 'setosa', 'versicolor', 'virginica' 
    ## 
    ## Pre-processing: centered (4), scaled (4) 
    ## Resampling: Cross-Validated (5 fold) 
    ## Summary of sample sizes: 84, 84, 84, 84, 84 
    ## Resampling results across tuning parameters:
    ## 
    ##   alpha  lambda        Accuracy   Kappa    
    ##   0.10   0.0008657464  0.9714286  0.9571429
    ##   0.10   0.0086574637  0.9523810  0.9285714
    ##   0.10   0.0865746367  0.9238095  0.8857143
    ##   0.55   0.0008657464  0.9714286  0.9571429
    ##   0.55   0.0086574637  0.9523810  0.9285714
    ##   0.55   0.0865746367  0.9428571  0.9142857
    ##   1.00   0.0008657464  0.9809524  0.9714286
    ##   1.00   0.0086574637  0.9523810  0.9285714
    ##   1.00   0.0865746367  0.9523810  0.9285714
    ## 
    ## Accuracy was used to select the optimal model using the largest value.
    ## The final values used for the model were alpha = 1 and lambda = 0.0008657464.

``` r
#### Make predictions ----
predictions <- predict(iris_caret_model_glmnet,
                       iris_test[, 1:4])

#### Display the model's evaluation metrics ----
confusion_matrix <-
  caret::confusionMatrix(predictions,
                         iris_test[, 1:5]$Species)
print(confusion_matrix)
```

    ## Confusion Matrix and Statistics
    ## 
    ##             Reference
    ## Prediction   setosa versicolor virginica
    ##   setosa         15          0         0
    ##   versicolor      0         15         2
    ##   virginica       0          0        13
    ## 
    ## Overall Statistics
    ##                                           
    ##                Accuracy : 0.9556          
    ##                  95% CI : (0.8485, 0.9946)
    ##     No Information Rate : 0.3333          
    ##     P-Value [Acc > NIR] : < 2.2e-16       
    ##                                           
    ##                   Kappa : 0.9333          
    ##                                           
    ##  Mcnemar's Test P-Value : NA              
    ## 
    ## Statistics by Class:
    ## 
    ##                      Class: setosa Class: versicolor Class: virginica
    ## Sensitivity                 1.0000            1.0000           0.8667
    ## Specificity                 1.0000            0.9333           1.0000
    ## Pos Pred Value              1.0000            0.8824           1.0000
    ## Neg Pred Value              1.0000            1.0000           0.9375
    ## Prevalence                  0.3333            0.3333           0.3333
    ## Detection Rate              0.3333            0.3333           0.2889
    ## Detection Prevalence        0.3333            0.3778           0.2889
    ## Balanced Accuracy           1.0000            0.9667           0.9333

``` r
### 4.d. Regularized Linear Regression Regression Problem with CARET ----
#### Load and split the dataset ----
data("cars")

# Define a 70:30 train:test data split of the dataset.
train_index <- createDataPartition(cars$Mileage,
                                   p = 0.7,
                                   list = FALSE)
cars_train <- cars[train_index, ]
cars_test <- cars[-train_index, ]

#### Train the model ----
set.seed(7)
train_control <- trainControl(method = "cv", number = 5)
cars_caret_model_glmnet <-
  train(Mileage ~ .,
        data = cars_train, method = "glmnet",
        metric = "RMSE", preProcess = c("center", "scale"),
        trControl = train_control)

#### Display the model's details ----
print(cars_caret_model_glmnet)
```

    ## glmnet 
    ## 
    ## 564 samples
    ##  17 predictor
    ## 
    ## Pre-processing: centered (17), scaled (17) 
    ## Resampling: Cross-Validated (5 fold) 
    ## Summary of sample sizes: 452, 452, 450, 451, 451 
    ## Resampling results across tuning parameters:
    ## 
    ##   alpha  lambda      RMSE      Rsquared   MAE     
    ##   0.10     2.129798  7511.504  0.2038320  5901.697
    ##   0.10    21.297983  7512.657  0.2023451  5895.815
    ##   0.10   212.979826  7605.083  0.1847722  5916.086
    ##   0.55     2.129798  7510.910  0.2038740  5901.028
    ##   0.55    21.297983  7510.974  0.2024067  5893.855
    ##   0.55   212.979826  7661.619  0.1762177  5957.250
    ##   1.00     2.129798  7510.550  0.2039209  5900.785
    ##   1.00    21.297983  7509.739  0.2024043  5892.217
    ##   1.00   212.979826  7768.150  0.1573318  6033.185
    ## 
    ## RMSE was used to select the optimal model using the smallest value.
    ## The final values used for the model were alpha = 1 and lambda = 21.29798.

``` r
#### Make predictions ----
predictions <- predict(cars_caret_model_glmnet, cars_test[, 1:18])

#### Display the model's evaluation metrics ----
##### RMSE ----
rmse <- sqrt(mean((cars_test$Mileage - predictions)^2))
print(paste("RMSE =", sprintf(rmse, fmt = "%#.4f")))
```

    ## [1] "RMSE = 7126.9600"

``` r
##### SSR ----
# SSR is the sum of squared residuals (the sum of squared differences
# between observed and predicted values)
ssr <- sum((cars_test$Mileage - predictions)^2)
print(paste("SSR =", sprintf(ssr, fmt = "%#.4f")))
```

    ## [1] "SSR = 12190454231.0075"

``` r
##### SST ----
# SST is the total sum of squares (the sum of squared differences
# between observed values and their mean)
sst <- sum((cars_test$Mileage - mean(cars_test$Mileage))^2)
print(paste("SST =", sprintf(sst, fmt = "%#.4f")))
```

    ## [1] "SST = 14551679326.7958"

``` r
##### R Squared ----
# We then use SSR and SST to compute the value of R squared.
# The closer the R squared value is to 1, the better the model.
r_squared <- 1 - (ssr / sst)
print(paste("R Squared =", sprintf(r_squared, fmt = "%#.4f")))
```

    ## [1] "R Squared = 0.1623"

``` r
##### MAE ----

absolute_errors <- abs(predictions - cars_test$Mileage)
mae <- mean(absolute_errors)
print(paste("MAE =", sprintf(mae, fmt = "%#.4f")))
```

    ## [1] "MAE = 5560.7122"

# B. Non-Linear Algorithms —

``` r
## 1.  Classification and Regression Trees ----
### 1.a. Decision tree for a classification problem without caret ----
#### Load and split the dataset ----
data("iris")

# Define a 70:30 train:test data split of the dataset.
train_index <- createDataPartition(iris$Species,
                                   p = 0.7,
                                   list = FALSE)
iris_train <- iris[train_index, ]
iris_test <- iris[-train_index, ]

#### Train the model ----
Species_model_rpart <- rpart(Species ~ ., data = iris_train)

#### Display the model's details ----
print(Species_model_rpart)
```

    ## n= 105 
    ## 
    ## node), split, n, loss, yval, (yprob)
    ##       * denotes terminal node
    ## 
    ## 1) root 105 70 setosa (0.33333333 0.33333333 0.33333333)  
    ##   2) Petal.Length< 2.45 35  0 setosa (1.00000000 0.00000000 0.00000000) *
    ##   3) Petal.Length>=2.45 70 35 versicolor (0.00000000 0.50000000 0.50000000)  
    ##     6) Petal.Length< 4.75 31  1 versicolor (0.00000000 0.96774194 0.03225806) *
    ##     7) Petal.Length>=4.75 39  5 virginica (0.00000000 0.12820513 0.87179487) *

``` r
#### Make predictions ----
predictions <- predict(Species_model_rpart,
                       iris_test[, 1:4],
                       type = "class")

#### Display the model's evaluation metrics ----
table(predictions, iris_test$Species)
```

    ##             
    ## predictions  setosa versicolor virginica
    ##   setosa         15          0         0
    ##   versicolor      0         14         0
    ##   virginica       0          1        15

``` r
confusion_matrix <-
  caret::confusionMatrix(predictions,
                         iris_test[, 1:5]$Species)
print(confusion_matrix)
```

    ## Confusion Matrix and Statistics
    ## 
    ##             Reference
    ## Prediction   setosa versicolor virginica
    ##   setosa         15          0         0
    ##   versicolor      0         14         0
    ##   virginica       0          1        15
    ## 
    ## Overall Statistics
    ##                                           
    ##                Accuracy : 0.9778          
    ##                  95% CI : (0.8823, 0.9994)
    ##     No Information Rate : 0.3333          
    ##     P-Value [Acc > NIR] : < 2.2e-16       
    ##                                           
    ##                   Kappa : 0.9667          
    ##                                           
    ##  Mcnemar's Test P-Value : NA              
    ## 
    ## Statistics by Class:
    ## 
    ##                      Class: setosa Class: versicolor Class: virginica
    ## Sensitivity                 1.0000            0.9333           1.0000
    ## Specificity                 1.0000            1.0000           0.9667
    ## Pos Pred Value              1.0000            1.0000           0.9375
    ## Neg Pred Value              1.0000            0.9677           1.0000
    ## Prevalence                  0.3333            0.3333           0.3333
    ## Detection Rate              0.3333            0.3111           0.3333
    ## Detection Prevalence        0.3333            0.3111           0.3556
    ## Balanced Accuracy           1.0000            0.9667           0.9833

``` r
### 1.b. Decision tree for a regression problem without CARET ----
#### Load and split the dataset ----
data("cars")

# Define an 80:20 train:test data split of the dataset.
train_index <- createDataPartition(cars$Mileage,
                                   p = 0.8,
                                   list = FALSE)
cars_train <- cars[train_index, ]
cars_test <- cars[-train_index, ]

#### Train the model ----
cars_model_cart <- rpart(Mileage ~ ., data = cars_train,
                            control = rpart.control(minsplit=5))

#### Display the model's details ----
print(cars_model_cart)
```

    ## n= 644 
    ## 
    ## node), split, n, deviance, yval
    ##       * denotes terminal node
    ## 
    ##    1) root 644 43445310000 19783.39  
    ##      2) Price>=42709.56 23  2507071000 12547.43  
    ##        4) Price< 51578.02 14   722609000  9299.00 *
    ##        5) Price>=51578.02 9  1406923000 17600.56  
    ##         10) Price>=62240.34 6   208539000 10119.33 *
    ##         11) Price< 62240.34 3   190947800 32563.00 *
    ##      3) Price< 42709.56 621 39689370000 20051.39  
    ##        6) Price>=13992.98 479 32285680000 19398.76  
    ##         12) Cruise< 0.5 82  5338993000 16835.65  
    ##           24) Price>=16876.49 21   947506200 12015.24 *
    ##           25) Price< 16876.49 61  3735536000 18495.13  
    ##             50) Cylinder< 5 45  2437937000 16131.56  
    ##              100) wagon< 0.5 28  1037033000 13189.07 *
    ##              101) wagon>=0.5 17   759177400 20978.00  
    ##                202) Price>=15433.4 10   212343700 16748.30 *
    ##                203) Price< 15433.4 7   112353400 27020.43 *
    ##             51) Cylinder>=5 16   339167400 25142.69 *
    ##         13) Cruise>=0.5 397 26296720000 19928.17  
    ##           26) Saturn>=0.5 13   536029100 14365.00 *
    ##           27) Saturn< 0.5 384 25344730000 20116.50  
    ##             54) Price< 14779.06 10   491871400 13585.60 *
    ##             55) Price>=14779.06 374 24414930000 20291.13  
    ##              110) Price>=15973.13 350 22722420000 20021.75  
    ##                220) Leather< 0.5 114  7146874000 18688.25  
    ##                  440) Price>=19755.93 73  5003789000 16909.66 *
    ##                  441) Price< 19755.93 41  1500991000 21855.02 *
    ##                221) Leather>=0.5 236 15274900000 20665.90  
    ##                  442) Price< 16208.65 2     4746280  2405.50 *
    ##                  443) Price>=16208.65 234 14597570000 20821.97  
    ##                    886) Price>=29222.01 100  5485178000 19404.60 *
    ##                    887) Price< 29222.01 134  8761579000 21879.72  
    ##                     1774) Saab< 0.5 97  5603169000 20398.22  
    ##                       3548) Cylinder< 5 5   165477800 10619.00 *
    ##                       3549) Cylinder>=5 92  4933538000 20929.70 *
    ##                     1775) Saab>=0.5 37  2387368000 25763.65  
    ##                       3550) convertible< 0.5 35  1788924000 24931.69 *
    ##                       3551) convertible>=0.5 2   150268400 40323.00 *
    ##              111) Price< 15973.13 24  1296754000 24219.46  
    ##                222) Cylinder< 5 7   436741100 17451.00 *
    ##                223) Cylinder>=5 17   407282500 27006.47 *
    ##        7) Price< 13992.98 142  6511460000 22252.88 *

``` r
#### Make predictions ----
predictions <- predict(cars_model_cart, cars_test[, 1:18])

#### Display the model's evaluation metrics ----
##### RMSE ----
rmse <- sqrt(mean((cars_test$Mileage - predictions)^2))
print(paste("RMSE =", sprintf(rmse, fmt = "%#.4f")))
```

    ## [1] "RMSE = 7769.7830"

``` r
##### SSR ----
# SSR is the sum of squared residuals (the sum of squared differences
# between observed and predicted values)
ssr <- sum((cars_test$Mileage - predictions)^2)
print(paste("SSR =", sprintf(ssr, fmt = "%#.4f")))
```

    ## [1] "SSR = 9659124339.9365"

``` r
##### SST ----
sst <- sum((cars_test$Mileage - mean(cars_test$Mileage))^2)
print(paste("SST =", sprintf(sst, fmt = "%#.4f")))
```

    ## [1] "SST = 10492333332.3750"

``` r
##### R Squared ----
# We then use SSR and SST to compute the value of R squared.
# The closer the R squared value is to 1, the better the model.
r_squared <- 1 - (ssr / sst)
print(paste("R Squared =", sprintf(r_squared, fmt = "%#.4f")))
```

    ## [1] "R Squared = 0.0794"

``` r
### 1.c. Decision tree for a classification problem with caret ----
#### Load and split the dataset ----
data("iris")

# Define a 70:30 train:test data split of the dataset.
train_index <- createDataPartition(iris$Species,
                                   p = 0.7,
                                   list = FALSE)
iris_train <- iris[train_index, ]
iris_test <- iris[-train_index, ]

#### Train the model ----
set.seed(7)
# We apply the 5-fold cross validation resampling method
train_control <- trainControl(method = "cv", number = 5)
Species_caret_model_rpart <- train(Species ~ ., data = iris,
                                    method = "rpart", metric = "Accuracy",
                                    trControl = train_control)

#### Display the model's details ----
print(Species_caret_model_rpart)
```

    ## CART 
    ## 
    ## 150 samples
    ##   4 predictor
    ##   3 classes: 'setosa', 'versicolor', 'virginica' 
    ## 
    ## No pre-processing
    ## Resampling: Cross-Validated (5 fold) 
    ## Summary of sample sizes: 120, 120, 120, 120, 120 
    ## Resampling results across tuning parameters:
    ## 
    ##   cp    Accuracy   Kappa
    ##   0.00  0.9400000  0.91 
    ##   0.44  0.7733333  0.66 
    ##   0.50  0.3333333  0.00 
    ## 
    ## Accuracy was used to select the optimal model using the largest value.
    ## The final value used for the model was cp = 0.

``` r
#### Make predictions ----
predictions <- predict(Species_model_rpart,
                       iris_test[, 1:4],
                       type = "class")

#### Display the model's evaluation metrics ----
table(predictions, iris_test$Species)
```

    ##             
    ## predictions  setosa versicolor virginica
    ##   setosa         15          0         0
    ##   versicolor      0         12         0
    ##   virginica       0          3        15

``` r
confusion_matrix <-
  caret::confusionMatrix(predictions,
                         iris_test[, 1:5]$Species)
print(confusion_matrix)
```

    ## Confusion Matrix and Statistics
    ## 
    ##             Reference
    ## Prediction   setosa versicolor virginica
    ##   setosa         15          0         0
    ##   versicolor      0         12         0
    ##   virginica       0          3        15
    ## 
    ## Overall Statistics
    ##                                          
    ##                Accuracy : 0.9333         
    ##                  95% CI : (0.8173, 0.986)
    ##     No Information Rate : 0.3333         
    ##     P-Value [Acc > NIR] : < 2.2e-16      
    ##                                          
    ##                   Kappa : 0.9            
    ##                                          
    ##  Mcnemar's Test P-Value : NA             
    ## 
    ## Statistics by Class:
    ## 
    ##                      Class: setosa Class: versicolor Class: virginica
    ## Sensitivity                 1.0000            0.8000           1.0000
    ## Specificity                 1.0000            1.0000           0.9000
    ## Pos Pred Value              1.0000            1.0000           0.8333
    ## Neg Pred Value              1.0000            0.9091           1.0000
    ## Prevalence                  0.3333            0.3333           0.3333
    ## Detection Rate              0.3333            0.2667           0.3333
    ## Detection Prevalence        0.3333            0.2667           0.4000
    ## Balanced Accuracy           1.0000            0.9000           0.9500

``` r
### 1.d. Decision tree for a regression problem with CARET ----
#### Load and split the dataset ----
data("cars")

# Define a 70:30 train:test data split of the dataset.
train_index <- createDataPartition(cars$Mileage,
                                   p = 0.7,
                                   list = FALSE)
cars_train <- cars[train_index, ]
cars_test <- cars[-train_index, ]

#### Train the model ----
set.seed(7)
# 7 fold repeated cross validation with 3 repeats
train_control <- trainControl(method = "repeatedcv", number = 5, repeats = 3)

cars_caret_model_cart <- train(Mileage ~ ., data = cars,
                                  method = "rpart", metric = "RMSE",
                                  trControl = train_control)
```

    ## Warning in nominalTrainWorkflow(x = x, y = y, wts = weights, info = trainInfo,
    ## : There were missing values in resampled performance measures.

``` r
#### Display the model's details ----
print(cars_caret_model_cart)
```

    ## CART 
    ## 
    ## 804 samples
    ##  17 predictor
    ## 
    ## No pre-processing
    ## Resampling: Cross-Validated (5 fold, repeated 3 times) 
    ## Summary of sample sizes: 644, 643, 643, 643, 643, 642, ... 
    ## Resampling results across tuning parameters:
    ## 
    ##   cp          RMSE      Rsquared    MAE     
    ##   0.01388104  7949.764  0.08522019  6199.757
    ##   0.01392370  7949.764  0.08522019  6199.757
    ##   0.03450810  8211.344  0.01484057  6419.778
    ## 
    ## RMSE was used to select the optimal model using the smallest value.
    ## The final value used for the model was cp = 0.0139237.

``` r
#### Make predictions ----
predictions <- predict(cars_caret_model_cart, cars_test[, 1:18])

#### Display the model's evaluation metrics ----
##### RMSE ----
rmse <- sqrt(mean((cars_test$Mileage - predictions)^2))
print(paste("RMSE =", sprintf(rmse, fmt = "%#.4f")))
```

    ## [1] "RMSE = 8117.3395"

``` r
##### SSR ----
# SSR is the sum of squared residuals (the sum of squared differences
# between observed and predicted values)
ssr <- sum((cars_test$Mileage - predictions)^2)
print(paste("SSR =", sprintf(ssr, fmt = "%#.4f")))
```

    ## [1] "SSR = 15813888031.0702"

``` r
##### SST ----
# SST is the total sum of squares (the sum of squared differences
# between observed values and their mean)
sst <- sum((cars_test$Mileage - mean(cars_test$Mileage))^2)
print(paste("SST =", sprintf(sst, fmt = "%#.4f")))
```

    ## [1] "SST = 16350220705.4958"

``` r
##### R Squared ----
# We then use SSR and SST to compute the value of R squared.
# The closer the R squared value is to 1, the better the model.
r_squared <- 1 - (ssr / sst)
print(paste("R Squared =", sprintf(r_squared, fmt = "%#.4f")))
```

    ## [1] "R Squared = 0.0328"

``` r
##### MAE ----

absolute_errors <- abs(predictions - cars_test$Mileage)
mae <- mean(absolute_errors)
print(paste("MAE =", sprintf(mae, fmt = "%#.4f")))
```

    ## [1] "MAE = 6356.6057"

``` r
## 2.  Naïve Bayes ----
### 2.a. Naïve Bayes Classifier for a Classification Problem without CARET ----
#### Load and split the dataset ----
data("iris")

# Define a 70:30 train:test data split of the dataset.
train_index <- createDataPartition(iris$Species,
                                   p = 0.7,
                                   list = FALSE)
iris_train <- iris[train_index, ]
iris_test <- iris[-train_index, ]

#### Train the model ----
Species_model_nb <- naiveBayes(Species ~ .,
                                data = iris_train)

#### Display the model's details ----
print(Species_model_nb)
```

    ## 
    ## Naive Bayes Classifier for Discrete Predictors
    ## 
    ## Call:
    ## naiveBayes.default(x = X, y = Y, laplace = laplace)
    ## 
    ## A-priori probabilities:
    ## Y
    ##     setosa versicolor  virginica 
    ##  0.3333333  0.3333333  0.3333333 
    ## 
    ## Conditional probabilities:
    ##             Sepal.Length
    ## Y                [,1]      [,2]
    ##   setosa     4.962857 0.3670917
    ##   versicolor 5.980000 0.5307043
    ##   virginica  6.551429 0.6414008
    ## 
    ##             Sepal.Width
    ## Y                [,1]      [,2]
    ##   setosa     3.428571 0.4155588
    ##   versicolor 2.814286 0.2777460
    ##   virginica  3.022857 0.3272755
    ## 
    ##             Petal.Length
    ## Y                [,1]      [,2]
    ##   setosa     1.471429 0.1871951
    ##   versicolor 4.262857 0.4452928
    ##   virginica  5.508571 0.5164195
    ## 
    ##             Petal.Width
    ## Y                 [,1]      [,2]
    ##   setosa     0.2457143 0.1038745
    ##   versicolor 1.3285714 0.1978880
    ##   virginica  2.0285714 0.2844721

``` r
#### Make predictions ----
predictions <- predict(Species_model_nb,
                       iris_test[, 1:4])

#### Display the model's evaluation metrics ----
confusion_matrix <-
  caret::confusionMatrix(predictions,
                         iris_test[, 1:5]$Species)
print(confusion_matrix)
```

    ## Confusion Matrix and Statistics
    ## 
    ##             Reference
    ## Prediction   setosa versicolor virginica
    ##   setosa         15          0         0
    ##   versicolor      0         15         0
    ##   virginica       0          0        15
    ## 
    ## Overall Statistics
    ##                                      
    ##                Accuracy : 1          
    ##                  95% CI : (0.9213, 1)
    ##     No Information Rate : 0.3333     
    ##     P-Value [Acc > NIR] : < 2.2e-16  
    ##                                      
    ##                   Kappa : 1          
    ##                                      
    ##  Mcnemar's Test P-Value : NA         
    ## 
    ## Statistics by Class:
    ## 
    ##                      Class: setosa Class: versicolor Class: virginica
    ## Sensitivity                 1.0000            1.0000           1.0000
    ## Specificity                 1.0000            1.0000           1.0000
    ## Pos Pred Value              1.0000            1.0000           1.0000
    ## Neg Pred Value              1.0000            1.0000           1.0000
    ## Prevalence                  0.3333            0.3333           0.3333
    ## Detection Rate              0.3333            0.3333           0.3333
    ## Detection Prevalence        0.3333            0.3333           0.3333
    ## Balanced Accuracy           1.0000            1.0000           1.0000

``` r
### 2.b. Naïve Bayes Classifier for a Classification Problem with CARET ----
#### Load and split the dataset ----
data("iris")

# Define a 70:30 train:test data split of the dataset.
train_index <- createDataPartition(iris$Species,
                                   p = 0.7,
                                   list = FALSE)
iris_train <- iris[train_index, ]
iris_test <- iris[-train_index, ]

#### Train the model ----
# We apply the 5-fold cross validation resampling method
set.seed(7)
train_control <- trainControl(method = "cv", number = 5)
Species_caret_model_nb <- train(Species ~ .,
                                 data = iris_train,
                                 method = "nb", metric = "Accuracy",
                                 trControl = train_control)

#### Display the model's details ----
print(Species_caret_model_nb)
```

    ## Naive Bayes 
    ## 
    ## 105 samples
    ##   4 predictor
    ##   3 classes: 'setosa', 'versicolor', 'virginica' 
    ## 
    ## No pre-processing
    ## Resampling: Cross-Validated (5 fold) 
    ## Summary of sample sizes: 84, 84, 84, 84, 84 
    ## Resampling results across tuning parameters:
    ## 
    ##   usekernel  Accuracy   Kappa    
    ##   FALSE      0.9619048  0.9428571
    ##    TRUE      0.9714286  0.9571429
    ## 
    ## Tuning parameter 'fL' was held constant at a value of 0
    ## Tuning
    ##  parameter 'adjust' was held constant at a value of 1
    ## Accuracy was used to select the optimal model using the largest value.
    ## The final values used for the model were fL = 0, usekernel = TRUE and adjust
    ##  = 1.

``` r
#### Make predictions ----
predictions <- predict(Species_caret_model_nb,
                       iris_test[, 1:4])

#### Display the model's evaluation metrics ----
confusion_matrix <-
  caret::confusionMatrix(predictions,
                         iris_test[, 1:5]$Species)
print(confusion_matrix)
```

    ## Confusion Matrix and Statistics
    ## 
    ##             Reference
    ## Prediction   setosa versicolor virginica
    ##   setosa         15          0         0
    ##   versicolor      0         14         2
    ##   virginica       0          1        13
    ## 
    ## Overall Statistics
    ##                                          
    ##                Accuracy : 0.9333         
    ##                  95% CI : (0.8173, 0.986)
    ##     No Information Rate : 0.3333         
    ##     P-Value [Acc > NIR] : < 2.2e-16      
    ##                                          
    ##                   Kappa : 0.9            
    ##                                          
    ##  Mcnemar's Test P-Value : NA             
    ## 
    ## Statistics by Class:
    ## 
    ##                      Class: setosa Class: versicolor Class: virginica
    ## Sensitivity                 1.0000            0.9333           0.8667
    ## Specificity                 1.0000            0.9333           0.9667
    ## Pos Pred Value              1.0000            0.8750           0.9286
    ## Neg Pred Value              1.0000            0.9655           0.9355
    ## Prevalence                  0.3333            0.3333           0.3333
    ## Detection Rate              0.3333            0.3111           0.2889
    ## Detection Prevalence        0.3333            0.3556           0.3111
    ## Balanced Accuracy           1.0000            0.9333           0.9167

``` r
## 3.  k-Nearest Neighbours ----
### 3.a. kNN for a classification problem without CARET's train function ----
#### Load and split the dataset ----
data("iris")

# Define a 70:30 train:test data split of the dataset.
train_index <- createDataPartition(iris$Species,
                                   p = 0.7,
                                   list = FALSE)
iris_train <- iris[train_index, ]
iris_test <- iris[-train_index, ]

#### Train the model ----
Species_caret_model_knn <- knn3(Species ~ ., data = iris_train, k=3)

#### Display the model's details ----
print(Species_caret_model_knn)
```

    ## 3-nearest neighbor model
    ## Training set outcome distribution:
    ## 
    ##     setosa versicolor  virginica 
    ##         35         35         35

``` r
#### Make predictions ----
predictions <- predict(Species_caret_model_knn,
                       iris_test[, 1:4],
                       type = "class")

#### Display the model's evaluation metrics ----
table(predictions, iris_test$Species)
```

    ##             
    ## predictions  setosa versicolor virginica
    ##   setosa         15          0         0
    ##   versicolor      0         14         1
    ##   virginica       0          1        14

``` r
# Or alternatively:
confusion_matrix <-
  caret::confusionMatrix(predictions,
                         iris_test$Species)
print(confusion_matrix)
```

    ## Confusion Matrix and Statistics
    ## 
    ##             Reference
    ## Prediction   setosa versicolor virginica
    ##   setosa         15          0         0
    ##   versicolor      0         14         1
    ##   virginica       0          1        14
    ## 
    ## Overall Statistics
    ##                                           
    ##                Accuracy : 0.9556          
    ##                  95% CI : (0.8485, 0.9946)
    ##     No Information Rate : 0.3333          
    ##     P-Value [Acc > NIR] : < 2.2e-16       
    ##                                           
    ##                   Kappa : 0.9333          
    ##                                           
    ##  Mcnemar's Test P-Value : NA              
    ## 
    ## Statistics by Class:
    ## 
    ##                      Class: setosa Class: versicolor Class: virginica
    ## Sensitivity                 1.0000            0.9333           0.9333
    ## Specificity                 1.0000            0.9667           0.9667
    ## Pos Pred Value              1.0000            0.9333           0.9333
    ## Neg Pred Value              1.0000            0.9667           0.9667
    ## Prevalence                  0.3333            0.3333           0.3333
    ## Detection Rate              0.3333            0.3111           0.3111
    ## Detection Prevalence        0.3333            0.3333           0.3333
    ## Balanced Accuracy           1.0000            0.9500           0.9500

``` r
### 3.b. kNN for a regression problem without CARET's train function ----
#### Load the dataset ----
data("cars")
cars$Saturn <- # nolint: object_name_linter.
  as.numeric(as.character(cars$Saturn))
x <- as.matrix(cars[, 1:17])
y <- as.matrix(cars[, 2])

#### Train the model ----
cars_model_knn <- knnreg(x, y, k = 3)

#### Display the model's details ----
print(cars_model_knn)
```

    ## 3-nearest neighbor regression model

``` r
#### Make predictions ----
predictions <- predict(cars_model_knn, x)

#### Display the model's evaluation metrics ----
##### RMSE ----
rmse <- sqrt(mean((y - predictions)^2))
print(paste("RMSE =", sprintf(rmse, fmt = "%#.4f")))
```

    ## [1] "RMSE = 522.9350"

``` r
##### SSR ----
ssr <- sum((y - predictions)^2)
print(paste("SSR =", sprintf(ssr, fmt = "%#.4f")))
```

    ## [1] "SSR = 219862673.7778"

``` r
##### SST ----
sst <- sum((y - mean(y))^2)
print(paste("SST =", sprintf(sst, fmt = "%#.4f")))
```

    ## [1] "SST = 53945264359.5062"

``` r
##### R Squared ----
r_squared <- 1 - (ssr / sst)
print(paste("R Squared =", sprintf(r_squared, fmt = "%#.4f")))
```

    ## [1] "R Squared = 0.9959"

``` r
##### MAE ----
absolute_errors <- abs(predictions - y)
mae <- mean(absolute_errors)
print(paste("MAE =", sprintf(mae, fmt = "%#.4f")))
```

    ## [1] "MAE = 246.2007"

``` r
### 3.c. kNN for a classification problem with CARET's train function ----
#### Load and split the dataset ----
data("iris")

# Define a 70:30 train:test data split of the dataset.
train_index <- createDataPartition(iris$Species,
                                   p = 0.7,
                                   list = FALSE)
iris_train <- iris[train_index, ]
iris_test <- iris[-train_index, ]

#### Train the model ----
# We apply the 10-fold cross validation resampling method
# We also apply the standardize data transform
set.seed(7)
train_control <- trainControl(method = "cv", number = 10)
Species_caret_model_knn <- train(Species ~ ., data = iris,
                                  method = "knn", metric = "Accuracy",
                                  preProcess = c("center", "scale"),
                                  trControl = train_control)

#### Display the model's details ----
print(Species_caret_model_knn)
```

    ## k-Nearest Neighbors 
    ## 
    ## 150 samples
    ##   4 predictor
    ##   3 classes: 'setosa', 'versicolor', 'virginica' 
    ## 
    ## Pre-processing: centered (4), scaled (4) 
    ## Resampling: Cross-Validated (10 fold) 
    ## Summary of sample sizes: 135, 135, 135, 135, 135, 135, ... 
    ## Resampling results across tuning parameters:
    ## 
    ##   k  Accuracy   Kappa
    ##   5  0.9533333  0.93 
    ##   7  0.9600000  0.94 
    ##   9  0.9533333  0.93 
    ## 
    ## Accuracy was used to select the optimal model using the largest value.
    ## The final value used for the model was k = 7.

``` r
#### Make predictions ----
predictions <- predict(Species_caret_model_knn,
                       iris_test[, 1:4])

#### Display the model's evaluation metrics ----
confusion_matrix <-
  caret::confusionMatrix(predictions,
                         iris_test[, 1:5]$Species)
print(confusion_matrix)
```

    ## Confusion Matrix and Statistics
    ## 
    ##             Reference
    ## Prediction   setosa versicolor virginica
    ##   setosa         15          0         0
    ##   versicolor      0         15         1
    ##   virginica       0          0        14
    ## 
    ## Overall Statistics
    ##                                           
    ##                Accuracy : 0.9778          
    ##                  95% CI : (0.8823, 0.9994)
    ##     No Information Rate : 0.3333          
    ##     P-Value [Acc > NIR] : < 2.2e-16       
    ##                                           
    ##                   Kappa : 0.9667          
    ##                                           
    ##  Mcnemar's Test P-Value : NA              
    ## 
    ## Statistics by Class:
    ## 
    ##                      Class: setosa Class: versicolor Class: virginica
    ## Sensitivity                 1.0000            1.0000           0.9333
    ## Specificity                 1.0000            0.9667           1.0000
    ## Pos Pred Value              1.0000            0.9375           1.0000
    ## Neg Pred Value              1.0000            1.0000           0.9677
    ## Prevalence                  0.3333            0.3333           0.3333
    ## Detection Rate              0.3333            0.3333           0.3111
    ## Detection Prevalence        0.3333            0.3556           0.3111
    ## Balanced Accuracy           1.0000            0.9833           0.9667

``` r
### 3.d. kNN for a regression problem with CARET's train function ----
#### Load and split the dataset ----
data("cars")

# Define an 80:20 train:test data split of the dataset.
train_index <- createDataPartition(cars$Mileage,
                                   p = 0.8,
                                   list = FALSE)
cars_train <- cars[train_index, ]
cars_test <- cars[-train_index, ]

#### Train the model ----
# We apply the 5-fold cross validation resampling method
# We also apply the standardize data transform
set.seed(7)
train_control <- trainControl(method = "cv", number = 5)
cars_caret_model_knn <- train(Mileage ~ ., data = cars,
                                 method = "knn", metric = "RMSE",
                                 preProcess = c("center", "scale"),
                                 trControl = train_control)

#### Display the model's details ----
print(cars_caret_model_knn)
```

    ## k-Nearest Neighbors 
    ## 
    ## 804 samples
    ##  17 predictor
    ## 
    ## Pre-processing: centered (17), scaled (17) 
    ## Resampling: Cross-Validated (5 fold) 
    ## Summary of sample sizes: 644, 643, 643, 643, 643 
    ## Resampling results across tuning parameters:
    ## 
    ##   k  RMSE      Rsquared    MAE     
    ##   5  7894.023  0.12156857  5995.798
    ##   7  8015.936  0.08433019  6152.664
    ##   9  8031.602  0.07027669  6172.571
    ## 
    ## RMSE was used to select the optimal model using the smallest value.
    ## The final value used for the model was k = 5.

``` r
#### Make predictions ----
predictions <- predict(cars_caret_model_knn,
                       cars_test[, 1:18])

#### Display the model's evaluation metrics ----
##### RMSE ----
rmse <- sqrt(mean((cars_test$Mileage - predictions)^2))
print(paste("RMSE =", sprintf(rmse, fmt = "%#.4f")))
```

    ## [1] "RMSE = 6301.4378"

``` r
##### SSR ----
# SSR is the sum of squared residuals (the sum of squared differences
# between observed and predicted values)
ssr <- sum((cars_test$Mileage - predictions)^2)
print(paste("SSR =", sprintf(ssr, fmt = "%#.4f")))
```

    ## [1] "SSR = 6353298862.7451"

``` r
##### SST ----
# SST is the total sum of squares (the sum of squared differences
# between observed values and their mean)
sst <- sum((cars_test$Mileage - mean(cars_test$Mileage))^2)
print(paste("SST =", sprintf(sst, fmt = "%#.4f")))
```

    ## [1] "SST = 11722298506.0938"

``` r
##### R Squared ----
# We then use SSR and SST to compute the value of R squared.
# The closer the R squared value is to 1, the better the model.
r_squared <- 1 - (ssr / sst)
print(paste("R Squared =", sprintf(r_squared, fmt = "%#.4f")))
```

    ## [1] "R Squared = 0.4580"

``` r
##### MAE ----
# MAE is expressed in the same units as the target variable, making it easy to
# interpret. For example, if you are predicting the amount paid in rent,
# and the MAE is KES. 10,000, it means, on average, your model's predictions
# are off by about KES. 10,000.
absolute_errors <- abs(predictions - cars_test$Mileage)
mae <- mean(absolute_errors)
print(paste("MAE =", sprintf(mae, fmt = "%#.4f")))
```

    ## [1] "MAE = 4814.0331"
