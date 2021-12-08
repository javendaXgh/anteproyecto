Con la propuesta del *SCSU* los resultados que se obtendrán serán más precisos. Para demostrar esto repitamos la búsqueda anterior pero esta vez en el Sistema alternativo.

```{r, busquedaproyectame, echo=FALSE, out.width='90%',fig.cap='Búsqueda de un autor "Jesus Fajardo" en SCSU',fig.align='center'}
knitr::include_graphics(rep("images/01-intro/jesus_proyectame.png"))
```

Los resultados extraídos sólo apuntan a un autor que es el que estábamos consultando anteriormente y repitiendo la búsqueda de las cuatro palabras "simultánea de múltiples metástasis", sin el uso de las comillas en la búsqueda, igualmente obtenemos un sólo resultado.

<br>
  
  ```{r, busquedaproyectame2, echo=FALSE, out.width='90%',fig.cap='Búsqueda de "simultánea de múltiples metástasis" en en SCSU',fig.align='center'}
knitr::include_graphics(rep("images/01-intro/texto_proyectame.png"))
```

<br>
  
  Claro está que no necesariamente se requiere que las búsquedas sean tan ajustadas pero en este caso como usamos cuatro palabras y la cantidad de documentos que se encuentran en en el Sistema alcanzan una cifra cercana a los 10.300 trabajos de grado, únicamente un resultado corresponde con el *query* realizado.
La descripción hecha anteriormente de la búsqueda de sendos textos representa la aproximación al segundo problema que debe solucionar nuestra propuesta que es mejorar los resultados que se obtengan


## Qué obtendremos

Al tener delimitado el problema de los *querys* podemos presentar el segundo desafío que se nos presenta para lograr optimizar las búsquedas de información y es la falta de una etiqueta que categorice las áreas de conocimiento, entendamos la profesión o el nombre del posgrado al que pertenece cada trabajo que se encuentra en el repositorio.

Del proceso de investigación realizado para este trabajo, el cual será descrito a detalle en el Apéndice A \@ref(apendicea), obtuvimos los datos contenidos en el cuadro \@ref(tab:pretable).

<br>
  
  `r sum(readRDS('/Users/josemiguelavendanoinfante/R/TESIS/proyecto_TEG/draw.rds')=='0'` table(draw\$total_clasi=='0')

```{r, echo=FALSE, include=FALSE}
library(janitor)
library(stringr)
library(dplyr)
library(kableExtra)
```

```{r pretable, echo=FALSE, warning=FALSE, out.width='60%'}


flextable::flextable(
  readRDS('/Users/josemiguelavendanoinfante/R/TESIS/proyecto_TEG/df_areas.rds')%>%
    mutate(jerarquia=case_when(jerarquia=='doctorado' ~ 'postgrado',
                               jerarquia=='maestria' ~ 'postgrado',
                               jerarquia=='especializacion' ~ 'postgrado',
                               
                               TRUE ~ 'pregrado'))%>%
    select(facultad, jerarquia)%>%
    rename(Facultad=facultad)%>%
    group_by(Facultad,jerarquia)%>%
    filter(jerarquia=='pregrado')%>%
    summarise(Cantidad=n(),.groups = 'drop')%>%
    select(Facultad,Cantidad)%>%
    mutate(Facultad=str_to_title(Facultad))%>%
    mutate(Facultad=str_replace_all(Facultad,' De ',' de '))%>%
    mutate(Facultad=str_replace_all(Facultad,' Y ',' y '))%>%
    mutate(Facultad=str_replace_all(Facultad,' Del ',' del '))%>%
    adorn_totals("row"))%>%
  flextable::set_caption('Total carreras de pregrado por Facultad')%>%
  flextable::autofit()%>%
  flextable::bold(12)


```

<br>
  
  En cada Facultad de la Universidad vemos en la cuadro \@ref(tab:pretable) la cantidad de carreras de pregrado que están adscritas que en total ascienden a 51 las carreras [^index-2].

