import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_page/google_sign_in.dart';

class LoginPage extends StatelessWidget{
  const LoginPage({super.key});

  @override
  Widget build(context){
    return MaterialApp(
        home: Scaffold(
          backgroundColor: Color.fromARGB(255, 143, 0, 34),
          body: Column(
            mainAxisSize: MainAxisSize.max,
              children: [
                Stack(
                  children: [
                    Image.asset(
                      'assets/images/Frame.png',
                      width: double.infinity,
                      fit: BoxFit.fitWidth,
                    ),
                    Positioned(
                      top: 80, // Adjust this based on how low you want the logo
                      left: 0,
                      right: 0,
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Image.asset(
                          'assets/images/ccell_logo.png',
                          height: 400, // You can change size here
                        ),
                      ),
                    ),
                  ],
                ),
              Text(
                  'Welcome!',
                  style:
                  TextStyle(
                    fontSize: 40,
                  )
              ),
              SizedBox(
                height: 100,
              ),
              Text(
                  'LOGIN WITH YOUR COLLEGE ACCOUNT',
                style: GoogleFonts.poppins(
                  fontSize: 14,
                )
                ),

                SizedBox(
                  height: 8,
                ),
              GestureDetector(
                onTap: () {
                  signInWithCollegeGoogleAccount(context);
                },
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(45),
                  ),
                  //padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  child: Image.asset(
                      'assets/images/google_logo.png',
                    height: 50,
                    fit: BoxFit.contain
                  ),
                ),
              ),
              SizedBox(
                height: 100,
              ),
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  foregroundColor: Colors.black,
                ),
                child: Text('Unable to Login?'),
              ),
            ],
          ),
        )
    );
  }
}