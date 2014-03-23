Mini-tutorial for Quandl: How to access financial data with R
=============================================================
by Joseph Rickert

*** http://blog.revolutionanalytics.com/2013/06/a-mini-tutorial-for-quandl.html ***

Quandl.com, the open source website for financial data, made rapid progress earlier this year in becoming an R friendly 
source for financial time series data. 

Tammer Kamel, Quandl’s founder introduced the site on Revolutions blog in late 
February as a “search engine” for numerical data and explained how Quandl’s “Q-bot” can take data from almost any 
publisher that shape it into a standard from. Then in early in March we noted that the quandl package is available 
in CRAN. Today, I would like to provide a mini-tutorial on accessing the data. Getting time series data couldn't be 
easier.

The main page lists a column of 10 “Markets”. Clicking on one, say “Currencies”, will take you to a page with the 
title ***Exchange Rates versus USD*** The first table on the page lists major currencies. All of the numbers in the 
table are live. Clicking on one will take you to the page devoted to a particular time series. 

For example, clicking on the entry in the column labeled “Inverted” in the row for the Japanese Yen (JPY) will take 
you to a page to devoted to the series of exchange rates for the Japanese Yen in US Dollars. 

Clicking on the red “Download” button at the top of the page will take you to the download wizard, and 
selecting R will yield a dropdown box with a line of R code to fetch the series.
