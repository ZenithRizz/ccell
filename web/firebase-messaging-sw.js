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

// Optional:
messaging.onBackgroundMessage(function(payload) {
  console.log('[firebase-messaging-sw.js] Received background message ', payload);
  const { title, body, image } = payload.notification;

  self.registration.showNotification(title, {
    body: body,
    icon: 'web-app-manifest-192x192.png',
    image: image,
  });
});