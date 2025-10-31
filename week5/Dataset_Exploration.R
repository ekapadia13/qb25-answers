setwd("/Users/cmdb/qb25-answers/week5")
library(tidyverse)
library(broom)

#Exercise 1 Wrangle the Data
proband_info <- read.csv("aau1043_dnm.csv") #read.csv automatically creates a tibble
proband_w_parents <- proband_info %>%
  group_by(Proband_id) %>% #you always combine "group_by" with "summarize"
  summarize("Paternal" = sum(Phase_combined == "father" , na.rm = TRUE), "Maternal" = sum(Phase_combined == "mother", na.RM = TRUE))

parent_info <- read.csv("aau1043_parental_age.csv")
probandID <- inner_join(proband_w_parents, parent_info)

#Exercise 2: Fit and interpret linear regression models with R

#creating a scatterplot of maternal DNMs versus maternal age
ggplot(data = probandID, aes(x = Mother_age, y = Maternal)) + 
  geom_point(color = "pink3") + 
  #scale_color_gradient(low = "thistle4", high = "lightpink") +
  labs(
    x = "Maternal Age" , 
    y = "Maternally-Derived DNMs"
  ) + 
  theme_classic()
ggsave("ex2_a.png")
#creating a scatterplot of paternal DNMs versus paternal age
ggplot(data = probandID, aes(x = Father_age, y = Paternal)) + 
  geom_point(color = "peachpuff4") + 
  labs(
    x = "Paternal Age" , 
    y = "Paternally-Derived DNMs"
  ) + 
  theme_classic()
ggsave("ex2_b.png")

lm(data = probandID, formula = Maternal ~ 1 + Mother_age) %>%
  summary()
lm(data = probandID, formula = Paternal ~ 1 + Father_age) %>%
  summary()

proband_longer <- probandID %>%
  pivot_longer(cols = c(Maternal, Paternal), names_to = "Parent", values_to = "DNMs")
ggplot(data = proband_longer, aes(x = DNMs, fill = Parent)) + 
  geom_histogram(alpha = 0.75, position = "Identity") +  
  labs( 
    x = "De Novo Mutations" ,
    y = "Number of Individuals"
  ) + 
  scale_fill_manual(values = c("pink3" , "peachpuff4")) + 
  theme_classic() 
ggsave("ex2_c.png")

t.test(probandID$Maternal, probandID$Paternal, paired = TRUE)
lm(data = probandID, formula = Maternal - Paternal ~ 1)

#Exercise 3: Explore a new dataset (Pokemon)
pokemon_df <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/main/data/2025/2025-04-01/pokemon_df.csv')

ggplot(data = pokemon_df, aes(x = height, y = hp, color = type_1)) + 
  geom_point() + 
  #labs(
  #  x = "" , 
  #  y = ""
  #) + 
  theme_classic() + 
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1))
ggsave("ex4_fig1.png")

ggplot(data = pokemon_df, aes(x = weight, y = hp, color = type_1)) + 
  geom_point() + 
  #labs(
  #  x = "" , 
  #  y = ""
  #) + 
  theme_classic() + 
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1))
ggsave("ex4_fig2.png")

ggplot(data = pokemon_df, aes(x = attack, y = defense, color = type_1)) + 
  geom_point() + 
  #labs(
  #  x = "" , 
  #  y = ""
  #) + 
  theme_classic() + 
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1))
ggsave("ex4_fig3.png")

ggplot(data = pokemon_df, aes(x = type_1, y = speed, color = type_1)) + 
  geom_point() + 
  #labs(
  #  x = "" , 
  #  y = ""
  #) + 
  theme_classic() + 
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1))
ggsave("ex4_fig4.png")

ggplot(data = pokemon_df, aes(x = type_2, y = speed, color = type_1)) + 
  geom_point() + 
  #labs(
  #  x = "" , 
  #  y = ""
  #) + 
  theme_classic() + 
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1))
ggsave("ex4_fig5.png")

model <- lm(data = pokemon_df, formula = speed ~ type_2)
summary(model)
model2 <- lm(data = pokemon_df, formula = speed ~ type_1)
summary(model2)
