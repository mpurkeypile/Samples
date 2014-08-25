library(RCurl)
library(XML)

#call the web service
Result <- basicTextGatherer()
curlPerform(url = "http://www.xignite.com/xGlobalHistorical.xml/GetGlobalHistoricalQuotesRange?IdentifierType=Symbol&Identifier=RBS.XLON&AdjustmentMethod=SplitOnly&StartDate=8/22/2013&EndDate=8/21/2014&Header_Username=JamesPolk1845", writefunction = Result$update)
ResultXML = xmlRoot(xmlTreeParse(Result$value()))

#parse the result and draw the chart
DataPoints = xmlElementsByTagName(ResultXML, "Last", TRUE)
plot(unlist(DataPoints), type="o", col = "blue", ylim=c(0, 5), ann = FALSE, axes = FALSE)
title(main = "RBS.XLON 1 Year History", col = "Red", xlab = "Date", ylab = "Price")
axis(2, at=1*0:5)
box()
