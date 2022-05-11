[⏮️ Go back to previous step](3-deploy-to-Azure.md)

[⏭️ Go to next step](5-register-service-worker.md)

# Make your PWA installable - add a web app manifest

In this step, we will modify the `manifest.json` file in the `public` folder to make our PWA installable.

## What should the web app manifest look like?

```json
  {
    "id": "/",
    "scope": "/",
    "lang": "en-us",
    "name": "Repose intelligent daily mood journal",
    "display": "standalone",
    "start_url": "/",
    "short_name": "Repose",
    "theme_color": "#B6E2D3",
    "description": "Repose is a mental health journal app that serves as your personal mood tracking companion and helps you organize and reflect upon your daily thoughts.",
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
        "name": "Open Journal",
        "short_name": "Journal",
        "description": "Open the journal page",
        "url": "/journal",
        "icons": [{ "src": "assets/icons/icon_192.png", "sizes": "192x192" }]
      }
    ]
  }
```

## How does everything work together?

### Members

A PWA can be customized by using manifest members like in the previous example. A minimum manifest file should contain the following:

```json
{
    "name": "My Sample PWA",
    "lang": "en-US",
    "start_url": "/"
}
```

To read more about the members of a manifest file. You can refer to [MDN docs](https://developer.mozilla.org/docs/Web/Manifest#members).

### Deploying the manifest

Web app manifests are deployed in HTML pages using a `<link>` element in the `<head>` of a document. This was taken care of during the PWA generation process by PWA Studio so that you don't have to manually add it. You can find this `<link rel="manifest" href="/manifest.json" />` element in `index.html` file.

### See it in action

After saving the manifest file and deploying it to your Azure static web app, you should see this button in the browser's address bar:

![Install Repose PWA](./images/4-install.png)

## Summary and next steps

Now you can install Repose as a standalone app on your device! Next, we will talk about how to 👉🏼 [register Service Worker to make your app network-independent plus offline support](5-register-service-worker.md).

## Resources
- [30 Days of PWA: 1.3 Make PWA Installable](https://aka.ms/learn-pwa/workshop/30days-1.3)
- [Microsoft Edge docs: Create a Web App Manifest](https://aka.ms/learn-pwa/workshop/docs.microsoft.com/microsoft-edge/progressive-web-apps-chromium/how-to/#step-2---create-a-web-app-manifest)
- [Microsoft Edge docs: Use a Web App Manifest to integrate a Progressive Web App into the operating system](https://aka.ms/learn-pwa/workshop/docs.microsoft.com/microsoft-edge/progressive-web-apps-chromium/how-to/web-app-manifests)