# Exploración y análisis de datos con R

## Módulo de referencia
[Exploración y análisis de datos con R](https://docs.microsoft.com/es-es/learn/modules/explore-analyze-data-with-r/?WT.mc_id=academic-59300-cacaste)

## Objetivos

¡Hola y bienvenidx a esta aventura de aprendizaje! En esta carpeta, encontrará un Notebook de Exploración de Datos. ¡Es un notebook de valoración guiada con calificación automática que lo ayudará a evaluar su comprensión al usar R para explorar y analizar datos! Esperamos que encuentre que R, es en esencia, un lenguaje hermoso y elegante para la Ciencia de Datos.


| **Objetivo**                      | Descripción                                    |
| ----------------------------- | -----------------------------------------------|
| **¿Qué aprenderás?**       | Cómo usar R para exploración y análisis de datos          |
| **Lo qué necesitarás**          | [Visual Studio Code](https://code.visualstudio.com?WT.mc_id=academic-59300-cacaste), [Docker Desktop](https://www.docker.com/products/docker-desktop), [Remote Developer Extension](https://aka.ms/vscode-remote/download/extension) y [Git](https://git-scm.com/downloads) |
| **Duración**                  | 2 horas                                      |
| **Diapositivas**                    | [Powerpoint](../../slides.pptx)                                |

## Video

¡Vídeo próximamente!

## Pre-aprendizaje

Este taller nos permite aplicar las habilidades aprendidas en el módulo [Exploración y análisis de datos con R](https://docs.microsoft.com/es-es/learn/modules/explore-analyze-data-with-r/?WT.mc_id=academic-59300-cacaste) para realizar análisis y visualización de datos. Como tal, se alienta a las personas a realizar el módulo de antemano para familiarizarse con algunos de los conceptos cubiertos en este taller.

## Requisitos previos

Para preparar, ejecutar y escribir código R en poco tiempo, hemos incluido en este taller un contenedor, de modo que tenga un entorno de codificación R listo para utilizar.

### Configuración del contenedor de desarrollo

Un **contenedor de desarrollo** es un contenedor de [Docker](https://www.docker.com) en ejecución with a well-defined tool/runtime stack and its prerequisites. Puede probar contenedores de desarrollo con **[GitHub Codespaces](https://github.com/features/codespaces)**, **[Binder](https://mybinder.org/)** o **[Visual Studio Code Remote - Containers](https://aka.ms/vscode-remote/containers)**.

#### GitHub Codespaces
Siga estos pasos para abrir este taller en un Codespace:
1. Haga clic en el menú desplegable Código y seleccione la opción **Abrir con Codespaces** .
2. Select **+ New codespace** at the bottom on the pane.

Para más información, consulte la [documentación de GitHub](https://docs.github.com/en/free-pro-team@latest/github/developing-online-with-codespaces/creating-a-codespace#creating-a-codespace).

#### Binder
Este taller también está disponible en Binder. Para abrir el notebook en un entorno de Binder, haga clic en el botón que se encuentra a continuación.

[![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/carlotta94c/workshop-library/workshop-binding?labpath=%2Ffull%2Fexplore-analyze-data-with-R%2Fsolution%2Fchallenge-Data_Exploration.ipynb)

#### Espacio aislado de Learn
También puede completar este desafío aprovechando el espacio asilado de Learn, que se encuentra en la [Unidad 9](https://docs.microsoft.com/es-es/learn/modules/explore-analyze-data-with-r/9-challenge-data-exploration) del módulo de Microsoft Learn -  Exploración y análisis de datos con R. Simplemente inicie sesión con su cuenta de Microsoft o GitHub y haga clic en **Activar el espacio aislado** para iniciar.

#### VS Code Remote - Containers
Siga estos pasos para abrir este taller en un contenedor usando la extensión VS Code Remote - Containers:

1. If this is your first time using a development container, please ensure your system meets the pre-reqs (i.e. have Docker installed) in the [getting started steps](https://aka.ms/vscode-remote/containers/getting-started).

2. Press <kbd>F1</kbd> select and **Add Development Container Configuration Files...** command for **Remote-Containers** or **Codespaces**.

   > **Note:** If needed, you can drag-and-drop the `.devcontainer` folder from this sub-folder in a locally cloned copy of this repository into the VS Code file explorer instead of using the command.

3. Select this definition. You may also need to select **Show All Definitions...** for it to appear.

4. Finally, press <kbd>F1</kbd> and run **Remote-Containers: Reopen Folder in Container** to start using the definition.

This definition includes some test code that will help you verify it is working as expected on your system. Open the `all-systems-check` folder where you can choose to run the `.R`, `.Rmd` or `.ipynb` scripts. You should see "Hello, remote world!" in an R terminal window (for `.R` and `.Rmd`) or within a Jupyter Notebook (for `.ipynb`) after the respective script executes.

At some point, you may want to make changes to your container, such as installing a new package. You'll need to rebuild your container for your changes to take effect. 

## Lo que vas a aprender

Supongamos que el Departamento de Transporte está considerando construir un nuevo aeropuerto. Como el increíble científico de datos que eres, se te ha pedido que explores los datos existentes. Los resultados de su análisis pueden formar la base de un informe o un modo de aprendizaje automático.

En este desafío, explorará un conjunto de datos del mundo real que contiene datos de vuelos del Departamento de Transporte de EE. UU.

## Paso 1: Limpieza de datos

Rara vez encontramos datos en la forma correcta para el análisis. Como tal, una vez que haya importado sus datos, un buen lugar para comenzar su análisis es respondiendo a la pregunta: "¿Son los datos precisos y apropiados para su análisis deseado?". La limpieza de datos para manejar errores, valores faltantes y otros problemas vale la pena a largo plazo y permite un análisis exploratorio de datos más fácil y preciso.

En esta sección usted:

- Identificará cualquier dato nulo o faltante e agregará valores de reemplazo apropiados.

- Identificará y eliminará cualquier valor atípico en las columnas DepDelay y ArrDelay.

## Paso 2: Análisis exploratorio de datos (EDA)

El análisis exploratorio de datos, conocido popularmente como EDA, es utilizado por los científicos de datos  para analizar e investigar conjuntos de datos y resumir sus características principales, por ejemplo, la distribución, a menudo visualizando y transformando datos.


En esta sección usted:

- Observará las estadísticas de resumen para los campos numéricos en el conjunto de datos.

- Determinará la distribución de las columnas DepDelay y ArrDelay.


### More EDA

The goal of EDA is to develop a better understanding of your data. More often than not, EDA will involve formulating some probing questions about your data, searching for answers by visualizing and transforming data and finally using the understanding gained to refine questions, drop the questions entirely and/or generate new questions.

In this section, you will:

- Use statistics, aggregate functions, and visualizations to answer the following questions:

    - What are the average (mean) departure and arrival delays?

    - How do the carriers compare in terms of arrival delay performance?

    - Is there a noticeable difference in arrival delays for different days of the week?

    - Which departure airport has the highest average departure delay?

    - Do late departures tend to result in longer arrival delays than on-time departures?

    - Which route (from origin airport to destination airport) has the most late arrivals?

    - Which route has the highest average arrival delay?

## Prueba

Evalúa tus conocimientos con [una breve prueba](https://docs.microsoft.com/en-us/learn/modules/explore-analyze-data-with-r/8-knowledge-check)!

## Próximos pasos

¡Felicidades por finalizar este reto 🏅!

Hay otros talleres sobre el uso de R para Ciencia de Datos. En este taller, aprendimos cómo limpiar, visualizar y transformar datos para obtener información y conocimiento. El siguiente conjunto de talleres le mostrará 
There are other workshops around using R for Data Science. In this workshop, we learnt how to clean data, visualize data and transform data to derive insights and knowledge. The next set of workshops will show you how to [create regression models](../intro-regression-R-tidymodels), [create classification models](../intro-classification-R-tidymodels) and create clustering models (coming soon!). Be sure to check them out!

## Práctica

En este taller utilizaste 
In this workshop, you used already provided questions to guide your EDA. Sometimes this is not the case. Try generating questions of your own and answering them using the data visualization and transformation skills you have acquire in this module. What new insights do you reveal?


## Feedback

¡Asegúrate de dejarnos [comentarios sobre este taller](https://forms.office.com/r/MdhJWMZthR)! ¡Feliz aprendizaje!

[Código de conducta](../../../../CODE_OF_CONDUCT.md)