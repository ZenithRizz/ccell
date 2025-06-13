import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatelessWidget{

  HomePage({super.key, required this.userName});

  final Map<String,Map<String, String>> buttonData = {
    'Academic Calender': {
      'image' :'academic_calender.png',
      'url': 'https://lnmiit.ac.in/academics/academic-documents/#pdf-academic-calendar-2025/1/'
    },
    'Lost & Found': {
      'image' : 'lost_found.png',
    },
    'Find The Location': {
      'image': 'find_location.png'
    },
    'Bus Timetable': {
      'image': 'bus_timetable.png',
      'url': 'https://raw.githubusercontent.com/Counselling-Cell-LNMIIT/appResources/main/pdf/Bus_Time_Table.pdf'
    },
    'Mess Menu': {
      'image': 'mess_menu.png',
      'url': 'https://raw.githubusercontent.com/Counselling-Cell-LNMIIT/appResources/main/pdf/Mess_Menu.pdf'
    },
    'Profile': {
      'image' : 'profile.png'
    }
  };
  final String userName;

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
                      'Hi $userName !',
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
                    _ButtonHomeScreen(
                      buttonData['Academic Calender']!['url'],
                      title: 'Academic Calender',
                      imageName: buttonData['Academic Calender']!['image']!),
                    SizedBox(
                      width: 20,
                    ),
                    _ButtonHomeScreen(
                      '',
                        title: 'Profile',
                        imageName: buttonData['Profile']!['image']!),
                  ],
                ),
                SizedBox(
                  width: 20,
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _ButtonHomeScreen(
                      '',
                        title: 'Find The Location',
                        imageName: buttonData['Find The Location']!['image']!),
                    SizedBox(
                      width: 20,
                    ),
                    _ButtonHomeScreen(
                        buttonData['Bus Timetable']!['url'],
                        title: 'Bus Timetable',
                        imageName: buttonData['Bus Timetable']!['image']!),
                  ],
                ),
                SizedBox(
                  width: 20,
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _ButtonHomeScreen(
                        buttonData['Mess Menu']!['url'],
                        title: 'Mess Menu',
                        imageName: buttonData['Mess Menu']!['image']!),
                    SizedBox(
                      width: 20,
                    ),
                    _ButtonHomeScreen(
                      '',
                        title: 'Lost & Found',
                        imageName: buttonData['Lost & Found']!['image']!),
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
  const _ButtonHomeScreen(this.url, {super.key, required this.title, required this.imageName});

  final String title;
  final String imageName;
  final String? url;
  
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
          onPressed: () {
            if(url != null && url!.isNotEmpty){
              _Urllauncher(url!);
            }
          },
          style: ElevatedButton.styleFrom(
                  minimumSize: const Size(166, 166),
                  maximumSize: const Size(166, 166),
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)
                  )
          ),
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 100,
                  width: 120,
                  child: Image.asset(
                      'assets/images/$imageName',
                    fit: BoxFit.contain,
                  ),
                ),
                Flexible(
                  child: Text(
                      title,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: GoogleFonts.lilitaOne(
                      fontSize: 16,
                      color: Colors.white,
                    ),

                  ),
                ),
              ],
            ),
          )),
    );
  }


  Future<void> _Urllauncher(String urlString) async {
    final Uri url = Uri.parse(urlString);
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }
}