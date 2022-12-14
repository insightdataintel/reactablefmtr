% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/gauge_chart.R
\name{gauge_chart}
\alias{gauge_chart}
\title{Display numeric values in a gauge chart}
\usage{
gauge_chart(
  data,
  fill_color = "#15607A",
  background = "#EEEEEE",
  show_min_max = FALSE,
  size = 1,
  min_value = NULL,
  max_value = NULL,
  number_fmt = NULL,
  fill_color_ref = NULL,
  text_color = "black",
  bold_text = FALSE,
  min_text_color = "black",
  max_text_color = "black",
  text_color_ref = NULL,
  text_size = NULL,
  bias = 1,
  opacity = 1,
  tooltip = FALSE,
  animation = "transform 1s ease"
)
}
\arguments{
\item{data}{Dataset containing at least one numeric column.}

\item{fill_color}{A single color or a vector of fill_color for the fill of the gauge.
fill_color should be given in order from low values to high values.
Can use R's built-in fill_color or other color packages.
Default is #15607A.}

\item{background}{The color for the background of the gauge.
Default is #EEEEEE.}

\item{show_min_max}{Show or hide the min and max values on the gauge.
Default is FALSE.}

\item{size}{Size of the gauge.
Options are 1 (small gauge) or 2 (large gauge).
Default is 1.}

\item{min_value}{A value to use as the minimum value for the gauge.
The default minimum value is 0.
Default is NULL.}

\item{max_value}{A value to use as the maximum value for the gauge.
The default maximum value is the maximum value in the column.
Default is NULL.}

\item{number_fmt}{Optionally format numbers using formats from the scales package.
Default is NULL.}

\item{fill_color_ref}{Assign colors to the fill of the gauge via another column
by providing the name of the column containing the colors in quotes.
Only one color can be provided per row.
Default is NULL.}

\item{text_color}{The color of the value shown within the gauge.
Default is black.}

\item{bold_text}{Logical: bold the text of the value within the gauge.
Default is FALSE.}

\item{min_text_color}{The color of the minimum value shown underneath the gauge.
Default is black.}

\item{max_text_color}{The color of the maximum value shown underneath the gauge.
Default is black.}

\item{text_color_ref}{Assign color to the text within the gauge via another column
by providing the name of the column containing the text colors in quotes.
Only one color can be provided per cell.
Default is NULL.}

\item{text_size}{Numeric value representing the size of the value within the gauge.
Default is NULL.}

\item{bias}{A positive value that determines the spacing between multiple colors.
A higher value spaces out the colors at the higher end more than a lower number.
Default is 1.}

\item{opacity}{A value between 0 and 1 that adjusts the opacity of fill_color.
A value of 0 is fully transparent, a value of 1 is fully opaque.
Default is 1.}

\item{tooltip}{Logical: hover tooltip.
Default is FALSE.}

\item{animation}{Control the duration and timing function of the animation
when sorting/updating values shown on a page.
See [CSS transitions](https://developer.mozilla.org/en-US/docs/Web/CSS/transition)
for available timing functions and examples.
Animation can be turned off by setting to "none".
Default is "background 1s ease".}
}
\value{
a function that displays values in a column in a gauge chart.
}
\description{
The `gauge_chart()` function displays numeric values in a column in a gauge or aka a speedometer chart.
    The minimum and maximum values that are present in the column can be added to the gauge chart by setting `show_min_max` to TRUE.
    By default, the minimum and maximum bounds of the gauge chart are the min/max of the column, but can be changed with `min_value` and `max_value`.
    The format of the min/max values and the values shown within the gauge chart can be changed with `number_fmt`.
    There are two sizes available for the gauge. The smaller default size 1 and the bigger size 2. The size can be specified within `size`.
    Many options that are available in `data_bars()` are also available in `gauge_chart()`.
    There are a few different ways to color the fill of the gauge.
    One way would be to apply either a single or multiple colors within `fill_color`.
    Colors may be assigned via another column if referenced within `fill_color_ref`.
    The opacity of the fill color can be controlled with `opacity`.
    If multiple colors are used within `fill_color`, the bias of the color normalization can be controlled with `bias`.
    The empty fill of the gauge can be colored with `background`.
    The color of the values within the gauge can be changed using `text_color`.
    Or they can be assigned via another column with `text_color_ref`.
    `gauge_chart()` needs to placed within the cell argument in reactable::colDef.
}
\examples{
library(dplyr)
data <- iris[45:54, ]

## Show values within a gauge chart:
reactable(
data,
defaultColDef = colDef(
align = "left",
maxWidth = 150,
cell = gauge_chart(data)))

## Show the min and max below the gauge:
reactable(
data,
defaultColDef = colDef(
align = "left",
maxWidth = 150,
cell = gauge_chart(data, show_min_max = TRUE)))

## Adjust the min and max value of the gauge:
reactable(
data,
defaultColDef = colDef(
align = "left",
maxWidth = 150,
cell = gauge_chart(data, show_min_max = TRUE, min_value = 0, max_value = 7)))

## Increase the size of the gauge chart:
reactable(
data,
defaultColDef = colDef(
align = "left",
maxWidth = 150,
cell = gauge_chart(data, size = 2)))

## Assign multiple colors to create a normalized fill based on value:
reactable(
data,
defaultColDef = colDef(
align = "left",
maxWidth = 150,
cell = gauge_chart(data, fill_color = c("blue","white","orange"))))

## Conditionally apply colors from another column:
data \%>\%
mutate(color_assign = case_when(
Species == "setosa" ~ "red",
Species == "versicolor" ~ "forestgreen",
TRUE ~ "grey")) \%>\%
reactable(
.,
defaultColDef = colDef(
align = "left",
maxWidth = 150,
cell = gauge_chart(., fill_color_ref = "color_assign")))

## Change the color of the empty fill of the gauge:
reactable(
data,
defaultColDef = colDef(
align = "left",
maxWidth = 150,
cell = gauge_chart(data, background = "transparent")))
}
