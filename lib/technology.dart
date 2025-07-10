import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:login_page/council.dart';
import 'package:url_launcher/url_launcher.dart';

class TechnologyCouncil extends StatelessWidget {
  const TechnologyCouncil({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0E1A23),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 140.h,
                width: double.infinity,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: CircleAvatar(
                        radius: 60.r,
                        backgroundImage: AssetImage(
                          "assets/images/tech_logo.jpg",
                        ),
                        backgroundColor: Colors.transparent,
                      ),
                    ),
                    Positioned(
                      top: 10.h,
                      left: 15.w,
                      child: GestureDetector(
                        onTap: () => Navigator.of(context).pop(),
                        child: Container(
                          padding: EdgeInsets.all(4.w),
                          decoration: BoxDecoration(
                            color: Color(0xFF1C2834),
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.white.withOpacity(0.2),
                              width: 2,
                            ),
                          ),
                          child: Icon(
                            Icons.keyboard_arrow_left,
                            color: Colors.white,
                            size: 30.sp,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.h),
                child: Text(
                  "The LNMIIT Student Science and Technology Council is meticulously designed to foster and promote a vibrant culture of scientific inquiry, technological innovation, and hands-on technical skill development among the student community. It acts as a central hub, orchestrating and amplifying the efforts of various student technical clubs and activities. Beyond mere coordination, the Council actively cultivates an environment ripe for intellectual curiosity and practical application, empowering students to translate theoretical knowledge into tangible solutions.",
                  style: GoogleFonts.inter(color: Colors.white, fontSize: 9.sp),
                ),
              ),
              SizedBox(height: 20.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: _buildGSecTile(
                  "Mr. Shivansh Porwal",
                  "General Secretary",
                  "8765457211",
                  "gsec.science@lnmiit.ac.in",
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: _buildGSecTile(
                  "Ms. Hiya Jain",
                  "Associate General Secretary",
                  "9701234550",
                  "agsec.science@lnmiit.ac.in",
                ),
              ),
              SizedBox(height: 10.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: GridView.count(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  crossAxisSpacing: 16.w,
                  mainAxisSpacing: 16.h,
                  childAspectRatio: 0.9,
                  children: [
                    squareCard(
                      "",
                      "Astronomy",
                      context,
                      "",
                      [],
                      [
                        {
                          "name": "Mudit Choudhary",
                          "phone": "9672467580",
                          "email": "23ucc623@lnmiit.ac.in",
                        },
                        {
                          "name": "Sirjan Singh",
                          "phone": "6239709755",
                          "email": "23ucs715@lnmiit.ac.in",
                        },
                        {
                          "name": "Sunidhi Avasthi",
                          "phone": "9829756507",
                          "email": "23ume547@lnmiit.ac.in ",
                        },
                        {
                          "name": "Vibhu Bharadwaj",
                          "phone": "9079660589",
                          "email": "23uec643@lnmiit.ac.in",
                        },
                      ],
                      'https://www.instagram.com/astronomylnmiit?igsh=MXEwemh4cjYwNzcxbQ==',
                    ),
                    squareCard(
                      "assets/images/tech/cipherclub/cipher_logo.png",
                      "Cipher",
                      context,
                      "With the mission to empower and educate, CIPHER is the Cybersecurity and Blockchain club focused on fostering awareness, innovation, and a strong technical culture. It provides a space for students to explore digital security and decentralized technologies, grow through collaboration, and engage with two of the most impactful domains shaping the future.",
                      [
                        "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/tech/cipherclub/cipher1.jpeg",
                        "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/tech/cipherclub/cipher2.jpg",
                        "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/tech/cipherclub/cipher3.jpeg",
                      ],
                      [
                        {
                          "name": "Lakshya Jain",
                          "phone": "7568245339",
                          "email": "23ucs633@lnmiit.ac.in",
                        },
                        {
                          "name": "Amartya Vikram Singh",
                          "phone": "6268818288",
                          "email": "23ume513@lnmiit.ac.in",
                        },
                        {
                          "name": "Siddhartha Swarnkar",
                          "phone": "9831224418",
                          "email": "23dcs510@lnmiit.ac.in",
                        },
                      ],
                      "https://www.instagram.com/cipher.lnmiit/",
                    ),
                    squareCard(
                      "assets/images/tech/cybros/cybros_logo.jpg",
                      "Cybros",
                      context,
                      "Cybros is a competitive programming club dedicated to fostering a strong coding culture within the college. We promote algorithmic thinking, conduct regular contests, and help students build problem-solving skills through consistent practice and collaboration.",
                      [
                        "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/tech/cybros/cybros1.jpg",
                        "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/tech/cybros/cybros2.jpg",
                        "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/tech/cybros/cybros3.jpg",
                        "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/tech/cybros/cybros4.jpg",
                        "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/tech/cybros/cybros5.jpg",
                        "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/tech/cybros/cybros6.jpg",
                        "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/tech/cybros/cybros7.jpg",
                      ],
                      [
                        {
                          "name": "Naman Jain",
                          "phone": "8890061881",
                          "email": "22ucs133@lnmiit.ac.in",
                        },
                        {
                          "name": "Romit Sovakar",
                          "phone": "8436915546",
                          "email": "22ucs168@lnmiit.ac.in",
                        },
                      ],
                      'https://www.instagram.com/cybros_lnmiit/',
                    ),
                    squareCard(
                      "",
                      "Debsoc",
                      context,
                      "",
                      [],
                      [],
                      'https://www.instagram.com/cybros_lnmiit?igsh=YjY0OGVjMWU4NW54',
                    ),
                    squareCard(
                      "",
                      "E Cell",
                      context,
                      "",
                      [],
                      [
                        {
                          "name": "Deepanshu Gupta",
                          "phone": "9145907801",
                          "email": "22ucs058@lnmiit.ac.in",
                        },
                        {
                          "name": "Harsh Koringa",
                          "phone": "8160552247",
                          "email": "22ucs088@lnmiit.ac.in",
                        },
                      ],
                      ' https://www.instagram.com/ecell.lnmiit?igsh=NTRsOWF6Y3ZwODJx',
                    ),
                    squareCard(
                      "assets/images/tech/phoenix/phoenix_logo.png",
                      "Phoenix",
                      context,
                      "Phoenix , The Robotics club of LNMIIT Jaipur is a vibrant community of tech enthusiasts committed to hands-on innovation, collaborative problem-solving, and excellence in robotics. We actively design, build, and program intelligent systems while proudly representing our institution in prestigious nationwide competitions, fostering both technical expertise and a spirit of innovation.",
                      [
                        "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/tech/phoenix/phoenix1.jpg",
                        "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/tech/phoenix/phoenix2.jpg",
                        "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/tech/phoenix/phoenix3.jpg",
                        "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/tech/phoenix/phoenix4.jpg",
                        "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/tech/phoenix/phoenix5.jpg",
                        "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/tech/phoenix/phoenix6.jpg",
                        "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/tech/phoenix/phoenix7.jpg",
                        "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/tech/phoenix/phoenix8.jpg",
                        "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/tech/phoenix/phoenix9.jpg",
                      ],
                      [
                        {
                          "name": "Akshat Mehta",
                          "phone": "9521593891",
                          "email": "23ucs525@lnmiit.ac.in",
                        },
                        {
                          "name": "Dhruv Gupta",
                          "phone": "8005681519",
                          "email": "23ume519@lnmiit.ac.in",
                        },
                        {
                          "name": "Utkarsh Kumar",
                          "phone": "8840566896",
                          "email": "23uec637@lnmiit.ac.in",
                        },
                      ],
                      "https://www.instagram.com/phoenix.lnmiit/",
                    ),
                    squareCard(
                      "assets/images/tech/quizzinga/quizzinga_logo.jpg",
                      "Quizzinga",
                      context,
                      "We are Quizzinga, The official quizzing club of LNMIIT...",
                      [
                        "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/tech/quizzinga/quizzinga1.jpg",
                        "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/tech/quizzinga/quizzinga2.jpg",
                        "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/tech/quizzinga/quizzinga3.jpg",
                        "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/tech/quizzinga/quizzinga4.jpg",
                        "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/tech/quizzinga/quizzinga5.jpg",
                        "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/tech/quizzinga/quizzinga6.jpg",
                        "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/tech/quizzinga/quizzinga7.jpg",
                        "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/tech/quizzinga/quizzinga8.jpg",
                        "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/tech/quizzinga/quizzinga9.jpg",
                      ],
                      [
                        {
                          "name": "Akshit Bansal",
                          "phone": "8604944254",
                          "email": "23ucs529@lnmiit.ac.in",
                        },
                        {
                          "name": "Shubh Shresth",
                          "phone": "8887922448",
                          "email": "23ucs746@lnmiit.ac.in",
                        },
                        {
                          "name": "Toshit P. Kumar",
                          "phone": "8107733891",
                          "email": "23uec632@lnmiit.ac.in",
                        },
                      ],
                      "https://www.instagram.com/quizzingalnm/",
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24.h),
            ],
          ),
        ),
      ),
    );
  }
}

