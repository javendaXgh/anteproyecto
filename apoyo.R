bookdown::create_gitbook('/Users/josemiguelavendanoinfante/R/TESIS/anteproyecto')


bookdown::render_book()
bookdown::serve_book()
bookdown::pdf_book()

bookdown::gitbook:
  css: style.css
config:
  toc:
  before: |
  <li><a href="./">A Minimal Book Example</a></li>
  after: |
  <li><a href="https://github.com/rstudio/bookdown" target="blank">Published with bookdown</a></li>
  edit: https://github.com/USERNAME/REPO/edit/BRANCH/%s
download: ["pdf", "epub"]
bookdown::pdf_book:
  includes:
  in_header: preamble.tex
latex_engine: xelatex
citation_package: natbib
keep_tex: yes
bookdown::epub_book: default


---
  editor_options: 
  markdown: 
  wrap: 72
---
  
  
  El mayor reto asociado al desarrollo de este trabajo es encontrar las
técnicas más idóneas, previa evaluación de las distintas disponibles,
para lograr hacer de la manera más eficiente y práctica los resultados
para cada búsqueda y así convertirse en una herramienta que sea de
utilidad para los investigadores y logre mostrar las distintas áreas de
conocimiento que forman parte de los saberes de la Universidad Central
de Venezuela. Para lograrlo es necesario usar las técnicas que en la
actualidad formar parte del "estado del arte" haciendo necesario la
revisión de distintas técnicas y para cada uno evaluar su desempeño, no
olvidando el reto que representa que los textos de entrada, es decir,
los textos de las investigaciones que son el principal, por no decir, el
exclusivo insumo de entrada, se encuentran en el idioma español y como
se demostrará más adelante, esto representa aplicar métodos de
procesamiento que están en función de la lengua nativa y muchas veces
los algoritmos y métodos más novedosos no están aún disponibles para
nuestra lengua nativa que es el español.


Algunas restricciones a mencionar son:
  
  -   Los trabajos de investigación que se considerarán como el conjunto
de datos que forman parte exclusiva del alcance de este trabajo son
aquellos que están como textos en formatos html, pdf, word quedando
por fuera cualquier otro como imágenes de gráficos.

-   Los textos con los cuales trabajaremos se encuentran almacenados en
un repositorio centralizado. Para una parte del procesamiento de los
textos será necesario trabajar con los archivos adjuntos a cada
trabajo (incluir cuadro de estructura del repositorio) mientras que
para otra parte sólo se usarán los abstracts, resumenes de cada
trabajo que se encuentran en formato html.

citation('base')

knitr::write_bib(c('reactable'), file = 'references.bib')
# ···
# Posteriormente es realizado el proceso para categorizar cada trabajo especial de grado a una determinada 
# carrera de pregrado o a un postgrado. Cuando el proceso de pattern matching no es exitoso se aplica una sub rutina 
# que incluye el algorimo Smith–Waterman para alineación de sub cadenas de texto. Luego se hace el registro del 
# documento en la base de datos.

# 
# '''
# Adicional a guardar los textos se complementa con otros atributos. Dentro del dominio del Information Retrieval
# los datos bibliográficos como el título, el autor, la fecha de publicación, "catalogación descriptiva" y las 
# "palabras claves" establecidas por los autores de cada trabajo, ayudando con ellas a la "catalogación temática" [@kraft2017] 
# 
# 
# 
# 
# 
# '''

p <- data.frame(
  
  stringsAsFactors = FALSE,
                ID = c(1L, 2L, 3L, 4L, 5L, 6L, 7L, 8L, NA),
             Tarea = c("web craling inicial",
                       "diseño algoritmo clasificación",
                       "diseño componentes de la aplicación","Implementación de componentes",
                       "Pruebas contenedores Docker","Pruebas de software",
                       "implementación en servidor","Elaboración de trabajo especial de grado",'TOTAL'),
          cantidad = c(2L, 3L, 4L, 4L, 1L, 1L, 1L, 8L, 24L),
            medida = c("semanas","semanas","semanas",
                       "semanas","semanas","semanas","semanas","semanas",
                       "semanas"),
       predecesora = c(0, 1L, 1L, 3L, 4L, 5L, 6L, 7L, NA)
)
View(p)
p <- data.frame(
  stringsAsFactors = FALSE,
                ID = c(1L, 2L, 3L, 4L, 5L, 6L, 7L, 8L),
                   Tarea = c("web craling inicial","diseño algoritmo clasificación",
                             "diseño componentes de la aplicación",
                             "Implementación de componentes","Pruebas contenedores Docker",
                             "Pruebas de software","implementación en servidor",
                             "Elaboración de trabajo especial de grado"),
          cantidad = c(2L, 3L, 4L, 4L, 1L, 1L, 1L, 8L),
                  medida = c("semanas",
                             "semanas","semanas","semanas","semanas","semanas",
                             "semanas","semanas"),
       predecesora = c(NA, 1L, 1L, 3L, 4L, 5L, 6L, 7L)
      )




# Otro de los modelos de Information Retrieval. Falta por enunciar
# 
# Las dos técnicas mencionadas anteriormente se pueden considerar dentro del área del aprendizaje automático (*machine learning*) aprendizaje no supervisado[^marco-teorico-1] en esta variante sí se usa una aproximación que aplica el aprendizaje supervisado
# [^marco-teorico-2] donde el entrenamiento del algoritmo servirá para predecir cuáles documentos resultan relevantes, sin embargo este modelo no será usado en el presente trabajo.
# 
# [^marco-teorico-1]: el tipo de aprendizaje donde no es necesario suministrar una etiqueta en el conjunto de datos a cada observación bien sea de tipo valor numérico o categórico. En este tipo de aprendizaje el algoritmo será el que logre...

[^marco-teorico-2]: a diferencia del aprendizaje no supervisado en este caso si se acompaña cada observación de una etiqueta Yi para cada observación Xi que sirve para el entrenamiento. Definición incompleta


Indexación:
  
  Cuando se dispone de grandes colecciones de documentos las cuales en algunos casos tienen que reposar distribuidas en clusteres de computadores, se hace necesario la creación de índices mediante el proceso de indexación. En el caso de los textos los métodos con los que se crean estos índices es distinto al de otro tipo de datos.

Principios de indexación en textos.

Tipos Indexaciones en texto:
  
  (PENDIENTE POR DESARROLLAR)

General Inverted GIN, Posting List

Pagamos un precio en almacenamiento. Colocar cuánto (PENDIENTE POR DESARROLLAR)

Otros tipos de indexación:
  
  (PENDIENTE POR DESARROLLAR) Breve mención a RUM y VODKA


Una de las características es el gran crecimiento en los parametros de los modelos que representan los textos, incluso creciendo a un ritmo mayor que los modelos de otras áreas como el área de computación visual.


## Modelo de Espacio Vectorial:

(PENDIENTE POR DESARROLLAR)

Otro de los modelos de Information Retrieval. Falta por enunciar


(PENDIENTE POR DESARROLLAR) "Las estructuras de datos construidas para la búsqueda en textos, llamadas *índices* son usadas para acelerar la búsqueda" no obstante esto causa un problema de espacio. Adicional al texto que se tiene que guardar también se hace necesario almacenar su índice y esto puede incrementar entre un 20% y 200% el espacio de almacenamiento. Data persistente