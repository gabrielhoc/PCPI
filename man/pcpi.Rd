% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/pcpi.R
\name{pcpi}
\alias{pcpi}
\title{Calculates Proactive Conservation Prioritization Index}
\usage{
pcpi(sp, var_out, var_in = NULL, weight_out = NULL, weight_in = NULL)
}
\arguments{
\item{sp}{character. Names of the taxa being evaluated.}

\item{var_out}{numeric. Threat variables. higher values must indicate increased threat.}

\item{var_in}{numeric. Interacting variables. Will modulate the effect of threat variables.}

\item{weight_out}{numeric. Weights for threat variables}

\item{weight_in}{numeric. Matrix of weights for the combination of interacting variables and threat variables.}
}
\value{
Data frame with PCPI and rank.
}
\description{
\code{pcpi} Calculates the Proactive Conservation Prioritization Index (ref), a new tool to prioritize species for conservation, which can incorporates information about future threats.
}
\examples{

# Load data
data(reptile_df)

# Calculate inverse range area
reptile_df$inv_range_area <- 1/(reptile_df$range_area)

var_out <- reptile_df[,6:8]
var_in <- reptile_df[,3:4]
weight_out <- c(1, 1.5, 3)
weight_in <-
  matrix(1:6, ncol(var_out), ncol(var_in))

# No interactions or weighting

reptile_pcpi <-
  pcpi(
    sp = reptile_df$sp,
    var_out = var_out
  )

# No interactions but weighting for variables

reptile_pcpi <-
  pcpi(
    sp = reptile_df$sp,
    var_out = var_out,
    weight_out = weight_out
  )

# With interactions

reptile_pcpi <-
  pcpi(
    sp = reptile_df$sp,
    var_out = var_out,
    var_in = var_in
  )

# With interactions and weighting for both variables and interactions

reptile_pcpi <-
  pcpi(
    sp = reptile_df$sp,
    var_out = var_out,
    var_in = var_in,
    weight_out = weight_out,
    weight_in = weight_in
  )

}