[^index-2]: esta cifra puede variar si se toma en cuenta que existen escuelas de pregrado donde funcionan dos carreras distintas como es el caso de la Escuela de Administración y Contaduría o la Escuela de Estadística y Ciencias Actuariales, ya que ellas otorgan títulos distintos como el de Administrador o Contador y el el otro caso el título de Actuario o de Estadístico.

A nivel de postgrado se nos presentan las cifras contenidas en el cuadro \@ref(tab:posttable).

<br>
  
  ```{r posttable, echo=FALSE, warning=FALSE,out.width='60%'}
library(janitor)
library(stringr)
library(dplyr)
flextable::flextable(
  readRDS('/Users/josemiguelavendanoinfante/R/TESIS/proyecto_TEG/df_areas.rds')%>%
    mutate(jerarquia=case_when(jerarquia=='doctorado' ~ 'postgrado',
                               jerarquia=='maestria' ~ 'postgrado',
                               jerarquia=='especializacion' ~ 'postgrado',
                               
                               TRUE ~ 'postgrado'))%>%
    select(facultad, jerarquia)%>%
    rename(Facultad=facultad)%>%
    group_by(Facultad,jerarquia)%>%
    filter(jerarquia=='postgrado')%>%
    summarise(Cantidad=n(),.groups = 'drop')%>%
    select(Facultad,Cantidad)%>%
    mutate(Facultad=str_to_title(Facultad))%>%
    mutate(Facultad=str_replace_all(Facultad,' De ',' de '))%>%
    mutate(Facultad=str_replace_all(Facultad,' Y ',' y '))%>%
    mutate(Facultad=str_replace_all(Facultad,' Del ',' del '))%>%
    adorn_totals("row"))%>%
  flextable::set_caption('Total postgrados por Facultad o Centro')%>%
  flextable::autofit()%>%
  flextable::bold(14)


```

```{asis index-5a}
\newpage

```

```{asis index-6a}
\newpage

```

```{r include=FALSE}
# automatically create a bib database for R packages
knitr::write_bib(c(
  .packages(), 'bookdown', 'knitr', 'rmarkdown'
), 'packages.bib')
```

## Descripción del Problema

Son varios los problemas que representa generar el Sistema propuesto, pero a los fines de delimitar los que propiamente son referentes para mejorar y/o complementar el sistema Saber UCV exclusivamente mencionaremos tres.

--------------
  
  
  mediante lo que se exprese en un *query*.

El que nos delimitemos exclusivamente a los textos Resumen responde a que a los fines de aplicar las distintas técnicas acá propuestas y evaluar la utilidad de las mismas el **Resumen** constituye un recurso de gran utilidad por lo representativo que es haciendo innecesario extenderse sobre todo el documento ya que esto llevaría a usar más recursos de *hardware* y podemos adelantar que nuestra propuesta está diseñada para ser fácilmente escalable y aplicada sobre los textos completos contenidos en los archivos de los trabajos especiales de grado.

## Qué obtendremos

Al tener delimitado el problema de los *querys* podemos presentar el segundo desafío que se nos presenta para lograr optimizar las búsquedas de información y es la falta de una etiqueta que categorice las áreas de conocimiento, entendamos la profesión o el nombre del posgrado al que pertenece cada trabajo que se encuentra en el repositorio.

Del proceso de investigación realizado para este trabajo, el cual será descrito a detalle en el Apéndice A \@ref(apendicea), obtuvimos los datos contenidos en el cuadro \@ref(tab:pretable).

####
## Sistemas de Recuperación de Información:

Es conocida la gran disponibilidad de información en distintos formatos que tienen a su disposición los investigadores. Ejemplo de esto son libros en las bibliotecas, o la variedad de documentos que se encuentran accesibles en formatos digitales como artículos publicados en revistas arbitradas, libros, páginas de internet especializadas en algún tema o los repositorios digitales de documentos. Es en esta abundancia donde recaen varios de los problemas a los cuales se enfrenta la labor investiga, sobre todo cuando se realiza la fase exploratoria de selección de aquellos documentos que puedan resultar de mayor interés.

