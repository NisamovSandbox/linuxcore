# Teoría de OSINT (Open Source Intelligence)

OSINT (*Open Source Intelligence*), traducido habitualmente como **inteligencia de fuentes abiertas**, es la disciplina que permite recopilar, evaluar, relacionar y analizar información obtenida de fuentes de acceso público o legítimamente accesibles para responder a una pregunta concreta. No consiste únicamente en buscar datos en Internet: el objetivo es convertir información dispersa en conocimiento útil, contextualizado y verificable.

La información de partida puede proceder de páginas web, prensa, redes sociales, registros públicos, documentación técnica, bases de datos, imágenes, vídeos, publicaciones académicas, repositorios de código y otros medios. Su disponibilidad no garantiza que sea verdadera, actual, completa ni que pueda reutilizarse sin restricciones. Por eso, la evaluación de las fuentes y el análisis son tan importantes como la propia búsqueda.

## Información abierta e inteligencia

- **Información de fuentes abiertas:** datos, documentos, publicaciones, imágenes o registros que pueden consultarse mediante fuentes accesibles.
- **Recopilación:** proceso de localizar y guardar la información relevante para una pregunta definida.
- **Procesamiento:** tareas de organización, normalización, traducción, deduplicación y estructuración de los datos recopilados.
- **Análisis:** evaluación de la calidad de la información, su contexto, las relaciones entre elementos y las posibles explicaciones.
- **Inteligencia:** resultado del proceso anterior, presentado de forma que ayude a comprender una situación o tomar una decisión.

Una lista de enlaces o una colección de capturas no constituye necesariamente un análisis OSINT. Para que el resultado sea útil, debe responder a una necesidad concreta, explicar cómo se ha llegado a las conclusiones y reconocer las incertidumbres existentes.

El término *open source* se refiere en este contexto a las **fuentes abiertas**, no al software de código abierto. Asimismo, una fuente puede ser accesible públicamente y, aun así, estar sujeta a derechos de autor, condiciones de uso o normas de protección de datos. La definición institucional de OSINT incluye información pública difundida en medios impresos y electrónicos, prensa, Internet, vídeos, imágenes y bases de datos, entre otros formatos.

## Objetivos y aplicaciones de OSINT

OSINT se utiliza en numerosos ámbitos, tanto dentro como fuera de la ciberseguridad:

- **Ciberseguridad defensiva:** identificar activos publicados por una organización, detectar información expuesta accidentalmente y comprender su superficie de ataque.
- **Inteligencia de amenazas:** contextualizar campañas de phishing, dominios sospechosos, indicadores de compromiso y publicaciones relacionadas con amenazas.
- **Respuesta a incidentes:** reconstruir una cronología a partir de fuentes públicas, corroborar indicios y localizar información relacionada con un incidente.
- **Periodismo e investigación:** verificar declaraciones, contrastar publicaciones y reconstruir acontecimientos mediante evidencias accesibles.
- **Verificación de información:** comprobar fechas, ubicaciones, imágenes, afirmaciones y posibles manipulaciones.
- **Investigación empresarial:** estudiar información corporativa pública, proveedores, cambios organizativos o presencia digital, respetando la normativa aplicable.
- **Análisis geográfico:** contextualizar fotografías, vídeos, mapas, imágenes de satélite y otros datos espaciales disponibles legítimamente.
- **Protección de la privacidad:** revisar la propia huella digital para localizar información personal expuesta y reducir su divulgación innecesaria.

El objetivo debe formularse antes de empezar. Una pregunta concreta —por ejemplo, «¿qué subdominios publica nuestra organización?»— permite definir el alcance y reducir la recopilación de información irrelevante.

## El ciclo de inteligencia OSINT

Una investigación OSINT rigurosa suele organizarse en fases. El proceso es iterativo: los resultados pueden hacer necesario revisar la pregunta inicial o buscar nuevas fuentes.

