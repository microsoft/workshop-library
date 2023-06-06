[⏮️ Ir a el paso anterior](./0-instalación.md)

[⏭️ Ir al siguiente paso](./2-agregar-contenido.md)

# Crear una nueva Progressive Web App

En este paso, primero hablaremos sobre qué es una PWA, y luego crearemos una nueva PWA usando PWA studio.

## ¿Qué es PWA?

Una [Aplicación Web Progresiva (PWA)](https://aka.ms/learn-pwa/workshop/docs.microsoft.com/microsoft-edge/progressive-web-apps-chromium/) es una aplicación web tradicional que se mejora progresivamente usando tecnologías web abiertas, para asegurarse de que brinde la mejor experiencia posible en cada dispositivo, basado en las capacidades disponibles.

Las Aplicaciones Web Progresivas usan [trabajadores de servicio](https://aka.ms/learn-pwa/workshop/docs.microsoft.com/microsoft-edge/progressive-web-apps-chromium/how-to/service-workers) _(service workers)_, [manifiestos](https://aka.ms/learn-pwa/workshop/docs.microsoft.com/microsoft-edge/progressive-web-apps-chromium/how-to/web-app-manifests), y otras características de la plataforma web en combinación con [mejora progresiva](https://developer.mozilla.org/en-US/docs/Glossary/Progressive_Enhancement) para brindar a los usuarios una experiencia a la par con las aplicaciones específicas de la plataforma (Windows, Android, etc.).

## Crear una PWA usando PWA Studio

Hay muchas maneras de crear una nueva aplicación web. Sin embargo, si está diseñando su aplicación web teniendo en cuenta la mejora progresiva y las características específicas de la plataforma, debería considerar usar una plantilla con configuraciones listas-para-usar para que le ayuden a comenzar rápidamente.
¡Utilice la extensión [PWA Studio](https://aka.ms/learn-pwa/workshop/pwa-studio) para Visual Studio Code!

Seguiremos estos [pasos](https://aka.ms/learn-pwa/workshop/github.com/pwa-builder/pwa-studio/wiki/Create-a-New-PWA) para crear una nueva PWA.
1. Presiona el icono de PWA Studio en el lado izquierdo de la ventana de VSCode
2. Haz clic en el botón Iniciar nueva PWA en la barra inferior de VSCode.
3. Ingrese el nombre del repositorio "repose" y presione enter.
4. Su PWA se abrirá en su propia ventana, con todas las dependencias instaladas y listas para comenzar a programar.

![Comienza una nueva PWA en la barra de comandos de VSCode usando la extensión PWA Studio.](../../images/1-command-bar-startnew.png)

## Explorando la solución generada

Antes de comenzar a programar, exploremos la solución generada. La extensión PWA Studio se creó basada en el proyecto PWABuilder [pwa-starter](https://aka.ms/learn-pwa/workshop/github.com/pwa-builder/pwa-starter). El proyecto usa la siguiente pila de tecnologías:

- [**lit**](https://lit.dev/): El framework de elección del equipo PWABuilder. Esto significa que también usará lit como un marco de componentes web para crear su PWA.
- [**fluent/web-components**](https://aka.ms/learn-pwa/workshop/docs.microsoft.com/fluent-ui/web-components/): Los Componentes Web Fluent son un conjunto de componentes de interfaz de usuario, como [Ionic](https://ionicframework.com/), o los [componentes web de diseño material (Material Design)](https://material.io/develop/web). Esto proporciona un conjunto de componentes de interfaz de usuario modernos que están listos para usar y se pueden personalizar fácilmente.
- [**Vite**](https://vitejs.dev/): Vite maneja el empaquetado del código, la generación del trabajador de servicio y más. Más adelante profundizaremos un poco más en esto cuando hablemos sobre el trabajador de servicio y la estrategia de caché.
- [**Vaadin Router**](https://vaadin.github.io/router/vaadin-router/demo/#vaadin-router-getting-started-demos): Para el enrutamiento, este proyecto usa Vaadin.
- [**TypeScript**](https://aka.ms/learn-pwa/workshop/www.typescriptlang.org/): TypeScript le brinda características como la finalización automática en su editor de código, lo que ayuda a que el proceso de desarrollo sea más fácil y rápido.

Ahora, veamos la estructura de archivos de la solución generada.

| archivos/directorios | descripción |
| ------------- | ----------- |
| `public` | Esta carpeta contiene todos los archivos que se sirven al navegador, como los iconos de su aplicación, capturas de pantalla y otros activos creativos. |
| `index.html` | Este es el archivo HTML principal que se sirve al navegador y el punto de entrada de su código fuente. |
| `public/manifest.json` | Este es el archivo de manifiesto que se usa para configurar su PWA. |
| `src` | Esta carpeta contiene todo el código fuente de su aplicación. |
| `src/app-index.ts` | Este archivo es el punto de entrada principal para el código de su aplicación. El enrutador se configura aquí, así como el registro del trabajador de servicio. |
| `src/components` | Esta carpeta contiene componentes reutilizables de su aplicación. |
| `src/pages` | Esta carpeta contiene diferentes páginas de su aplicación. Cada página posee sus estilos CSS en la configuración predeterminada. |
| `src/styles` | Esta carpeta contiene hojas de estilo CSS. |
| [`package.json`](https://docs.npmjs.com/cli/v7/configuring-npm/package-json) | Este es el archivo que contiene metadatos relevantes para su proyecto y se usa para administrar dependencias, scripts, versiones y más. |
| `tsconfig.json` | Este es el archivo de configuración para TypeScript. |
| `vite.config.ts` | Este es el archivo de configuración de `vite` que sabe cómo construir y empaquetar el código. Contiene la configuración de `workbox` que controla cómo se maneja el caché.  |

## Ejecutar la PWA generada

Para ejecutar la solución, simplemente escriba el siguiente comando en la terminal de VSCode o en la terminal de su elección:

```bash
npm run dev
```

## Subir la solución a GitHub

¿Recuerda el repositorio de Git que generaste en el último paso? Ahora empujemos nuestra solución a él usando el siguiente comando desde el directorio de su proyecto:

```bash
git remote add origin https://github.com/<your_git_username>/<your_repo_name | repose.git>
git branch -M main
git push -u origin main
```

Usted puede verificar su configuración de control remoto de push/pull usando el siguiente comando:

```bash
git remote -v
```

## Resumen y próximos pasos

Ya ha creado su Aplicación Web Progresiva. A continuación, 👉🏼 [agregar contenido adicional](./2-agregar-contenido.md) como un diario de ánimo para convertirla en una aplicación web funcional.

## Recursos
- [30 Días de PWA: 1.1 Introducción a PWA](https://aka.ms/learn-pwa/workshop/30days-1.1)
- [30 Días de PWA: 1.2 Descomponiendo PWA](https://aka.ms/learn-pwa/workshop/30days-1.2)
- [Documentación de Microsoft Edge: Visión general de las aplicaciones web progresivas (PWAs)](https://aka.ms/learn-pwa/workshop/docs.microsoft.com/microsoft-edge/progressive-web-apps-chromium/)
- [30 Días de PWA: 3.1 Herramientas de inicio rápido - Parte 1](https://aka.ms/learn-pwa/workshop/30days-3.1)
- [30 Días de PWA: 3.2 Herramientas de inicio rápido - Parte 2](https://aka.ms/learn-pwa/workshop/30days-3.2)
