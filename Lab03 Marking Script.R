# This file is used to mark stats220 lab 03:
# Create a project and add this file within same folder as your project
# All students submission I saved it into the subfolder "submission", if you don't use same folder name, please change it accordingly. 

# Read your student list
student.df <- read.csv("lab03-marks-c-3.csv", header = TRUE, stringsAsFactors = FALSE)

# Get total student number
std.num<- nrow(student.df)

# Initialze the output dataframechro
mark.df <- data.frame(matrix(vector(), ncol = 10))
colnames(mark.df) <- names(student.df)


#Running through each student and enter the marks for them
for (i in 1:std.num){
  student<- student.df[i, ]
  studentname <- student[1]
  stdId <- student[2]
  
  cat("You are now marking ", as.character(studentname))
  
  # Open student's file checking answers, please CHANGE THE FOLDER NAME, if you save submissions in different folder 
  opencmd <- paste("open ","submissions/*",stdId,"*", sep = "")
  system(opencmd)
  
  # Enter mark: 1 mark
  mark01 = as.numeric(readline(prompt = "Enter csv marks (3 marks total) --> "))
  
  # Enter mark: 1 mark
  mark02 = as.numeric(readline(prompt = "Enter xlxs marks (3 marks total) --> "))
  
  # Enter mark: 1 mark
  mark03 = as.numeric(readline(prompt = "Enter xml marks (3 marks total) --> "))
  
  # Enter mark: 1 mark
  mark04 = as.numeric(readline(prompt = "Enter db, sqllite marks (3 marks total) --> "))
  
  # Enter mark: 1 mark
  mark05 = as.numeric(readline(prompt = "Enter .txt marks (3 marks total) --> "))
  
  # Enter mark: 1 mark
  mark06 = as.numeric(readline(prompt = "Enter -37.8497 marks (3 marks total) --> "))
  
  #Convert total marks  
  total = sum(mark01, mark02, mark03, mark04, mark05, mark06)
  
  # Add the marks into the csv file
  student[3:9] <- c(mark01, mark02, mark03, mark04, mark05, mark06, total)
  
  
  # Ask if the marker wants to add comments to the student
  comments <- readline(prompt = "Any comments for this student?  --> ")
  student[10] <- comments
  mark.df[i,] <- student
  print("Student has been marked, details as follows")
  print(mark.df[i,])
}


##Export your marks to csv file
write.table(mark.df, "lab03-marks-c-3.csv", row.names = FALSE, sep = ",")
