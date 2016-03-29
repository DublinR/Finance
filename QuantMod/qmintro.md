QuantMod
=================
The Quantmod package allows you to develop, testing, and deploy of statistically based trading models.  It provides the infrastructure for downloading/importing data from a variety of locations, analyze that data and produce charts that help determine statistical trends.  I appreciated Digital Dude calling this package to my attention  in a recent comment.  I also noticed that Revolution Analytics had highlighted the package on its finance page.  Actually, I had come across quantmod a few months ago - and it instantly got me excited about the power of R.  To give you an idea of typical usage, the following creates a stock chart of the last three months of Apple stock data.

<pre><code>
library('quantmod')

getSymbols("AAPL")
chartSeries(AAPL, subset='last 3 months')
addBBands()
</code></pre>

The getSymbols function is used to retrieve stock data.  Data can originate in a number of locations.  In the example above, we are obtaining a single stock, Apple.  If you wanted to download several different stock quotes, you can do so in a single command.

<pre><code>
getSymbols(c("ORCL","IBM"))
</code></pre>

Once you have retrieved stock data, you can focus on subsets of dates quickly.
<pre><code>
AAPL['2010-06-01::2010-06-26']
</code></pre>
You can also merge data to view comparisons.

<pre><code>
head(as.xts(merge(ORCL,IBM)))
</code></pre>

The chartSeries command creates the plot pictured above.  It captures a large amount of information, the date, open and close price, and volume of trading for each day.  Finally, the addBBands() call adds Bollinger Bands to the chart.  Informally, this amounts to a line indicating moving average and two lines a standard deviation above and below this moving average. For the uninitiated, technical indicators (and overlays) can be broken up into four categories - Trend, Volatility, Momentum, and Volume.  Those available in Quantmod are listed below.

### Trend
- Welles Wilder's Directional Movement Indicator	ADX	addADX
- Double Exponential Moving Average	DEMA	addDEMA
- Exponential Moving Average	EMA	addEMA
- Simple Moving Average	SMA	addSMA
- Parabolic Stop and Reverse	SAR	addSAR
- Exponential Volume Weighted Moving Average	EVWMA	addEVWMA
- Moving Average Convergence Divergence	MACD	addMACD
- Triple Smoothed Exponential Oscillator	TRIX	addTRIX
- Weighted Moving Average	WMA	addWMA
- ZLEMA	ZLEMA	addZLEMA

### Volatility

- Average True Range	ATR	addATR
- Bollinger Bands	BBands	addBBands
- Price Envelope	N/A	addEnvelope

### Momentum
- Commodity Channel Index	CCI	addCCI
- Chande Momentum Oscillator	CMO	addCMO
- Detrended Price Oscillator	DPO	addDPO
- momentum	addMomentum
- Rate of Change	ROC	addROC
- Relative Strength Indicator	RSI	addRSI
- Stocastic Momentum Index	SMI	addSMI
- Williams %R	WPR	addWPR

### Volume
- Chaiken Money Flow	CMF	addCMF
- Volume	N/A	addVo
