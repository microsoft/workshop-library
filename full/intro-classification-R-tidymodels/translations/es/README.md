# Introducción a los modelos de regresión mediante R y tidymodels

## Objetivos
¡Estas a punto de comenzar este viaje lleno de aprendizaje! Aquí encontrarás una serie de desafíos de modelos de regresión. Estos se encuentran en unas notebooks que se evalúan automáticamente y que te ayudarán a conocer tu nivel de comprensión en el uso de R para crear modelos capaces de predecir valores cuantificables como precios, tamaños u otros números escalares.

| **Objetivo**                  | Descripción                                    |
| ----------------------------- | -----------------------------------------------|
| **¿Qué aprenderás?**            | Cómo crear modelos de regresión en R           |
| **¿Qué necesitarás?**           | [Visual Studio Code](https://code.visualstudio.com?WT.mc_id=academic-59300-cacaste), [Docker Desktop](https://www.docker.com/products/docker-desktop), [Remote Developer Extension](https://aka.ms/vscode-remote/download/extension) y [Git](https://git-scm.com/downloads) |
| **Duración**                  | De 1.5 a 2 Horas                               |
| **Diapositivas**              | [Powerpoint](./slides.pptx)                    |

## Vídeo
Próximamente

> *[Solo disponible en inglés](https://youtu.be/ckqijBKO-Es "Explicación del taller")*

## Pre-Aprendizaje

En este taller aplicarás lo aprendido en el módulo [Introducción a los modelos de regresión mediante R y tidymodels](https://docs.microsoft.com/es-mx/learn/modules/introduction-regression-models/?WT.mc_id=academic-59300-cacaste). Es recomendable primero cursar el módulo anterior para familiarizarse con los conceptos que se abordarán en este taller.
Este, es el segundo taller de una serie diseñada para introducirse a la ciencia de datos en R. Si te interesa aprender sobre el análisis exploratorio de datos, entonces echa un vistazo al [primer](../explore-analyze-data-with-R) taller de esta serie.

## Requisitos previos

En esta ocasión, hemos preparado un contenedor con el entorno preparado para que comiences a utilizar R.

### Configuración del contenedor

Un **contenedor de desarrollo** es un contenedor de Docker configurado de acuerdo a los prerrequisitos.
Puede probar los contenedores con **[GitHub Codespaces](https://github.com/features/codespaces)**, **[Binder](https://mybinder.org/)** o **[Visual Studio Code Remote - Containers](https://aka.ms/vscode-remote/containers)**.

#### GitHub Codespaces
Sigue estos pasos para abrir este taller en Codespace:
1. Haz clic en el menú desplegable "Code" y seleccione la opción **Abrir con Codespaces**.
2. Seleccione **+ Nuevo codespace**, ubicado en la parte inferior del panel.

Para mayor información, revise la [documentación de GitHub](https://docs.github.com/es/codespaces/developing-in-codespaces/creating-a-codespace).

#### Binder
Este taller también se encuentra disponible en Blinder. Para abrir el notebook en un entorno de Binder, haga clic en el botón de abajo.

[![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/carlotta94c/workshop-library/introToRegressionR%26Tidymodels?labpath=full%2Fintro-regression-R-tidymodels%2Fsolution%2FChallenge-regression.ipynb)

#### Espacio aislado

También puedes realizar estos desafíos utilizando en espacio aislado, disponible en la [unidad 9](https://docs.microsoft.com/es-es/training/modules/introduction-regression-models/9-challenge-regression?WT.mc_id=academic-59300-cacaste) del módulo Introducción a los modelos de regresión mediante R y tidymodels, de MS Learn. Solo debes iniciar sesión con una cuentra de Microsoft o GitHub y hacer clic en **Activar espacio aislado**.

#### VS Code Remote - Containers
Realiza lo siguiente para abrir este taller en un contenedor, utilizando la extensión VS Code Remote - Containers:

1. Si es su primera vez utilizando un contenedor, por favor, asegúrese que su sistema cumpla con los requisitos previos (tener instalado Docker) [en la configuración inicial](https://aka.ms/vscode-remote/containers/getting-started).

2. Presione <kbd>F1</kbd>, seleccione **Add Development Container Configuration Files...** para **Remote-Containers** o **Codespaces**.
   > **Nota:** Si es necesario, en lugar de usar el comando, puede arrastrar y soltar la carpeta `.devcontainer` desde esta subcarpeta en una copia clonada localmente de este repositorio en el explorador de archivos de VS Code

3. Seleccione esta definición. Es posible que también deba seleccionar **Show All Definitions...** para que aparezca.

4. Finalmente, presione <kbd>F1</kbd> y ejecuten **Remote-Containers: Reopen Folder in Container** para comenzar a utilizar la definición.

Esta definición incluye un código de prueba que lo ayudará a verificar que funciona como se espera en su sistema. Abre la carpeta `all-systems-check`donde podrás elegir ejecutar el script `.R`, `.Rmd` o `.ipynb`. Deberías ver "Hello, remote world!" en una ventana de terminal de R (para .R y .Rmd) o dentro de un Jupyter Notebook (para .ipynb) después de que se ejecute el script respectivo.

En algún momento, es posible que desee realizar cambios en su contenedor, como instalar un nuevo paquete. Deberá reconstruir su contenedor para que los cambios surtan efecto.

## Qué aprenderás

Digamos que somos un(a) agente de bienes raíces y nos acaban de entregar un par de casas nuevas en diferentes lugares de una ciudad. No sabemos el precio de venta, y queremos obtener una estimación del mismo comparándolo con el de otras casas en el lugar.

En este desafío, utilizarás un conjunto de datos de transacciones de ventas de bienes raíces para predecir el precio por unidad de una propiedad en función de características como la antigüedad de la propiedad, la disponibilidad de servicios locales y la ubicación.

## Paso 1: Exploración de los datos 🕵️‍️

El primer paso en cualquier proyecto de aprendizaje automático suele ser explorar los datos que se utilizarán para entrenar el modelo. El objetivo de esta exploración es tratar de comprender las relaciones entre sus atributos; en particular, cualquier correlación aparente entre las características y la etiqueta que el modelo intentará predecir.

En esta sección:

- Importe los datos e identifique las `características` (predictores) y las variables de `etiqueta` (resultado) con las que trabajarás.

- Examine el resumen estadístico y grafique la distribución de la variable de salida, en nuestro caso: precio de una casa.

- Pruebe con valores atípicos.

- Examine la relación aparente entre las características numéricas y el precio de una casa utilizando la estadística de correlación y los diagramas de dispersión. 

- Examine la distribución del precio de la vivienda para cada característica categórica mediante diagramas de caja.

- Examine the distribution of the house price for each categorical feature using boxplots.

Ahora que ha explorado los datos, es tiempo de utilizarlo para entrenar un modelo de regresión que utilice las característica que identificamos como potencialmente predictivas para la etiqueta de alquilires.

## Paso 2: Gestión de los datos

Una práctica común en el aprendizaje supervisado es dividir los datos en dos subconjuntos; un conjunto (generalmente más grande) con el que entrenar el modelo y un conjunto más pequeño con el que validar el modelo entrenado. Esto nos permite evaluar qué tan bien funciona el modelo para obtener una mejor estimación de cómo funcionarán sus modelos con nuevos datos.

En esta sección:

- Establezca la partición de los datos en dos conjuntos, uno que se destine al entrenamiento y otro que se destine a la evaluación.

- Extraiga los conjuntos de entrenamiento y prueba.

## Paso 3: Crear una especificación de modelo de bosque aleatorio

En esta sección, crearás una especificación de modelo con la siguiente información:

- El `tipo` de modelo es `random forest`.

- El `modo` del modelo es `regression` (contrario a la clasificación, etc).

- el `motor` computacional es el nombre del paquete R, que en nuestro caso será el paquete `randomForest`.

## Paso 4: Preprocesamiento de los datos usando recetas

Una receta es un objeto que define una serie de pasos para el procesamiento de datos. En la práctica, es común realizar algún preprocesamiento de los datos para facilitar que un algoritmo ajuste un modelo a ellos.

En esta sección, establecerá una receta que:

- Remueva la característica transaction_date.

- Transforme la característica local_convenience_stores en categórica (factor).

- Centre y escale todos los predictores numéricos.

## Paso 5: Crear un flujo de trabajo para el modelo y para su entrenamiento

Un flujo de trabajo de modelo permite al usuario unir objetos de modelado y preprocesamiento. A continuación, puede adaptar todo el flujo de trabajo a los datos, de modo que el modelo encapsule todos los pasos de preprocesamiento, así como el algoritmo.

En esta sección:

- Cree un flujo de trabajo para el modelo.

- Entrene el modelo de random forest.

## Paso 6: Evaluar el rendimiento del modelo

Una vez el modelo ha sido entrenado, querrá evaluar qué tan bien (o no) funcionará con nuevos datos. 

En esta sección:

- Use el modelo entrenado para hacer predicciones en el `conjunto de prueba`.

- Evalúe las predicciones del modelo utilizando métricas como `rmse` y `R^2`.

## Paso 7: Utilizar el modelo entrenado

Si el rendimiento del modelo es el esperado, puede guardarlo para utilizarlo más adelante. Luego puede cargarlo cuando lo necesite y usarlo para predecir etiquetas para nuevos datos. Esto a menudo se llama puntuación o inferencia.

En esta sección:

- Guarde su modelo entrenado y luego utilícelo para predecir el precio por unidad para las siguientes transacciones de bienes raíces:

 | **transaction_date** | **house_age** | **transit_distance** | **local_convenience_stores** | **latitude** | **longitude** |
|---------------------|----------------|--------------|--------|-------|------|
| 2013.167             | 16.2          | 289.3248             | 5                            | 24.98203     | 121.54348     |
| 2013.000             | 13.6          | 4082.015             | 0                            | 24.94155     | 121.50381     |

## Prueba de conocimientos

¡Pon a prueba tus conocimientos con esta [pequeña prueba](https://learn.microsoft.com/es-mx/training/modules/introduction-regression-models/8-knowledge-check?WT.mc_id=academic-59300-cacaste)!

## Siguiente paso

¡Felicidades por concluir el desafío 🏅!

Existen otros talleres donde utilizar R para ciencia de datos. En este taller, aprendimos cómo se puede usar la regresión para crear un modelo de aprendizaje automático que predice valores numéricos. En el siguiente taller aprenderás a [crear modelos de clasificación](../../../intro-classification-R-tidymodels) y modelos de agrupación en clústeres (próximamente). ¡Asegúrate de echarles un vistazo!

## Práctica

En este taller entrenaste un modelo sencillo para predecir el precio de viviendo en función de sus características. A veces, un profesiona de datos necesita probar diferentes modelos. Intente utilizar otros modelos mencionados en este taller. E intente ajustar algunos hiperparámetros mientras lo intenta. ¿Obtiene mejores resultados? 

## Retroalimentación

¡Asegúrate de proporcionar una [retroalimentación de este taller](https://forms.office.com/r/MdhJWMZthR)! ¡Feliz aprendizaje!

## [Código de conducta](../../../../CODE_OF_CONDUCT.md)

## Módulo de referencia

[Introducción a los modelos de regresión mediante R y tidymodels](https://docs.microsoft.com/es-mx/learn/modules/introduction-regression-models/?WT.mc_id=academic-59300-cacaste).

## Agradecimientos ❤️ 🚀 ✨ 

¡Muchísimas gracias a [Jonathan Castillo](https://www.linkedin.com/in/jona866/) @jona866 por haber traducido todo este contenido a español!