Widget squareCard(
  String logoUrl,
  String label,
  BuildContext context,
  String description,
  List<String> galleryImages,
  List<Map<String, String>> cordies,
  String instaUrl,
) {
  return Material(
    elevation: 6,
    borderRadius: BorderRadius.circular(16.r),
    child: InkWell(
      borderRadius: BorderRadius.circular(16.r),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CouncilDetailScreen(
              imageUrl: logoUrl,
              galleryImages: galleryImages,
              cordies: cordies,
              instaUrl: instaUrl,
              description: description,
            ),
          ),
        );
      },
      child: Container(
        width: 100.w,
        height: 100.h,
        padding: EdgeInsets.all(8.r),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFF353F54), Color(0xFF222834)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: Colors.white.withOpacity(0.2), width: 2.w),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(logoUrl),
              radius: 40.r,
              backgroundColor: Colors.transparent,
            ),
            SizedBox(height: 8.h),
            Text(
              label,
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget _buildGSecTile(
  String name,
  String post,
  String phoneUrl,
  String mailUrl,
) {
  return Container(
    margin: EdgeInsets.only(bottom: 12.h),
    decoration: BoxDecoration(
      color: const Color(0xFF1C2834),
      borderRadius: BorderRadius.circular(12.r),
      border: Border.all(color: Colors.white.withOpacity(0.2), width: 2.w),
    ),
    child: ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
      title: Text(
        name,
        style: GoogleFonts.inter(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 14.sp,
        ),
      ),
      subtitle: Text(
        post,
        style: GoogleFonts.inter(
          color: Color.fromARGB(255, 192, 190, 190),
          fontSize: 10.sp,
        ),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: Icon(Icons.phone, color: Colors.greenAccent, size: 20.sp),
            onPressed: () => _launchPhone(phoneUrl),
          ),
          IconButton(
            icon: Icon(Icons.email, color: Colors.lightBlueAccent, size: 20.sp),
            onPressed: () => _launchEmail(mailUrl),
          ),
        ],
      ),
    ),
  );
}

void _launchPhone(String phone) async {
  final Uri uri = Uri.parse('tel:$phone');
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri);
  }
}

void _launchEmail(String email) async {
  final Uri uri = Uri(scheme: 'mailto', path: email);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri);
  }
}
