library(magrittr)

dat <- pamngr::get_data("cgnoxair") %>%
  tidyr::pivot_longer(cols = -dates, names_to = "variable") %>%
  pamngr::pchange() %>%
  dplyr::slice_max(dates, n = 60) 
  

p <- dat %>%
  pamngr::barplot() %>%
  pamngr::pam_plot(
    plot_title = "Durable Goods Orders",
    plot_subtitle = "Monthly Change in Nondefense Capital Goods Orders ex Aircraft",
    show_legend = FALSE
  )

p %>% pamngr::all_output("capital-goods-orders-nondefense-ex-air")