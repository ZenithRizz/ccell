import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_page/google_sign_in.dart';
import 'package:login_page/main.dart';
import 'package:login_page/welcome_screen.dart'; // <-- Import WelcomeScreen

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const WelcomeScreen()),
        );
        return false;
      },
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 0, 18, 25),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Stack(
                  children: [
                    Image.asset(
                      'assets/images/Frame_dark.png',
                      width: double.infinity,
                      fit: BoxFit.fitWidth,
                    ),
                    Positioned(
                      top: 80,
                      left: 0,
                      right: 0,
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Image.asset(
                          'assets/images/ccell_logo_dark.png',
                          height: 300,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  'WELCOME!',
                  style: GoogleFonts.lilitaOne(
                    fontSize: 30,
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 10),
                const SizedBox(height: 10),
                SizedBox(
                  width: 300,
                  child: Material(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(45),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(45),
                      onTap: () {
                        signInWithCollegeGoogleAccount(context);
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/google_logo.png',
                              height: 32,
                              fit: BoxFit.contain,
                            ),
                            const SizedBox(width: 10),
                            Flexible(
                              child: Text(
                                'Login with your College Account',
                                style: GoogleFonts.poppins(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                TextButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) => MyHomePage()));
                  },
                  child: const Text("Click for quick access"),
                ),
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.black,
                  ),
                  child: Text(
                    'Unable to Login?',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}