



library(ggplot2)
library(dplyr)
get_random_walk <- function(forward_length, backward_length, distance) {
  steps <- c()
  current_distance <- 0
  while (distance>=current_distance) {
    t_step <- sample(c(forward_length, backward_length*-1), 1)
    steps <- c(steps, t_step)
    current_distance <- current_distance + t_step 
  }
  print(paste('I need', length(steps) ,'steps to get home.'))
  df <- data.frame('distance' = cumsum(steps))
  df$step <- 1:nrow(df)
  
  p <- ggplot(df, aes(x=step, y=distance))+
    geom_line()+
    theme_bw()+
    labs(title = paste0(length(steps) ,' steps to get home'), x= 'Steps', y= 'Distance'  )
  return(p)  
}



library(rtsdata)
library(data.table)
library(pracma)
library(TTR)




get_one_ticker <- function (ticker, start_date = "2000-01-01", end_date = Sys.Date(), mas = c(500, 100, 50, 20), calcutate_mas = T, calculate_rsi=T, plot_res=T) {
  # Download historical data from Yahoo Finance using ‘getSymbols.yahoo‘ and create a dataframe
  df <- data.frame(rtsdata::ds.getSymbol.yahoo(ticker, from = (as.Date(start_date) - 250), to = end_date))
  # Format the names and assign it back to the df (lowercase, delete after the dot)
  names(df) <- tolower(sapply(strsplit(names(df), ".",  fixed = T), "[[", 2))
  # Add the row name as a new column
  df$date <- as.Date(row.names(df))
  # Change index
  row.names(df) <- 1:nrow(df)
  df <- data.table(df)
  # Calculate the moving averages
  if (calcutate_mas) {
    for (simple_mas in mas) {
      df[[paste0("ma_", simple_mas, "_value")]] <- pracma::movavg(df[["close"]], simple_mas, type = "s")
    }
  }
  # Calculate the RSI
  if (calculate_rsi) {
    df$rsi <- TTR::RSI(as.numeric(df$high), n = 14)
  }
  # Filter the dataframe to the filled rows
  df <- df[date >= as.Date(start_date) & !is.na(rsi), ]
  # Add the ticker name
  df$ticker <- ticker
  if (plot_res) {
    # Visualize
    cols <- colnames(df %>% select(starts_with("ma_")))
    pal <- palette(rainbow(length(cols)))
    p <- ggplot() +
      geom_line(data = df, aes(x=date, y=close, color="close")) +
      labs(x = "Date", y = "Close price") +
      theme_bw()
    for (i in 1:length(cols)) {
      p <- p + geom_line(data = df, aes(x=date, y= !!sym(cols[i]), color = !!cols[i]))
    }
    p <- p +
      scale_color_manual(values = c("black", pal), name = "")
    plot(p)
  }

  return(df)
}
# gworet_one_ticker('TSLA') %>% tail(10)
# df <- get_one_ticker('TSLA')




