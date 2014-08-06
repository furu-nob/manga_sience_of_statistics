# setwd("/Users/furuyama/github/manga_sience_of_statistics/2-1/")
# objects()
rm (umai.ramen, output.table, umai.ramen.histhistgram)
umai.ramen <- read.csv("ramen.csv", header=T, stringsAsFactors=F)
umai.ramen.histhistgram <- hist(umai.ramen[,2],breaks = c(500,600,700,800,900,1000),plot=F,right=FALSE)
output.table <- matrix(,7,4)
output.table[1,] <- c("以上-未満/階級","階級値","度数","相対度数")
output.table[2:6,1] <- c("500-600","600-700","700-800","800-900","900-1000")
output.table[2:6,2] <- umai.ramen.histhistgram$mids
output.table[2:6,3] <- umai.ramen.histhistgram$counts
output.table[2:6,4] <- umai.ramen.histhistgram$density * 100
# output.table <- rbind(output.table, c("計",NA,sum(umai.ramen.histhistgram$counts),sprintf("%.2f",sum(umai.ramen.histhistgram$density * 100))))
output.table[7,] <- c("計",NA,sum(umai.ramen.histhistgram$counts),sprintf("%.2f",sum(umai.ramen.histhistgram$density * 100)))
