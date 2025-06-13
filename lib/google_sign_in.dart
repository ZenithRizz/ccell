import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:login_page/home_page.dart';

Future<void> signInWithCollegeGoogleAccount(BuildContext context) async {
    final GoogleSignIn googleSignIn = GoogleSignIn();

      try {
        await googleSignIn.signOut();
        final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

        if (googleUser == null) {
          //user cancelled sign in or process terminated or smth
          return;
        }

        final String email = googleUser.email;
        if (!email.endsWith('@lnmiit.ac.in')) {
          await googleSignIn.signOut();

          await showDialog(
            context: context,
            builder: (BuildContext dialogContext) {
              return AlertDialog(
                backgroundColor: Color.fromARGB(255, 245, 245, 245),
                title: Text('Used an Invalid Email'),

                content: Text('Please use your LNMIIT Email ID to Sign In.'),
                actions: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(dialogContext).pop();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 239, 210, 210),
                      side: BorderSide(
                        color: Color.fromARGB(255, 86, 3, 3),
                        width: 2,
                      )
                    ),
                    child:  Text(
                        'Retry',
                      style: TextStyle(
                        color: Color.fromARGB(255, 86, 3, 3),
                      )

                    ),
                  ),
                ],
              );
            },
          );

          throw Exception('Use your Official College Email ID to Sign In.');
        }

        final GoogleSignInAuthentication googleAuth = await googleUser
            .authentication;
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        await FirebaseAuth.instance.signInWithCredential(credential);
        print('Sign-in Successful');

        UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);

        String userName = userCredential.user?.displayName ?? 'User';

        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => HomePage(userName: userName,)
            ),
        );

    } catch (e) {
    print('Sign-in failed: $e');
    return;
    }

    }


