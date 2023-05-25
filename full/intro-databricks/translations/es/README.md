# Leer y escribir datos en Azure Databricks

Databricks es una plataforma para trabajar con _big data_. Azure tiene una integración sólida con Databricks, lo que facilita la configuración y el trabajo con _datasets_.

## Objetivos

En este taller, utilizarás Databricks, una poderosa plataforma para trabajar con big data. Repasaremos la lectura y escritura de diferentes tipos de datos en Azure Databricks como JSON, Parquet y CSV. También aprenderás a leer y operar con datos almacenados en Databricks.

| **Objetivo** | Descripción |
| -------------------------------------------- | ---------------------------------------------------------------------- |
| **Qué aprenderás** | Lee y escribe diferentes tipos de datos en Azure Databricks |
| **Lo que necesitarás** | Una suscripción de Azure: <br> - [Prueba gratuita de Azure](https://azure.microsoft.com/free/?WT.mc_id=academic-56680-alfredodeza) <br> - [Azure para estudiantes ](https://azure.microsoft.com/free/students/?WT.mc_id=academic-56680-alfredodeza)</li></ul> |
| **Duración** | 1 hora |
| **Diapositivas** | [Powerpoint](../../slides.pptx) |

## Video

Vídeo próximamente!

## Pre-aprendizaje

- [Describir Azure Databricks](https://docs.microsoft.com/es-es/learn/modules/describe-azure-databricks/?WT.mc_id=academic-56680-alfredodeza)

## Requisitos previos

Los asistentes deben tener una cuenta de Azure. Hay varias opciones que te pueden dar créditos gratis:

- [Prueba gratuita de Azure](https://azure.microsoft.com/free/?WT.mc_id=academic-56680-alfredodeza)
- [Azure para estudiantes](https://azure.microsoft.com/free/students/?WT.mc_id=academic-56680-alfredodeza)

Para este taller, los estudiantes revisarán [Leer y escribir datos en Azure Databricks](https://docs.microsoft.com/es-es/learn/modules/read-write-data-azure-databricks/?WT.mc_id=academic-56680-alfredodeza), un módulo de aprendizaje que lo dirigirá a importar un Notebook de Jupyter para ejecutar procesos usando Databricks. Estos notebooks te mostrarán cómo leer y escribir datos en Azure Databricks.

## Lo que los estudiantes aprenderán

Databricks es una de las plataformas más destacadas para manejar big data y realizar tareas colaborativas en Data Science. Este taller cubrirá cómo comenzar con la plataforma en Azure y realizar interacciones de datos, incluida la lectura, escritura y análisis de conjuntos de datos.

Leer datos:
![Imagen de trabajo con un cuaderno](../../images/workspace.png)

Trabajar con notebookx:
![Imagen de la importación de libretas](../../images/notebook.png)

Importar cuadernos:
![Imagen de cuadernos en un área de trabajo de Databricks](../../images/import.png)

Asociar un clúster a un lugar de trabajo:
![Imagen de un clúster de Databricks](../../images/cluster.png)

## Paso 1: Leer datos en formato CSV

[Comienza aquí](https://docs.microsoft.com/es-es/learn/modules/describe-azure-databricks/5-exercise-work-notebooks?WT.mc_id=academic-56680-alfredodeza) para crear un clúster de Azure Databricks e ir a través del cuaderno para leer los datos. Este cuaderno cubrirá lo siguiente:

- Cubrir la clase `SparkSession`
- Lee un archivo TSV (valor separado por tabuladores) muy simple
- Transforma el TSV en un archivo CSV (valores separados por comas)
- Lee el archivo CSV con un esquema inferido y luego con un esquema definido por el usuario

## Paso 2: Leer datos en formato JSON

Continúa con el siguiente cuaderno para leer datos JSON después de completar el cuaderno CSV. Realiza los pasos necesarios para leer y cargar los datos JSON en Databricks. En esta sección vas a:

- Cargar un archivo JSON en Databricks
- Usar la inferencia para detectar automáticamente los tipos de valores y datos en el archivo JSON
- Con `pyspark`, crearás un esquema definido por el usuario para cargar JSON

## Paso 3: Leer datos en formato Parquet

Trabaja con el siguiente cuaderno (_3. Lectura de datos - Parquet_) para cargar archivos de Parquet que generalmente vienen con un esquema predefinido. Al igual que con otros pasos, en esta sección podras:

- Cargar un archivo de Parquet con un esquema predefinido
- Comprender por qué los archivos de Parquet generalmente vienen con un esquema
- Leer datos del archivo Parquet y visualizar algunos de sus detalles


## Paso 4: leer datos almacenados en tablas y vistas

Carga el siguiente cuaderno _4.Lectura de datos: tablas y vistas_ en Databricks para leer los datos almacenados en tablas y vistas. En esta sección verás cómo registrar tablas y leer desde una tabla o vista, estos incluirán:

- Registrar una tabla en Databricks
- Use un archivo TSV para crear una nueva tabla
- Visualizar los datos cargados en la interfaz de usuario
- Crear una vista temporal

## Paso 5: Escribir datos

Finalmente, anda al último cuaderno (_5. Escritura de datos_) donde usarás archivos de Parquet para escribir datos. Cubrirás la carga de un archivo TSV en Databricks y luego lo guardarás como un archivo Parquet usando la API de Python `Pyspark`.

## Prueba

Verifiqua tus conocimientos con [una breve prueba](https://docs.microsoft.com/es-es/learn/modules/read-write-data-azure-databricks/8-knowledge-check?WT.mc_id=academic-56680-alfredodeza)

## Próximos pasos

Hay una ruta de aprendizaje un poco más avanzada y complicada que cubre [Ingeniería de datos con Azure Databricks](https://docs.microsoft.com/es-es/learn/paths/data-engineer-azure-databricks/?WT.mc_id=academic-56680-alfredodeza).

## Práctica

En este taller usaste pequeños conjuntos de datos con los que es fácil trabajar. Intenta usar conjuntos de datos más grandes para aprovechar una plataforma como Databricks.

## Feedback

¡Asegúrese de dar [comentarios sobre este taller](https://forms.office.com/r/MdhJWMZthR)!

[Código de conducta](../../CODE_OF_CONDUCT.md)

## Módulo de referencia

[Leer y escribir datos en Azure Databricks](https://docs.microsoft.com/es-es/learn/modules/read-write-data-azure-databricks/?WT.mc_id=academic-56680-alfredodeza)