
getSymbols(c("^GSPC","^VIX"))
head(as.xts(merge(GSPC,VIX)))
chartSeries(c(GSPC, VIX), subset='last 3 months')

#####################################


chart_Series(GSPC)
add_Series(OHLC(VIX)+1000,on=1)
