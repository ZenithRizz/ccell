import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'SCIENCE & TECHNOLOGY COUNCIL',
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold
                )
              ),
              const SizedBox(height: 8),
              CircleAvatar(),
              SizedBox(height: 20),
              Text(
                "About the COUNCIL", 
                style: GoogleFonts.inter(
                  color: Colors.white,
                  fontSize: 12
                ) 
              ),
              SizedBox(height: 20,),
              _buildGSecTile("GSec", "General Secretary", "", ""),
              SizedBox(height: 12,),
              _buildGSecTile("A GSec", "Associate General Secretary", "", ""),
              SizedBox(height: 12,),
              GridView.count(
                shrinkWrap: true,
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 0.85,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  squareCard(
                    "",
                    "Astronomy",
                    context,
                    "",
                    [],
                    [],
                    ''
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
                      {"name": "Lakshya Jain", "phone": "7568245339", "email": "23ucs633@lnmiit.ac.in"},
                      {"name": "Amartya Vikram Singh", "phone": "6268818288", "email": "23ume513@lnmiit.ac.in"},
                      {"name": "Siddhartha Swarnkar", "phone": "9831224418", "email": "23dcs510@lnmiit.ac.in"},
                    ],
                    "https://www.instagram.com/cipher.lnmiit/"
                  ),
                  squareCard(
                    "assets/images/tech/cybros/cybros_logo.jpg",
                    "Cybros",
                    context,
                    "Cybros is a competitive programming club dedicated to fostering a strong coding culture within the college. We promote algorithmic thinking, conduct regular contests, and help students build problem-solving skills through consistent practice and collaboration.",
                    [

                    ],
                    [],
                    ''
                  ),
                  squareCard(
                    "",
                    "Debsoc",
                    context,
                    "",
                    [],
                    [],
                    ''
                  ),
                  squareCard(
                    "",
                    "E Cell",
                    context,
                    "",
                    [],
                    [],
                    ''
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
                      {"name": "Akshat Mehta", "phone": "9521593891", "email": "23ucs525@lnmiit.ac.in"},
                      {"name": "Dhruv Gupta", "phone": "8005681519", "email": "23ume519@lnmiit.ac.in"},
                      {"name": "Utkarsh Kumar", "phone": "8840566896", "email": "23uec637@lnmiit.ac.in"},
                    ],
                    "https://www.instagram.com/phoenix.lnmiit/"
                  ),
                  squareCard(
                    "assets/images/tech/quizzinga/quizzinga_logo.png",
                    "Quizzinga",
                    context,
                    "We are Quizzinga, The official quizzing club of LNMIIT. Some consider us a cult of nerds (may or may not be true), while others call us a buzzing hivemind of trivia enthusiasts. If you like trivia nights, auctions or winning big prizes, Quizzinga might just be your turf. VENI VIDI VICI!!!",
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
                      {"name": "Akshit Bansal", "phone": "8604944254", "email": "23ucs529@lnmiit.ac.in"},
                      {"name": "Shubh Shresth", "phone": "8887922448", "email": "23ucs746@lnmiit.ac.in"},
                      {"name": "Toshit P. Kumar", "phone": "8107733891", "email": "23uec632@lnmiit.ac.in"},
                    ],
                    "https://www.instagram.com/quizzingalnm/"
                  ),
                ],
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}

// Square Card Widget
Widget squareCard(String logoUrl, String label, BuildContext context, String description, List<String> galleryImages, List<Map<String, String>> cordies, String instaUrl) {
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
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(123, 127, 139, 1),
              Colors.black,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        width: 100,
        height: 100,
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(backgroundImage: AssetImage(logoUrl), radius: 50, backgroundColor: Colors.transparent),
            const SizedBox(height: 10),
            Text(label, textAlign: TextAlign.center, style: GoogleFonts.poppins(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
          ],
        ),
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
    final Uri uri = Uri(
      scheme: 'mailto',
      path: email,
    );

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

Widget _buildGSecTile(String name, String post, String phoneUrl, String mailUrl) {
  return Container(
    decoration: BoxDecoration(
      color: const Color(0xFF1C2834),
      borderRadius: BorderRadius.circular(12),
    ),
    margin: const EdgeInsets.only(bottom: 12),
    child: ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      title: Text(
        name,
        style: GoogleFonts.inter(
          color: Colors.white,
          fontWeight: FontWeight.bold
        )
      ),
      subtitle: Text(
        post,
        style: GoogleFonts.inter(
          color: Color.fromARGB(255, 192, 190, 190),
          fontSize: 10
        )
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
            onPressed: () => _launchEmail(mailUrl)
          ),
        ],
      ),
    ),
  );
}