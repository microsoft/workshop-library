[⏮️ Go back to previous step](5-register-service-worker.md)

[⏭️ Go to next step](7-store-ready.md)

# Make your PWA engaging - enable push notifications

In this step, we will talk about how to add advanced capabilities such as notifications to our PWA.

## Update `workbox-build` module

You will need to update the [`vite.config.ts` file](./solution/04-notifications/vite.config.ts) to utilize `injectManifest` strategy.

This time, the `vite-plugin-pwa` plugin will first build the custom service worker via `rollup` and then, with previous build result will call to workbox `injectManifest` method. It allows you to create you own [service worker file](./solution/04-notifications/public/sw.js). So let's create a new `sw.js` file in the project's `./public/` folder. Update both `sw.js` and `vite.config.ts` files to have the same code as shown in solution [04-notifications](./solution/04-notifications/).

## Display notifications in action center

PWAs can display notifications by using the [Notifications API](https://developer.mozilla.org/en-US/docs/Web/API/Notifications_API). You will create a [notification component](./solution/04-notifications/src/script/components/notification.ts) in Repose app to enable this feature.

### Request permission to display notifications

You will first need to check if Notifications API is supported and request a user's permission to display notifications. You can do this by adding the following code to notification component:

```typescript
  private requestNotificationPermission() {
    if ("Notification" in window) {
      console.log("Notifications API is supported");

      Notification.requestPermission().then(permission => {
        if (permission === 'granted') {
          console.log('Notification permission granted.');
        }
      });
    } else {
      console.log("Notifications API is not supported");
    }
  }
```

### Display a notification

Once you know that the API is supported and the user has accepted notifications, you can display a notification by creating a Notification object. Here is a function that will display a notification to remind the user to drink some water:

```typescript
  private displayNotification() {
    const notifTitle = "Hi";
    const notifBody = "It's time to drink some water 💦";
    const notifImg = `assets/media/toast.jpg`;
    const options = {
      body: notifBody,
      icon: notifImg,
    };
    new Notification(notifTitle, options);
  }
```

Make sure you add the image to `./public/assets/` folder. And take a look at the sample code in the solution [04-notifications](./solution/04-notifications/) to add notification component to the Repose app.

## Summary and next steps

Congratulations! You now have an engaging PWA that can be installed on different devices and have offline support.

You can further customize notifications by [adding actions](https://aka.ms/learn-pwa/workshop/docs.microsoft.com/microsoft-edge/progressive-web-apps-chromium/how-to/notifications-badges#add-actions-to-notifications) to them. You will need to setup a [push service to send push notifications to your users](https://aka.ms/learn-pwa/workshop/docs.microsoft.com/microsoft-edge/progressive-web-apps-chromium/how-to/notifications-badges#add-actions-to-notifications).

Next, let's see how we can 👉🏼 [audit the PWA and make it store ready](7-store-ready.md)!

## Resources
- [30 Days of PWA: 1.6 Make PWA Capable](https://aka.ms/learn-pwa/workshop/30days-1.6)
- [30 Days of PWA: 2.7 Notifying your users of updates](https://aka.ms/learn-pwa/workshop/30days-2.7)
- [Microsoft Edge docs: Re-engage users with badges, notifications, and push messages](https://aka.ms/learn-pwa/workshop/docs.microsoft.com/microsoft-edge/progressive-web-apps-chromium/how-to/notifications-badges)
- [30 Days of PWA: Advanced Capabilities](https://aka.ms/learn-pwa/workshop/30days-week2)
- [30 Days of PWA: 3.3 Debugging tools - Part 1](https://aka.ms/learn-pwa/workshop/30days-3.3)
- [30 Days of PWA: 3.4 Debugging tools - Part 2](https://aka.ms/learn-pwa/workshop/30days-3.4)
- [30 Days of PWA: 4.2 Best practices for PWA engagement](https://aka.ms/learn-pwa/workshop/30days-4.2)