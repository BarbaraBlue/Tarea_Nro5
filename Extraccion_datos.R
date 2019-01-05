install.packages("rvest")
library("rvest")

#inicializando la var de archivo con el nombre de mi pagina
archivo <- 'Tarea_Nro5.html'

#Leyendo el HTML del archivo
webpage <- read_html(archivo)

html_nodes(webpage,'p')

#Extrayendo contenido en la clase justificado
contenidoWebNoticia <- html_nodes(webpage,'p')

#Pasando la info a texto
textoNoticia <- html_text(contenidoWebNoticia)

#Viendo a priori la info en la variable textoNoticia
print(textoNoticia)

#Pregunta ¿Qué representa el \n?

#Eliminando los \n, comillas ("), puntos (.) y comas (,) del texto
textoNoticia <- gsub("\n","",textoNoticia)
textoNoticia <- gsub("\"","",textoNoticia)
textoNoticia <- gsub("[.]","",textoNoticia)
textoNoticia <- gsub(",","",textoNoticia)
textoNoticia <- gsub("&acute;","á",textoNoticia)
textoNoticia <- gsub("\r","",textoNoticia)
textoNoticia <- gsub("\t","",textoNoticia)

#Viendo a priori la info en la variable textoNoticia
print(textoNoticia)

#Separando las palabras por espacio
splitEspacioNoticia <- strsplit(textoNoticia," ")[[1]]

#Pasando todas las palabras a minúsculas
splitEspacioNoticia <- tolower(splitEspacioNoticia)
splitEspacioNoticia

#Contando palabras
unlistNoticias<- unlist(splitEspacioNoticia)
tablaPalabras <- table (unlistNoticias)
print(unlistNoticias)

#Pasando la info a un data frame
dfPalabrasNoticia <- as.data.frame(tablaPalabras)
dfPalabrasNoticia

#alamacenando la informacion en CSV
write.csv(dfPalabrasNoticia, file="PalabrasNoticia.csv")

#o en un txt
write.table(dfPalabrasNoticia, file="PalabrasNoticia.txt")

##############EXTRACCIÓN INFORMACIÓN TABLA##############
tablaProductos <- html_nodes(webpage,"table")

#Extrayendo los elementos de la tabla
tablaProductosExtraida <- html_table(tablaProductos[[1]])

#Viendo el contenido de la posición 1,2 de la tabla
print(tablaProductosExtraida[1,2])