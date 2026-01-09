############################################################
#                 SCRIPT R – BASES AVANCÉES               #
# Ce script couvre les bases + manipulation de données    #
# avec dplyr et ggplot2, et est entièrement commenté.    #
############################################################

# ===================== 0. Installer / charger packages =====================
# Si les packages ne sont pas installés, les installer
if(!require(dplyr)) install.packages("dplyr")
if(!require(ggplot2)) install.packages("ggplot2")

# Charger les packages
library(dplyr)
library(ggplot2)

# ===================== 1. Variables et types =====================
x <- 10          # entier
y <- 3.5         # numérique
nom <- "Hadil"   # chaîne de caractères
vrai <- TRUE     # booléen

# Afficher et vérifier types
print(x)
class(x)

# ===================== 2. Opérations =====================
a <- 5
b <- 2
a + b   # addition
a^b     # puissance
a %% b  # modulo

# Comparaisons logiques
a > b
a == b

# ===================== 3. Vecteurs et fonctions vectorielles =====================
vec <- c(1,2,3,4,5)
vec2 <- seq(10, 50, by=10)

vec * 2       # multiplier chaque élément
vec + vec2    # addition élément par élément

# Fonctions utiles
sum(vec)
mean(vec)
max(vec)
min(vec)

# ===================== 4. Listes =====================
ma_liste <- list(nombre=10, nom="Hadil", vecteur=c(1,2,3))
ma_liste$nom
ma_liste[[3]]

# ===================== 5. Matrices =====================
mat <- matrix(1:9, nrow=3, ncol=3)
mat[1,1]
mat[,2]  # toutes les lignes, colonne 2

# ===================== 6. Data frames =====================
df <- data.frame(
  Nom = c("Alice", "Bob", "Charlie", "David", "Eva"),
  Age = c(25, 30, 22, 28, 35),
  Score = c(90, 85, 95, 70, 88)
)
df

# Accès aux colonnes
df$Nom
df[2, "Score"]

# ===================== 7. Manipulation avancée avec dplyr =====================
# Filtrer les lignes
df_filtre <- df %>% filter(Age > 25)
df_filtre

# Sélectionner certaines colonnes
df_select <- df %>% select(Nom, Score)
df_select

# Ajouter une nouvelle colonne
df <- df %>% mutate(Pass = ifelse(Score >= 80, TRUE, FALSE))
df

# Résumer les données
df %>% summarise(moyenne = mean(Score), max_score = max(Score))

# Grouper et résumer
df %>% group_by(Pass) %>% summarise(n = n(), moyenne_score = mean(Score))

# Trier les données
df %>% arrange(desc(Score))

# ===================== 8. Boucles et conditions =====================
# Boucle for
for(i in 1:5){
  print(i^2)
}

# Boucle while
compteur <- 1
while(compteur <= 5){
  print(compteur*2)
  compteur <- compteur + 1
}

# Condition if-else
x <- 7
if(x > 10){
  print("grand")
} else if(x > 5){
  print("moyen")
} else{
  print("petit")
}

# ===================== 9. Fonctions =====================
ma_fonction <- function(a, b){
  somme <- a + b
  produit <- a * b
  return(list(somme=somme, produit=produit))
}
res <- ma_fonction(3,4)
res$somme
res$produit

# ===================== 10. Lecture / écriture de fichiers =====================
write.csv(df, "exemple_avance.csv", row.names = FALSE)
df2 <- read.csv("exemple_avance.csv")
df2

# ===================== 11. Statistiques =====================
x <- c(1,2,3,4,5,6,7,8,9,10)
mean(x)
median(x)
sd(x)
var(x)
summary(x)

# ===================== 12. Graphiques avec ggplot2 =====================
# Graphique scatter plot
ggplot(df, aes(x=Age, y=Score, color=Pass)) +
  geom_point(size=3) +
  geom_smooth(method="lm", se=FALSE, color="black") +
  labs(title="Age vs Score", x="Age", y="Score") +
  theme_minimal()

# Histogramme
ggplot(df, aes(x=Score)) +
  geom_histogram(binwidth=5, fill="lightblue", color="black") +
  labs(title="Histogramme des Scores", x="Score", y="Nombre") +
  theme_minimal()

# Barplot
ggplot(df, aes(x=Nom, y=Score, fill=Pass)) +
  geom_bar(stat="identity") +
  labs(title="Scores par étudiant", y="Score", x="Nom") +
  theme_minimal()

# ===================== FIN =====================
