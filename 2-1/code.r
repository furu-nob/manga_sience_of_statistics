setwd("/Users/furuyama/github/manga_sience_of_statistics/2-1/")

# ramen.csv 作成
# \"（ダブルクォート） はつけない

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
# http://aoki2.si.gunma-u.ac.jp/R/dp/junbi.html
# 1列目をfactor（要素）に
> umai_ramen[,1] <- factor(umai_ramen[,1])
> str(umai_ramen)
'data.frame': 50 obs. of  2 variables:
 $ Shop : Factor w/ 50 levels "1","2","3","4",..: 1 2 3 4 5 6 7 8 9 10 ...
 $ Price: int  700 850 600 650 980 750 500 890 880 700 ...

> table(umai_ramen)
    Price
Shop 500 550 580 590 600 650 670 680 700 720 750 777 780 790 800 850 880 890 900 930 980
  1    0   0   0   0   0   0   0   0   1   0   0   0   0   0   0   0   0   0   0   0   0
  2    0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   1   0   0   0   0   0
  3    0   0   0   0   1   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0
  4    0   0   0   0   0   1   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0
  5    0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   1
…

# xxxx
# 500-600
k500_600 <- subset(umai_ramen,Price >= 500 & Price < 600,c(Price))
k600_700 <- subset(umai_ramen,Price >= 600 & Price < 700,c(Price))
k700_800 <- subset(umai_ramen,Price >= 700 & Price < 800,c(Price))
k800_900 <- subset(umai_ramen,Price >= 800 & Price < 900,c(Price))
k900_1000 <- subset(umai_ramen,Price >= 900 & Price < 1000,c(Price))
# xxxx

# http://www13.atwiki.jp/rmemo/pages/18.html
# グラフは描かずに度数分布表だけを作る
> hist(umai_ramen[,2],plot=F)
$breaks
 [1]  500  550  600  650  700  750  800  850  900  950 1000

$counts
 [1]  2  5  5 10  6 10  3  7  1  1

$density
 [1] 0.0008 0.0020 0.0020 0.0040 0.0024 0.0040 0.0012 0.0028 0.0004 0.0004

$mids
 [1] 525 575 625 675 725 775 825 875 925 975

$xname
[1] "umai_ramen[, 2]"

$equidist
[1] TRUE

attr(,"class")
[1] "histogram"



# http://www2.hak.hokkyodai.ac.jp/fukuda/lecture/SocialLinguistics/Rshagen/02histogramR.html
# クラスの区間を通常は「～以上～未満」として集計しますので、right=FALSEというオプションを忘れずに指定してください。
> hist(umai_ramen[,2],breaks = c(500,600,700,800,900,1000),plot=F,right=FALSE)
$breaks
[1]  500  600  700  800  900 1000

$counts
[1]  4 13 18 12  3

$density
[1] 0.0008 0.0026 0.0036 0.0024 0.0006

$mids
[1] 550 650 750 850 950

$xname
[1] "umai_ramen[, 2]"

$equidist
[1] TRUE

attr(,"class")
[1] "histogram"

# http://bio-info.biz/tips/r_histogram.html

> ?str
Description
Compactly display the internal structure of an R object, a diagnostic function and an alternative to summary (and to some extent, dput). Ideally, only one line for each ‘basic’ structure is displayed. It is especially well suited to compactly display the (abbreviated) contents of (possibly nested) lists. The idea is to give reasonable output for any R object. It calls args for (non-primitive) function objects.

>  str(umai_ramen)
'data.frame': 50 obs. of  2 variables:
 $ Shop : int  1 2 3 4 5 6 7 8 9 10 ...
 $ Price: int  700 850 600 650 980 750 500 890 880 700 ...

# ggplot2を読み込み
> library(ggplot2)

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


ggplot のaesの意味 → aesthetics（エステティクス、美的要素）の略

