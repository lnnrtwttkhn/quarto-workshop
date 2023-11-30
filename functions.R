make_table <- function(name) {
  library(magrittr)
  yaml_data <- yaml::read_yaml("tables.yml")
  df <- data.frame(
    Name = rep(names(yaml_data), sapply(yaml_data, length)),
    Input = paste0("```\n", unlist(yaml_data), "\n```"),
    Output = paste0("\n", unlist(yaml_data))
  )
  df <- df %>%
    subset(., Name == name) %>%
    subset(., select = c(Input, Output))
  return(df)
}
