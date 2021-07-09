

link = "https://www.imdb.com/search/title/?genres=musical&languages=en&sort=user_rating,desc&title_type=feature&num_votes=10000,&explore=genres&pf_rd_m=A2FGELUUNOQJNL&pf_rd_p=d0addcab-e8f0-45ef-9965-515319b79038&pf_rd_r=GMNV4GYM4ADT0FCS970S&pf_rd_s=right-4&pf_rd_t=15051&pf_rd_i=genre&ref_=ft_gnr_mvtre_15"
imdb = read_html(link)

Film = imdb %>% html_nodes(".lister-item-header a") %>% html_text()

Year = imdb %>% html_nodes(".text-muted.unbold") %>% html_text()

Category = imdb %>% html_nodes(".genre") %>% html_text()
Category <- gsub('\n', '', Category)

Parent_Guide <- imdb %>% html_nodes(".certificate") %>% html_text() 

Runtime <- imdb %>% html_nodes(".runtime") %>% html_text()

Stars <- imdb %>% html_nodes(".text-muted+ p") %>% html_text()
Stars <- gsub(".*Stars:","",Stars)

Ratings <- imdb %>% html_nodes(".ratings-imdb-rating strong") %>% html_text()

Brief <- imdb %>% html_nodes(".ratings-bar+ .text-muted") %>% html_text()


musical_movies = data.frame(Film, Year, Category, Ratings, Runtime, Stars, Brief, stringsAsFactors = FALSE)
write.csv(musical_movies, "musical_movies.csv")
