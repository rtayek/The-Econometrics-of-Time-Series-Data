filename<-"w1\\Week 1 Data.csv"
print(filename)
path=file.path(filename)
print(path)
print(file.exists(path))

df <- as.data.frame(read.csv(path))
