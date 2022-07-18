# Parte 1: Entrenar tu modelo

Un modelo personalizado de Vision. 

## Crear el proyecto

Este proyecto es un modelo de Custom Vision (vision personalizada), se utiliza para etiquetar imágenes con la categoría adecuada, y se somete a entrenamiento. ¡Comencemos creando un proyecto!


1. Ingresa a la página web de [Custom Vision](https://www.customvision.ai?WT.mc_id=academic-49102-chrhar) e inicia sesión. 
4. Selecciona **Nuevo Proyecto**
5. Escribe **Clasificación de Perros** para el nombre del proyecto. 
6. Junto a Recurso, selecciona la clave que has creado previamente, cuyo nombre será el que has creado en [Configuración](setup-es.md).
7. Para **Tipo de Proyecto** selecciona **Clasificación**
9. Para **Tipos de Clasificación** selecciona  **Multiclase**, ya que nuestros perros solo tendrán una raza. 
10. Para **Dominios** selecciona **General \[A2\]**
11. Selecciona **Crear proyecto**

## Subir imágenes

Una vez que nuestro proyecto ha sido creado, es el momento de subir nuestras imágenes. Estas serán utilizadas para entrenar el modelo. 

> **Consejo**: Como regla general, cuantas más imágenes puedas utilizar para entrenar el modelo, mejor. Busca incluir la mayor variedad de imágenes posibles, que incluyan diferente iluminación, ángulos, y configuraciones.  


1. Selecciona **Agregar imágenes**
3. Navega a **Imágenes de entrenamiento**
4. Selecciona todas las imágenes marcadas como **american-staffordshire-terrier** en la carpeta, y seleccione **Abrir**
5. Ingrese **american-staffordshire-terrier** para la etiqueta y seleccione **Subir 8 archivos**
6. Seleccione **Hecho**
8. Repita los pasos anteriores para las razas restantes: 
    - **australian-shepherd**
    - **buggle**
    - **german-wirehaired-pointer**
    - **shorkie**
9. Seleccione **Entrenar** para abrir el diálogo de entrenamiento. 
10. Deje **Quick Training** seleccionado y seleccione **Entrenar** para comenzar el entrenamiento. 

> **Nota**: Entrenar el modelo puede tomar un par de minutos. 

## Resumen

¡Felicidades! Ha entrenado un modelo de Custom Vision _(personalizado de Vision)_ que puede detectar tipos de perros. A continuación [probará y usará el modelo](./predict-es.md)
Congratulations! You have trained up a custom vision model which can detect dog types. Next you'll 
