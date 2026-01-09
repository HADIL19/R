############################################################
#                   SCRIPT R – BASES                       #
# Ce script couvre les bases essentielles de R,            #
# avec des exemples et des commentaires explicatifs.      #
############################################################

# ===================== 1. Variables et types =====================

# Affectation d'une valeur à une variable
x <- 10          # entier
y <- 3.5         # nombre décimal (numeric)
nom <- "Hadil"   # chaîne de caractères (string)
vrai <- TRUE     # booléen (TRUE/FALSE)

# Affichage des valeurs
print(x)
print(y)
print(nom)
print(vrai)

# Vérifier le type d'une variable
class(x)    # integer / numeric / character / logical

# ===================== 2. Opérations =====================

# Opérations arithmétiques
a <- 5
b <- 2

a + b   # addition
a - b   # soustraction
a * b   # multiplication
a / b   # division
a^b     # puissance
a %% b  # modulo (reste)
a %/% b # division entière

# Comparaisons logiques
a > b    # TRUE
a < b    # FALSE
a == b   # égalité
a != b   # différence

# ===================== 3. Vecteurs =====================

# Création d'un vecteur
vec <- c(1, 2, 3, 4, 5)  # c() combine les valeurs
vec2 <- seq(10, 50, by=10) # séquence de 10 à 50 par pas de 10

# Affichage
vec
vec2

# Accès aux éléments
vec[1]    # premier élément
vec[2:4]  # éléments 2 à 4
vec[length(vec)]  # dernier élément

# Opérations sur vecteurs
vec * 2       # multiplication de chaque élément par 2
vec + vec2    # addition élément par élément

# ===================== 4. Listes =====================

# Une liste peut contenir différents types
ma_liste <- list(nombre=10, nom="Hadil", vecteur=c(1,2,3))
ma_liste
ma_liste$nom        # accès par nom
ma_liste[[3]]       # accès par position

# ===================== 5. Matrices =====================

# Création d'une matrice 3x3
mat <- matrix(1:9, nrow=3, ncol=3)
mat

# Accès aux éléments
mat[1,1]  # ligne 1, colonne 1
mat[ ,2]  # toutes les lignes, colonne 2
mat[3, ]  # ligne 3, toutes les colonnes

# ===================== 6. Data frames =====================

# Structure principale pour les données tabulaires
df <- data.frame(
  Nom = c("Alice", "Bob", "Charlie"),
  Age = c(25, 30, 22),
  Score = c(90, 85, 95)
)
df

# Accès aux colonnes
df$Nom
df[, "Age"]
df[2, "Score"]  # ligne 2, colonne Score

# ===================== 7. Boucles =====================

# Boucle for
for(i in 1:5){
  print(i^2)
}

# Boucle while
compteur <- 1
while(compteur <= 5){
  print(compteur * 2)
  compteur <- compteur + 1
}

# ===================== 8. Conditions =====================

x <- 7
if(x > 10){
  print("x est grand")
} else if(x > 5){
  print("x est moyen")
} else{
  print("x est petit")
}

# ===================== 9. Fonctions =====================

# Définir une fonction
ma_fonction <- function(a, b){
  somme <- a + b
  produit <- a * b
  return(list(somme=somme, produit=produit))
}

# Appel de la fonction
res <- ma_fonction(3, 4)
res$somme
res$produit

# ===================== 10. Lecture / écriture de fichiers =====================

# Création d'un fichier CSV
write.csv(df, "exemple.csv", row.names = FALSE)

# Lecture d'un fichier CSV
df2 <- read.csv("exemple.csv")
df2

# ===================== 11. Statistiques de base =====================

x <- c(1,2,3,4,5,6,7,8,9,10)

mean(x)    # moyenne
median(x)  # médiane
sd(x)      # écart-type
var(x)     # variance
summary(x) # résumé statistique

# ===================== 12. Graphiques =====================

# Graphique simple
plot(x, x^2, type="b", col="blue", main="x vs x^2", xlab="x", ylab="x^2")

# Histogramme
hist(x, col="lightgreen", main="Histogramme de x", xlab="Valeurs de x")

# Diagramme en barres
barplot(df$Score, names.arg=df$Nom, col="orange", main="Scores des étudiants", ylab="Score")

# ===================== FIN =====================
