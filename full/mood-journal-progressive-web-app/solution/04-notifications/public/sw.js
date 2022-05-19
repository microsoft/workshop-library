importScripts(
  'https://storage.googleapis.com/workbox-cdn/releases/6.4.1/workbox-sw.js'
);

import { clientsClaim } from 'workbox-core';

self.skipWaiting();
clientsClaim();

workbox.precaching.cleanupOutdatedCaches();

console.log("hello world");

self.addEventListener('push', function(event) {
  const data = JSON.parse(event.data.text());

  event.waitUntil(
    registration.showNotification(data.title, {
      body: data.message,
      icon: 'assets/media/toast.jpg'
    })
  );
});

self.addEventListener('notificationclick', function(event) {
  event.notification.close();

  event.waitUntil(
    clients.matchAll({ type: 'window', includeUncontrolled: true })
      .then(function(clientList) {
        if (clientList.length > 0) {
          let client = clientList[0];

          for (let i = 0; i < clientList.length; i++) {
            if (clientList[i].focused) {
              client = clientList[i];
            }
          }

          return client.focus();
        }

        return clients.openWindow('/');
      })
  );
});

self.addEventListener('pushsubscriptionchange', function(event) {
  event.waitUntil(
    Promise.all([
      Promise.resolve(event.oldSubscription ? deleteSubscription(event.oldSubscription) : true),
        Promise.resolve(event.newSubscription ? event.newSubscription : subscribePush(registration))
          .then(function(sub) { return saveSubscription(sub); })
    ])
  );
});

workbox.precaching.precacheAndRoute(self.__WB_MANIFEST || []);
