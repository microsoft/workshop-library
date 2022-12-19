# Integrando Custom Vision con Power Apps para Detección de Retinopatía Diabetica 

## Enlace fuente del módulo
https://docs.microsoft.com/learn/modules/classify-images-custom-vision/

https://docs.microsoft.com/learn/modules/customize-apps-in-powerapps/

## Objetivos

En este taller, vamos a discutir sobre como construir una aplicación no-code con el clasificador de imágenes de Custom Vision 
 

| **Objetivo**                  |               Descripción           |
| ----------------------------- | --------------------------------------------------------------------- |
| **Lo que aprenderemos**       | Como construir una aplicación con Power Apps e integrarlo con el clasificador de imágenes de Custom VisionHow to build an app                                                                   |
| **Lo que necesitamos**        | [Custom Vision](https://www.customvision.ai/), [Power App]( https://make.powerapps.com)|
| **Duración**                  | 1 hour                                                                  |
| **¿Sólo quieres ver la solución o el demo de la app? Aquí:** | [DR Detection App](https://apps.powerapps.com/play/7df60516-60d8-4627-bccb-f96169f86d76?tenantId=84c31ca0-ac3b-4eae-ad11-519d80233e6f&source=portal&screenColor=RGBA(0%2C176%2C240%2C1))                      |
| **Slides** | [Powerpoint](slides.pptx) 
| **Autor**                  | [Jingyi Zhu](https://github.com/viviana2419), [Sanya Sinha](https://github.com/ssanya942)                                                                |
                         
## Video

[![Paso a paso del taller](./../images/promo.png)](https://youtu.be/YctfdD8ycQY "Paso a paso del taller")
> 🎥 Clic en esta imágen para ver como Jingyi y Sanya te guian en el paso a paso del taller


## Pre-Aprendizaje

[Inicia con Visión Computacional](https://docs.microsoft.com/learn/modules/analyze-images-computer-vision/)

[Inicia con Power App](https://docs.microsoft.com/learn/modules/get-started-with-powerapps/)

## Prerequisitos

1. Tú necesitarás una [Cuenta de Azure](https://azure-for-academics.github.io/getting-azure/) para el servicio de Custom Vision. Puedes obtener créditos gratis de [Azure para Estudiantes](https://azure.microsoft.com/free/students/), o [Azure Prueba Gratis](https://azure.microsoft.com/free/).

    Aprende más acerca de como crear una cuenta de Azure en [Microsoft Learn](https://docs.microsoft.com/learn/modules/create-an-azure-account/)

2. Es más, si aún no tienes tu cuenta, [registrate de forma gratuita](https://powerapps.microsoft.com/) en PowerApps.com con una cuenta estudiantil o de trabajo. Una vez que te hayas registrado, tu podrás [ingresar](https://web.powerapps.com/) para usar PowerApps en la web. 

    Aprende más acerca de [unirse al Programa de Desarrolladores de Microsoft](https://developer.microsoft.com/en-us/microsoft-365/dev-program) y [crea una cuenta de Power Apps](https://techcommunity.microsoft.com/t5/educator-developer-blog/getting-started-with-a-power-apps-community-developer-account/ba-p/2693859) 


## Lo que aprenderán los estudiantes

En este proyecto,yu vas a construir una aplicación que detecta Retinpatía Diabética. 

Tú podrás...
  1. Obtener información de detección de forma automática y precisa a partir de un conjunto de datos.
  2. Use el servicio de Custom Vision para crear una solución de clasificación de imágen.
  3. Personalizar una Power app agregando controles, imágenes y lógica.
  
¿Qué es la Retinopatía Diabética?
  Es una complicación que afecta los ojos, la cual no muestra sintomas o solo problemas leves de visión al inicio. Pero esto puede conducir a ceguera. El manejo cuidadoso de la diabetes es la mejor forma de prevenir la perdida de visión. El paciente debe ver a un oftalmólogo una vez al año para hacer un examen de la vista en dilatación del ojo - incluso si la visión parece estar bien.

![imágen del ojo](./../images/eye.png)

## Hito 1 - Construir el proyecto en Custom Vision

En Azure, tu puedes usar el servicio cognitivo de Custom Vision para entrenar un modelo de clasificación de imágen basado en imágenes existentes. Aquí hay dos elementos para crear una solución de clasificación de imágenes. Primero, debes entrenar el modelo para reconocer diferentes clases de imágenes existentes. Entonces, cuando el modelo es estrenado, tu debes publicarlo como si fuera un servicio que pueda ser consumida por las aplicaciones.

1. Vamos a comenzar obteniendo el dataset de imágenes de retinopatía diabética.

    https://www.kaggle.com/linchundan/fundusimage1000

    https://www5.cs.fau.de/fileadmin/research/datasets/fundus-images/healthy.zip
    
    Siéntete libre de mezclar estos dos datasets para fortalecer la solidez de tu modelo. 

2. Abre el portal de Azure en https://portal.azure.com/. Si se le solicita, registrate usando una cuenta Microsoft asociada con una suscripción de Azure y acepta los términos y condiciones de servicio.
![screenshot 1](./../images/screenshot-1.png)


3. Clic en la sección de Custon Vision, entonces tu debes entrar a esta página:
  ![screenshot 2](./../images/screenshot-2.png)

    * Vamos a crear un nuevo proyecto con la siguiente configuració:

      Opciones de creacion: Both

      Detalles del proyecto: 
      
          Subscripción: Visual Studio Enterprise Subscripción 
          
          Grupo de Recursos: DRDEMO 

      Detalles de Instancia:
      
          Región: la más cercana a ti

          Nombre: DRDEMO101
      
      Recurso de entrenamiento y predicción:
      
          Pricing tier: Standard
          
    Clic 'Revisar+crear'. Una vez que tu recurso ha sido validado, da clic a 'crear'. <br> Ahora tienes un grupo de recursos disponible.
    ![screenshot 3](./../images/screenshot-3.png)

      
4. Lo siguiente, ingresa en el [portal de Custom Vision](https://www.customvision.ai/), crea un nuevo proyecto con la siguiente configuración:

   ![screenshot 4](./../images/screenshot-4.png)

          Nombre: Detección Retinopatía Diabética 

          Descripción: Imágen de clasificación para retinopatía diabética

          Recurso: El recurso que creaste previamente

          Tipos de proyecto: Clasificación

          Tipos de Clasificación: Multiclase (etiqueta simple por imagen)

          Dominios: General[A2]
   Entonces, clic 'Crear Proyecto'

5. Entrarás a la intercade de usuario de Custom Vision como se muestra abajo. Clic [+] Agrega imágenes, y selecciona todos los archivos positivos en la carpeta de imágenes positivas que extrajiste previamente. Entonces carga los archivos de imágenes, especificando la etiqueta.
   ![custom vision portal](./../images/cv-portal.png)

6. Repite el paso anterior para subir las imágenes en la carpeta de negativos con la etiqueta negativo

7. En el proyecto de Custom Vision, debajo de las imágenes, clic en Entrenar para entrenar el modelo clasificador utilizando las imágenes etiquetadas. Selecciona la opción de Entrenamiento rápido, y entonces espera para que la iteración del entrenamiento este completa (esto puede tardar algunos minutos).

8. Cuando la iteración del modelo haya sido entrenada, revisa las métricas de Precisión, Recall y Performace estas miden la precisión de la predicción del modelo de clasificación, y deben ser todas altas.

   * La precisión indica la fracción de clasificaciones identificadas que son correctas. Por ejemplo, Si el modelo identifica 100 imágenes como perros, y 99 de estas fueran realmente de perros, entonces la precisión sería de 99%.
   * Recall indica la fraccion actual de clasificacines que han sido correctamente identificadas. Por ejemplo, si hay ralmente 100 imágenes de manzanas, y el modelo ha identificado 80 como manzanasif, el recall debería ser de 80%.
   * Medida de precición media es el valor del promedio de precisón(AP). AP es el área bajo la curva de precisión/recall (precisión trazada contra la llamada para cada predicción hecha).
![cv training](./../images/cv-training.png)


## Hito 2 - Prueba es modelo y genera un enlace de Custom Vision

Antes de publicar esta iteración del modelo para el uso en la aplicación tu debes probarlo.

1. Arriba de las métricas de desempeño, clic en 'prueba rápida'. Mira lo que regresa la predicción del modelo - la puntuación de probabilidad debe ser alrededor de 99%.
2. En la ventana de prueba rápida, selecciona en el campo de enviar imagen e ingresa la URL de la imágen que quieres usarpara tu prueba. Si en cambio tu quieres usar una imágen almacenada en tu almacenamiento local, selecciona  navegar en los archivos locales de imágenes.
3. La imágen que seleccionaste aparece en medio de la página. Entonces los resultados de la predicción aparecerán debajo de la imágen en forma de tabla con dos columnas, etiquetadas con etiquetas confiables. Despues mira los resultados, tu deberías estar cerca de la ventana de Prueba Rápida.
![ventana de prueba rápida](./../images/quick-test.png)

¡Ahora estas listo para publicar tu modelo entrenado y usarlo en una aplicación cliente!

Clic en publicar el modelo entrenado con las siguientes configuraciones:

        Nombre del modelo: Detección de retinopatía diabética 

        Recurso de predicción: El recurso de predicción que creaste previamente.

Después de publicar, clic en el icono de la URL de la predicción para ver la información requerida y publicar el modelo. Después, tu necesitarás la URL apropiada y los valores de predicción de la llave para obtener una imágen de la URL, mantén este cuadro de diálogo abierto y llévalo a la siguiente tarea.

## Hito 3 - Conecta el modelo de Custom Vision y Power App

Ve a https://make.powerapps.com y registrate con tu cuenta organizacional.

La siguiente figura muestra la ventana de desarrollo principal cuando entras al Power App Studio:

![studio 1](./../images/studio-1.png)

![studio 2](./../images/studio-2.png)

Ahora echaremos un vistazo a los pasos para conectar nuestra applicación de Custom Vision.

1. Necesitamos conectar a Custom Vision con nuestra fuente de datos ve a Data source→(busca Custom Vision) → Selecciona Custom Vision → Escoge a tabla/entidad.
![connección 1](./../images/connect-1.png)
2. Entonces se te pedirá ingresar la llave y la URL del sitio. Nosotros regresaremos a la pestaña de Performance de Custom Vision y encontraremos la llave de predicción como en la imágen de abajo(cubriremos las llaves específicas para eviar costos de uso de recursos).
![connección 2](./../images/connect-2.png)

Usaremos solamente una porción de la URL del archivo de la imágen como en la imágen de abajo.
![connection 3](./../images/connect-3.png)

Clic 'Conectar' después tu fuente de recursos de Custom Vision aparecerá en el panel de la izquierda.

## Hito 4 - Diseño de Power App
Ahora, crearemos el 'CameraTestScreen'
 * Primero, agrega la caracteristica 'Cámara' para la funcionalidad de detección en teléfonos o tablets. 
 ![Layout 1](./../images/layout-1.png)
 * Después, agrega un botón 'Scan'. Esta es una función OnSelect que debería ser similar a lo que se muestra abaj [ClearCollect](https://docs.microsoft.com/en-us/powerapps/maker/canvas-apps/functions/function-clear-collect-clearcollect), y lo llamaremos camercol 
 
 ![Diseño 2](./../images/layout-2.png)
 * Siguiente, vamos a insertar una galería para mostrar el proceso de escaneado, 
 ![Diseño 3](./../images/layout-3.png)
   * Cuando se le solicita, escoge camercol como el grupo de recursos
   * En propiedades escoge el diseño como 'título y subtítulo', y el color de la fuente como amarillo o como desees.
   ![Diseño 4](./../images/layout-4.png)
   * Después, clic 'Título 2' en el panel izquierdo. Modifica esta función como ThisItem.tagName y cambia el color de la fuente como amarillo o como tu desees.
   ![Diseño 5](./../images/layout-5.png)
   * Moviéndose a 'Subtítulo2' en el panel izquierdo, we are going to use it showing the percentage of positive or negative detection result. Modify its function as Round(ThisItem.probability*100,2)&"%" and change font color as yellow or as you like
   ![layout 6](./../images/layout-6.png)
 * Lastly, rename the screen name as 'CameraTestScreen'. 

La segunda pantalla es 'GalleryTestScreen', y se ve de esta manera 
![layout 7](./../images/layout-7.png)
 * Primero, vamos a agregar la función 'agregar foto'
 ![layout 8](./../images/layout-8.png)
  Debería generarse la caja como la de abajo
   ![layout 9](./../images/layout-9.png)
   
 * Entonces, agrega el botón 'Escanear'. Esto es la función "OnSelect" y debería ser similar a la de abajo, y la nombraremos como "gallerycol"
 ![layout 10](./../images/layout-10.png)
 * A continuación, vamos a insertar la galería, el proceso es similar como cuando agregamois la primera pantalla de cámara
 * Puedes probar el proceso de detección usando la vista previa!
 ![layout 11](./../images/layout-11.png)

Avanzando, vamos a construir la pantalla de navegación para cuando entremos en la aplicación. 
![layout 12](./../images/layout-12.png)
 * Cambiemos el fondo de pantalla a 'Black' and agregamos la imagen de fondo
 ![layout 13](./../images/layout-13.png)
 * Habrá una etiqueta para nuesta aplicación en la parte superior, y refiere a "Detector de Retinopatía Diabética", o algún nombre que tu prefieras
 ![layout 14](./../images/layout-14.png)
 * Agrega dos botones, uno 'Probar Cámara', y otro 'Cargar Imágen', modifica la función "OnSelect" para navegar haciendo click
 ![layout 15](./../images/layout-15.png)

 * Finalmente, agrega el boton 'Atrás' en las pantalla de cámara y galería para navegar hacia atrás a la pantalla principal
   * función de entrada: Navigate('Pantalla de navegación')
   ![layout 16](./../images/layout-16.png)

Después de realizar los pasos anteriores, tendrás un Power Apps con pantallas y funciones las cuales se veras como la imagen de abajo. 
![layout 17](./../images/layout-17.png)

La aplicación puede correr en teléfono, instala la aplicación de Power Apps Mobile en tu teléfono. Cuando se construya la aplicación, tu deberías poder probar la aplicación de la misma forma que un usuario normal.


## Hito 5 - Pruebas de precisión de la aplicación con nuevas entradas

Ahora tu aplicación esta construida, el siguiente paso es comenzar a probarla.

Pruebas unitarias
* Una prueba unitaria es es usada para revisar una función específica o característica de tu aplicación y ver que esta funcionando correctamente. 
* Comencemos por consultar las secciones de la fase de planificación y la fase de diseño para asegurarnos de probar todos los escenarios importantes. Asegúrate de dividir las pruebas para cada caracteristica o función. 
* Para probar los lienzos dentro de la aplicación, puedes construirla en la herramienta llamada Power Apps Test Studio para escribir, organizar, y automatizar las pruebas del lienzo de aplicaciones. Más información: https://docs.microsoft.com/powerapps/maker/canvas-apps/test-studio

Pruebas End-to-end
* Las pruebas End-to-end son usadas para revisar si la solución global funciona correctamente. 
* Puede realizar esta prueba siguiendo un escenario de prueba que se acerque al caso de uso del proceso empresarial real.

User acceptance test (Optional)
* A user acceptance test (UAT) is done by the user of the app instead of the maker. This test is to ensure that what has been built by the makers matches the requirements initially requested by the user.
* Prueba tu aplicación con tus familiares, amigos y otras personas con diferentes niveles en términos de TI y niveles de habilidades. This way, you can get a variety of feedback.
* Tú puedes revisar de forma rápida los problemas y ver recomendaciones para arreglarlos con el revisor de soluciones [solution checker](https://docs.microsoft.com/powerapps/maker/data-platform/use-powerapps-checker)

¡Felicidades! Has hecho tu primera aplicación, la has probado y esta lista para usarse. Ahora puedes [publicarla](https://docs.microsoft.com/powerapps/maker/canvas-apps/save-publish-app) and [share](https://docs.microsoft.com/powerapps/maker/canvas-apps/share-app) ¡el lienzo de tu aplicación!

## Comprobación de conocimientos

https://docs.microsoft.com/learn/modules/classify-images-custom-vision/3a-knowledge-check

https://docs.microsoft.com/learn/modules/get-started-with-powerapps/6-powerapps-quiz-get-started

## Siguientes pasos

[Aprende más sobre Custom Vision](https://docs.microsoft.com/learn/paths/explore-computer-vision-microsoft-azure/)

[Aprende más sobre creación de Canvas App](https://docs.microsoft.com/learn/paths/create-powerapps/)

[Construir un bot Bot con Azure Health para escenarios personalizados](https://docs.microsoft.com/learn/paths/create-bots-azure-health-bot/)

[Escuela de negocios de IA para la salud](https://docs.microsoft.com/learn/paths/ai-business-school-healthcare)

Panel de Computer Vision en el cuidado de la salud en [este vídeo](https://www.youtube.com/watch?v=dbISoN71rrY)

## Practica tus habilidades

Puedes modificar tu aplicación para analizar imágenes, incluyendo la generación de subtítulos, extracción de etiquetas relevantes, identificación de objetos, determinar el tipo de imágen y metadatos. detección de rostros humanos, conocimiento de marcas y celebridades, y más. Encontrarás más sobre el uso de los servicios de Computer Vision en la [documentación del servicio](https://docs.microsoft.com/azure/cognitive-services/computer-vision/).

Con Power Apps, tu puedes:

Construir una aplicación de forma rápida usando las habilidades que has adquirido.

Conectar con los servicios en la nube y fuentes de datos que tu has usado ya.

Comparte tus aplicaciones al instante para que tus compañeros de trabajo puedan utilizarlas en sus teléfonos y tabletas..

## Feedback

Asegurate de dar [feedback sobre este taller](https://forms.office.com/r/MdhJWMZthR)!

[Código de conducta](../../CODE_OF_CONDUCT.md)

