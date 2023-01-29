[⏮️ Ir al paso anterior](./4-agregar-manifiesto-web.md)

[⏭️ Ir al siguiente paso](./6-notificaciones.md)

# Hacer que su PWA sea independiente de la red y funcione sin conexión - registrar un trabajador de servicio

En este paso, veremos cómo se registra el trabajador de servicio. Tenga en cuenta que no necesita realizar ningún cambio de código en este paso. Asegúrese de abrir el [archivo `vite.config.ts`](../../solution/03-repose-PWA/vite.config.ts) a medida que recorremos las configuraciones.

## ¿Qué es un trabajador de servicio?

[Trabajadores de servicio](https://learn.microsoft.com/es-mx/microsoft-edge/progressive-web-apps-chromium/how-to/service-workers) son un tipo especial de trabajador web con la capacidad de interceptar, modificar y responder a todas las solicitudes de red utilizando la `API Fetch`. Los trabajadores de servicio pueden acceder a la `API Cache` y a los almacenes de datos asincrónicos del lado del cliente, como `IndexedDB`, para almacenar recursos.

## ¿Cómo funcionan los trabajadores de servicio?

Desde el punto de vista del desarrollo, debe conocer dos conceptos:

**[Registro de trabajador de servicio:](https://learn.microsoft.com/es-mx/microsoft-edge/progressive-web-apps-chromium/how-to/service-workers)**

Como todos los trabajadores web, el trabajador de servicio debe ser escrito en su propio archivo. La ubicación de ese archivo (en relación con la raíz de la aplicación) define el ámbito de su autoridad. Los trabajadores de servicio solo pueden interceptar o administrar solicitudes a páginas dentro de su ámbito. Colocar el archivo en la raíz de su aplicación garantiza que su trabajador de servicio administre todas las páginas dentro de ella.

**[Ciclo de vida del trabajador de servicio:](https://learn.microsoft.com/es-mx/microsoft-edge/progressive-web-apps-chromium/how-to/service-workers#the-service-worker-lifecycle)**

1. Registro: El navegador registra el trabajador de servicio, iniciando el ciclo de vida del trabajador de servicio.
2. Instalación: El navegador activa `install` como el primer evento al trabajador de servicio. Puede usar esto para pre-cachear recursos (por ejemplo, rellenar la caché con recursos de larga duración como logotipos o páginas sin conexión).
3. Activación: El navegador envía el evento `activate` para indicar que el trabajador de servicio ha sido instalado. Este trabajador de servicio ahora puede realizar acciones de limpieza (por ejemplo, eliminar cachés antiguas de la versión anterior) y prepararse para manejar eventos funcionales. Si hay un trabajador de servicio antiguo en juego, puede usar `clients.claim()` para reemplazar inmediatamente el antiguo trabajador de servicio con el nuevo.

## ¿Cómo se registra el trabajador de servicio en los proyectos generados por PWA Studio?

¡Buenas noticias! Con PWA Studio, no necesita crear ni registrar un trabajador de servicio. El trabajador de servicio se crea y registra automáticamente para usted en función de la configuración que proporcione en el archivo `vite.config.ts`. PWA Studio utiliza [`vite-plugin-pwa` para configurar `workbox`](https://vite-plugin-pwa.netlify.app/workbox/) con [unas pocas líneas de código.](../../solution/03-repose-PWA/vite.config.ts)

**Configuración predeterminada del complemento VitePWA de PWA Studio:**

| propiedad | valor | descripción |
| --- | --- | --- |
| `registerType` | `autoUpdate` | Cuando haya contenido nuevo disponible, el nuevo trabajador de servicio actualizará las cachés y volverá a cargar todas las ventanas / pestañas del navegador con la aplicación abierta automáticamente, debe tomar el control para que la aplicación funcione correctamente. |
| `manifest` | `false` |  Si desea agregar el atributo `crossorigin="use-credentials"` a `<link rel="manifest">` |
| `workbox` | *basado en el modo* | [`generateSW` opciones de configuración](https://developer.chrome.com/docs/workbox/modules/workbox-build/#generatesw-mode); [`injectManifest` opciones de configuración.](https://developer.chrome.com/docs/workbox/modules/workbox-build/#injectmanifest-mode)|

Detrás de escena, `vite-plugin-pwa` está utilizando el módulo [workbox-build](https://developer.chrome.com/docs/workbox/reference/workbox-build/) para construir el trabajador de servicio. De forma predeterminada, elige la estrategia `generateSW` que invoca el modo de trabajo `generateSW` de workbox. Encontrará este modo más útil cuando quiera 1) pre-cachear archivos y 2) tener necesidades simples de almacenamiento en caché en tiempo de ejecución. El otro modo es `injectManifest` que es útil cuando desea más control sobre su trabajador de servicio, por ejemplo, cuando desea usar otras funciones como `WebPush`. Puede leer más sobre cómo elegir el modo en la [documentación de workbox-build](https://developer.chrome.com/docs/workbox/modules/workbox-build/#which-mode-to-use). Vamos a mantener el modo predeterminado `generateSW` por ahora. Esto se logra a través de la configuración predeterminada `VitePWA` `strategies: 'generateSW'`. Pero cambiará al modo `injectManifest` en el [siguiente paso](6-notificaciones.md) cuando habilite la función de notificación.

## ¿Cuál es la estrategia `CacheFirst`?

Hay varias opciones de `handler` que puede pasar a `runtimeCaching` como parte de la configuración de `VitePWA`. La estrategia `CacheFirst` es una de ellas. PWA Studio usa esta estrategia de forma predeterminada y habilita el soporte sin conexión. La estrategia `CacheFirst` es una implementación de una [cache-first](https://developer.chrome.com/docs/workbox/caching-strategies-overview/#cache-first-falling-back-to-network) estrategia de solicitud. Es útil para activos que han sido revisados, como URLs como `/styles/example.a8f5f1.css`, ya que pueden almacenarse en caché durante períodos de tiempo prolongados.

Para solicitudes coincidentes, el proceso es el siguiente:
1. La solicitud llega al caché. Si el activo está en el caché, atiendalo desde ahí.
2. Si la solicitud no está en el caché, vaya a la red.
3. Una vez que finalice la solicitud de red, agréguela al caché y luego devuelva la respuesta de la red.

## Donde puedo ver el codigo del trabajador de servicio?

Puede ver la versión minificada del código del trabajador de servicio en el directorio `dist` y `dev-dist`.

Para obtener una vista más cercana al archivo completo, vaya a la pestaña "Fuente" en su navegador. Expanda la carpeta `@vite-plugin-pwa` y verá que `virtual:pwa-register` contiene algunos de los eventos de ciclo de vida que mencionamos en la sección anterior.

## Resumen y próximos pasos

En resumen no necesita registrar un trabajador de servicio en los proyectos generados por PWA Studio si está bien con las opciones predeterminadas: archivos pre-cache y necesidades de tiempo de ejecución `cacheFirst`. ¡El trabajador de servicio se crea y registra automáticamente para usted! Y tiene soporte sin conexión de inmediato.

Ahora que tiene un trabajador de servicio predeterminado, hablemos sobre cómo modificar la configuración para habilitar escenarios avanzados como 👉🏼 [notificaciones](6-notificaciones.md).

## Recursos
- [30 Días de PWA: 1.4 Hacer PWA confiable](https://aka.ms/learn-pwa/workshop/30days-1.4)
- [30 Días de PWA: 1.5 Hacer PWA funcionar sin conexión](https://aka.ms/learn-pwa/workshop/30days-1.5)
- [Documentación de Microsoft Edge: Agregar un trabajador de servicio](https://aka.ms/learn-pwa/workshop/docs.microsoft.com/microsoft-edge/progressive-web-apps-chromium/how-to/#step-3---add-a-service-worker)
- [Documentación de Microsoft Edge: Usar trabajadores de servicio para administrar solicitudes de red y notificaciones push](https://aka.ms/learn-pwa/workshop/docs.microsoft.com/microsoft-edge/progressive-web-apps-chromium/how-to/service-workers)
- [30 Días de PWA: 4.3 Mejores prácticas para la instalabilidad de PWA](https://aka.ms/learn-pwa/workshop/30days-4.1)
- [30 Días de PWA: 4.4 Mejores prácticas para la confiabilidad de PWA](https://aka.ms/learn-pwa/workshop/30days-4.4)
