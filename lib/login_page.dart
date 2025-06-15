import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_page/google_sign_in.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 18, 25),
      body: Column(
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
                    height: 400,
                  ),
                ),
              ),
            ],
          ),
          Text(
            'Welcome!',
            style: GoogleFonts.lilitaOne(
              fontSize: 30,
              fontWeight: FontWeight.normal,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'LOGIN WITH YOUR COLLEGE ACCOUNT',
            style: GoogleFonts.poppins(
              fontSize: 14,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 170),
          GestureDetector(
            onTap: () {
              signInWithCollegeGoogleAccount(context);
            },
            child: Container(
              height: 70,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(45),
              ),
              child: Image.asset(
                'assets/images/google_logo.png',
                height: 64,
                fit: BoxFit.contain,
              ),
            ),
          ),
          const SizedBox(height: 20),
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
        ],
      ),
    );
  }
}
