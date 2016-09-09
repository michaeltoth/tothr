# Under development

# This is designed to produce fading trails similar to what we created in our 
# baby data visualization. This currently doesn't work and needs updating.
# Cross reference the main.R script used to produce the baby visualization
# When working on this

add_fading_trail <- function(data, var_to_fade, decay = 0) {
    arguments <- as.list(match.call())
    print(arguments)
    var_to_fade = eval(arguments$var_to_fade, data)
    print(var_to_fade)
    max_value = max(var_to_fade)
    
    anim <- lapply(1:10, function(i) {data$var_to_fade <- data$var_to_fade + i; data$fade <- 1 / (i + 2); data})
    data$fade <- 1
    data_with_fade <- rbind(data, do.call(rbind, anim))
    
    data_with_fade <- filter(dat_with_fade, var_to_fade <= max_value)
}

p2 <- ggplot(top_10_with_fade, aes(x = proportion, y = count, color = sex, frame = year, alpha = fade)) +
    geom_point(size = 4) +
    ggtitle('Year:') +
    xlab('\nProportion (by sex) of Babies Born') +
    ylab('Number of Babies Born') +
    scale_color_manual(name = '', values = c('#ff7f00', '#377eb8'), labels = c('Female', 'Male')) +
    scale_x_continuous(labels = percent) + 
    scale_y_continuous(labels = comma) +
    scale_alpha(guide = 'none') + # Remove alpha legend from plot output
    theme_bw() +
    theme(panel.border = element_blank(),
          panel.grid = element_blank(),
          axis.ticks = element_blank(),
          legend.key = element_blank(),
          legend.position = 'bottom')

gg_animate(p2, interval = 0.2, ani.width = 600, ani.height = 400)