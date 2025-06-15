import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:login_page/loading_screen.dart';

Future<void> signInWithCollegeGoogleAccount(BuildContext context) async {
  final GoogleSignIn googleSignIn = GoogleSignIn();

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

    // Navigate to loading screen, then to home screen
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => LoadingScreen(userName: userName),
      ),
    );
  } catch (e) {
    print('Sign-in failed: $e');
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Login failed. Please try again.'),
        backgroundColor: Colors.red,
      ),
    );
  }
}
