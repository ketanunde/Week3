dosage <- c(20, 30, 40, 50, 60) 
drug1 <- c(16, 20, 27, 40, 60)
drug2 <- c(15, 18, 25, 31, 40)

column_names <- c("Dosage", "Drug1", "Drug2")

drugs <- data.frame(dosage, 
                    drug1, 
                    drug2)

colnames(drugs) <- column_names
str(drugs)

plot(drugs)

plot(dosage, type = "o", col = "Blue")
?plot

#Option "b" indicates both points and lines should be plotted
plot(dosage, drug1, type = "b")

?par
# Set or Query Graphical Parameters
# par can be used to set or query graphical parameters. 
# Parameters can be set by specifying them as arguments to par in tag = value form, 
# or by passing them as a list of tagged values.

opar <- par(no.readonly = TRUE)
# lty = line type 
# lwd = line width

# lty =2 dashed line
# pch =17 solid traingle 
par(lty = 2, pch = 17)
plot(dosage, drug1, type = "b")
par(opar)