El investigador debe contar con herramientas al enfrentarse al proceso de búsqueda de información siendo una de estas los *Sistemas de Recuperación de Información*. Estos Sistemas deben permitir la interacción necesaria para que el investigador formule con el nivel de detalle deseado la búsqueda que se plantea mediante un texto y un contexto, lo cual denominaremos ***query***, y se detectará la aparición del mismo dentro de un grupo de documentos [@manning2008], al cual denominaremos ***Corpus*** [^index-1] . Conocemos que tal búsqueda se debe ejecutar con ciertos niveles de flexibilidad y no restringirse a la aparición exacta del ***query*** ya que se puede complementar con distintos criterios a filtrar como un período restringido de fechas o que esté asociado a una determinada área del conocimiento.

[^index-1]: Conjunto cerrado de textos o de datos destinado a la investigación científica.

Para ilustrar lo anterior usemos el siguiente ejemplo: supongamos que un ingeniero quiere buscar información sobre la "investigación de operaciones" dentro de un determinado ***Corpus*** de textos académicos. Al hacer el *query* el sistema que usemos va a determinar cuáles documentos dentro del *corpus*, de diversas temáticas, hacen mención a ese tema. Es probable que pudiésemos encontrar textos asociados a medicina donde la "investigación de operaciones" tiene una semántica asociada distinta a la rama del conocimiento que estudia problemas de optimización que se denomina "investigación de operaciones" ya que en diferentes áreas de estudio se pueden tener comprensiones que divergen sobre una misma búsqueda de términos.

Visto lo anterior es necesario que el sistema que usemos permita separar de alguna forma la información recuperada acorde a un contexto de interés del investigador,jerarquizando aquellos documentos que resultan de mayor interés. Incluso, las visualizaciones con las que representemos los resultados obtenidos de un *query* pueden aportar conocimiento en sí mismo haciendo intuitiva la comprensión [@zhang2008] o dando aportes hacia dónde es viable dirigir futuras indagaciones en un proceso que claramente es iterativo [@zhai2016] y adicionalmente el sistema puede generar la recomendación de otros trabajos [@aggarwal2018] que presenten alguna similitud sobre el tema investigado.

Estos sistemas permiten acceder y extraer información que originalmente no está estructurada pero que mediante distintas técnicas logran que los textos se puedan representar de forma estructurada facilitando la aplicación de distintos procesos que pertenecen a las ciencias de la computación.

## Saber UCV:

