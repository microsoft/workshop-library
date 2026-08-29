# ¡Tu propio portafolio con JavaScript y GitHub Codespaces!

_Crea, personaliza e implementa tu propio portafolio web en minutos._  ✨

En esta plantilla tenemos el entorno de desarrollo, la base establecida y lista para funcionar. Para que puedas iniciar inmediatamente Codespaces y personalizarlo sin configuración.

En esta plantilla podrás "elegir tu propia aventura": tenemos una aplicación web basada en [React](https://reactjs.org/) lista para que puedas personalizarla e implementarla fácilmente utilizando solo tu navegador web.


![Aplicación web de perfil JavaScript](../../images/js-portfolio-site.gif "Aplicación web de perfil JavaScript")

## Acerca de Codespaces

Con Codespaces, obtienes [Visual Studio Code](https://visualstudio.microsoft.com/?WT.mc_id=academic-80067-sagibbon) en la nube, mediante un ["contenedor de desarrollo"](https://containers.dev/). Al igual que una versión que se ejecuta localmente de [Visual Studio Code](https://visualstudio.microsoft.com/?WT.mc_id=academic-80067-sagibbon), la versión en la nube también te permite instalar extensiones y usar un terminal.

## Qué aprenderás y requisitos para este taller

| **Objetivos**              | Descripción                                    |
| ----------------------------- | --------------------------------------------------------------------- |
| **Lo que vas a aprender**       | La personalizacion de Codespaces, desarrollo web e implementación de aplicaciones web     |
| **Lo que vas a necesitar**          | <ul><li>[Cuenta de GitHub](https://github.com)</li><li>Acceso a [Codespaces](https://github.com/features/codespaces)</li><li> Opcional: [Azure para estudiantes](https://azure.microsoft.com/free/students/?WT.mc_id=academic-80067-sagibbon) o [Azure](https://azure.microsoft.com/free/search/?WT.mc_id=academic-80067-sagibbon) cuenta para desarrollo </li></ul> |
| **Duración**                  | 35 minutos                                                                |
| **Diapositivas**                  | [Haz clic aquí](./slides.pptx) |
| **Recursos necesarios para este taller** |  [Haz clic aquí](https://github.com/microsoft/codespaces-project-template-js) |


## 🗃️ Enlace para la plantilla y sus recursos

Esta plantilla es un [Portafolio web hecho con JavaScript y GitHub Codespaces](https://github.com/microsoft/codespaces-project-template-js) el cual incluye todos los recursos que **necesitarás para demostrar la presentación completa a tu audiencia**.

Dentro de este taller, hay [3 puntos de personalización](https://github.com/microsoft/codespaces-project-template-js#-customize-your-site-in-3-steps) que deben ser añadidos a la plantilla. Esto les permitirá a cada asistente personalizar su propio sitio web.

Más allá de 3 puntos de personalización, hay [4 retos](https://github.com/microsoft/codespaces-project-template-js#-challenges). Estos te permiten personalizar tu taller para tu audiencia y el tiempo que te gustaría dedicar.

Sigue las [instrucciones que se encuentran en introducción](https://github.com/microsoft/codespaces-project-template-js#-getting-started) para que tu audiencia comience con su proyecto al utilizarlo dentro de [Codespaces](https://github.com/features/codespaces).


## 🏃 Subir tu aplicación web

El proyecto incluye la configuración necesaria para implementar **gratis** para <a href="https://azure.microsoft.com/en-in/products/app-service/static/" target="_blank">Azure Static Web Apps</a> y <a href="https://pages.github.com/" target="_blank">GitHub Pages</a>. 

### Azure Static Web Apps

<a href="https://azure.microsoft.com/en-in/products/app-service/static/" target="_blank">Azure Static Web Apps</a> es la solución de hospedaje de Microsoft para sitios estáticos (o sitios que se representan en el explorador del usuario, no en un servidor) a través de Azure. Este servicio ofrece oportunidades adicionales para expandir tu sitio a través de Azure Functions, autenticación, versiones provisionales y ¡mucho más!.

Necesitarás cuentas de Azure y GitHub para implementar la aplicación web. Si aún no tienes una cuenta de Azure, puedes crearla desde dentro durante el proceso de implementación o desde los siguientes vínculos:

* [Crear una cuenta de Azure para estudiantes (no se requiere tarjeta de crédito)](https://azure.microsoft.com/free/students/)
* [Creación de una nueva cuenta de Azure](https://azure.microsoft.com/en-US/)

Con tu proyecto abierto en Codespaces:

1. Haz clic en el icono de Azure en la barra lateral izquierda. Inicie sesión si aún no lo has hecho y, si eres nuevo en Azure, sigue las indicaciones para crear su cuenta.
1. En el menú Azure, haz clic en el signo "+" y, a continuación, en "Create Static Web App".
1. Si no has iniciado sesión en GitHub, se te pedirá que inicies sesión. Si tienes algún cambio de archivo pendiente, se te pedirá que confirmes esos cambios.
1. Ingresa la información de tu aplicación cuando se te solicite:
    1. **Region**: Elige el más cercano a ti
    1. **Estructura del proyecto**: selecciona "React"
    1. **Ubicación del código de aplicación**: `/`
    1. **Ubicación de compliación**: `dist`
1. Cuando hayas terminado, verás una notificación en la parte inferior de la pantalla y se agregará un workflow de GitHub Action a tu proyecto. Si hace clic en "Open Action in GitHub", verás la acción que se creó para ti y se está ejecutando actualmente.

![Deploy de Azure Static Web App](../../images/swa-deploy.gif  "Deploy de Azure Static Web App")


### GitHub Pages

<a href="https://pages.github.com/" target="_blank">GitHub Pages</a> te permite alojar sitios web directamente desde tu repositorio de GitHub. Este proyecto ya está configurado para que puedas subir tu portafolio en GitHub Pages con muy pocos pasos.

Con tu proyecto abierto en Codespaces:

1. Abre `package.json` y actualiza los siguientes valores: 
    1. **homepage**: establezca en  `http://{github-username}.github.io/{repo-name}`, donde `github-username` es tu nombre de usuario de GitHub y `repo-name` es el nombre que llamó a este repositorio de tu portafolio cuando lo creaste.
    1. **build-gh**: reemplace  `github-username` con tu nombre de usuario de GitHub y `repo-name` con el nombre del repositorio
1. Confirma y envía esos cambios a `package.json` a tu repositorio remoto de GitHub.
1.  Abre un nuevo terminal desde el menú o presionando `crtl` + `shift` + ` (o abra el menú superior izquierdo, seleccione "Terminal" y "Nuevo terminal")`
1. Dentro de la ventana de terminal, ejecuta el siguiente comando: `npm run deploy`. Esto primero ejecutará el script previo a la implementación para compilar el proyecto, seguido del script de implementación que enviará esos archivos empaquetados a una nueva rama en su repositorio (gh-pages) que se usará para tu sitio de GitHub Pages.
1. Cuando hayas terminado, dentro de tu repositorio, ve a Settings and Pages. Allí verás que se ha configurado una página para usted en la rama gh-pages, y deberías ver la url (que debe coincidir con el valor de "página de inicio" que estableció en package.json)

![Deploy de Azure Static Web App](../../images/github-pages-deploy.gif "Deploy de Azure Static Web App")

<br />


## 📚 Recursos

* [Descripción general de los documentos de GitHub Codespaces](https://docs.github.com/codespaces/overview)
* [Usa los contenedores de desarrollo localmente con VS Code y Docker](https://github.com/microsoft/vscode-remote-try-node#vs-code-dev-containers)

<br>

> #### Aplicación de navegador Codespaces
>
> Si estás utilizando Edge o Chrome, verás una opción para instalar la aplicación Codespaces cuando inicies tu Codespace. La aplicación Codespaces te permite iniciar tu Codespace dentro de la aplicación para que puedas trabajar fuera del navegador. Busca el icono de la aplicación e instalalo con la ventana emergente para probarla.
>
> <img src="https://user-images.githubusercontent.com/82035/196431310-806a36ca-f122-4739-83f6-79afa1543e7c.png" alt="Aplicación web iniciada en el puerto 1234" style="width: 800px;"/>

<br />

<br>

## 🔎 ¿Encontraste un problema o tienes una idea para mejorar?
Ayúdanos a mejorar este repositorio al [¡avisarnos y escribiendo aquí!](https://forms.office.com/r/MdhJWMZthR/?WT.mc_id=academic-80067-sagibbon)!

<br>

## [Code of Conduct](../../../../CODE_OF_CONDUCT.md)