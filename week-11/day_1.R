t <- readLines('/home/mihaly/R_codes/Coding-Practice-With-R-2022-2023/week-11/day1_1')
# first part
all_max <- c()
tempmax<- 0
for (i in 1:length(t)) {
  if (t[i]=='') {
    all_max <- c(all_max,tempmax )
    tempmax<- 0
  }else{
    tempmax<- tempmax+as.numeric(t[i])
  }
}
max(all_max)

# secound pasum(rts 
sum(sort(all_max, decreasing = T)[1:3])
