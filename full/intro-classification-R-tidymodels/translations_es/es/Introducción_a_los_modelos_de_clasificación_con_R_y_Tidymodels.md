# Introducción a los modelos de clasificación usando R y Tidymodels

## Fuente del módulo
[Introducción a los modelos de clasificación usando R y Tidymodels](https://docs.microsoft.com/en-us/learn/modules/introduction-classification-models/?WT.mc_id=academic-59300-cacaste)

## Objetivos

¡Hola y bienvenidos a esta aventura de aprendizaje! En esta carpeta, encontrarás un Cuaderno de desafío de clasificación. Básicamente, se trata de un cuaderno de evaluación guiada con calificación automática que te ayudará a evaluar tu comprensión al usar R para crear modelos que predicen a qué categoría pertenece un elemento. ¡Así que toma tu varita y deja que comience la aventura!

| **Objetivo**                      | Descripción                                    |
| ----------------------------- | -----------------------------------------------|
| **Que aprenderás**       | Cómo crear modelos de clasificación en R           |
| **Lo que necesitarás**          | [Visual Studio Code](https://code.visualstudio.com?WT.mc_id=academic-59300-cacaste), [Docker Desktop](https://www.docker.com/products/docker-desktop), [Remote Developer Extension](https://aka.ms/vscode-remote/download/extension) y [Git](https://git-scm.com/downloads)   |
| **Duración**                  | De 1.5 a 2 horas                                          |
| **Diapositivas**                    | [Powerpoint](./slides.pptx)                                 |

## Vídeo

[![Recorrido por el taller](./images/promo.png)](https://youtu.be/NpYpUgaoK8M "workshop walk-through")
> 🎥 Has clic en esta imagen para ver a Carlotta guiarte a través del material del taller y obtener algunos consejos sobre cómo impartirlo.

## Pre-aprendizaje
Este taller permite a los alumnos utilizar las habilidades aprendidas en el módulo. [Introducción a los modelos de clasificación usando R y tidymodels](https://docs.microsoft.com/en-us/learn/modules/introduction-classification-models/?WT.mc_id=academic-59300-cacaste) para crear tus propios modelos de clasificación. Como tal, se alienta a los alumnos a pasar por el módulo de antemano para familiarizarse con algunos de los conceptos cubiertos en este taller.
Este taller es el tercero de una serie diseñada para comenzar con la ciencia de datos en R. Por lo tanto, es posible que también desee echar un vistazo al [primero](../explore-analyze-data-with-R) y [segundo](../intro-regression-R-tidymodels) talleres de la serie, que tratan sobre el análisis exploratorio de datos y la regresión.


## Requisitos previos

Para ponerlo en funcionamiento y escribir código R en poco tiempo, hemos incluido este taller de modo que tenga un entorno de codificación R listo para usar.

### Configuración del contenedor de desarrollo

Un **contenedor de desarrollo** es un contenedor en ejecución [Docker](https://www.docker.com) con una herramienta/pila de tiempo de ejecución bien definida y sus requisitos previos. Puedes probar contenedores de desarrollo con **[GitHub Codespaces](https://github.com/features/codespaces)** or **[Visual Studio Code Remote - Containers](https://aka.ms/vscode-remote/containers)**.

#### GitHub Codespaces
Sigue estos pasos para abrir este taller en un Codespace:
1. Haga clic en el menú desplegable Código y seleccione la opción **abrir con Codespaces**.
2. Selecciona **+ Nuevo codespace** en la parte inferior del panel.

Para más información, revisar la [Documentación de GitHub](https://docs.github.com/en/free-pro-team@latest/github/developing-online-with-codespaces/creating-a-codespace#creating-a-codespace?WT.mc_id=academic-59300-cacaste).

#### Binder
Este taller también está disponible en Binder. Para abrir el cuaderno en un entorno de Binder, simplemente has  clic en el botón a continuación.

[![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/carlotta94c/workshop-library/introToClassificationR%26Tidymodels?labpath=full%2Fintro-classification-R-tidymodels%2Fsolution%2FChallenge-Classification.ipynb)

#### Aprende Sandbox
También puede superar este desafío aprovechando el entorno Learn Sandbox, proporcionado por [Unit 9](https://docs.microsoft.com/en-us/learn/modules/introduction-classification-models/9-challenge-classification?WT.mc_id=academic-59300-cacaste) del módulo MS Learn - Introducción a los modelos de clasificación usando R y tidymodels. Simplemente inicia sesión con tu cuenta de Microsoft o GitHub y has clic en **Activar sandbox** para comenzar.

#### VS Code Remote - Containers
Sigue estos pasos para abrir este taller en un contenedor con la extensión VS Code Remote - Containers:

1. Si es la primera vez que usas un contenedor de desarrollo, asegurate de que tu sistema cumpla con los requisitos previos (es decir, tener Docker instalado) en [pasos para empezar](https://aka.ms/vscode-remote/containers/getting-started).

2. Presiona <kbd>F1</kbd> seleccionar y **Agregar archivos de configuración del contenedor de desarrollo...** command for **Remote-Containers** o **Codespaces**.

   > **Nota:** Si es necesario, puedes arrastrar y soltar la carpeta `.devcontainer` desde esta subcarpeta en una copia clonada localmente de este repositorio en el explorador de archivos de VS Code en lugar de usar el comando.

3. Seleccione esta definición. Es posible que también deba seleccionar **Mostrar todas las definiciones...** para que aparezca.

4. Finalmente, presiona <kbd>F1</kbd> y corre **Remote-Containers: Reabrir carpeta en contenedor** para empezar a usar la definición.

Esta definición incluye un código de prueba que te ayudará a verificar que funciona como se espera en tu sistema. Abre la carpeta `all-systems-check` donde puedes elegir ejecutar los scripts `.R`, `.Rmd` o `.ipynb`. Deberías ver "¡Hola, mundo remoto!" en una ventana de terminal R (para `.R` y `.Rmd`) o dentro de un Jupyter Notebook (para `.ipynb`) después de que se ejecute el script respectivo.

En algún momento, es posible que desees realizar cambios en tu contenedor, como instalar un nuevo paquete. Deberás reconstruir tu contenedor para que los cambios surtan efecto.

## Lo que vas a aprender

Digamos que somos científicos de datos en una empresa de elaboración de vino. Su empresa quiere producir el mejor vino y tu tienes la tarea de trabajar con los registros de vinos de la empresa y el experto en vinos para lograrlo.

En este desafío, entrenarás un modelo de clasificación para analizar las características químicas y visuales de las muestras de vino y clasificarlas según su cultivo (variedad de uva).

## Hito 1: ‍️Ordenar los datos.

Rara vez encontramos datos en la forma correcta para el análisis. Una excelente manera de comenzar su análisis de datos es limpiar sus datos para que sean consistentes con las funciones que usarás en tu proceso de análisis.

En esta sección:

- Importa los datos e identifica las variables `características` (predictores) y `etiqueta` (resultado) con las que trabajarás.

- Codifica la columna de resultados en una variable categórica.


## Hito 2: visualizar los datos

El objetivo de la exploración de datos es tratar de comprender las "relaciones" entre sus atributos; en particular, cualquier correlación aparente entre las características y la etiqueta que tu modelo intentará predecir. Una forma de hacerlo es mediante el uso de la visualización de datos. La visualización de datos te permite identificar tendencias y plantear nuevas preguntas sobre los datos.

En esta sección, deberás:

- Reestructurar los datos de modo que pueda trazar fácilmente los datos como facetas: subgráficos en los que cada uno muestra un subconjunto de los datos

- Visualizar y explorar la relación entre el resultado y cada función mediante diagramas de caja.

## Hito 3: Presupuesto de datos

Ahora, es hora de entrenar algunos modelos. Es una buena práctica en el aprendizaje supervisado dividir los datos en dos subconjuntos; un conjunto (normalmente más grande) con el que entrenar el modelo y un conjunto de "retención" más pequeño con el que validar el modelo entrenado. Esto nos permite evaluar qué tan bien funciona el modelo para obtener una mejor estimación de cómo funcionarán sus modelos con nuevos datos.

En esta sección, deberás:

- Crear una especificación de división de datos, es decir, qué proporción se destina al entrenamiento y qué se destina a las pruebas.

- Extraer los conjuntos de entrenamiento y prueba.


## Hito 4: Crea una especificación de modelo, una receta, un flujo de trabajo y luego entrene un modelo.

Ahora que tenemos un conjunto de funciones de entrenamiento y la etiqueta de entrenamiento correspondiente, podemos ajustar un algoritmo de clasificación multiclase a los datos para crear un modelo. Una receta es un objeto que define una serie de pasos para el procesamiento de datos. En la práctica, es común realizar algún preprocesamiento de los datos para facilitar que un algoritmo ajuste un modelo a ellos.

En esta sección, deberás:

- Crear una especificación de modelo multinomial.

- Crear una receta que especifique que todos los predictores numéricos deben normalizarse.

- Agrupar la especificación del modelo y la receta en un flujo de trabajo.

- Ajustar todo el flujo de trabajo a los datos, de modo que el modelo encapsule todos los pasos de preprocesamiento, así como el modelo multinomial.

## Hito 5: Evaluar el rendimiento del modelo.

Una vez que tengas un modelo entrenado que use el conjunto de entrenamiento, querrá evaluar qué tan bien (o no) funcionará con nuevos datos.

En esta sección, podrás:

- Utilizar el modelo entrenado para hacer predicciones de variedades de vino y generar sus correspondientes predicciones de probabilidad para el "conjunto de prueba".

- Evaluar el rendimiento del modelo utilizando una `matriz de confusión`.

- Evaluar el rendimiento del modelo utilizando otras métricas que surgen de la matriz de confusión, tales como: "exactitud", "precisión" y "recuperación".

- Evalúa el rendimiento del modelo utilizando la "curva ROC" y el "área bajo la curva ROC".

En general, ¿tu modelo hizo un gran trabajo al clasificar las variedades de vino?

## Hito 6: Usar el modelo para hacer inferencias

Si está satisfecho con el rendimiento del modelo, puedes guardarlo para utilizarlo más tarde. Luego puedes cargarlo cuando lo necesites y usarlo para predecir etiquetas para nuevos datos. Esto a menudo se llama puntuación o inferencia.

En esta sección, podrás:

- Guardar tu modelo entrenado y luego utilízarlo para predecir la variedad de los siguientes vinos:

 | **alcohol** | **malic_acid** | **ash** | **alcalinity** | **magnesium** | **phenols** | **flavanoids** | **nonflavanoids** | **proanthocyanins** | **color_intensity** | **hue** | **OD280_315_of_diluted_wines** | **proline** |
|---------------------|----------------|--------------|--------|-------|------|-------|------|-------|-----|---------|-------|------|
| 13.72 | 1.43| 2.5 | 16.7 | 108 | 3.4 | 3.67 | 0.19 | 2.04 | 6.8 | 0.89 | 2.87 | 1285|
| 12.37 | 0.94 | 1.36 | 10.6 | 88 | 1.98 | 0.57 | 0.28 | 0.42 | 1.95 | 1.05 | 1.82 | 520 |

## Prueba

Pon a prueba tus conocimientos con [una breve prueba](https://docs.microsoft.com/en-us/learn/modules/introduction-classification-models/8-knowledge-check?WT.mc_id=academic-59300-cacaste)!

## Siguientes pasos

¡Felicitaciones por terminar este desafío de clasificación 🏅!

Hay otros talleres para crear modelos de aprendizaje automático en R. En este taller, aprendimos cómo crear un modelo de aprendizaje automático que predice categorías o clases. El siguiente módulo te mostrará cómo crear modelos de agrupamiento (¡próximamente!).

## Práctica

En este taller, entrenaste un modelo único (modelo de clasificación multinomial) para analizar las características químicas y visuales de las muestras de vino y clasificarlas según su cultivo (variedad de uva). A veces, un profesional de datos puede necesitar probar un par de modelos. Intenta usar otros modelos discutidos en este taller para hacer lo mismo. Intenta ajustar algunos hiperparámetros del modelo mientras lo hace también. ¿Obtienes mejores métricas de evaluación?


## Retroalimentación

Asegúrate de dar [retroalimentación sobre este taller](https://forms.office.com/r/MdhJWMZthR)! ¡Feliz aprendizaje!

[Código de conducta](../../CODE_OF_CONDUCT.md)

