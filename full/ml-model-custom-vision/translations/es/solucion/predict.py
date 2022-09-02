# Cliente de predición
from azure.cognitiveservices.vision.customvision.prediction import CustomVisionPredictionClient
# Key class para azure
from msrest.authentication import ApiKeyCredentials
# dotenv para cargar key
from dotenv import load_dotenv
# Importa os para leer variables de entorno
import os

# Cargar key y valores de punto final (endpoints)
load_dotenv()

# Establecer los valores en variables
key = os.getenv('KEY')
endpoint = os.getenv('ENDPOINT')
project_id = os.getenv('PROJECT_ID')
published_name = os.getenv('PUBLISHED_ITERATION_NAME')

# Credenciales de configuración para el cliente
credentials = ApiKeyCredentials(in_headers={'Prediction-key':key})

# Crear cliente, que se utilizará para hacer predicciones
client = CustomVisionPredictionClient(endpoint, credentials)

# Abre el archivo de prueba
with open('../testing-images/american-staffordshire-terrier-10.jpg', 'rb') as image:
    # Realizar la predicción
    results = client.classify_image(project_id, published_name, image.read())

    # Debido a que podría haber múltiples predicciones, recorremos cada una de ellas.
    for prediction in results.predictions:
        # Muestra el nombre de la raza y el porcentaje de probabilidad
        print(f'{prediction.tag_name}: {(prediction.probability):.2%}')