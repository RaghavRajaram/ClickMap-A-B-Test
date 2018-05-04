# ClickMap-A-B-Test
Visualize & analyse Website Click Heatmap for A/B test and interpret results. 

A Version (orange Share button)

![A](https://github.com/RaghavRajaram/ClickMap-A-B-Test/blob/master/1.png)

B Version (white Share button)

![A](https://github.com/RaghavRajaram/ClickMap-A-B-Test/blob/master/2.png)


# Data
Mocked up data representing button clicks on a website, their coordinates and conversion (yes/no) for both version of the website. 

# Approach

- Read and store the images. One for Group A and one for Group B.
- Separate the data for group A and B to visualize click heatmap.
Plot heatmap over the image raster for Group A.

![AHeatmap](https://github.com/RaghavRajaram/ClickMap-A-B-Test/blob/master/shareA.png)

Plot heatmap over the image raster for Group A.

![BHeatmap](https://github.com/RaghavRajaram/ClickMap-A-B-Test/blob/master/shareB.png)

- Make a subset of 'Share' button clicks.
- Use statistical methods to test the significance (chisquared, Fisher test etc).
- We observe a 7.2% difference between A and B. (Significant at 95% but not 99%)