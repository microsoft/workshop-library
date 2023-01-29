[⏮️ Ir al paso anterior](./3-despliegue-en-Azure.md)

[⏭️ Ir al siguiente paso](./5-registrar-trabajador-de-servicio.md)

# Hacer que su PWA sea instalable - agregar un manifiesto de aplicación web

En este paso, modificaremos el archivo `manifest.json` en la carpeta `public` para hacer que nuestra PWA sea instalable.

## ¿Cómo debería ser el manifiesto de la aplicación web?

```json
  {
    "id": "/",
    "scope": "/",
    "lang": "en-us", // Aquí puede cambiar el idioma de su aplicación ante la instalación de la aplicación. Tome en cuenta que cada idioma requiere un archivo de traducción.
    "name": "Diario de estado de ánimo inteligente Repose",
    "display": "standalone",
    "start_url": "/",
    "short_name": "Repose",
    "theme_color": "#B6E2D3",
    "description": "Repose es una aplicación de diario de estado de ánimo inteligente que le permite registrar sus pensamientos y emociones diarias.",
    "orientation": "any",
    "background_color": "#FAE8E0",
    "dir": "ltr",
    "related_applications": [],
    "prefer_related_applications": false,
    "icons": [
      {
        "src": "assets/icons/icon_512.png",
        "sizes": "512x512",
        "type": "image/png"
      },
      {
        "src": "assets/icons/icon_192.png",
        "sizes": "192x192",
        "type": "image/png"
      },
      {
        "src": "assets/icons/icon_48.png",
        "sizes": "48x48",
        "type": "image/png"
      },
      {
        "src": "assets/icons/icon_24.png",
        "sizes": "24x24",
        "type": "image/png"
      }
    ],
    "screenshots": [
      {
        "src": "assets/screenshots/screen.png",
        "sizes": "1617x1012",
        "type": "image/png"
      }
    ],
    "features": [
      "Cross Platform",
      "fast",
      "simple"
    ],
    "categories": [
      "health",
      "lifestyle"
    ],
    "shortcuts": [
      {
        "name": "Abrir diario",
        "short_name": "Diario",
        "description": "Abra la página del diario",
        "url": "/journal",
        "icons": [{ "src": "assets/icons/icon_192.png", "sizes": "192x192" }]
      }
    ]
  }
```

## ¿Cómo es que todo funciona en conjunto?

### Miembros

Una PWA se puede personalizar mediante miembros de manifiesto como en el ejemplo anterior. Un archivo de manifiesto mínimo debe contener lo siguiente:

```json
{
    "name": "Mi PWA de ejemplo",
    "lang": "en-US",
    "start_url": "/"
}
```

Para obtener más información sobre los miembros de un archivo de manifiesto. Puede consultar la [documentación de MDN](https://developer.mozilla.org/docs/Web/Manifest#members).

### Desplegar el manifiesto

Los manifiestos de aplicaciones web se despliegan en páginas HTML usando un elemento `<link>` en el `<head>` de un documento. Esto se tomó en cuenta durante el proceso de generación de PWA por PWA Studio para que no tenga que agregarlo manualmente. Puede encontrar este elemento `<link rel="manifest" href="/manifest.json" />` en el archivo `index.html`.

### Verlo en acción

Después de guardar el archivo de manifiesto y desplegarlo en su aplicación web estática de Azure, debería ver este botón en la barra de direcciones del navegador:

![Instala Repose PWA](../../images/4-install.png)

## Resumen y próximos pasos

Ahora puede instalar Repose como una aplicación independiente en su dispositivo. A continuación, hablaremos sobre cómo 👉🏼 [registrar Service Worker para hacer que su aplicación sea independiente de la red más soporte sin conexión.](./5-registrar-trabajador-de-servicio.md)

## Recursos
- [30 Días de PWA: 1.3 Hacer PWA instalable.](https://aka.ms/learn-pwa/workshop/30days-1.3)
- [Documentación de Microsoft Edge: Crear un manifiesto de aplicación web.](https://aka.ms/learn-pwa/workshop/docs.microsoft.com/microsoft-edge/progressive-web-apps-chromium/how-to/#step-2---create-a-web-app-manifest-es)
- [Documentación de Microsoft Edge: Utilice un manifiesto de aplicación web para integrar una aplicación web progresiva en el sistema operativo.](https://aka.ms/learn-pwa/workshop/docs.microsoft.com/microsoft-edge/progressive-web-apps-chromium/how-to/web-app-manifests)
