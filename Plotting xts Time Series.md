- SPY SPDR S&P 500 ETF Trust
- QQQ PowerShares NASDAQ QQQ Trust
- GDX Market Vectors Gold Miners ETF
- DBO PowerShares DB Oil Fund (ETF)
- VWO Vanguard FTSE Emerging Markets ETF

We first obtain the data using quantmod, going back to January 2007:
<pre><code>
library(quantmod)
tckrs <- c("SPY", "QQQ", "GDX", "DBO", "VWO")
getSymbols(tckrs, from = "2007-01-01")
</code></pre>
Then, extract just the closing prices from each set:
<pre><code>
SPY.Close <- SPY[,4]
QQQ.Close <- QQQ[,4]
GDX.Close <- GDX[,4]
DBO.Close <- DBO[,4]
VWO.Close <- VWO[,4]
</code></pre>
What we want is the set of cumulative returns for each, in the sense of the cumulative value of $1 over time.  To do this, it is simply a case of dividing each daily price in the series by the price on the first day of the series.  As *SPY.Close[1]*, for example, is itself an **xts** object, we need to coerce it to numeric in order to carry out the division:
<pre><code>
SPY1 <- as.numeric(SPY.Close[1])
QQQ1 <- as.numeric(QQQ.Close[1])
GDX1 <- as.numeric(GDX.Close[1])
DBO1 <- as.numeric(DBO.Close[1])
VWO1 <- as.numeric(VWO.Close[1])
</code></pre>
Then, it’s a case of dividing each series by the price on the first day, just as one would divide an `R` vector by a scalar.  For convenience of notation, we’ll just save these results back into the original ETF ticker names and overwrite the original objects:
<pre><code>
SPY <- SPY.Close/SPY1
QQQ <- QQQ.Close/QQQ1
GDX <- GDX.Close/GDX1
DBO <- DBO.Close/DBO1
VWO <- VWO.Close/VWO1
</code></pre>
We then merge all of these xts time series into a single xts object (à la a matrix):

basket <- cbind(SPY, QQQ, GDX, DBO, VWO)

Note that is.xts(basket)returns TRUE. We can also have a look at the data and its structure:

> head(basket)
           SPY.Close QQQ.Close GDX.Close DBO.Close VWO.Close
2007-01-03 1.0000000  1.000000 1.0000000        NA 1.0000000
2007-01-04 1.0021221  1.018964 0.9815249        NA 0.9890886
2007-01-05 0.9941289  1.014107 0.9682540 1.0000000 0.9614891
2007-01-08 0.9987267  1.014801 0.9705959 1.0024722 0.9720154
2007-01-09 0.9978779  1.019889 0.9640906 0.9929955 0.9487805
2007-01-10 1.0012025  1.031915 0.9526412 0.9517923 0.9460847

<pre><code>
> tail(basket)
           SPY.Close QQQ.Close GDX.Close DBO.Close VWO.Close
2014-01-10  1.302539        NA 0.5727296  1.082406 0.5118100
2014-01-13  1.285209  1.989130 0.5893833  1.068809 0.5053915
2014-01-14  1.299215  2.027058 0.5750716  1.074166 0.5110398
2014-01-15  1.306218  2.043710 0.5826177  1.092707 0.5109114
2014-01-16  1.304520  2.043941 0.5886027  1.089411 0.5080873
2014-01-17  1.299003  2.032377 0.6070778  1.090647 0.5062901
</code></pre>

Note that we have a few NA values here.  This will not be of any significant consequence for demonstrating plotting functions, however.

We will now look how we can plot all five series, overlayed on a single graph.  In particular, we will look at the plot(.) functions in both the zoo and xts packages.

Using plot(.) in the zoo package
The xts package is an extension of the zoo package, so coercing our xts object basket to a zoo object is a simple task:

 zoo.basket <- as.zoo(basket)

Looking at head(zoo.basket) and tail(zoo.basket), we will get output that looks the same as what we got for the original xts basket object, as shown above; the date to data mapping is preserved. The plot(.) function provided in zoo is very simple to use, as we can use the whole zoo.basket object as input, and the plot(.) function will overlay the time series and scale the vertical axis for us with the help of a single parameter setting, namely the screens parameter.

Let’s now look at the code and the resulting plot in the following example, and then explain what’s going on:
<pre><code>
# Set a color scheme:
tsRainbow <- rainbow(ncol(zoo.basket))
# Plot the overlayed series
plot(x = zoo.basket, ylab = "Cumulative Return", main = "Cumulative Returns",
        col = tsRainbow, screens = 1)
# Set a legend in the upper left hand corner to match color to return series
legend(x = "topleft", legend = c("SPY", "QQQ", "GDX", "DBO", "VWO"), 
       lty = 1,col = tsRainbow)
</code></pre>
  