- **Definición de requisitos:** establecer qué se quiere averiguar, para qué se utilizará el resultado y qué preguntas deben quedar respondidas.
- **Planificación:** delimitar el objetivo, el periodo temporal, las fuentes permitidas, las técnicas, los recursos y los riesgos.
- **Recopilación:** localizar información en las fuentes seleccionadas y registrar su procedencia.
- **Procesamiento y organización:** limpiar duplicados, normalizar formatos, convertir fechas y estructurar los datos para poder compararlos.
- **Evaluación de fuentes:** valorar la autoridad, la fiabilidad, la actualidad y la relación de cada elemento con la pregunta investigada.
- **Análisis y corroboración:** comparar fuentes independientes, estudiar relaciones, considerar explicaciones alternativas y separar hechos de hipótesis.
- **Elaboración del informe:** presentar los hallazgos, las evidencias, las limitaciones, el nivel de confianza y las recomendaciones pertinentes.
- **Revisión y retroalimentación:** comprobar si el informe responde a los requisitos y determinar qué información adicional sería necesaria.

No toda investigación necesita completar cada fase con el mismo grado de profundidad. La escala del trabajo, la sensibilidad de los datos y las consecuencias de una conclusión deben determinar el nivel de documentación y verificación.

## Tipos de fuentes de información

La calidad de una investigación depende en parte de la variedad y pertinencia de sus fuentes. Algunas categorías habituales son:

- **Motores de búsqueda:** ayudan a descubrir páginas indexadas y documentos públicos. Sus resultados dependen de la indexación, el idioma, la ubicación y los criterios de ordenación; la ausencia de resultados no demuestra que algo no exista.
- **Medios de comunicación y publicaciones:** noticias, comunicados, revistas, artículos científicos y publicaciones especializadas. Es importante distinguir entre información original, opinión y contenido que repite otras fuentes.
- **Redes sociales y comunidades públicas:** publicaciones, perfiles, fechas, imágenes, comentarios y relaciones visibles. El nombre de usuario o la fotografía de un perfil no prueban por sí solos la identidad de una persona.
- **Registros y datos públicos:** registros mercantiles, boletines oficiales, licitaciones, estadísticas, datos abiertos y otros documentos publicados por instituciones. La cobertura y el acceso varían según la jurisdicción.
- **Infraestructura de Internet:** DNS, registros RDAP/WHOIS, certificados TLS publicados, datos de registro de dominios, páginas web y servicios expuestos de forma pública. Los datos pueden estar ocultos, delegados a terceros, desactualizados o sujetos a cambios.
- **Repositorios y documentación técnica:** código público, paquetes, documentación, incidencias y metadatos de proyectos. Pueden revelar información técnica accidentalmente, por lo que las organizaciones deben revisar lo que publican.
- **Documentos y metadatos:** PDF, imágenes, documentos ofimáticos y otros ficheros que pueden incluir autoría, fechas, software utilizado o información de ubicación. Los metadatos pueden faltar, ser modificados o contener valores incorrectos.
- **Imágenes, vídeo y cartografía:** fotografías, vídeos, mapas, imágenes de satélite y panorámicas públicas. La geolocalización requiere comparar varios indicios y tener en cuenta la fecha y el contexto.
- **Archivos históricos:** copias archivadas de páginas web y documentos retirados. Una captura histórica acredita que cierto contenido fue archivado, pero no necesariamente que siga vigente o que estuviera completo.
- **Fuentes académicas y técnicas:** artículos, repositorios científicos, normas, informes técnicos y documentación de fabricantes, útiles para comprobar conceptos y datos especializados.

Las filtraciones de datos, las credenciales robadas y los conjuntos de información obtenidos de forma ilícita no deben tratarse automáticamente como fuentes abiertas por el mero hecho de que circulen en Internet. Su acceso, conservación y uso pueden implicar riesgos legales, de privacidad y de seguridad.

## Clasificación por ámbito

Denominaciones en OSINT:

- **SOCMINT (*Social Media Intelligence*):** análisis de información procedente de redes sociales y plataformas sociales. A veces se considera un ámbito especializado dentro de OSINT; la clasificación exacta depende de la organización y la metodología.
- **GEOINT (*Geospatial Intelligence*):** análisis de información geográfica y espacial, que puede incorporar mapas, imágenes de satélite y fotografías públicas. GEOINT es una disciplina relacionada, pero no es sinónimo de OSINT.
- **CYBINT (*Cyber Intelligence*):** expresión utilizada para la inteligencia relacionada con el ciberespacio y las amenazas digitales. Puede integrar OSINT con otras fuentes técnicas y de seguridad.
- **Inteligencia de amenazas (*Threat Intelligence*):** análisis de información sobre amenazas, capacidades, infraestructura, tácticas e indicadores. Puede emplear fuentes abiertas, telemetría interna y otras fuentes autorizadas.

