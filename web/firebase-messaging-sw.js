importScripts("https://www.gstatic.com/firebasejs/10.12.0/firebase-app-compat.js");
importScripts("https://www.gstatic.com/firebasejs/10.12.0/firebase-messaging-compat.js");

firebase.initializeApp({
  apiKey: "AIzaSyBu41rfJeJKIQngNDthdZT5SwAxNEtxHOU",
  authDomain: "ccell-b8c42.firebaseapp.com",
  databaseURL: "https://ccell-b8c42-default-rtdb.asia-southeast1.firebasedatabase.app",
  projectId: "ccell-b8c42",
  storageBucket: "ccell-b8c42.firebasestorage.app",
  messagingSenderId: "655780948496",
  appId: "1:655780948496:web:6b30f127ca19d672453895",
  measurementId: "G-KPM10BTRWS"
});

const messaging = firebase.messaging();

// Background message handler
messaging.onBackgroundMessage(function(payload) {
  console.log('[firebase-messaging-sw.js] Received background message ', payload);
  
  // Extract notification data
  const notificationTitle = payload.notification?.title || 'C-Cell Notification';
  const notificationOptions = {
    body: payload.notification?.body || 'You have a new notification',
    icon: '/web-app-manifest-192x192.png',
    badge: '/web-app-manifest-192x192.png',
    vibrate: [200, 100, 100],
    requireInteraction: true,
    actions: [
      {
        action: 'open',
        title: 'Open App'
      }
    ],
    data: {
      url: payload.data?.click_action || '/'
    }
  };

  return self.registration.showNotification(notificationTitle, notificationOptions);
});

// Handle notification click events
self.addEventListener('notificationclick', (event) => {
  console.log('[firebase-messaging-sw.js] Notification clicked', event);
  
  event.notification.close();
  
  // Open the app when notification is clicked
  const urlToOpen = event.notification.data?.url || '/';
  
  event.waitUntil(
    clients.matchAll({ type: 'window', includeUncontrolled: true })
      .then((clientList) => {
        // Check if there's already a window/tab open with the target URL
        for (const client of clientList) {
          if (client.url === urlToOpen && 'focus' in client) {
            return client.focus();
          }
        }
        // If no window/tab is open, open a new one
        if (clients.openWindow) {
          return clients.openWindow(urlToOpen);
        }
      })
  );
});
