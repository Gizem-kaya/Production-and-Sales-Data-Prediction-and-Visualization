# R-Studio

Representation of production and sales changes according to years, months and locations and Prediction future sales and production values.

## 2.4.1. Problem Description

 First, two big excel files named SATIS (sales) and STOK (stock) were
given. The data sets in this file were expected to create a new SATIS and
STOCK file for a week. After the week these excel files finished. Then Mr.
Mustafa Taş and Oktay Sönmez (engineers in charge) presented the project.
SATIS and STOK files were too big and too hard to understand generally. The
work was to give a meaning to the data. Which means to create graphics by 
the years and by the cities, to make forecasts about sales and stock in the
coming years.

## 2.4.2. Analysis and Work

 In order to approach the problem of giving meaning to the data, the
analysis was divided into several parts. First of all, there was a need for a plan
and an algorithm. After a little research and time, this algorithm has formed
step by step:

- Check where are we with getwd() and go in the file which is in with
setwd("E:/…..”).

- Read SATIS.xlsx, STOK.xlsx, URUN.xlsx, BOLGE.xlsx files with
“openxlsx “ package.

- Then for visualization it was necessary to perform data conversion
on SATIS and STOK data.

- By “ggplot” package a few graphics have been created to show
Area, product and amount relationship according to years (Initial /
Rplot1.png, Rplot2.png, Rplot3.png, Rplot4.png).

- The last graph is organized as an example of a rating chart.

- Then, for each year, for “Makta”, the percentages of the products
were compared according to region.

- The same process was done for “Rampa” and “Satış Deposu”.

- As you can see on charts and tables, ID's are used instead of
product and region names. The reason why the ID’s were put in the
database was ID’s need smaller space than names. But we have
been able to put names in graphics instead of ID's.

- To do this, SATIS – BOLGE – URUN and STOK – BOLGE – URUN
tables must be joined (solved with SQL logic). So that regions and
product data can be easily used together in graphics.

- For using them together, “inner_join” and “merge” functions used
from “dplyr” package.

- After preparing the data, SATIS and STOK data divided and
separated according to years (with “subset.data.frame()”function).
Because for each year; sales and stints, ramps, sales depots,
quantity and amount ratios are requested by region.
- After all this has been done, it is necessary to give meaning to the
collected data.

- Before plotting, it is essential to change the structure of the data.
Because the numbers do not appear as integers when the data in
the chart are not changed.

- For STOK table, regions were put in the x-axis; quantity and
amount were put in the y-axis in separate charts, thus in all the
regions within a year, it can be seen the whole STOK table in one
chart for a year and these graphics are now easier to interpret and
the functionality of the graphics has increased.

- Similarly, for SATIS table, regions were put in the x-axis; Makta,
Rampa and Satış Deposu were put in the y-axis in separate charts.


* Examples are shown below 2015 STOK and SATIS chart:

#### SATIS: 

![1](https://user-images.githubusercontent.com/32525636/61541226-f0bf9c80-aa47-11e9-98f2-ca722c6ed8f6.png)



![2](https://user-images.githubusercontent.com/32525636/61541232-f4532380-aa47-11e9-8be2-17f008994d36.png)



## 2.4.3. End of The Project

- The last remaining process after estimating the required graphics is the
estimation process.

- This process was done as done in The Titanic Project.

- First of all, randomForest package loaded and called.

- Similarly Train and Test sets were created.

- After that, randomForest function is used. In the random forest
approach, a large number of decision trees are created. Every
observation is fed into every decision tree. The most common outcome
for each observation is used as the final output. A new observation is
fed into all the trees and taking a majority vote for each classification
model. 

- For creating a decision tree, tree() and plot() functions are used and
that base table was obtained:

![3](https://user-images.githubusercontent.com/32525636/61541427-4e53e900-aa48-11e9-84c1-c371463eb77a.png)

- With text() function the finished decision tree is obtained: 

![4](https://user-images.githubusercontent.com/32525636/61541769-ebaf1d00-aa48-11e9-80c5-5bd6ddf584e9.png)

- An estimation operation was performed using the predict function using
this tree, and at the end of this processing, a comparison of the actual
values and the predicted values was made in a dataframe named
"table.comp":

![5](https://user-images.githubusercontent.com/32525636/61541771-ee117700-aa48-11e9-80ed-331c34aee33f.png)

- The values did not appear very similar. Because there were not many
classes of data, although it was in the titanic project. We only had
month, year and region information (this data frame has 1,848 lines
and can be obtained by running the program).

- At the end of the project, when the year and region information were
given, it was requested that the sales charts (quantity and amount) of
the year and the region come together.

- To do this, “easyggplot2” package is needed.

- The data separated according to years have been combined with
rbind() function.

- Then a function was created (Bol_tab()) that takes the names of
regions and years as parameters and creates two separate charts of
sales quantities and amounts and prints them side by side. 

* A few examples are below:


Bol_tab(1,2015)

![6](https://user-images.githubusercontent.com/32525636/61541775-ef42a400-aa48-11e9-80f5-b17d1d5b06a8.png)

Bol_tab(2,2016) # Adapazarı is another name of Sakarya

![7](https://user-images.githubusercontent.com/32525636/61541781-f10c6780-aa48-11e9-98b1-c489bcc61a89.png)
