gapminder %>%
  summarise(mean_pop = mean(pop),
            sd = sd(pop))

psych::bfi %>%
  rowwise() %>%
  mutate(A_tot = mean(c_across(A1:A5), na.rm = TRUE),
         C_tot = mean(c_across(C1:C5), na.rm = TRUE),
         E_tot = mean(c_across(E1:E5), na.rm = TRUE),
         N_tot = mean(c_across(N1:N5), na.rm = TRUE),
         O_tot = mean(c_across(O1:O5), na.rm = TRUE)) %>%
  select(A_tot, C_tot, E_tot, N_tot, O_tot)

psych::bfi %>%
  rowwise() %>%
  mutate(A_tot = mean(c_across(A1:A5), na.rm = TRUE),
         C_tot = mean(c_across(C1:C5), na.rm = TRUE),
         E_tot = mean(c_across(E1:E5), na.rm = TRUE),
         N_tot = mean(c_across(N1:N5), na.rm = TRUE),
         O_tot = mean(c_across(O1:O5), na.rm = TRUE)) %>%
  select(A_tot, C_tot, E_tot, N_tot, O_tot, gender, age, education)

bfiscore <- psych::bfi %>%
  rowwise() %>%
  mutate(A_tot = mean(c_across(A1:A5), na.rm = TRUE),
         C_tot = mean(c_across(C1:C5), na.rm = TRUE),
         E_tot = mean(c_across(E1:E5), na.rm = TRUE),
         N_tot = mean(c_across(N1:N5), na.rm = TRUE),
         O_tot = mean(c_across(O1:O5), na.rm = TRUE)) %>%
  select(A_tot, C_tot, E_tot, N_tot, O_tot, gender, age, education)


bfiscore %>%
  group_by(gender) %>%
  summarise(A_mean = mean(A_tot),
            C_mean = mean(C_tot),
            E_mean = mean(E_tot),
            N_mean = mean(N_tot),
            O_mean = mean(O_tot))

bfiscore %>%
  group_by(gender) %>%
  summarise(
    across(A_tot:O_tot,
           list(mean = ~ mean(.x, na.rm = TRUE),
                sd = ~ sd(.x, na.rm = TRUE),
                min = ~ min(.x, na.rm = TRUE),
                max = ~ max(.x, na.rm = TRUE))))

bfiscore %>%
  group_by(education) %>%
  summarise(
    across(A_tot:O_tot,
           list(mean = ~ mean(.x, na.rm = TRUE),
                sd = ~ sd(.x, na.rm = TRUE),
                min = ~ min(.x, na.rm = TRUE),
                max = ~ max(.x, na.rm = TRUE))))

    