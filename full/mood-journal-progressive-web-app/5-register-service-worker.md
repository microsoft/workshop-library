[⏮️ Go back to previous step](4-add-web-manifest.md)

[⏭️ Go to next step](6-notifications.md)

# Make your PWA network-independent and work offline - register a service worker

In this step, we will take a look at how service worker is registered. Note that you don't need to make any code changes in this step. Make sure you open the [`vite.config.ts` file](./solution/03-repose-PWA/vite.config.ts) as we walk through the configurations.

## What is a service worker?

[Service Workers](https://aka.ms/learn-pwa/workshop/docs.microsoft.com/microsoft-edge/progressive-web-apps-chromium/how-to/service-workers) are a special type of Web Worker with the ability to intercept, modify, and respond to all network requests using the `Fetch API`. Service Workers can access the `Cache API`, and asynchronous client-side data stores, such as `IndexedDB`, to store resources.

## How do service workers work?

From a development perspective, you need to know two concepts:

**[Service Worker Registration:](https://aka.ms/learn-pwa/workshop/docs.microsoft.com/microsoft-edge/progressive-web-apps-chromium/how-to/service-workers)**

Like all Web Workers, the Service Worker must be authored in its own file. The location of that file (relative to the root of the app) defines the scope of its authority. Service Workers can only intercept or manage requests to pages within their scope. Placing the file at the root of your app ensures your service worker will manage all pages within it.

**[Service Worker Lifecycle:](https://aka.ms/learn-pwa/workshop/docs.microsoft.com/microsoft-edge/progressive-web-apps-chromium/how-to/service-workers#the-service-worker-lifecycle)**

1. Registration: The browser registers the service worker, kicking off the Service Worker lifecycle.
1. Installation: The browser triggers `install` as the first event to the Service Worker. It can use this for pre-caching resources (e.g., populate cache with long-lived resources like logos or offline pages).
1. Activation: The browser sends the `activate` event to indicate that the service worker has been installed. This service worker can now do clean up actions (e.g., remove old caches from prior version) and ready itself to handle functional events. If there is an old service worker in play, you can use `clients.claim()` to immediately replace the old service worker with your new one.

## How is service worker registered in PWA Studio generated projects?

Good news! With PWA Studio, you don't need to create or register a service worker. The service worker is automatically created and registered for you based on the configuration you provide in the `vite.config.ts` file. PWA Studio utilizes [`vite-plugin-pwa` to setup `workbox`](https://vite-plugin-pwa.netlify.app/workbox/) with [a few lines of code](./solution/03-repose-PWA/vite.config.ts).

**Default PWA Studio VitePWA plugin config:**

| property | value | description |
| --- | --- | --- |
| `registerType` | `autoUpdate` | when new content is available, the new service worker will update caches and reload all browser windows/tabs with the application open automatically, it must take the control for the application to work properly. |
| `manifest` | `false` |  Whether to add the `crossorigin="use-credentials"` attribute to `<link rel="manifest">` |
| `workbox` | *based on mode* | [`generateSW` config options](https://developer.chrome.com/docs/workbox/modules/workbox-build/#generatesw-mode); [`injectManifest` config options](https://developer.chrome.com/docs/workbox/modules/workbox-build/#injectmanifest-mode)|

Behind the scenes, `vite-plugin-pwa` is using [workbox-build](https://developer.chrome.com/docs/workbox/reference/workbox-build/) module to build the service worker. By default, it chooses the `generateSW` strategy which invokes the workbox `generateSW` mode. You will find this mode most useful when you want to 1) pre-cache files and 2) have simple runtime caching needs. The other mode is `injectManifest` which is useful when you want more control over your service worker, for instance, when you want to use other features like `WebPush`. You can read more on how to choose the mode in the [workbox-build docs](https://developer.chrome.com/docs/workbox/modules/workbox-build/#which-mode-to-use). Let's will keep the default `generateSW` mode for now. This is achieved through the default `VitePWA` configuration `strategies: 'generateSW'`. But you will switch to `injectManifest` mode in the [next step](6-notifications.md) when you enable notification feature.

## What is `CacheFirst` strategy?

There are a handful of `handler` options you can pass into `runtimeCaching` as part of `VitePWA` configuration. The `CacheFirst` strategy is one of them. PWA Studio uses this strategy by default and it enables offline support. The `CacheFirst` strategy is an implementation of a [cache-first](https://developer.chrome.com/docs/workbox/caching-strategies-overview/#cache-first-falling-back-to-network) request strategy. It is useful for assets that have been revisioned, such as URLs like `/styles/example.a8f5f1.css`, since they can be cached for long periods of time.

For matching requests, the process goes like this:

1. The request hits the cache. If the asset is in the cache, serve it from there.
2. If the request is not in the cache, go to the network.
3. Once the network request finishes, add it to the cache, then return the response from the network.

## Where can I see the service worker code?

You can see the minified version of service worker code in the `dist` and `dev-dist` directory.

To get a closer look at the full file, head over to Source tab in your browser. Expand folder `@vite-plugin-pwa` and you will see `virtual:pwa-register` that contains some of the lifecycle events we talked about in the previous section.

## Summary and next steps

In short, you don't need to register a service worker in PWA Studio generated projects if you are fine with the default options - pre-cache files and runtime `cacheFirst` needs. The service worker is automatically created and registered for you! And you have offline support right away.

Now that you have a default service worker, let's talk about how to modify the configuration to enable advanced scenarios like 👉🏼 [notifications](6-notifications.md).

## Resources
- [30 Days of PWA: 1.4 Make PWA Reliable](https://aka.ms/learn-pwa/workshop/30days-1.4)
- [30 Days of PWA: 1.5 Make PWA Work Offline]()(https://aka.ms/learn-pwa/workshop/30days-1.5)
- [Microsoft Edge docs: Add a Service Worker](https://aka.ms/learn-pwa/workshop/docs.microsoft.com/microsoft-edge/progressive-web-apps-chromium/how-to/#step-3---add-a-service-worker)
- [Microsoft Edge docs: Use Service Workers to manage network requests and push notifications](https://aka.ms/learn-pwa/workshop/docs.microsoft.com/microsoft-edge/progressive-web-apps-chromium/how-to/service-workers)
- [30 Days of PWA: 4.3 Best practices for PWA Installability](https://aka.ms/learn-pwa/workshop/30days-4.1)
- [30 Days of PWA: 4.4 Best practices for PWA reliability](https://aka.ms/learn-pwa/workshop/30days-4.4)