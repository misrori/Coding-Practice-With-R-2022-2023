library(ggplot2)
library(ggThemeAssist)
library(nycflights13)

t <- flights %>%
  group_by(carrier)%>%
  summarise('mean_arr_delay'=mean(arr_delay, na.rm = T)) %>%
  arrange(mean_arr_delay) %>% 
  ggplot(aes(x = reorder(carrier, mean_arr_delay), y = mean_arr_delay)) + 
  geom_col(color='limegreen', fill='cyan4')+
  labs( y='Average delay', x = 'Carrier')+theme_linedraw()

#highlight a plot object, click addins then ggplot theme assist

t
t + theme(plot.title = element_text(family = "mono"),
    panel.background = element_rect(fill = "aliceblue"),
    plot.background = element_rect(fill = "white")) +labs(title = "hello")

library(esquisse)
# click addins than ggplot2 builder