Dentro de estos Sistemas tenemos que en la Universidad Central de Venezuela se cuenta con uno denominado **Saber UCV** al cual se puede acceder en la dirección [www.saber.ucv.ve](http://saber.ucv.ve/) que funciona a modo de repositorio institucional de distintos documentos de textos académicos generados por la comunidad ucevista. Este sistema fue "creado para alojar, gestionar y difundir de manera gratuita y en texto completo: tesis, artículos de investigación, libros, revistas electrónicas, presentaciones que conforman la producción académica" de esta casa de estudios.

El repositorio Saber UCV es una implementación del software de código abierto llamado **DSpace** que fue creado con la finalidad de ser un repositorio institucional bibliográfico para uso académico de colecciones digitales, [https://duraspace.org](https://duraspace.org/dspace/about/). Este software fue diseñado e implementado en un esfuerzo conjunto entre desarrolladores del *Massachusetts Institute of Technology (MIT)* y *Hewlett-Packard Labs (HP Labs)* en el año 2002. En junio de 2021 se lanzó la 7 versión que es la más reciente, no obstante la versión que está implementada en Saber UCV es la 1.7.1. que data del año 2013.

### Delimitación de documentos con los cuales se trabajará:

Si bien en el sitio web están almacenados artículos de prensa, artículos preimpresos y publicados, fotografías, infografías y tesis de distintos niveles académicos es exclusivamente con este último subconjunto con el cual se conformará el conjunto de datos con el cual trabajaremos.

#### Corpus seleccionado: {#corpus}

En la categoría **Tesis** del repositorio se encuentran los trabajos especiales de grado de pre y postgrado junto con las tesis de doctorado. Cada documento de la categoría Tesis, indistintamente del nivel académico al que pertenezca, contiene un texto resumen que es de la misma autoría que el propio documento, es decir que cada trabajo cuenta tanto como con el documento, que generalmente es un archivo anexo en formato *word* o *PDF*, y también se dispone de un texto **Resumen** que está contenido dentro de la propia ficha en *html*.

Es en esta ficha donde se muestran ciertos detalles sobre el trabajo seleccionado como lo son el título, nombre del autor, las palabras claves, la fecha de publicación y el texto **Resumen**. En la figura \@ref(fig:ficharegistro) podemos ver la ficha que corresponde a un trabajo almacenado en el repositorio. <br>
  
  ```{r, ficharegistro, echo=FALSE, out.width='60%',fig.cap='Modelo de ficha registro en Saber UCV', fig.align='center'}
knitr::include_graphics(rep("images/01-intro/ficha_registro.png"))
```

<br>
  
  Con los textos **Resumen**,con la **fecha**, el **nombre del autor**, las **palabras claves** de todos los trabajos catalogados como Tesis en el repositorio Saber UCV es con los que conformaremos nuestro ***Corpus***.

Para el momento en que se presenta esta Investigación bajo la categoría **Tesis** reposan `r dim(readRDS('/Users/josemiguelavendanoinfante/R/TESIS/proyecto_TEG/draw.rds'))[1]` documentos distribuidos con las jerarquías que se muestran en el cuadro \@ref(tab:jerarquias).

```{r jerarquias, echo=FALSE, warning=FALSE, out.width='60%'}
datos <- readRDS('/Users/josemiguelavendanoinfante/R/TESIS/proyecto_TEG/draw.rds')
datos <- table(datos$jerarquia)%>%
  as.data.frame()

names(datos) <- c('jerarquía','cantidad')

flextable::flextable(datos%>%
                       adorn_totals("row"))%>%
  flextable::set_caption('Total documentos por jerarquía')%>%
  flextable::autofit()%>%
  flextable::bold(5)
```

La disponibilidad por fecha de trabajos en el repositorio la presentamos en la tabla 

```{r, fechas, echo=FALSE, warning=FALSE,out.width='80%'}

# Basic histogram plot with mean line and marginal rug
gghistogram(readRDS('/Users/josemiguelavendanoinfante/R/TESIS/proyecto_TEG/draw.rds'), x = "fecha", bins = 25, 
            fill = "#0073C2FF", color = "#0073C2FF",
            add = "mean", rug = TRUE)

```

Analizando la distribución de frecuencia por año vista en es necesario destacar que en el repositorio no se encuentran todos los trabajos realizados en la historia de la Universidad Central de Venezuela, sino algunos pocos que han sido incorporados generados entre 1993 y 2011 que es la fecha en que empezó a recopilar los trabajos de forma períodica el Repositorio, pero también se hace importante destacar que desde esa fecha tampoco se encuentran insertados todos los trabajos generados por asuntos que queda fuera de los objetivos de este trabajo investigar.

Es importante señalar que la cantidad de trabajos mencionados no constitu

#### Archivos complementarios:

Por razones que se expondrán en \@ref(clasificacion) igualmente será necesario trabajar con los documentos anexos que indicamos en \@ref(corpus) que disponen un vínculo de descarga en cada ficha *html* de los documentos catalogados como tesis. La descarga y procesamiento de estos textos será necesario para complementar el corpus descrito en \@ref(corpus).

## Planteamiento del Problema: {#problema}

Si bien este repositorio con que cuenta la Universidad sirve para realizar procesos de búsqueda de textos (*search engine*) y/o de recuperación de información, hay algunas características que pueden ser complementadas y mejoradas.

### I. No se posee clasificación de los documentos: {#clasificacion}

El ***Corpus*** que reposa en Saber UCV para ninguno de los documentos posee la etiqueta que clasifique a cual postgrado o carrera de pregrado pertenece. En caso de realizar una búsqueda y querer delimitarla a documentos que se circunscriban a una determinada área de conocimiento actualmente es imposible y por ende resulta inviable evaluar la escuela, o el postgrado, y la Facultad donde se hizo la investigación.

Tampoco se dispone el listado con las etiquetas a asignar a cada uno de los documentos. Según lo que se investigó en el presente Trabajo no es de conocimiento público un único directorio que se encuentre publicado en algún medio oficial de la U.C.V. que contenga los nombres de las carreras de pregrado y de los distintos postgrados, significando esto que es un doble proceso de construcción el que se necesita hacer para realizar la clasificación de los documentos.

Relativo a este problema también surge el determinar cómo se realizará la comparación de cada una de las etiquetas con el texto de cada documento e incluso detectar dónde se localiza el texto con el cual se efectuará la comparación, ya que el texto denominado **Resumen** que vimos en \@ref(fig:ficharegistro) no contiene la información necesaria para extraer dónde fue realizada cada una de las investigaciones haciendo necesario que sean analizados los documentos anexos a cada ficha que es propiamente el archivo, o los archivos, que componen cada una de la tesis.

### II. Problemas en los resultados que generan los ***Querys***:

Existe un tipo de *query* denominado *"Full Text Search"* o búsqueda de texto completo \@ref(fts) que es donde se hace presente una de las principales deficiencias que posee el Sistema Saber UCV ya que aunque en él se pueden ejecutar búsquedas de texto, los métodos con los que se implementan estas búsquedas llevan a que sean generados una gran cantidad de resultados, en especial al usar más de una palabra en la búsqueda, presumimos que por usar el operador lógico *OR* entre cada una de las palabras solicitadas en el *query*.

#### Ejemplo ***Query*** en Saber UCV:

Evaluemos el problema descrito con un ejemplo. Supongamos que queremos ver en el sistema Saber UCV los trabajos que un autor de nombre "Jesús Fajardo" ha realizado.

<br>
  
  ```{r, busquedasaber, echo=FALSE, out.width='60%',fig.cap='Búsqueda de un autor "Jesus Fajardo" en www.saber.ucv.ve',fig.align='center'}
knitr::include_graphics(rep("images/01-intro/jesus_saber.png"))
```

<br> Al revisar los resultados que se muestran en la figura \@ref(fig:busquedasaber) podemos apreciar que la primera posición de los 30 resultados que fueron encontrados, no muestra un autor que se llame "Jesús Fajardo" sino el apellido Fajardo. Incluso, al realizar la consulta del vínculo del primer resultado tampoco aparece la palabra "Jesús" dentro de todos los datos que muestra la ficha. Al revisar el segundo resultado vemos que sí coincide con el término que se estaba buscando pero de resto ninguno otro de los 28 resultados incluyen un "Jesús Fajardo".

Revisemos otro ejemplo de búsqueda esta vez con cuatro palabras que son "simultánea de múltiples metástasis" las cuales se encuentran en el título del trabajo visto anteriormente en la posición núnero dos que corresponde a Jesús Fajardo.

<br>
  
  ```{r, busquedasaber2, echo=FALSE, out.width='60%',fig.cap='Búsqueda de "simultánea de múltiples metástasis" en www.saber.ucv.ve',fig.align='center'}
knitr::include_graphics(rep("images/01-intro/texto_saber.png"))
```

<br> La cantidad de resultados asciende a 10.449, cifra similar a la cantidad total de trabajos de la categoría "Tesis" que se encuentran en el repositorio, ya que como fue explicado anteriormente el Sistema Saber UCV debe aplicar el operador lógico *OR* entre cada una de las palabras al momento de generar el *query*. A manera de referencia podemos contar que si hubiésemos querido realizar la búsqueda exacta de la frase, con haberle colocado comillas al inicio y al final obtendríamos la referencia al trabajo que previamente sabemos que es el que queremos encontrar.

El uso de comillas para buscar una frase exacta genera una compensación entre la precisión en la búsqueda, ya que es exacta, cerrando el umbral de encontrar otros resultados que igualmente pudiesen resultar de interés, así que el uso de este método puede presentar considerables desventajas.

## Propuesta:

Se presenta una propuesta que se basa en el desarrollo e implementación del **Sistema Complementario Saber UCV (SCSU)** el cual se soporta sobre una arquitectura distribuida. El desarrollo de este prototipo permitirá brindar una solución a los problemas planteados en \@ref(problema) pudiendo convertirse en una aplicación de utilidad para la comunidad universitaria y en general para los investigadores que usan como fuente de información los documentos que reposan en Saber UCV.

El SCSU será un sistema de recuperación de información que usará como Corpus los textos resumen de cada tesis que reposa en Saber UCV. Sobre el Corpus, serán aplicadas técnicas de Minería de Texto y de Procesamiento de Lenguaje Natural para detectar relaciones y extraer conocimiento [@miningt2012c]. 

El SCSU contará con una base de datos estructurada indexada donde adicional al Corpus se incluirán datos como el autor, la fecha de publicación y la categoría del trabajo (escuela o postgrado donde fue generado).

Igualmente será necesario crear una rutina que permita clasificar cada uno de los documentos que conforman el Corpus. En este procedimiento será necesario realizar distintos procedimientos para obtener las etiquetas con que serán realizadas las clasificaciones, la lectura de los archivos y el uso de distintas técnicas y algoritmos que permitan generar la correcta clasificación.

Nuestra propuesta permitirá que ante la formulación de un ***query*** por parte de un usuario sea extraído del Sistema los textos que contienen tales frases bajo un contexto donde se puedan definir un período de fechas, la facultad y/o escuela donde se generó la investigación. Los resultados se mostrarán con distintos gráficos, tablas interactivas, coocurrencias de palabras (*co-occurrences words*) [@wijffels2021] y recomendaciones de documentos basados en las similitudes que presente uno con otros contenidos en el corpus. 

También el SCSU debe permitir obtener indicadores cuantitativos sobre las cantidades de trabajos que reposan en Saber UCV pudiendo establecer distintas dimensiones y granularidades al momento de generar las consultas tales como facultades, escuelas, por pre o pos grados y fecha de publicación.

Contar con el Sistema Complementario Sabe UCV brindará una mirada de acceso que puede ir de lo general o lo específico y dar nociones sobre las distintas investigaciones que se realizan en la Universidad Central de Venezuela.



## Objetivo:

Generar un sistema de extracción de información que funcione bajo una arquitectura distribuida que permita clasificar los trabajos que reposan en Saber UCV y a los usuarios finales generar consultas de "búsqueda de texto completo" sobre los textos que constituyen el Corpus.

## Antecedentes:



## Estructura propuesta:

Este trabajo está estructurado en un Capítulo que expone el Marco Teórico sobre el cual reposa la estructura conceptual de la aplicación. En el Capítulo  se describirá la propuesta técnica, el objetivo general y específicos junto con el proceso de desarrollo de la aplicación haciendo mención a cada uno de los componentes que forman parte de ella e incluso las evaluaciones y pruebas que se realizaron para elegir una determinada tecnología por sobre otras. En el Capítulo  se mostrarán los resultados, las conclusiones y recomendaciones posterior a la realización de la aplicación. Igualmente se incluye un apéndice donde se describirá el proceso que se tuvo que cubrir para generar el conjunto de datos sobre el que se generó el **SCSU**.

En esta propuesta mostraremos las principales consideraciones que se tomaron en el diseño de SCSU, los retos enfrentados, el desempeño que presenta la aplicación y los resultados obtenidos en el proceso de clasificación de documentos.



# Basic histogram plot with mean line and marginal rug
p <- gghistogram(readRDS('/Users/josemiguelavendanoinfante/R/TESIS/proyecto_TEG/draw.rds'), x = "fecha", bins = 25, 
                 fill = "#0073C2FF", color = "#0073C2FF", rug = TRUE)
ggpar(p,subtitle='Cantidad de documentos disponibles por ano de elaboracion',ylab='cantidad')

Basic histogram plot with mean line and marginal rug


p <- gghistogram(readRDS('/Users/josemiguelavendanoinfante/R/TESIS/proyecto_TEG/draw.rds'), x = "fecha", bins = 25, 
                 fill = "#0073C2FF", color = "#0073C2FF", rug = TRUE)
ggpar(p,subtitle='Cantidad de documentos disponibles por año de elaboración',ylab='cantidad')
library(dplyr)

dim(readRDS('/Users/josemiguelavendanoinfante/R/TESIS/proyecto_TEG/draw.rds')%>% filter(fecha<='2011-01-01'))[1]



#####