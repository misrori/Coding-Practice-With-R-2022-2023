
greet_person_external <- function(greeting = "Hello", name = "World") {
  print(paste0(greeting, ", ", name, "!!!"))
}

greet_person_random <- function(greeting, name) {
  greeting <- c("Hello", "Hi", "Good morning", "Yo", "Whattup", "How's it goin'", "Hey, Goodbye")
  name <- c("World", "Mom, Miss Crabtree", "Adrian", "G", "Dude", "Jude", "Mr. Chips")
  print(paste0(sample(greeting,1), ", " , sample(name,1 ), "!"))
}