Estas etiquetas no se utilizan de manera idéntica en todos los sectores. Lo importante es describir con claridad qué fuentes se emplearon y qué tipo de conclusión permiten obtener.

## Recopilación pasiva y activa

En ciberseguridad suele distinguirse entre técnicas pasivas y activas. La diferencia depende de si la investigación interactúa directamente con el objetivo, aunque no existe una frontera universal que clasifique todas las técnicas de la misma forma.

- **Recopilación pasiva:** utiliza información ya publicada o fuentes de terceros sin realizar pruebas directas contra la infraestructura investigada. Ejemplos habituales son consultar noticias, documentos públicos, archivos históricos o bases de datos de certificados.
- **Recopilación con interacción:** consulta servicios o sistemas y puede generar registros, por ejemplo, al acceder a una página, llamar a una API o efectuar consultas DNS. Aunque estas acciones sean de bajo impacto, pueden quedar registradas por el proveedor o por el sistema consultado.
- **Reconocimiento activo:** implica interactuar de forma más directa con la infraestructura, por ejemplo, mediante escaneo de puertos o pruebas técnicas. Estas actividades exceden la consulta pasiva de fuentes y deben realizarse únicamente dentro de un alcance autorizado.

Que una técnica se denomine «pasiva» no la convierte automáticamente en legal, inocua o libre de restricciones. Del mismo modo, una consulta pública puede dejar registros. La autorización, el propósito, el alcance y la normativa aplicable deben determinar cómo se realiza la investigación.

## Identificadores, entidades y relaciones

OSINT busca con frecuencia establecer si varios elementos guardan relación. Entre los elementos que pueden analizarse se encuentran:

- **Identificadores:** nombres de usuario, dominios, direcciones de correo corporativas, nombres de organizaciones, direcciones IP, identificadores de publicaciones y huellas de archivos.
- **Entidades:** personas, organizaciones, sistemas, sitios web, dominios, cuentas, documentos o acontecimientos.
- **Relaciones:** vínculos observables entre entidades, como un dominio que apunta a una dirección IP, una cuenta que publica un enlace o un documento que menciona una organización.
- **Cronología:** secuencia de eventos y publicaciones ordenados temporalmente, teniendo en cuenta zonas horarias y posibles errores en las fechas.
- **Grafo de relaciones:** representación de entidades como nodos y de sus vínculos como aristas. Facilita observar conexiones, pero una conexión no demuestra necesariamente control, propiedad o identidad común.

**La correlación no equivale a la atribución.** Dos cuentas que utilizan el mismo alias pueden pertenecer a personas distintas; una dirección IP puede alojar numerosos servicios; y un dominio puede cambiar de propietario o proveedor. Las relaciones deben sostenerse con evidencias adicionales antes de presentar una conclusión.

## Verificación y evaluación de evidencias

La información hallada en una fuente abierta debe evaluarse antes de utilizarse como base de una conclusión:

- **Procedencia:** identificar quién publicó el dato, dónde apareció y si la fuente es original o reproduce información ajena.
- **Fiabilidad de la fuente:** valorar su historial, competencia, transparencia, incentivos y posibilidad de error o manipulación.
- **Credibilidad del contenido:** comprobar si el dato es coherente con otras evidencias y si puede haber sido alterado, sacado de contexto o generado artificialmente.
- **Actualidad:** registrar cuándo se publicó, cuándo ocurrió el hecho y cuándo se consultó la información; estas fechas pueden ser diferentes.
- **Corroboración independiente:** contrastar con fuentes que no dependan todas de una misma publicación original. Que varios sitios repitan una afirmación no significa que existan varias confirmaciones independientes.
- **Contexto:** considerar idioma, zona horaria, localización, posibles cambios de nombre, homónimos y limitaciones técnicas de la fuente.
- **Confianza:** expresar qué tan sólida es la conclusión y qué información faltaría para confirmarla o refutarla.

Separar explícitamente tres niveles:

- **Hecho observado:** lo que la fuente muestra directamente, por ejemplo, que una página publicó cierto texto en una fecha determinada.
- **Inferencia:** interpretación razonable basada en uno o más hechos, pero que no se observa directamente.
- **Hipótesis:** explicación posible que aún requiere más evidencias.

## Sesgos y errores frecuentes

