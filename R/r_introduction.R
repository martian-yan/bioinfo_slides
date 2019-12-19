# Read data
voles <- read.csv("Voles.txt", sep='\t')

# Check the data
names(voles)
head(voles)
dim(voles)
str(voles)
summary(voles)

# How many male voles are heterozygous for IL1b?
volesmh <- subset(voles, Sex=="Male" & IL1b_253=="G:A")
summary (volesmh)

# A simple plot
hist(voles$Body.length)

# State the means and standard deviations of body length for male and for female voles. 
volesm <- subset(voles, Sex=="Male")
summary(volesm)
sd(volesm$Body.length)

volesf <- subset(voles, Sex=="Female")
summary(volesf)
sd(volesf$Body.length)

# A box plot compare the body length between gender
plot(Body.length~factor(Sex), data=voles)

# Do the mean body lengths of male and female voles significantly differ from one another?
## Check normality
qqnorm(voles$Body.length[voles$Sex=="Male"])
qqnorm(voles$Body.length[voles$Sex=="Female"])

## Run a t-test
t.test(Body.length~Sex,data=voles)

# Use ggplot2 visualise the t-test
install.packages("ggpubr")
library("ggpubr")  # or require("ggpubr")

fig <- ggboxplot(voles, x = "Sex", y = "Body.length",
                 color = "Sex", palette = "jco",
                 add = "jitter")

fig + stat_compare_means(method = "t.test")

fig

