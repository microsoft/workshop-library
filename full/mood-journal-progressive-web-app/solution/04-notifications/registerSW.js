// register service worker
if ('serviceWorker' in navigator) {
  // register service worker
  navigator.serviceWorker.register( import.meta.env.MODE === 'production' ? '/sw.js' : '/dev-sw.js?dev-sw').then((registration) => {
    // registration successful
    console.log('Service Worker Registered');
  }).catch((err) => {
    // registration failed
    console.log('Service Worker failed to register', err);
  });
}