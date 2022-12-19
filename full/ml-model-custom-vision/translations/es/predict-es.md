# Parte 2: Utiliza el modelo

Con el modelo entrenado, es momento de centrar nuestra atención en su uso. Comenzaremos probándolo en el sitio web de Custom Vision. Luego, exploraremos cómo podemos llamar al modelo desde el código usando un SDK. 

## Probar el modelo
Veamos que tan bien funciona nuestro modelo. Es importante usar imágenes que no se usaron para entrenar el modelo. Después de todo, si el modelo ya ha visto la imagen, sabrá la respuesta. 

1. Selecciona **Quick Test**
2. Selecciona  **Buscar en archivos locales**
4. Navega a [**imagenes de prueba**](../../testing-images/) y selecciona una de las imágenes de perros
5. Selecciona **Abrir**
6. Observe las puntuaciones de **Etiqueta/Categoria** _tag_ y **Probabilidad**

## Publica el modelo

El objetivo de crear un modelo en Custom Vision es usarlo en diferentes aplicaciones. Para poder acceder al modelo fuera del sitio web, este debe de publicarse. 

1. En la pestaña de 'Rendimiento', selecciona **Publicar**
3. Para **Nombre de Modelo** escribe **perros**
4. Para **Recurso de Predicción** selecciona la clave de predicción que has creado previamente
5. Selecciona **Publicar**
6. Selecciona **URL de Prediccion** para ver la dirección del endpoint
7. Copia el valor en el recuadro gris debajo de  **Si tiene un archivo de imagen** y péguelo en algún lugar local donde pueda encontrarlo más tarde
8. Selecciona **Entendido**


## Obtener claves y valores

Como con cualquier servicio, necesitamos recopilar las claves y los valores para realizar nuestras llamadas. Copia estas claves en un archivo de texto; ya que se utilizarán en el siguiente paso. 

1. En la pantalla **Rendimiento**, selecciona **URL de Predicción**
1. Copia la URL que esta debajo de **Si tiene un archivo de imagen**; esto se usará para crear el endpoint
2. Copia el valor hexadecimal de la **Llave de Predicción**. Esta luce similar a: *ba81ed4539cd46ec979a98569035a463*
3. Selecciona **Entendido** para cerrar la ventana
4. En la esquina superior derecha de la interfaz de Custom Vision, selecciona el ícono de **Engranaje** para la configuración 
5. Copia el valor de **id del Proyecto**

> Consejo: **Id del Proyecto** es el valor en el lado izquierdo de la pantalla

### Crear el valor del endpoint

El SDK para Custom Vision utiliza una URL ligeramente diferente a la copiada anteriormente. El valor que copiaste tendrá un aspecto similar al siguiente: 

> `https://customvisionworkshop-prediction.cognitiveservices.azure.com/customvision/v3.0/Prediction/0dd3299b-6a41-40fe-ab06-dd20e886ccd4/classify/iterations/Iteration1/image`

Para crear el valor de endpoint, borra todo después de **azure.com**. Tu valor de endpoint, debe lucir asi:

> `https://customvisionworkshop-prediction.cognitiveservices.azure.com/`

## Almacenar las credenciales necesarias

