# Exploración y análisis de datos con R

## Módulo de referencia
[Exploración y análisis de datos con R](https://docs.microsoft.com/es-es/learn/modules/explore-analyze-data-with-r/?WT.mc_id=academic-59300-cacaste)

## Objetivos

¡Hola! Te damos la bienvenida a esta aventura de aprendizaje. En esta carpeta, encontrarás un notebook de exploración de datos. ¡Es un notebook de evaluación guiada de calificación automática que te ayudará a probar tus conocimientos en R para explorar y analizar datos! Esperamos que puedas notar que R, es en esencia, un lenguaje hermoso y elegante para la Ciencia de Datos.


| **Objetivo**                      | Descripción                                    |
| ----------------------------- | -----------------------------------------------|
| **¿Qué aprenderás?**       | Aprenderás a cómo utilizar R para exploración y análisis de datos          |
| **Lo qué necesitarás**          | [Visual Studio Code](https://code.visualstudio.com?WT.mc_id=academic-59300-cacaste), [Docker Desktop](https://www.docker.com/products/docker-desktop), [Remote Developer Extension](https://aka.ms/vscode-remote/download/extension) y [Git](https://git-scm.com/downloads) |
| **Duración**                  | 2 horas                                      |
| **Diapositivas**                    | [Powerpoint](./slides.pptx)                                |

## Video

¡Vídeo próximamente!

<!--- 
🎥 Haga clic en esta imagen para ver a Carlotta guiarlo a través del material del taller y para obtener algunos consejos sobre cómo impartir este mismo.

---> 
## Pre-aprendizaje

Este taller nos permite aplicar las habilidades aprendidas en el módulo [Exploración y análisis de datos con R](https://docs.microsoft.com/es-es/learn/modules/explore-analyze-data-with-r/?WT.mc_id=academic-59300-cacaste) para realizar análisis y visualización de datos. Por lo tanto, se les invita a que finalicen el módulo de Microsoft Learn antes de comenzar este taller para familiarizarse con algunos de los conceptos que veremos más adelante.

## Requisitos previos

Para preparar, ejecutar y escribir código R en poco tiempo, hemos incluido en este taller un contenedor, de manera que tengas un entorno de programación de R listo para utilizar.

### Configuración del contenedor de desarrollo

Un **contenedor de desarrollo** es un contenedor de [Docker](https://www.docker.com) en ejecución que incluye herramientas y tiempos de ejecución bien definidos así como los requisitos previos. Puedes probar contenedores de desarrollo con **[GitHub Codespaces](https://github.com/features/codespaces)**, **[Binder](https://mybinder.org/)** o **[Visual Studio Code Remote - Containers](https://aka.ms/vscode-remote/containers)**.

#### GitHub Codespaces
Sigue estos pasos para abrir este taller en un Codespace:
1. Haz clic en el menú desplegable Código y selecciona la opción **Open with Codespaces** .
2. Selecciona **+ New codespace** en la parte inferior del panel.

Para más información, consulta la [documentación de GitHub](https://docs.github.com/en/free-pro-team@latest/github/developing-online-with-codespaces/creating-a-codespace#creating-a-codespace).

#### Binder
Este taller también está disponible en Binder. Para abrir el notebook en un entorno de Binder, haz clic en el botón que se encuentra a continuación.

[![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/carlotta94c/workshop-library/workshop-binding?labpath=%2Ffull%2Fexplore-analyze-data-with-R%2Fsolution%2Fchallenge-Data_Exploration.ipynb)

#### Espacio aislado de Aprendizaje
También puedes completar este desafío aprovechando el espacio asilado de Learn, que se encuentra en la [unidad 9](https://docs.microsoft.com/es-es/learn/modules/explore-analyze-data-with-r/9-challenge-data-exploration) del módulo de Microsoft Learn -  Exploración y análisis de datos con R. Solo necesitas iniciar sesión con tu cuenta de Microsoft o GitHub y hacer clic en **Activar el espacio aislado** para iniciar.

#### Contenedores de VS Code Remotos
Sigue estos pasos para abrir este taller en un contenedor usando la extensión VS Code _Remote - Containers_:

1. Si es la primera vez que utilizas un contenedor de desarrollo, asegúrate de que tu sistema cumpla con los requisitos previos (por ejemplo, tener instalado Docker) en la [guía de inicio](https://aka.ms/vscode-remote/containers/getting-started).

2. Presiona <kbd>F1</kbd> y selecciona el comando **Add Development Container Configuration Files...** para **Remote-Containers** o **Codespaces**.

   > **Nota:** Si es necesario, puedes arrastrar y soltar la carpeta `.devcontainer` desde esta subcarpeta en una copia clonada localmente de este repositorio en el explorador de archivos de VS Code en lugar de usar el comando.

3. Selecciona esta definición. También debes seleccionar **Show All Definitions...** para que aparezca.

4. Finalmente, presiona <kbd>F1</kbd> y ejecute **Remote-Containers: Reopen Folder in Container** para empezar a usar la definición.

Esta definición incluye un código de prueba que te ayudará a verificar que funciona correctamente en tu sistema. Abre la carpeta `all-systems-check` donde puede elegir ejecutar los scripts `.R`, `.Rmd` o `.ipynb`. Deberías ver "¡Hola, mundo remoto!" en una ventana de terminal R (para `.R` y `.Rmd`) o dentro de un Jupyter Notebook (para `.ipynb`) después de que se ejecute el script respectivo.

En algún momento, es posible que desees realizar cambios en tu contenedor, como por ejemplo, instalar un nuevo paquete. Deberás reconstruir tu contenedor para que los cambios surtan efecto.

## Lo que vas a aprender

Supongamos que el Departamento de Transporte está considerando construir un nuevo aeropuerto. Como el increíble científico de datos que eres, se te ha pedido que explores los datos existentes. Los resultados de su análisis pueden formar la base de un informe o un modo de aprendizaje automático.

En este desafío, explorarás un conjunto de datos del mundo real que contiene datos de vuelos del Departamento de Transporte de EE. UU.

## Paso 1: Limpieza de datos

Rara vez encontramos datos en la forma correcta para el análisis. Como tal, una vez que hayas importado tus datos, un buen lugar para comenzar su análisis es respondiendo a la pregunta: "_¿Son los datos precisos y apropiados para el análisis deseado?_". La limpieza de datos para resolver errores, valores faltantes y otros problemas vale la pena a largo plazo y permite un análisis exploratorio de datos más fácil y preciso.

En esta sección:

- Identificarás cualquier dato nulo o faltante e agregará valores de reemplazo apropiados.

- Identificarás y eliminará cualquier valor atípico en las columnas DepDelay y ArrDelay.

## Paso 2: Análisis exploratorio de datos (EDA)

El análisis exploratorio de datos, conocido popularmente como EDA, es utilizado por los científicos de datos  para analizar e investigar conjuntos de datos y resumir sus características principales, por ejemplo, la distribución, a menudo visualizando y transformando datos.


En esta sección:

- Observarás las estadísticas de resumen para los campos numéricos en el conjunto de datos.

- Determinarás la distribución de las columnas DepDelay y ArrDelay.


### Más EDA

El objetivo de EDA es desarrollar una mejor comprensión de sus datos. La mayoría de las veces, EDA implicará formular algunas preguntas de sondeo sobre sus datos, buscar respuestas mediante la visualización y transformación de datos y, finalmente, utilizar la comprensión adquirida para refinar las preguntas, descartarlas por completo y/o generar nuevas preguntas.

En esta sección:

- Utilizarás estadísticas, funciones agregadas y visualizaciones para responder las siguientes preguntas:

    - ¿Cuáles son los retrasos promedio (media) de salida y llegada?

    - ¿Cómo se comparan los transportistas en términos de rendimiento de retrasos en la llegada?

    - ¿Hay una diferencia notable en los retrasos de llegada para los diferentes días de la semana?

     - ¿Qué aeropuerto de salida tiene el retraso medio de salida más alto?

     - ¿Las salidas tardías tienden a resultar en retrasos de llegada más prolongados que las salidas a tiempo?

     - ¿Qué ruta (del aeropuerto de origen al aeropuerto de destino) tiene más llegadas tardías?

     - ¿Qué ruta tiene el promedio de retraso de llegada más alto?

## Prueba

Evalúa tus conocimientos con [una breve prueba](https://docs.microsoft.com/es-es/learn/modules/explore-analyze-data-with-r/8-knowledge-check).

## Próximos pasos

¡Felicidades por finalizar este reto 🏅!

Hay otros talleres sobre el uso de R para Ciencia de Datos. En este taller, aprendimos cómo limpiar, visualizar y transformar datos para obtener información. El siguiente conjunto de talleres te enseñará [cómo crear modelos de regresión](../../../intro-regression-R-tidymodels/), [cómo crear modelos de clasificación](../../../intro-classification-R-tidymodels/) y cómo crear modelos de agrupamiento (¡muy pronto!). ¡Asegúrate de echarles un vistazo!

## Práctica

En este taller utilizaste preguntas ya proporcionadas para guiar su EDA. A veces este no es el caso. Intenta generar tus propias preguntas y responderlas utilizando las habilidades de transformación y visualización de datos que had adquirido en este módulo. ¿Qué nueva información has obtenido?

## Agradecimientos ❤️ 
¡Muchísimas gracias a [Felipe Flores](https://www.linkedin.com/in/felipe-florest/) (@FelFT) por haber traducido todo este contenido a español! 🚀 ✨ 

## Feedback

Asegúrate de dejarnos tus [comentarios sobre este taller](https://forms.office.com/r/MdhJWMZthR). ¡Feliz aprendizaje!

[Código de conducta](../../../../CODE_OF_CONDUCT.md)