Los datos públicos pueden conducir a conclusiones equivocadas si se interpretan sin controles. Los errores habituales incluyen:

- **Sesgo de confirmación:** buscar solo información que respalde la hipótesis inicial y descartar las pruebas contrarias.
- **Falsos positivos:** considerar que un perfil, dominio o correo pertenece al objetivo por una coincidencia parcial.
- **Fuentes circulares:** tratar varias páginas que copian el mismo origen como confirmaciones independientes.
- **Información obsoleta:** utilizar una página archivada, un registro antiguo o un perfil abandonado como si describiera la situación actual.
- **Manipulación de contenido:** confundir imágenes editadas, capturas incompletas, cuentas suplantadas o material generado artificialmente con evidencias auténticas.
- **Errores de geolocalización:** atribuir una imagen a un lugar basándose en un único elemento, sin verificar señales, edificios, sombras, terreno o fecha.
- **Confusión entre coincidencia y causalidad:** asumir que dos hechos relacionados temporalmente tienen una relación causal.
- **Exceso de confianza:** presentar una hipótesis como certeza pese a que las fuentes son incompletas.
- **Sesgo de cobertura:** interpretar la ausencia de resultados como prueba de ausencia. Las herramientas solo encuentran información incluida en sus fuentes y dentro de sus límites.

La mejor defensa frente a estos errores es mantener la trazabilidad, buscar activamente evidencias contrarias, contrastar de forma independiente y comunicar las limitaciones.

## Seguridad operativa y protección de la información

La investigación OSINT también puede exponer al analista a páginas maliciosas, documentos manipulados o datos sensibles. Para reducir estos riesgos:

- **Separación de entornos:** utilizar un entorno de trabajo apropiado y actualizado, especialmente cuando se examinen archivos o sitios desconocidos.
- **Descargas controladas:** evitar ejecutar ficheros encontrados durante la investigación y analizar los archivos sospechosos con procedimientos defensivos adecuados.
- **Protección de credenciales:** no introducir credenciales personales o corporativas en sitios que no sean necesarios ni confiables para el trabajo.
- **Control de datos:** restringir el acceso a los informes, aplicar cifrado cuando corresponda y conservar solo la información necesaria.
- **Gestión de consultas:** respetar los límites de frecuencia y las condiciones de uso de las fuentes y APIs.
- **Minimización:** no recopilar información personal ajena al objetivo y no divulgar datos sensibles de manera innecesaria.
- **Documentación:** registrar los métodos utilizados para que otra persona autorizada pueda revisar la investigación.

## Estructura de un informe OSINT

Un informe útil debe permitir que otra persona entienda qué se investigó, cómo se hizo y en qué medida las conclusiones están respaldadas por evidencias. Puede incluir las siguientes secciones:

- **Resumen ejecutivo:** principales resultados y su relevancia.
- **Objetivo y alcance:** pregunta investigada, activos incluidos, límites y exclusiones.
- **Metodología:** fuentes consultadas, herramientas, fechas y técnicas utilizadas.
- **Hallazgos:** evidencias con referencias, cronología y contexto.
- **Análisis:** relaciones observadas, explicaciones consideradas y evidencias que respaldan o contradicen cada hipótesis.
- **Nivel de confianza:** indicación razonada de la solidez de cada conclusión.
- **Limitaciones:** fuentes inaccesibles, cobertura incompleta, posibles falsos positivos y datos que no pudieron verificarse.
- **Conclusiones y recomendaciones:** respuesta a la pregunta inicial y próximos pasos proporcionados.
- **Anexos:** consultas, referencias, hashes o evidencias adicionales necesarios para la revisión.

## Principios fundamentales de OSINT

- **Pregunta antes que herramienta:** elegir herramientas después de definir qué se necesita averiguar.
- **Fuentes antes que conclusiones:** conservar la procedencia de cada dato relevante.
- **Corroboración antes que atribución:** una coincidencia aislada no demuestra identidad, propiedad ni causalidad.
- **Transparencia sobre la incertidumbre:** distinguir hechos, inferencias e hipótesis.
- **Reproducibilidad:** registrar fecha, método y condiciones de consulta.
- **Proporcionalidad y privacidad:** recopilar y conservar solo lo necesario para una finalidad legítima.
- **Actualización continua:** recordar que las páginas, los perfiles, los dominios y las herramientas cambian con el tiempo.
