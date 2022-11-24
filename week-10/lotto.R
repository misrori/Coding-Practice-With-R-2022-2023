
min_number <- 1
max_number  <- 90
number_of_choose <- 5

get_numbers_from_user <- function(min_number, max_number, number_of_choose) {
  numbers <- c()
  while (length(numbers)<number_of_choose) {
    t_number <- readline(prompt = paste0('Please give me the ', length(numbers)+1 ,'. number between ' , min_number, ' and ', max_number, '. Your number:'))
    if (grepl('.',t_number, fixed = T) | grepl(',',t_number, fixed = T)   ) {
      print(paste0('Please write integers between: ',min_number, ' and ', max_number, '!' ))
      next()
    }
    t_number  <- as.integer(t_number)
    if (t_number%in% numbers) {
      print(paste0(t_number, ' is already in your numbers!' ))
      next()
    }
    if (is.na(t_number) ) {
      print('Please write numbers number')
    }
    else {
      if (t_number>=min_number & t_number<=max_number ) {
        numbers <- c(numbers, t_number)
      } else{
        print(paste0('The number should be between: ', min_number, ' and ', max_number, '!' )) 
      }
    }
  }
  numbers <- sort(numbers)
  return(sort(numbers))
}

simulate_lotto <- function(min_number=1, max_number, number_of_choose) {
  
  user_numbers <- get_numbers_from_user(min_number, max_number, number_of_choose)
  good_numbers <- sort(sample(min_number:max_number, number_of_choose))
  
  all_choose <- choose(max_number,  number_of_choose)
  for (i in number_of_choose:0) {
    
    good_choose <- choose(number_of_choose,i )  * choose( max_number - number_of_choose  , number_of_choose -i ) 
    
    chance <- good_choose/all_choose
    print(paste0('Your chance to get ',i ,' number correct is: ', chance*100, '%' ))
  }
  print(paste0("Thank you, your numbers are: ", paste(user_numbers, collapse = ', ') ) )
  
  print(paste0("And the winning numbers are: ",  paste(good_numbers, collapse = ', ')) )
  
  print( paste0('You got:  ' ,sum(user_numbers%in%good_numbers), ' correct' ))
}



# 
simulate_lotto(1,45,7)

# 
# 
# 
# t_number <- as.integer('32r0')
# t_number <- as.integer('32.3')
# t_number <- as.integer('32')
# 
# is.(t_number)
# 
# is.integer(t_number)
# as.integer(t_number)
# 
# class(t_number)
# get_numbers_from_user(1,20, 6)
# 
# 
# 
# i <- 1
# 
# choose(number_of_choose,i )  * choose( max_number - number_of_choose  , number_of_choose -i ) 
# 
# 
# 
# 
# choose(90, 4)
# choose(86, 1)
# 
# choose(5,4)*choose(85,1)
# 
# choose(5,3)*choose(85,1)
# 
# 
