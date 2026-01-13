############################################################
#            R : ORGANISATION & GESTION DES DONNÉES
#           
############################################################


############################################################
# 1. LE RÉPERTOIRE DE TRAVAIL
############################################################

# Afficher le répertoire de travail actuel
getwd()

# Exemple de résultat :
# "C:/Users/Hadil/Documents"

# Le symbole "~" représente le dossier utilisateur
# (Documents sous Windows, Home sous Linux/Mac)

# Modifier le répertoire de travail (optionnel)
# ⚠️ Peu recommandé avec RStudio (utiliser plutôt des projets)
#setwd("C:/MonDossier/MonProjet")


############################################################
# 2. LES PROJETS RSTUDIO (RECOMMANDÉ)
############################################################

# Avantages des projets RStudio :
# - Organisation claire des fichiers
# - Répertoire de travail défini automatiquement
# - Scripts et objets restaurés à l’ouverture
# - Une session R indépendante par projet

# Structure conseillée d’un projet :
# MonProjet/
# ├── data/        # données brutes
# ├── scripts/     # scripts R
# ├── output/      # résultats, exports
# └── report/      # rapports


############################################################
# 3. APPELER UN SCRIPT DEPUIS UN AUTRE SCRIPT
############################################################

# Exécuter un script R externe
# Le chemin est relatif au répertoire du projet
source("scripts/preparation.R")

# Exemple :
# preparation.R : import + nettoyage
# analyse.R     : statistiques + graphiques


############################################################
# 4. IMPORTATION DES DONNÉES (FICHIERS TEXTE)
############################################################

########################
# 4.1 read.table()
########################

# Lire un fichier texte structuré (tableau)
donnees <- read.table(
  file = "data/donnees.txt", # chemin du fichier
  header = TRUE,             # première ligne = noms des variables
  sep = ";",                 # séparateur (; , \t ...)
  dec = ".",                 # séparateur décimal
  stringsAsFactors = FALSE   # éviter les facteurs automatiques
)

# Visualiser les données
head(donnees)   # premières lignes
tail(donnees)   # dernières lignes
str(donnees)    # structure des données


########################
# 4.2 file.choose()
########################

# Ouvre une fenêtre pour choisir le fichier
donnees <- read.table(
  file = file.choose(),
  header = TRUE,
  sep = ";"
)


########################
# 4.3 attach() (à utiliser avec prudence)
########################

# Permet d’accéder directement aux colonnes
attach(donnees)

# Exemple :
mean(age)

# Toujours détacher après utilisation
detach(donnees)


############################################################
# 5. IMPORTATION AVEC scan()
############################################################

# scan() est utile si les données ne sont PAS en tableau
x <- scan(
  file = "data/valeurs.txt",
  skip = 5,        # ignorer les 5 premières lignes
  sep = " ",       # séparateur
  dec = ","        # séparateur décimal
)

# Afficher les valeurs
x


############################################################
# 6. IMPORTER DES DONNÉES DEPUIS EXCEL
############################################################

########################
# 6.1 Copier-coller
########################

# Copier les données dans Excel (CTRL + C)
# Puis dans R :
donnees_excel <- read.table(
  file = "clipboard",
  header = TRUE,
  sep = "\t"
)

########################
# 6.2 Package xlsx
########################

# Installer le package (une seule fois)
#install.packages("xlsx")

# Charger le package
library(xlsx)

# Lire un fichier Excel
donnees_excel <- read.xlsx(
  file = "data/fichier.xlsx",
  sheetIndex = 1
)


############################################################
# 7. EXPORTATION DES DONNÉES
############################################################

########################
# 7.1 Export vers fichier texte
########################

write.table(
  donnees,
  file = "output/resultats.txt",
  sep = ";",
  row.names = FALSE,
  col.names = TRUE
)

########################
# 7.2 Export vers Excel (via presse-papiers)
########################

write.table(
  donnees,
  file = "clipboard",
  sep = "\t",
  row.names = FALSE
)

# Ensuite : CTRL + V dans Excel


############################################################
# 8. VISUALISATION DES DONNÉES
############################################################

# Mini tableur modifiable
fix(donnees)

# Mini tableur non modifiable
View(donnees)


############################################################
# 9. LES BOUCLES EN R
############################################################

########################
# 9.1 Boucle for
########################

# Calculer une somme
somme <- 0
for (i in 1:10) {
  somme <- somme + (2 * i^2) / (i + 1)
}

somme


########################
# 9.2 Boucle while
########################

i <- 1
while (i <= 10) {
  print(i)
  i <- i + 1
}


########################
# 9.3 Boucle repeat
########################

i <- 1
repeat {
  print(i)
  i <- i + 1
  
  if (i > 5) {
    break  # sortie immédiate de la boucle
  }
}


########################
# 9.4 next et break
########################

for (i in 1:10) {
  if (i == 5) {
    next  # saute l’itération 5
  }
  
  if (i == 8) {
    break # arrête la boucle
  }
  
  print(i)
}


