from flask import Flask, redirect, url_for, request, render_template, session
import requests
import os
import uuid
import json
from dotenv import load_dotenv
load_dotenv()


app = Flask(__name__)


@app.route('/', methods=['GET'])
def index():
    return render_template('index.html')


@app.route('/', methods=['POST'])
def index_post():
    # Lee los valores del Formulario
    original_text = request.form['text']
    target_language = request.form['language']

    # Carga los valores de .env
    key = os.environ['KEY']
    endpoint = os.environ['ENDPOINT']
    location = os.environ['LOCATION']

    # Indicar lo que queremos traducir, la versión de la API (3.0) y seleccionar idioma
    path = '/translate?api-version=3.0'
    # Agregamos el parametro seleccionar idioma
    target_language_parameter = '&to=' + target_language
    # Creamos la URL Completa
    constructed_url = endpoint + path + target_language_parameter

    # Configurar la información del "header", que incluye nuestra clave de suscripción
    headers = {
        'Ocp-Apim-Subscription-Key': key,
        'Ocp-Apim-Subscription-Region': location,
        'Content-type': 'application/json',
        'X-ClientTraceId': str(uuid.uuid4())
    }

    # Creamos el "body" del request con el texto a traducir
    body = [{'text': original_text}]

    # Hacemos la llamada usando POST
    translator_request = requests.post(
        constructed_url, headers=headers, json=body)
    # Obtenemos la respuesta en JSON
    translator_response = translator_request.json()
    # Obtenemos la traduccion
    translated_text = translator_response[0]['translations'][0]['text']

    # Llamamos el Render Template, pasando el texto traducido,
    # el texto original e idioma seleccionado del Template
    return render_template(
        'results.html',
        translated_text=translated_text,
        original_text=original_text,
        target_language=target_language
    )
