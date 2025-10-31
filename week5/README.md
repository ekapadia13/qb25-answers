# Exercise 2 Answers
The slope of my Maternal Age Vs Maternally-Derived DNMs is 0.37757. This means that for every year that the maternal age increases, the number of de novo mutations increases by 0.37757. This does roughly match my plot, however there is a lot of scatter on the actual plot. My p value is < 2e-16. This tells me that my relationship is significant, as compared to the null hypothesis, which would be that the slope is 0 (i.e. that maternal age does not influence the amount of de novo mutations).

The slope of my Paternal Age vs Paternally-Derived DNMs is 1.35384. This means that for every year that the paternal age increases, the number of de novo mutations increases by 1.35384. This matches my plot, and the distribution is a lot tighter than we see for the maternal plot. My p value is < 2e-16. This tells me that my relationship is significant, as compared to the null hypothesis, which would be that the slope is 0. (i.e. that the paternal age does not influence the amount of de novo mutations). 

y = mx + b --> y = 1.35384(50.5) + 10.32632 = 78.69524 de novo mutations

T-tests compare means of distributions and whether they are statistically different. The size/average difference in parental DNMs is 38.23485. This means that there is a difference 38.23485 DNMs between the maternal mean and paternal mean. This does match my plot, as we can see the maternal and paternal labeled sections lie apart from each other. My p value is < 2.2e-16. This tells me that my relationship is significant, as compared to the null hypothesis, which would be that the difference between maternal and paternal means is 0. 

When I ran the lm, I got a coefficient of -38.23. This perfectly matches up with the size/average distance we see in the T-test of 38.23485. In this lm, there is no slope, so the intercept term represents our mean. Therefore, this is telling us that our mean DNM difference between maternal and paternal is 38.23. 

# Exercise 3 Answers
I chose the Pokemon dataset <3 

I seem to see correlations between pokemon height and health, a slightly lower correlation for weight and health, a huge correlation with attack points and defense points, no correlation with the primary pokemon type and their speed (come on a type like a dragon or flying should definitely be faster than a rcok type), but surprisingly a very tiny correlation seemed to show for secondary type and speed. 

I hypothesize that Pokemon secondary type slightly correlates with speed. My adjacent hypothesis is that this correlation is more significant than the correlation between primary type and speed. 
    My R^2 value is 0.1867, which is a really bad correlation. However, the R^2 value of my alternative hypothesis is 0.08497 which is an even worse fit. So this does slightly confirm my hypothesis that secondary Pokemon type has a stronger correlation to speed than primary Pokemon type does. 