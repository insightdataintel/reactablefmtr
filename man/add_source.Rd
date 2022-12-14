% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/table_elements.R
\name{add_source}
\alias{add_source}
\title{Add a source below a reactable table}
\usage{
add_source(
  table = NULL,
  source = NULL,
  align = "left",
  font_color = "#000",
  font_size = 16,
  font_style = "normal",
  font_weight = "normal",
  text_decoration = NULL,
  text_transform = NULL,
  letter_spacing = NULL,
  word_spacing = NULL,
  text_shadow = NULL,
  background_color = "#FFFFFF",
  margin = NULL
)
}
\arguments{
\item{table}{A reactable table.}

\item{source}{A string to be displayed as the source.}

\item{align}{The alignment of the source.
Options are "left", "right", "center".
Default is "left".}

\item{font_color}{Color of the source text.
Default is #000.}

\item{font_size}{Numeric value representing the size of the font of the source (in px).
Default is 16.}

\item{font_style}{Style of the source font.
Options are "normal" or "italic".
Default is "normal".}

\item{font_weight}{The font weight of the source.
Options are "bold" or "normal".
Default is "normal".}

\item{text_decoration}{Add an underline, overline, or line-through source.
Options are "underline", "overline", "underline overline", or "line-through".
Default is NULL.}

\item{text_transform}{Specify how to capitalize the title.
Options are "uppercase", "lowercase", or "capitalize".
Default is NULL.}

\item{letter_spacing}{Numeric value that adjusts the horizontal spacing between letters.
A number above 0 adds more spacing between letters, a number below 0 decreases the spacing.
Default is NULL.}

\item{word_spacing}{Numeric value that adjusts the horizontal spacing between words.
A number above 0 adds more spacing between words, a number below 0 decreases the spacing.
Default is NULL.}

\item{text_shadow}{Apply a shadow around the title.
See <https://developer.mozilla.org/en-US/docs/Web/CSS/text-shadow> for options.
Default is NULL.}

\item{background_color}{Color of the source background.
Default is #FFFFFF.}

\item{margin}{Use margin() to set the margin around the text (top, right, bottom, left).
Default is NULL.}
}
\value{
a function that adds a source below a reactable table.
}
\description{
Use `add_source()` to place a source below a {reactable} or {reactablefmtr} table.
     The same options that are present in `add_title()` and `add_subtitle()` are also available in `add_source()`.
     The source can be aligned to the left, right, or center with the align option.
     The text properties of the source, such as the font size and font style can be customized.
     The background color of the source can also be adjusted as well as the margin around the source.
}
\examples{
\dontrun{
## Create the reactable table and then pipe in the source
table <- reactable(iris[10:29, ])

table \%>\%
  add_source("This is a source")

## Use options to adjust the style and position of the source
table \%>\%
  add_source("This is a source", font_style = "italic", font_color = "grey")
}
}
