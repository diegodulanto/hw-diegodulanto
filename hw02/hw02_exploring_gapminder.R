gapminder %>%
  select(country, year, gdpPercap) %>%
  filter(country %in% c("Peru" , "Japan", "Canada"), year>1969 & year<1980)

gapminder %>%
  mutate(lifeExpDrop = lag(lifeExp))

gapminder %>%
  select(country, gdpPercap) %>%
  mutate(maxgdpPercap = max(gdpPercap)) %>%
  group_by(country)

gapminder %>%
  select(country, lifeExp, gdpPercap) %>%
  filter(country %in% c("Canada")) %>%
