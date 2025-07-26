import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:login_page/loading_screen.dart';
import 'package:login_page/notifications_api/notification_state.dart';




Future<void> initializeFCM(String userId) async {
  final FirebaseMessaging messaging = FirebaseMessaging.instance;

  // Request notification permissions (iOS + Web)
  final NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    sound: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
  );


  if (kDebugMode) {
    print("🔔 User permission: ${settings.authorizationStatus}");
  }

  // Subscribe to global topic
  try {
    await messaging.subscribeToTopic("all-users");
    if (kDebugMode) {
      print("📌 Subscribed to all-users topic");
    }
  } catch (e) {
    if (kDebugMode) {
      print("⚠️ Failed to subscribe to topic: $e");
    }
  }


  // Get FCM token (use vapidKey for web)
  String? token;
  try {
    token = await messaging.getToken(
      vapidKey: kIsWeb
          ? "BO1lGHgcWJXK1vANSjKKMAScw5CEXFfzFKUZlfufe1MrKSTa5pUET-wPxUxx0O2UcAxZj2fjmSx_Nog8hNu6EEM"
          : null,
    );
    if (kDebugMode) {
      print('✅ FCM Token: $token');
    }

    if (kDebugMode) {
      print("📤 Sending token registration:");
      print("userId: '$userId'");
      print("token: '$token'");
    }

    // Send token to backend
    final response = await http.post(
      Uri.parse('https://ccell-notification-api.onrender.com/api/tokens/register'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'userId': userId, 'token': token}),
    );

    if (response.statusCode == 200) {
      if (kDebugMode) {
        print("✅ Token registered with backend");
      }
    } else {
      if (kDebugMode) {
        print("❌ Failed to register token: ${response.body}");
      }
    }
  } catch (e) {
    if (kDebugMode) {
      print("❌ Error while retrieving or sending FCM token: $e");
    }
  }
}
Future<void> signInWithCollegeGoogleAccount(BuildContext context) async {
  final GoogleSignIn googleSignIn = GoogleSignIn();

  Future<void> requestNotificationPermission() async {

    final settings = await FirebaseMessaging.instance.requestPermission();
    NotificationState.permissionGranted =
        settings.authorizationStatus == AuthorizationStatus.authorized;

  }

  try {
    // Sign out previous sessions just in case
    await googleSignIn.signOut();

    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
    if (googleUser == null) {
      // User cancelled sign-in
      return;
    }

    final String email = googleUser.email;
    if (!email.endsWith('@lnmiit.ac.in')) {
      await googleSignIn.signOut();

      await showDialog(
        context: context,
        builder: (BuildContext dialogContext) {
          return AlertDialog(
            backgroundColor: const Color.fromARGB(255, 245, 245, 245),
            title: const Text('Used an Invalid Email'),
            content: const Text('Please use your LNMIIT Email ID to Sign In.'),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(dialogContext).pop();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 239, 210, 210),
                  side: const BorderSide(
                    color: Color.fromARGB(255, 86, 3, 3),
                    width: 2,
                  ),
                ),
                child: const Text(
                  'Retry',
                  style: TextStyle(
                    color: Color.fromARGB(255, 86, 3, 3),
                  ),
                ),
              ),
            ],
          );
        },
      );
      return;
    }

    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
    final String userName = userCredential.user?.displayName ?? 'User';

    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      await initializeFCM(user.email ?? user.uid);
      NotificationState.permissionGranted = true;
      requestNotificationPermission();
    } else {
      if (kDebugMode) {
        print("❌ Firebase user not logged in");
      }
    }

    // Navigate to loading screen, then to home screen
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => LoadingScreen(userName: userName),
      ),
    );
  } catch (e) {
    if (kDebugMode) {
      print('Sign-in failed: $e');
    }
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Login failed. Please Refresh and Try Again'),
        backgroundColor: Colors.red,
      ),
    );
  }
}