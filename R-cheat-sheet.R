print("Hello R in VS Code 🚀")
############################################################
#            R – BASES COMPLÈTES (SCRIPT ULTIME)
#            Compatible R 4.5.x
############################################################

########################
# 1. AIDE & ENVIRONNEMENT
########################
help(mean)
?mean
ls()
rm(list = ls())
getwd()
setwd("C:/")  # adapte si besoin
history()
sessionInfo()

########################
# 2. TYPES & VARIABLES
########################
x <- 10
y <- 3.14
z <- "texte"
b <- TRUE

class(x)
typeof(y)
length(z)
is.numeric(x)
as.character(x)

########################
# 3. VECTEURS
########################
v <- c(1, 2, 3, 4, 5)
numeric(5)
seq(1, 10, by = 2)
rep(1, times = 5)

v + 2
v * v
sum(v)
mean(v)
min(v); max(v)

v[1]
v[-1]
v[v > 3]

########################
# 4. FACTEURS
########################
f <- factor(c("A", "B", "A", "C"))
levels(f)
table(f)
as.character(f)

########################
# 5. MATRICES
########################
m <- matrix(1:9, nrow = 3, byrow = TRUE)
nrow(m); ncol(m)
t(m)
m[1, ]
m[, 2]
rowSums(m)
colMeans(m)

########################
# 6. ARRAYS
########################
a <- array(1:12, dim = c(2, 3, 2))
dim(a)

########################
# 7. LISTES
########################
l <- list(
  nom = "Hadil",
  age = 21,
  notes = c(15, 16, 14)
)

l$nom
l[[2]]
length(l)

########################
# 8. DATA FRAMES
########################
df <- data.frame(
  nom = c("A", "B", "C"),
  age = c(20, 22, 19),
  note = c(15, 14, 16)
)

head(df)
tail(df)
str(df)
summary(df)
df$age
df[df$note > 14, ]
df[ , c("nom", "note")]

########################
# 9. CONDITIONS
########################
x <- 12

if (x > 10) {
  print("x > 10")
} else if (x == 10) {
  print("x = 10")
} else {
  print("x < 10")
}

########################
# 10. BOUCLES
########################
for (i in 1:5) {
  print(i)
}

i <- 1
while (i <= 5) {
  print(i)
  i <- i + 1
}

repeat {
  print("stop")
  break
}

########################
# 11. FONCTIONS
########################
add <- function(a, b = 0) {
  return(a + b)
}

add(3, 5)
add(10)

########################
# 12. APPLY FAMILY
########################
apply(m, 1, sum)
lapply(l, class)
sapply(l, length)
tapply(df$note, df$nom, mean)

########################
# 13. TRI & STATISTIQUES
########################
sort(v)
order(v)
rank(v)
sd(v)
var(v)
quantile(v)
cor(v, v)

########################
# 14. CHAÎNES DE CARACTÈRES
########################
txt <- "Bio Informatique R"
nchar(txt)
toupper(txt)
tolower(txt)
substr(txt, 1, 3)
grep("R", txt)
gsub(" ", "_", txt)

########################
# 15. DATES
########################
d <- Sys.Date()
Sys.time()
format(d, "%d/%m/%Y")
as.Date("2025-01-01")

########################
# 16. FICHIERS
########################
write.csv(df, "data.csv", row.names = FALSE)
read.csv("data.csv")

save(df, file = "data.RData")
load("data.RData")

########################
# 17. GRAPHIQUES (BASE R)
########################
x <- 1:10
y <- x^2

plot(x, y, type = "b", col = "blue",
     main = "Graphique R",
     xlab = "X", ylab = "Y")

hist(v)
boxplot(v)

########################
# 18. PACKAGES
########################
install.packages("ggplot2")   # une seule fois
library(ggplot2)

ggplot(df, aes(x = nom, y = note)) +
  geom_col(fill = "steelblue") +
  theme_minimal()

########################
# 19. ERREURS & DEBUG
########################
try(log("a"))
warning("Attention")
stop("Erreur fatale")

########################
# 20. PROGRAMMATION AVANCÉE
########################
set.seed(123)
rnorm(5)
sample(1:10, 3)
system.time(rnorm(1e6))

############################################################
#               FIN DU SCRIPT
############################################################
