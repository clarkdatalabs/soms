#Build character table locally
root = "C:/Users/DJT/Dropbox/workspace/SOM/soms/Shakespeare_txt"

##Read char table outline
CHAR <- read.csv(file=paste(root,"character_table.csv",sep = "/"), sep=",", header=T, check.names = FALSE, stringsAsFactors = FALSE)


##Read play text

library("readr")
for (row in row.names(character_table)){
  path <- paste(root, CHAR[row,"genre"], paste(CHAR[row,"play"],"_characters",sep=""), paste(CHAR[row,"character"],".txt",sep=""),sep="/")
  CHAR[row,"text"] <- read_file(path, locale(encoding = "UTF-16"))
}

remove(row)
remove(path)


A <- CHAR[ , !(names(CHAR) == "path")]
  
write.csv(A, file = "CHAR.csv", row.names = FALSE)

remove(A)
