library(rvest)
library(tidyverse)

url <- "https://www.imdb.com/search/title/?groups=top_100&sort=user_rating,desc"

url %>%
  read_html() %>%
  html_node("h3")

url %>%
  read_html() %>%
  html_nodes("h3") %>% 
  html_text() 
movie_name <- url %>%
  read_html() %>%
  html_nodes("h3.lister-item-header") %>%
  html_text2() 

ratings <- url %>%
  read_html() %>%
  html_nodes("div.ratings-imdb-rating") %>%
  html_text2() %>%
  as.numeric()

votes <- url %>%
  read_html() %>%
  html_nodes("p.sort-num_votes-visible") %>%
  html_text2()

imdb_df <- data.frame(
  movie_name,
  ratings
)
View(imdb_df)
