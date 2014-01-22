#all of your possible independent variables
indeps <- c("A", "B", "C", "D")


#generate a T/F matrix to encapsulate all possibilities
booleans<-expand.grid(rep(list(c(T,F)), length(indeps)))
booleans <-booleans[-(dim(booleans)[1]),] # because the last one (all false) is useless

#match column names with indeps
names(booleans)<-paste("", LETTERS[1:length(indeps)], sep="")

#apply annon. function to each line of the T/F matrix to generate our functions
Models <-apply(booleans, 1, function(x) as.formula(
                      paste(c("R ~ 1", indeps[x]),
                            collapse=" + ")))

Models