\documentclass[a4paper,12pt]{scrartcl}
\usepackage[latin1]{inputenc}
\usepackage[spanish]{babel}
\usepackage[letterpaper, landscape, margin=0.2in]{geometry}
\usepackage{pdflscape}
\usepackage{graphicx}
\begin{document}
\title{Ejercicio modelo de frecuencia}
\author{Boris Polanco}
\publishers{Actuaria Consultores Cia.Ltda} 
\maketitle
\newpage
\section{Introducci?n}
En un modelo de regresi?n se puede dar el caso que se cuenta con variables binarias o en general categ?ricas. Otra posibilidad es que se tengan todas las variables cualitativas. Esto se da en los modelos de pricing de seguros, para lo que se utilizan los llamados Modelos Lineales Generalizados.\\
Tales modelos gracias al desarrollo de la computaci?n 
\subsection{Un ejemplo de veh?culos}
<<tidy=TRUE,size="small",echo=TRUE,include=TRUE,background="gray">>=
  datos<-read.csv("base_vehiculos.csv",header=TRUE,sep = ",")
names(datos)
@
  
  
  \begin{table}[ht]
\centering
\begin{tabular}{rrrrrrrrrrrrr}
\hline
& ANY & nro pol&dur& nro de sin &sexo& zona cond&Exp media& Exp max&Edad & cob adic& cob todo riesgo&potencia\\ 
\hline
1 &97 & 102518& 1 & 0 & 0 & 0 & 0 & 1 & 0 & 0 & 1 & 1 \\ 
2 &97 & 102712& 1 & 0 & 0 & 0 & 0 & 1 & 0 & 0 & 0 & 1 \\ 
3 &97 & 102791& 1 & 0 & 0 & 0 & 0 & 1 & 0 & 0 & 1 & 1 \\ 
4 &97 & 102876& 1 & 0 & 0 & 0 & 0 & 1 & 0 & 0 & 0 & 0 \\ 
5 &97 & 104753& 1 & 0 & 0 & 0 & 0 & 1 & 0 & 0 & 0 & 0 \\ 
6 &97 & 201263& 1 & 0 & 0 & 1 & 0 & 1 & 0 & 0 & 0 & 1 \\ 
\hline
\end{tabular}
\end{table}
Las variables que contiene la tabla son las siguientes:
  
  \begin{itemize}
\item any: a?o
\item nro Poliza
\item nro siniestros
\item sexo: 1 mujer 0 hombre
\item Zona de conducci?n: 1 urbana 0 resto
\item Experiencia media 1 entre 4-14 a?os, 0 resto
\item Experiencia max: 1 mas de 15, 0 resto
\item Edad: 1 30 o mas, 0 resto
\item Coberturas Adicionales: 1 Si, 0 No
\item Coberturas todo riesgo 1 si, 0 No
\item potencia 1 m?s 120 cv, 0 no
\end{itemize}

<<echo=TRUE,tidy=TRUE,eval=TRUE,TRUE>>=
  modelo<-glm(datos$nro_de_siniestros~datos$sexo+datos$zona_conduccion+datos$Experiencia_media+datos$Experiencia_max+
                datos$Edad,family=poisson(link="log"))
summary(modelo)
@
  
  \end{document}
