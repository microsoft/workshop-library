# Python HTTP API para utilizar con GitHub Codespaces

_Ejecuta una API de Python con este repositorio listo para usar en minutos_

Al abrir este repositorio de plantillas en Codespaces, puedes iniciar rápidamente con una aplicación web de Python que sirve a una API HTTP mediante  [FastAPI](https://fastapi.tiangolo.com/) framework. 
Podrás centrarse en trabajar con el proyecto en lugar de la instalación y la configuración.


🤔 ¿Curioso? Mira el siguiente vídeo donde te explicamos todos los detalles:

[![Video de Entorno de desarrollo Python con Codespaces](../../images/banner.gif)](https://youtu.be/_i9Pywj3rSg "Entorno de desarrollo Python con Codespaces")

## Sobre Codespaces

Al utilizar Codespaces, tu tendrás [Visual Studio Code](https://visualstudio.microsoft.com/?WT.mc_id=academic-77460-alfredodeza) en la nube, utilizando un ["contenedor para desarrolladores"](https://containers.dev/). Como una versión local de [Visual Studio Code](https://visualstudio.microsoft.com/?WT.mc_id=academic-77460-alfredodeza), la versión en la nube también te permite instalar extensiones y usar un terminal.

También puedes configurar el contenedor de desarrolladores para que ejecutes un runtime específico y haga que arranque con tus extensiones favoritas.

## Lo que aprenderás y los requisitos para este taller

| **Objetivos**              | Descripción                                    |
| ----------------------------- | --------------------------------------------------------------------- |
| **Lo que vas a aprender**       | you will customize your environment in codespaces and manage APIs               |
| **Requisitos:**          | Una cuenta de [GitHub](https://github.com), acceso a [Codespaces](https://github.com/features/codespaces) y el [FastAPI framework](https://fastapi.tiangolo.com/) |
| **Duración**                  | 35 minutes                                                                |
| **Diapositivas**                  | [slides](./slides_es.pptx) |

## Enlace para esta plantilla y sus recursos

En esta plantilla [Python HTTP API para usar con GitHub Codespaces](https://github.com/microsoft/codespaces-project-template-py) se encuentran todos los recursos que **necesitas para hacer la presentación completa a su audiencia**.

Esta plantilla también está lista para ser utilizada con [Codespaces](https://github.com/features/codespaces), un entorno para desarrolladores que se ejecuta en la nube con [Visual Studio Code](https://visualstudio.microsoft.com/?WT.mc_id=academic-77460-alfredodeza).

<details>
   <summary><strong>Aprende más sobre las APIs</strong></summary>

   Una API (Interfaz de programación de aplicaciones) describe una forma en que dos equipos interactúan.
   Una API HTTP permite que un equipo conectado a Internet envíe una solicitud HTTP a otro equipo conectado a Internet y recibirá una respuesta. Por ejemplo, mi equipo podría enviar una solicitud a `http://a-weather-website-api.com/api/city=Los+Angeles` y recibirá datos como  `{"high": 72, "low": 66}`.

   Las API HTTP a menudo proporcionan datos o funcionalidad que es exclusiva de un servicio, como la API de ejemplo para el sitio web meteorológico. Un sitio web meteorológico podría proporcionar endpoints de API adicionales para otras funciones relacionadas con el clima, como próximos pronósticos o datos históricos. Cualquier sitio web puede decidir ofrecer una API si cree que tiene una funcionalidad útil para compartir con otras computadoras. **En este proyecto, ejecutarás una API HTTP que genera un token aleatorio.**


</details>

## 🚀 Siguientes pasos

¡Lleva esta aplicación API al siguiente nivel e impleméntela en la nube! Para este desafío de aprendizaje, utilizaras una opción de implementación GRATUITA para Azure y GitHub Actions para la automatización.

Antes de continuar, asegúrate de tener una cuenta de Azure lista. Selecciona cualquiera de las siguientes opciones

- [Inicie sesión en su cuenta de Azure](https://azure.microsoft.com/en-US/?WT.mc_id=academic-77460-alfredodeza)
- [Crear una cuenta de Azure para estudiantes (no se requiere tarjeta de crédito)](https://azure.microsoft.com/free/students/?WT.mc_id=academic-77460-alfredodeza)
- [Creación de una nueva cuenta de Azure](https://azure.microsoft.com/en-US/?WT.mc_id=academic-77460-alfredodeza)

Hay algunos pasos involucrados, ¡así que asegúrate de hacer todo bien!

<details>
<summary><b>Crea un Azure App Service</b></summary>

¡Ahora, vas a configurar la implementación automática de la aplicación usando Azure más GitHub Actions! Sin embargo, primero debes configurar algunos servicios de Azure.

1. Abre [Azure Cloud Shell](https://shell.azure.com/?WT.mc_id=academic-77460-alfredodeza).
1. Usa el Bash Shell (¡no PowerShell!) para estos pasos.
1. Si dice "You have no storage mounted", seleccione una suscripción en su cuenta y haga clic en "Create storage". Cloud Shell utiliza ese recurso de almacenamiento para almacenar los datos generados durante las sesiones de shell.

1. Crea un *Resource Group* que agrupe los diferentes recursos de Azure usados para la aplicación:

```
az group create --name demo-fastapi --location "East US"
```
1. Veras una respuesta JSON con detalles sobre el recurso recién creado, para este comando y todos los comandos que siguen.
1. Crea el *App Service Plan* **GRATIS**:
```
az appservice plan create --name "demo-fastapi" --resource-group demo-fastapi --is-linux --sku FREE
```
1. Crea un identificador aleatorio para un nombre de aplicación web único:
```
let "randomIdentifier=$RANDOM*$RANDOM"
```
1. Crea el *Web App Service* con un contenedor placeholder utilizando la variable 'randomIdentifier' de antes:
```
az webapp create --name "demo-fastapi-$randomIdentifier" --resource-group demo-fastapi --plan demo-fastapi --runtime "PYTHON:3.9"
```
1. Dirígete al Portal de Azure [App Services list](https://portal.azure.com/#view/HubsExtension/BrowseResource/resourceType/Microsoft.Web%2Fsites) y confirma que el servicio recién creado aparece en la lista.
</details>


<details>
<summary><b>Creación de un Azure Service Principal</b></summary>

A continuación, crea un Azure Service Principal, este es un tipo especial de cuenta que tiene los permisos necesarios para autenticarse desde GitHub a Azure:

1. Busca el ID de tu suscripción de Azure [en el Portal de Azure](https://portal.azure.com/#view/Microsoft_Azure_Billing/SubscriptionsBlade?WT.mc_id=academic-77460-alfredodeza) o [siguiendo esta guía](https://learn.microsoft.com/azure/azure-portal/get-subscription-tenant-id?WT.mc_id=academic-77460-alfredodeza).
1. Crea un Service Principal con un rol de "contributor" que permita realizar cambios en cualquier recurso de esa suscripción. Reemplace $AZURE_SUBSCRIPTION_ID por el ID que encontraste en el paso 1 y ejecuta este comando:


```
az ad sp create-for-rbac --name "CICD" --role contributor --scopes /subscriptions/$AZURE_SUBSCRIPTION_ID --sdk-auth
```

1. Captura la salida y agrégala como un [Secreto del repositorio de Github](/../../settings/secrets/actions/new) con el nombre `AZURE_CREDENTIALS`.

</details>

<details>

<summary><b>Configura GitHub Actions</b></summary>

Ahora que ha creado todos los recursos de Azure, debes actualizar el archivo del workflow de GitHub Action con el nombre de su aplicación web.

1. Busca el nombre de tu aplicación. Debería tener un aspecto similar a `demo-fastapi-97709018` pero con un número aleatorio diferente al final, y puedes encontrarlo en Azure Portal o con los comandos de Cloud Shell.
2. Abre el archivo [.github/workflows/web_app.yml](/.. /.. /edit/main/.github/workflows/web_app.yml) y actualiza el valor de `AZURE_WEBAPP_NAME` al nombre de tu aplicación.

</details>

<details>
<summary><b>🏃 ¡Sube tu app!</b></summary>

Antes de continuar, verifica lo siguiente:

1. Has creado un Azure Service Principal y la has guardado un [repositorio secreto](/../../settings/secrets/) como `AZURE_CREDENTIALS`.
1. Has creado un [App Service](https://portal.azure.com/#view/HubsExtension/BrowseResource/resourceType/Microsoft.Web%2Fsites) con un nombre válido y el sitio ya está disponible con el contenido estático predeterminado.

Para implementar:

1. Ve a [acciones del repositorio](/../../actions/workflows/web_app.yml)y haz clic en _Run workflow_ y luego en el botón verde para ejecutarlo.

**La implementación puede tardar un par de minutos**. Asegúrate de ver los registros en Azure Cloud Shell para comprobar el progreso:

```
az webapp log tail --name $AZURE_WEBAPP_NAME --resource-group $AZURE_RESOURCE_GROUP
```

### Eliminando recursos cuando se complete

Después de la implementación, asegúrate de limpiar los recursos eliminando el grupo de recursos. Puedes hacerlo en Azure Cloud Shell haciendo referencia al nombre del grupo que creó inicialmente (`demo-fastapi` en los ejemplos):

```
az group delete --name demo-fastapi
```

### Solución de problemas de implementación

Al implementar, es posible que encuentres errores o problemas, ya sea en la parte de automatización (GitHub Actions) o en el momento de implementarlo (Azure Web Apps).

Si tienes problemas, comprueba los registros en el portal o usa lo siguiente con la CLI de Azure:

```
az webapp log tail --name $AZURE_WEBAPP_NAME --resource-group $AZURE_RESOURCE_GROUP
```

Actualice ambas variables para que coincidan con tu entorno.

</details>


## Otros recursos

- [FastAPI](https://fastapi.tiangolo.com/)
- [Codespaces](https://github.com/features/codespaces)
- [Usar contenedores de desarrollo localmente](https://github.com/Microsoft/vscode-remote-try-python)


## Comentarios y sugerencias

¡Asegurate de compartir tus comentarios sobre este taller [aquí!](https://forms.office.com/r/MdhJWMZthR)!

[Código de conducta](../../CODE_OF_CONDUCT.md)
