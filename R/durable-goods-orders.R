library(magrittr)

dat <- pamngr::join_sheets(c("dgnotot", "cgnoxair")) %>%
  dplyr::slice_max(dates, n = 60) %>%
  magrittr::set_colnames(c("dates", 
                           "1. Durable Goods", 
                           "2. Core Capital Goods")) %>%
  tidyr::pivot_longer(cols = -dates, names_to = "variable")

p <- dat %>%
  pamngr::lineplot() %>%
  pamngr::pam_plot(
    plot_title = "Durable Goods Orders",
    plot_subtitle = "USD Millions",
    show_legend = FALSE
  )

p <- p + ggplot2::facet_wrap(.~variable, ncol = 2, scales = "free")

p %>% pamngr::all_output("durable-goods-orders")