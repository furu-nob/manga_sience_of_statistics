# (1)縦軸度数のグラフ
# (2)縦軸相対度数のグラフ
# setwd("/Users/furuyama/github/manga_sience_of_statistics/2-1/")
# objects()
# source("histgram-table.R")
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
# 出力
output.table

# data.frame作成
#(1) df <- data.frame(mids = umai.ramen.histhistgram$mid, counts = umai.ramen.histhistgram$counts)
#(2)
df <- data.frame(mids = umai.ramen.histhistgram$mid, density = umai.ramen.histhistgram$density * 100)

# グラフ書く
library(ggplot2)
g <- ggplot(
  df,
  aes (
    x = mids,
    #(1)y = counts,
    #(2)
    y = density,
    #(1)fill = counts,
    #(2)
    fill = density,
    #(1)label = counts, vjust = -0.5
    #(2)
    label = density, vjust = -0.5
  )
)
g <- g + geom_bar(
  stat = "identity",
)
g <- g + xlab("mids")
#(1)g <- g + ylab("Counts")
#(2)
g <- g + ylab("Density")
g <- g + ggtitle("manga_sience_of_statistics 2-1")
g <- g + geom_text()
plot(g)
#(1)ggsave(file="graph_hist_counts.png")
#(2)ggsave(file="graph_hist_density.png")
