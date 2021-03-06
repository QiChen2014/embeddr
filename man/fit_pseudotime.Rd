% Generated by roxygen2 (4.1.1): do not edit by hand
% Please edit documentation in R/embeddr.R
\name{fit_pseudotime}
\alias{fit_pseudotime}
\title{Fit the pseudotime curve}
\usage{
fit_pseudotime(sce, clusters = NULL, ...)
}
\arguments{
\item{sce}{The SCESet object}

\item{clusters}{The (numeric) clusters to use for the curve fitting. If NULL (default) then
all points are used}

\item{...}{Additional arguments to be passed to \code{princurve} from \pkg{principal.curve}.}
}
\value{
The modified \code{SCESet} with the following fields added to pData:
\describe{
\item{pseudotime}{The pseudotime of the cell (arc-length from beginning of curve, rescale to [0,1])}
\item{trajectory_1}{The x-coordinate of a given cell's projection onto the curve}
\item{trajectory_2}{The y-coordinate of a given cell's projection onto the curve}
\item{proj_dist}{The euclidean distance in the plane from each cell to its projection}}
If a given cell is not in \code{clusters} then the value for each of the above fields is set to \code{NA}.
}
\description{
Fits the pseudotime curve using principal curves from the princurve library
}
\examples{
library(scater)
data('sc_example_counts') ; sce <- newSCESet(countData = sc_example_counts)
sce <- embeddr(sce)
sce <- fit_pseudotime(sce)
}

