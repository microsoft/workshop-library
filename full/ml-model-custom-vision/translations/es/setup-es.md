# Parte 0: Instalar y configurar herramientas

Cómo con cualquier proyecto, se necesitarán algunas herramientas. En particular, un editor de código, una suscripción de Azure, y un par de claves para Custom Vision. 

## Instalando el editor

Visual Studio Code es un editor de código abierto en el cual se puede utilizar para crear casi cualquier tipo de proyecto con cualquier lenguaje de programación. Si aún no tienes instalado Visual Studio Code, puedes instalarlo visitando [code.visualstudio.com](https://code.visualstudio.com). También necesitaras la [extensión de Pylance](https://marketplace.visualstudio.com/items?itemName=ms-python.vscode-pylance), que proporcionará funcionalidad adicional al escribir en Python.

## Obtención del proyecto inicial

Se ha proporcionado un proyecto inicial que incluye las imágenes para el taller y la solución del código. Para obtener el proyecto: 

1. Visita [https://github.com/microsoft/workshop-library/](https://github.com/microsoft/workshop-library/). 
1. Selecciona **Use this template** _en español: utiliza esta plantilla_ para crear una copia del repositorio en tú cuenta de GitHub.
1. Nombra el nuevo repositorio **workshop-library**. 
1. Selecciona **Create repository from template**. 
1. Cuando se abra el nuevo repositorio, selecciona **Code**. 
1. Selecciona la pestaña **Local** y después el botón de **Copiar**. 


    ![icono de copiar](../../images/copy.png)
    
1. Abre la ventana de comando o terminal y ejecute lo siguiente, reemplazando \<URL\> con la URL que copió en el paso anterior. 

    ```bash
    # Windows
    git clone <URL>
    cd workshop-library\full\ml-model-custom-vision
    code .

    # Linux, WSL or macOS
    git clone <URL>
    cd workshop-library\full\ml-model-custom-vision
    code .
    ```

## Registro en Azure para Estudiantes

Azure para Estudiantes ofrece $100 US en crédito gratis para ser usado a través de 12 meses y una gran cantidad servicios gratis - ¡Custom Vision incluido! Si aún no tienes una suscripción de Azure, puedes registrarte en [Azure para Estudiantes](https://azure.microsoft.com/free/students) usando tú correo institucional. Si tu dirección de correo no funciona, solicita apoyo en tu institución. 

## Creando las claves

Para usar Custom Vision, necesitará dos claves: 

- Una clave de entrenamiento, utilizada para crear el modelo. 
- Una clave de predicción, utilizada para hacer predicciones basadas en el modelo. 

Crearemos estas claves usando el Portal de Azure. 


1. Visita esta página web [portal.azure.com](https://portal.azure.com)
1. Selecciona **Crear un Recurso**
1. Busca **Custom Vision** y presiona enter
1. Selecciona **Custom Vision** de la lista de servicios
1. Selecciona **Crear**.  
1. En **Opciones de Creación** asegúrese de que **Ambos** esté seleccionado. 
2. Debajo de **Detalles del Proyecto** configure lo siguiente: 
    1. En **Suscripción**  seleccione su suscripción de Azure para Estudiantes. 
    1. En **Grupo de Recursos** seleccione **Crear nuevo**, introduzca  **custom-vision** para el nombre, y seleccione **OK**. 
4. Debajo de **Detalles de Instalación** configure lo siguiente: 
    1. En **Región** selecciona una región cercana a ti. 
    1. En **Nombre**, proporciona un nombre único cómo  **custom-vision-tu-nombre**, reemplazando **tu-nombre** con el tuyo. 
6. Para **Tarifas de costos de formación** y **Tarifas de costos de predicción** selecciona **Gratis F0**.
7. Selecciona **Revisar + Crear**.
8. Selecciona **Crear**.


## Resumen

Ahora cuentas con todas las herramientas necesarias para crear y usar un modelo de Custom Vision. El siguiente paso es: [Entrenar tu modelo](./train-es.md).