Siempre que esté escribiendo código, es una buena práctica nunca codificar valores confidenciales, como contraseñas o cualquier valor que pueda cambiar. Esto puede dar lugar a abrir brechas de seguridad o código que es difícil de mantener. Para crear nuestra aplicación, vamos a seguir las mejores prácticas generalmente aceptadas. Para hacer esto, usaremos una biblioteca llamada [python_dotenv](https://github.com/theskumar/python-dotenv), la cual permite establecer variables de entorno con un archivo de texto.

1. Regresa a Visual Studio Code
2. En la carpeta raíz de este proyecto, crea un nuevo archivo llamado **.env**
3. Agrega los siguientes valores, reemplazando los marcadores de posición

    ```bash
    ENDPOINT=<YOUR_ENDPOINT>
    KEY=<YOUR_PREDICTION_KEY>
    PROJECT_ID=<YOUR_PROJECT_ID>
    PUBLISHED_ITERATION_NAME=perros
    ```

1. Guarda el archivo seleccionando **Archivo** > **Guardar**

## Instalar los paquetes

Usaremos dos paquetes de Python para apoyar nuestro proyecto. El primero ya lo presentamos, **python-dotenv**. El siguiente es la [librería cliente de Custom Vision (o SDK)](https://docs.microsoft.com/azure/cognitive-services/custom-vision-service/quickstarts/image-classification?tabs=visual-studio&pivots=programming-language-python&WT.mc_id=academic-49102-chrhar), que se usará para hacer las predicciones. 

1. Crea un nuevo archivo llamado **requirements.txt**
2. Dentro de **requirements.txt**, agrega lo siguiente: 

    ```bash
    python-dotenv
    azure-cognitiveservices-vision-customvision
    ```

1. Guarda el archivo seleccionado **Archivo** > **Guardar**
2. Abre una nueva ventana de terminal dentro de Visual Studio Code seleccionando **Terminal** > **Nueva Ventana de Terminal**
3. Crea un nuevo entorno de Python e instala los paquetes ejecutando el siguiente comando: 

    ```bash
    # En Windows
    python3 -m venv venv
    .\venv\Scripts\activate
    pip install -r requirements.txt

    # En Linux, WSL o macOS
    python3 -m venv venv
    source venv/bin/activate
    pip install -r requirements.txt
    ```

1. Los paquetes se instalarán. 

## Creando el programa

Con el trabajo de configuración realizado, ¡es hora de agregar tu código! Dividiremos esto en algunas secciones.


1. Crea un nuevo archivo llamado **predict.py**

### Importar las librerias

La mayoría de las aplicaciones de Python comienzan importando las bibliotecas requeridas, y nuestro programa seguirá el mismo patrón. 

1. Dentro de **predict.py**, agregue lo siguiente para importar las bibliotecas necesarias: 

    ```python
    # Cliente de predicción
    from azure.cognitiveservices.vision.customvision.prediction import CustomVisionPredictionClient
    # Clase llave para Azure
    from msrest.authentication import ApiKeyCredentials
    # dotenv para cargar la clave
    from dotenv import load_dotenv
    # Importar el módulo os para leer las variables de entorno
    import os
    ```

### Carga las variables

Anteriormente configuramos algunas variables de entorno como nuestra clave y endpoint. Vamos a cargarlos en la memoria. 

1. Al final de **predict.py**, agrega el siguiente código para cargar las variables de entorno

    ```python
    # Carga los valores de clave y endpoint
    load_dotenv()
    
    # Establece los valores en variables
    key = os.getenv('KEY')
    endpoint = os.getenv('ENDPOINT')
    project_id = os.getenv('PROJECT_ID')
    published_name = os.getenv('PUBLISHED_ITERATION_NAME')
    ```

### Realiza la predicción

¡Ahora podemos realizar nuestra predicción! Usaremos una de las [imágenes de la carpeta de prueba](../../testing-images/).


1. Al final de **predict.py**, agrega el siguiente código para realizar la predicción de una raza de perro

    ```python
    # Configura las credenciales para el cliente
    credentials = ApiKeyCredentials(in_headers={'Prediction-key':key})
    
    # Crea el cliente, el cual se utilizará para hacer predicciones
    client = CustomVisionPredictionClient(endpoint, credentials)
    
    # Abre el archivo de prueba
    with open('testing-images/american-staffordshire-terrier-10.jpg', 'rb') as image:
        # Realiza la predicción
        results = client.classify_image(project_id, published_name, image.read())
    
        # Debido a que podría haber múltiples predicciones, recorremos cada una de ellas.
        for prediction in results.predictions:
            # Muestra el nombre de la raza y el porcentaje de probabilidad
            print(f'{prediction.tag_name}: {(prediction.probability):.2%}')
    ```

## Ejecutar el programa

Con el programa creado, ¡es momento de ejecutarlo y ver que pasa!


1. Guarda todos los archivos seleccionando **Archivo** > **Guardar Todo**
2. Regresa a la terminal dentro de Visual Studio Code seleccionando **Vista** > **Terminal**
3. Ingresa el siguiente comando para ejecutar el programa

    ```bash
    python predict.py
    ```

1. Ahora debería ver el siguiente resultado: 

    ```bash
    american-staffordshire-terrier: 97.11%
    german-wirehaired-pointer: 1.46%
    australian-shepherd: 0.97%
    buggle: 0.46%
    shorkie: 0.00%
    ```

    > **Nota**: Es posible que sus porcentajes no coincidan exactamente con los anteriores

## Resumen
¡Felicidades! Has creado y llamado con éxito un modelo de Custom Vision (visión personalizada). El modelo que creaste se puede utilizar para clasificar tipos de imágenes. También puedes crear modelos para detectar ciertos objetos en una imagen. Si quieres seguir desarrollando tus habilidades:

- [Detección de Objetos con Custom Vision](https://docs.microsoft.com/learn/modules/detect-objects-images-custom-vision/?WT.mc_id=academic-49102-chrhar)
- [Creando modelos personalizados con TensorFlow](https://docs.microsoft.com/learn/paths/tensorflow-fundamentals/?WT.mc_id=academic-49102-chrhar)
