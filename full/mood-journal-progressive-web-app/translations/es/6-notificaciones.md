[⏮️ Ir al paso anterior](5-registrar-trabajador-de-servicio.md)

[⏭️ Ir al siguiente paso](7-listo-para-la-tienda.md)

# Haz que tu PWA sea atractiva - habilita las notificaciones push

En este paso, hablaremos sobre cómo agregar capacidades avanzadas como las notificaciones a nuestra PWA.

## Actualizar el módulo `workbox-build`

Necesitarás actualizar el [archivo `vite.config.ts`](../../solution/04-notifications/vite.config.ts) para utilizar la estrategia `injectManifest`.

En esta ocasión, el complemento `vite-plugin-pwa` primero construirá el trabajador de servicio personalizado a través de `rollup` y luego, con el resultado de la compilación anterior, llamará al método `injectManifest` de workbox.

Esto te permite crear tu propio [archivo de trabajador de servicio](../../solution/04-notifications/public/sw.js). Así que creemos un nuevo archivo `sw.js` en la carpeta `./public/` del proyecto. Actualiza ambos archivos `sw.js` y `vite.config.ts` para tener el mismo código que se muestra en la solución [04-notificaciones.](../../solution/04-notifications/)

## Mostrar notificaciones en el centro de acciones

Las PWAs pueden mostrar notificaciones mediante el uso de la [API de notificaciones](https://developer.mozilla.org/en-US/docs/Web/API/Notifications_API). Crearás un [componente de notificación](../../solution/04-notifications/src/script/components/notification.ts) en la aplicación Repose para habilitar esta función.

### Solicitar permiso para mostrar notificaciones

Primero necesitarás verificar si la API de notificaciones es compatible y solicitar el permiso del usuario para mostrar notificaciones. Puedes hacer esto agregando el siguiente código al componente de notificación:

```typescript
  private requestNotificationPermission() {
    if ("Notification" in window) {
      console.log("El navegador soporta las notificaciones.");

      Notification.requestPermission().then(permission => {
        if (permission === 'granted') {
          console.log('Permiso de notificación concedido');
        }
      });
    } else {
      console.log("El navegador no soporta las notificaciones.");
    }
  }
```

### Mostrar una notificación

Una vez que sepas que la API es compatible y el usuario ha aceptado las notificaciones, puedes mostrar una notificación creando un objeto de notificación. Aquí está una función que mostrará una notificación para recordarle al usuario que beba agua:

```typescript
  private displayNotification() {
    const notifTitle = "Hola";
    const notifBody = "Es tiempo de beber agua 💦";
    const notifImg = `assets/media/toast.jpg`;
    const options = {
      body: notifBody,
      icon: notifImg,
    };
    new Notification(notifTitle, options);
  }
```

Asegúrate de agregar la imagen a la carpeta `./public/assets/`. Y echa un vistazo al código de muestra en la solución [04-notificaciones](../../solution/04-notifications/) para agregar el componente de notificación a la aplicación Repose.

## Resumen y próximos pasos

¡Felicidades! Ahora tienes una PWA atractiva que se puede instalar en diferentes dispositivos y tiene soporte sin conexión.

Puedes personalizar aún más las notificaciones [agregando acciones](https://aka.ms/learn-pwa/workshop/docs.microsoft.com/microsoft-edge/progressive-web-apps-chromium/how-to/notifications-badges#add-actions-to-notifications) a ellas. Necesitarás configurar un [servicio push para enviar notificaciones push a tus usuarios](https://aka.ms/learn-pwa/workshop/docs.microsoft.com/microsoft-edge/progressive-web-apps-chromium/how-to/notifications-badges#add-actions-to-notifications).

Ahora, veamos cómo podemos 👉🏼 ¡[auditar la PWA y prepararla para la tienda](7-listo-para-la-tienda.md)!

## Recursos
- [30 Días de PWA: 1.6 Hacer una PWA Competente.](https://aka.ms/learn-pwa/workshop/30days-1.6)
- [30 Días de PWA: 2.7 Notificando a tus usuarios de actualizaciones.](https://aka.ms/learn-pwa/workshop/30days-2.7)
- [Documentos de Microsoft Edge: Vuelve a atraer a los usuarios con insignias, notificaciones y mensajes push.](https://aka.ms/learn-pwa/workshop/docs.microsoft.com/microsoft-edge/progressive-web-apps-chromium/how-to/notifications-badges)
- [30 Días de PWA: Capacidades avanzadas.](https://aka.ms/learn-pwa/workshop/30days-week2)
- [30 Días de PWA: 3.3 Herramientas de depuración - Parte 1.](https://aka.ms/learn-pwa/workshop/30days-3.3)
- [30 Días de PWA: 3.4 Herramientas de depuración - Parte 2.](https://aka.ms/learn-pwa/workshop/30days-3.4)
- [30 Días de PWA: 4.2 Mejores prácticas para la participación de PWA.](https://aka.ms/learn-pwa/workshop/30days-4.2)
