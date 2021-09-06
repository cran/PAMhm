## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(PAMhm)

## ---- eval=FALSE--------------------------------------------------------------
#  install.packages("PAMhm")

## ---- eval=FALSE--------------------------------------------------------------
#  install.packages("devtools")
#  devtools::install_github("vfey/PAMhm")

## ---- out.width='85%', fig.width=6, fig.height=4, fig.align='center'----------
set.seed(1234)
mat <- matrix(c(rnorm(100, mean = 2), rnorm(100, mean = -1.8)), nrow = 20)
PAM.hm(mat, cluster.number = 3)

## ---- out.width='85%', fig.width=6, fig.height=4, fig.align='center'----------
PAM.hm(mat, cluster.number = c("2", "4-5"))

## ---- out.width='85%', fig.width=6, fig.height=4, fig.align='center'----------
mat[1] <- mat[1] * 20
PAM.hm(mat, cluster.number = 3, trim = NULL, winsorize.mat = FALSE)

## ---- out.width='85%', fig.width=6, fig.height=4, fig.align='center'----------
m <- robustHD::winsorize(as.numeric(mat))
tr <- min(abs(round(c(min(m, na.rm = TRUE), max(m, na.rm = TRUE)), 3)), na.rm = TRUE)
PAM.hm(mat, cluster.number = 3, trim = tr)

## ---- out.width='85%', fig.width=6, fig.height=4, fig.align='center'----------
PAM.hm(mat, cluster.number = 3, trim = -1, winsorize.mat = FALSE)

## ---- out.width='85%', fig.width=6, fig.height=4, fig.align='center'----------
set.seed(1234)
mat <- matrix(rnorm(200, mean = 3.6), nrow=20)
PAM.hm(mat)

## ---- out.width='85%', fig.width=6, fig.height=4, fig.align='center'----------
PAM.hm(mat, medianCenter = "column", trim = NULL, winsorize.mat = FALSE)

## ---- out.width='85%', fig.width=6, fig.height=4, fig.align='center'----------
PAM.hm(mat, medianCenter = "column", trim = -1)

