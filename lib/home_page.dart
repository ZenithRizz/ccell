import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget{

  HomePage({super.key});

  final Map<String, String> buttonData = {
    'Academic Calender': 'academic_calender.png',
    'Lost & Found': 'lost_found.png',
    'Find The Location': 'find_location.png',
    'Bus Timetable': 'bus_timetable.png',
    'Mess Menu': 'mess_menu.png',
    'Profile': 'profile.png'
  };

  @override
  Widget build (context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 0, 18, 25),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 70,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Row(
                children: [
                  SizedBox(
                    width: 30,
                  ),
                  Text(
                      'Hi Name !',
                      style: GoogleFonts.lilitaOne(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      )
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 60,
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _ButtonHomeScreen(title: 'Test 1'),
                    SizedBox(
                      width: 20,
                    ),
                    _ButtonHomeScreen(title: 'Test 1'),
                  ],
                ),
                SizedBox(
                  width: 20,
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _ButtonHomeScreen(title: 'Test 1'),
                    SizedBox(
                      width: 20,
                    ),
                    _ButtonHomeScreen(title: 'Test 1'),
                  ],
                ),
                SizedBox(
                  width: 20,
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _ButtonHomeScreen(title: 'Test 1'),
                    SizedBox(
                      width: 20,
                    ),
                    _ButtonHomeScreen(title: 'Test 1'),
                  ],
                )
              ],
                    ),
            ),
          ],
        ),
    );
  }

}

class _ButtonHomeScreen extends StatelessWidget {
  const _ButtonHomeScreen({super.key, required this.title});

  final String title;
  
  @override
  Widget build (context){
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [
              Colors.white.withOpacity(0.4),
              Color.fromARGB(255, 199, 198, 198).withOpacity(0.3),
              Colors.black.withOpacity(0.2),
            ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
                  minimumSize: const Size(166, 166),
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)
                  )
          ),
          child: Column(
            children: [
              SizedBox(
                height: 120,
                width: 120,
                child: Image.asset(
                    'assets/images/ccell_logo.png',
                  fit: BoxFit.contain,
                ),
              ),
              Text(
                  title,
                style: GoogleFonts.lilitaOne(
                  fontSize: 16,
                  color: Colors.white,
                )
              ),
            ],
          )),
    );
  }
}