my_palette <- c("#000000","#009686","#0B5BB0","#B80048","#9B59B6", "#A6ABBD","#D5A419","#7B8DC1","#C87BA7")

my_palette <-  c("#000000","#AA3082","#2265A4","#168B31","#B60318", "#F2C00E","#757575","88AED1","#87C390","#88AED1","#DD7F80")

names(my_palette) <- NULL



theme_my_white <- function(base_size = 11, base_family = "",
                           base_line_size = base_size / 22,
                           base_rect_size = base_size / 22) {
  # Starts with theme_bw and then modify some parts
  # = replace all greys with pure black or white
  ggthemes::theme_tufte(
    base_size = base_size,
    base_family = base_family
  ) +
    theme(
      # black text and ticks on the axes
      axis.text        = element_text(colour = "black", size = rel(0.8)),
      axis.ticks       = element_line(colour = "black", size = rel(0.5)),
      # NB: match the *visual* thickness of axis ticks to the panel border
      #     0.5 clipped looks like 0.25
      
      # pure black panel border and grid lines, but thinner
      #panel.border     = element_rect(fill = NA, colour = "black", size = rel(1)),
      panel.border = element_blank(),
      panel.grid.major = element_line(colour = "black", size = rel(0.1)),
      #panel.grid.minor = element_line(colour = "black", size = rel(0.05)),
      #panel.grid.major.x = element_blank(),
      #panel.grid.minor = element_blank(),
      axis.line = element_line(colour = "black", size = rel(0.5)), 
      # strips with black background and white text
      strip.background = element_rect(fill = "white"),
      strip.text       = element_text(colour = "black", size = rel(0.8), face="bold"),
      
      complete = TRUE
    )
}

scale_colour_discrete <- function(...)
  scale_colour_manual(..., values = my_palette)
scale_fill_discrete <- function(...)
  scale_fill_manual(..., values = my_palette)
geom_mybar <- function(...){
  ggplot2::geom_bar(...) + ggplot2::geom_hline(yintercept=0, colour="black")
}

ggplot2::theme_set(theme_my_white())
