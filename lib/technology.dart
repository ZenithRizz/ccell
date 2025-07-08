import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_page/council.dart';
import 'package:url_launcher/url_launcher.dart';

class TechnologyCouncil extends StatelessWidget {
  const TechnologyCouncil({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    return Scaffold(
      backgroundColor: const Color(0xFF0E1A23),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.04,
            vertical: height * 0.02,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: height * 0.01),
              CircleAvatar(
                backgroundImage: AssetImage("assets/images/tech_logo.jpg"),
                radius: width * 0.15,
              ),
              SizedBox(height: height * 0.025),
              Text(
                "The LNMIIT Student Science and Technology Council is meticulously designed to foster and promote a vibrant culture of scientific inquiry, technological innovation, and hands-on technical skill development among the student community. It acts as a central hub, orchestrating and amplifying the efforts of various student technical clubs and activities. Beyond mere coordination, the Council actively cultivates an environment ripe for intellectual curiosity and practical application, empowering students to translate theoretical knowledge into tangible solutions.",
                style: GoogleFonts.inter(
                  color: Colors.white,
                  fontSize: width * 0.030,
                ),
              ),
              SizedBox(height: height * 0.025),
              _buildGSecTile(
                "Mr. Shivansh Porwal",
                "General Secretary",
                "8765457211",
                "gsec.science@lnmiit.ac.in",
                width,
              ),
              _buildGSecTile(
                "Ms. Hiya Jain",
                "Associate General Secretary",
                "9701234550",
                "agsec.science@lnmiit.ac.in",
                width,
              ),
              GridView.count(
                shrinkWrap: true,
                crossAxisCount: 2,
                crossAxisSpacing: width * 0.04,
                mainAxisSpacing: height * 0.02,
                childAspectRatio: 0.85,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  squareCard("", "Astronomy", context, "", [], [], '', width),
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
                    width,
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
                    width,
                  ),
                  squareCard("", "Debsoc", context, "", [], [], '', width),
                  squareCard("", "E Cell", context, "", [], [], '', width),
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
                    width,
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
                    width,
                  ),
                ],
              ),
              SizedBox(height: height * 0.03),
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
  double width,
) {
  return Material(
    elevation: 6,
    borderRadius: BorderRadius.circular(16),
    child: InkWell(
      borderRadius: BorderRadius.circular(16),
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
      child: LayoutBuilder(
        builder: (context, constraints) {
          final cardWidth = constraints.maxWidth;
          return Container(
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color.fromRGBO(123, 127, 139, 1), Colors.black],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            padding: EdgeInsets.all(width * 0.02),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundImage: logoUrl.isNotEmpty
                      ? AssetImage(logoUrl)
                      : null,
                  radius: cardWidth * 0.3,
                  backgroundColor: Colors.transparent,
                  child: logoUrl.isEmpty
                      ? const Icon(Icons.group, size: 40, color: Colors.white)
                      : null,
                ),
                SizedBox(height: width * 0.025),
                Text(
                  label,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: cardWidth * 0.1,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          );
        },
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

Widget _buildGSecTile(
  String name,
  String post,
  String phoneUrl,
  String mailUrl,
  double width,
) {
  return Container(
    decoration: BoxDecoration(
      color: const Color(0xFF1C2834),
      borderRadius: BorderRadius.circular(12),
    ),
    margin: EdgeInsets.only(bottom: width * 0.03),
    child: ListTile(
      contentPadding: EdgeInsets.symmetric(
        horizontal: width * 0.04,
        vertical: width * 0.01,
      ),
      title: Text(
        name,
        style: GoogleFonts.inter(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: width * 0.04,
        ),
      ),
      subtitle: Text(
        post,
        style: GoogleFonts.inter(
          color: const Color.fromARGB(255, 192, 190, 190),
          fontSize: width * 0.03,
        ),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: const Icon(Icons.phone, color: Colors.greenAccent),
            onPressed: () => _launchPhone(phoneUrl),
          ),
          IconButton(
            icon: const Icon(Icons.email, color: Colors.lightBlueAccent),
            onPressed: () => _launchEmail(mailUrl),
          ),
        ],
      ),
    ),
  );
}
