[⏮️ Ir al paso anterior](./2-agregar-contenido.md)

[⏭️ Ir al siguiente paso](./4-agregar-manifiesto-web.md)

# Hacer que tu PWA sea segura - despliégala en un punto de acceso HTTPS

En este paso, desplegaremos nuestra PWA en un punto de acceso HTTPS.

## ¿Cuáles son los bloques de construcción de una PWA?

Empecemos hablando sobre los tres bloques de construcción principales para el desarrollo de PWA:

**[HTTPS](https://developer.mozilla.org/es/docs/Glossary/https)** - hace que tu PWA sea segura. En este paso, describiremos cómo desplegar nuestra PWA en un punto de acceso HTTPS.

**[Manifiesto de aplicación web](https://learn.microsoft.com/es-mx/microsoft-edge/progressive-web-apps-chromium/how-to/web-app-manifests)** - hace que tu PWA sea instalable. En el [paso 4](./4-agregar-manifiesto-web.md), describiremos cómo agregar un manifiesto de aplicación web a la PWA.

**[Trabajadores de servicio](https://learn.microsoft.com/es-mx/microsoft-edge/progressive-web-apps-chromium/how-to/service-workers)** - hace que tu PWA sea confiable e independiente de la red. En el [paso 5](./5-registrar-trabajador-de-servicio.md), describiremos cómo registrar un trabajador de servicio para la PWA.

## Opciones de HTTPS

1. Use un servicio de alojamiento que soporte HTTPS por defecto. Los proveedores de nube como [Azure](https://aka.ms/learn-pwa/workshop/azure.microsoft.com) ofrecen opciones como [Azure App Service](https://aka.ms/learn-pwa/workshop/azure.microsoft.com/services/app-service/web) que pueden ayudar. En este paso, desplegarás Repose en un [Azure Static Web App](https://aka.ms/learn-pwa/workshop/azure.microsoft.com/services/app-service/static).
2. Use su propio proveedor de alojamiento y cree los certificados requeridos usando servicios gratuitos como [Let’s Encrypt](https://letsencrypt.org/docs/).

**Nota:** los navegadores, como Microsoft Edge, le permitirán usar http://localhost (no HTTPS) para previsualizar y probar su PWA localmente - solo para fines de depuración.

## Desplegar en un Azure Static Web App

1. Construye el paquete distribuible ejecutando este comando `npm run build`. Esto creará un directorio `dist` con todos los archivos necesarios.
2. Instala la [extensión de Azure Static Web Apps de VSCode](https://aka.ms/learn-pwa/workshop/azure-static-web-apps-vscode-extension).
3. Crea un nuevo Azure Static Web App siguiendo los [pasos 1-5 de este tutorial](https://aka.ms/learn-pwa/workshop/azure-create-a-static-web-app).
4. Cuando se le solicite seleccionar los preajustes que coincidan con el tipo de aplicación. Seleccione la opción "Custom (Personalizado)". ![Selección personalizada en el tipo de aplicación.](../../images/3-extension-presets-no-framework.png)
5.  Para la solicitud de ubicación de la aplicación, ingrese `/`.
6.  Para la ubicación de salida de compilación, ingrese `dist`.
7.  Sigue el resto de los pasos en el [tutorial anterior](https://aka.ms/learn-pwa/workshop/azure-create-a-static-web-app) para finalizar la creación del Azure Static Web App y ver el recurso.

**Nota:** se agregará un archivo `.yml` a la carpeta `.github/workflows` en la raíz de su repositorio para habilitar el despliegue continuo a Azure Static Web Apps después de completar los pasos anteriores.

## Resumen y próximos pasos

Ahora has desplegado Repose en un Azure Static Web App. Vamos a 👉🏼 [agregar todos los miembros necesarios al archivo de manifiesto de la aplicación web para que Repose sea instalable](./4-agregar-manifiesto-web.md).

## Recursos
- [30 Días de PWA: 1.4 Hacer PWA confiable.](https://aka.ms/learn-pwa/workshop/30days-1.4)
- [Documentación de Microsoft Edge: HTTPS](https://aka.ms/learn-pwa/workshop/docs.microsoft.com/microsoft-edge/progressive-web-apps-chromium/how-to/#step-1---use-https)
