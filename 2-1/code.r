setwd("/Users/furuyama/github/manga_sience_of_statistics/2-1/")

# ramen.csv 作成
# \" はつけない

> umai_ramen <- read.csv("ramen.csv", header=T, stringsAsFactors=F)
> head(umai_ramen)
  Shop Price
1    1   700
2    2   850
3    3   600
4    4   650
5    5   980
6    6   750


# 数値要約
> summary(umai_ramen)
      Shop           Price      
 Min.   : 1.00   Min.   :500.0  
 1st Qu.:13.25   1st Qu.:670.0  
 Median :25.50   Median :750.0  
 Mean   :25.50   Mean   :742.9  
 3rd Qu.:37.75   3rd Qu.:800.0  
 Max.   :50.00   Max.   :980.0  


# 度数分布表
# 相対度数

> ?str
Description
Compactly display the internal structure of an R object, a diagnostic function and an alternative to summary (and to some extent, dput). Ideally, only one line for each ‘basic’ structure is displayed. It is especially well suited to compactly display the (abbreviated) contents of (possibly nested) lists. The idea is to give reasonable output for any R object. It calls args for (non-primitive) function objects.

>  str(umai_ramen)
'data.frame': 50 obs. of  2 variables:
 $ Shop : int  1 2 3 4 5 6 7 8 9 10 ...
 $ Price: int  700 850 600 650 980 750 500 890 880 700 ...

# ヒストグラムを書く
> ggplot(umai_ramen,aes(x=Price)) + geom_histogram()
stat_bin: binwidth defaulted to range/30. Use 'binwidth = x' to adjust this.
> ggsave(file="graph_hist1.png")
Saving 7 x 6.05 in image
stat_bin: binwidth defaulted to range/30. Use 'binwidth = x' to adjust this.

# 幅100
> ggplot(umai_ramen,aes(x=Price)) + geom_histogram(binwidth = 100)
> ggsave(file="graph_hist100.png")
Saving 7 x 6.05 in image



