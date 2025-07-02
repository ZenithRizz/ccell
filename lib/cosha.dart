import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class COSHAScreen extends StatelessWidget {
  
  void _launchPhone(String phone) async {
    final Uri uri = Uri.parse('tel:$phone');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  void _launchEmail(String email) async {
    final Uri uri = Uri(
      scheme: 'mailto',
      path: email,
    );

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF001219),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              const SizedBox(height: 50),
              CircleAvatar(radius: 80, backgroundImage: AssetImage("assets/images/cosha_logo.jpg"), backgroundColor: Colors.transparent,),
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Text(
                  "A college is composed of many things: students, professors, academic blocks, hostels, mess etc. For the proper functioning of everything lying beneath the biosphere of Hostels, Mess and Canteen, Committee of Students for Hostel Affairs (COSHA) is the way to go. COSHA supervises all matters of common interest to the Hostels, whilst handling queries, complaints and suggestions regarding Mess and Canteen. Be it improving the mess menu, lodging a complaint regarding canteen shops, or raising a query related to the habitable conditions of hostels; Cosha is inculcated with the responsibility of being the voice of students and relaying their valid concerns to the higher authorities. A meeting of COSHA is chaired by the President, and consists of the Convenor of COSHA, Hall Representatives and Chief Warden/Wardens. In a meeting, COSHA puts forward the students’ candid views and tries to establish a common ground. COSHA believes in eliminating all complaints, relaying constructive suggestions and maintaining transparency at all fronts.", 
                  style: GoogleFonts.poppins(color: Colors.white, fontSize: 12), 
                ),
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.all(12),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xFF1C2834),
                    borderRadius: BorderRadius.circular(12)
                  ),
                  child: ListTile(
                    contentPadding: EdgeInsets.symmetric(horizontal: 16),
                    title: Text(
                      "HEAD",
                      style: GoogleFonts.poppins(color: Colors.white, fontWeight: FontWeight.bold,),
                    ),
                    subtitle: Text(
                      "COSHA Head",
                      style: GoogleFonts.poppins(color: const Color.fromARGB(255, 192, 190, 190), fontSize: 10)
                    ),
                    trailing: Wrap(
                      spacing: 12,
                      children: [
                        IconButton(
                          onPressed: () => _launchPhone(""), 
                          icon: Icon(Icons.call, color: Colors.greenAccent,)
                        ),
                        IconButton(
                          onPressed: () => _launchEmail("cosha@lnmiit.ac.in"), 
                          icon: Icon(Icons.mail, color: Colors.lightBlueAccent,)
                        ),
                      ],
                    ),
                  ),
                ),
              )                            
            ]
          ),
        ),
      ),
    );
  }
}