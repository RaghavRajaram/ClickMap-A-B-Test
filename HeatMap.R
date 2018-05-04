# Read click data and store it.
shareData = read.csv("ShareAB.csv")


library(png)
library(ggplot2)
library(grid)


# Read and store the images. One for Group A and one for Group B.
image1 <- readPNG("1.png")
image2 <- readPNG("2.png")


# Separate the data for group A and B to visualize click heatmap.
shareA = shareData[shareData$Group == 'A',]
shareB = shareData[shareData$Group == 'B',]
  

# Plot heatmap over the image raster for Group A 
ggplot(shareA, aes(x=x, y=y)) + geom_point() + xlim(0,385) + ylim (0,310) + 
  annotation_custom(rasterGrob(image1, width=unit(1,"npc"), height=unit(1,"npc")), 
                    -Inf, Inf, -Inf, Inf)+ 
  stat_density_2d(aes(fill = ..level.., alpha = ..level..), geom="polygon")+
  scale_fill_gradient(low = "red", high = "green")


# Plot heatmap over the image raster for Group B
ggplot(shareB, aes(x=x, y=y)) + geom_point() + xlim(0,385) + ylim (0,310) + 
  annotation_custom(rasterGrob(image2, width=unit(1,"npc"), height=unit(1,"npc")), 
                    -Inf, Inf, -Inf, Inf)+ 
  stat_density_2d(aes(fill = ..level.., alpha = ..level..), geom="polygon")+
  scale_fill_gradient(low = "red", high = "green")


# Make a subset of 'Share' button clicks.
shareClick = shareData[shareData$Share==1,c(2,5)]


# Make a frequency table from the data to observe the difference between the two groups.
freqTable = table(shareClick$Group, shareClick$Conversion)[, c(2,1)] 

# We observe a 7.2% difference between the groups. Lets test the significance of this result through chi-squared, Fisher test
# and N-1 chi-squared p-values.

# Chi-squared test
prop.test(freqTable, conf.level = .95)

# chi-squared test p-value
chip = prop.test(freqTable, conf.level = .95)$p.value

# p-value is about 0.0267. Siginificant at the 95% level but not at the 99% level.


# Fisher test is widely used to test the significance of A/B tests. 
fisherp = fisher.test(freqTable)$p
# p-value is about 0.0266. Siginificant at the 95% level but not at the 99% level.


# N-1 chi-squared test results. Calculate chisq and then use it to calculate N-1 Chi squared.

chisq = chisq.test(freqTable)

# N-1 chisq = chisq*(N/(N-1)). 
n1chisq = (chisq$statistic)*(1000/(1000-1))

# Calculate p-value for N-1 chisq. 1 is df.
newp = 1 - pchisq(n1chisq,1)
# p-value is about 0.0266. Siginificant at the 95% level but not at the 99% level.
