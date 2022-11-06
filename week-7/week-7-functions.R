a<-1
greet_person_external <- function(greeting = "Hello", name = "World") {
  print(paste0(greeting, ", ", name, "!!!"))
}

greet_person_random <- function(greeting, name) {
  greeting <- c("Hello", "Hi", "Good morning", "Yo", "Whattup", "How's it goin'", "Hey, Goodbye")
  name <- c("World", "Mom, Miss Crabtree", "Adrian", "G", "Dude", "Jude", "Mr. Chips")
  print(paste0(sample(greeting,1), ", " , sample(name,1 ), "!"))
}

greet_person_external('hehe', 'jo')

df <- iris

names(df)[1:4]

for (i in names(df)[1:4]) {
  class(df[[i]])
  df[[i]] <- df[[i]]*2
}
