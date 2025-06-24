import 'package:flutter/material.dart';
import 'package:login_page/council.dart';

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
              const Text(
                'SCIENCE & TECHNOLOGY COUNCIL',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 8),
              CircleAvatar(),
              SizedBox(height: 20),
              Text("About the COUNCIL", style: TextStyle(color: Colors.white),),
              SizedBox(height: 20,),
              _buildGSecTile("name", "General Secretary"),
              SizedBox(height: 12,),
              _buildGSecTile("name", "Associate General Secretary"),
              SizedBox(height: 12,),
              GridView.count(
                shrinkWrap: true,
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
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
                    [],
                    [
                      {"name": "Lakshya Jain", "phone": "7568245339"},
                      {"name": "Amartya Vikram Singh", "phone": "6268818288"},
                      {"name": "Siddhartha Swarnkar", "phone": "9831224418"},
                    ],
                    ''
                  ),
                  squareCard(
                    "",
                    "Cybros",
                    context,
                    "",
                    [],
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
                    [],
                    [
                      {"name": "Akshat Mehta", "phone": "9521593891"},
                      {"name": "Dhruv Gupta", "phone": "8005681519"},
                      {"name": "Utkarsh Kumar", "phone": "8840566896"},
                    ],
                    ''
                  ),
                  squareCard(
                    "assets/images/tech/quizzinga/quizzinga_logo.png",
                    "Quizzinga",
                    context,
                    "We are Quizzinga, The official quizzing club of LNMIIT. Some consider us a cult of nerds (may or may not be true), while others call us a buzzing hivemind of trivia enthusiasts. If you like trivia nights, auctions or winning big prizes, Quizzinga might just be your turf. VENI VIDI VICI!!!",
                    [],
                    [
                      {"name": "Akshit Bansal", "phone": "8604944254"},
                      {"name": "Shubh Shresth", "phone": "8887922448"},
                      {"name": "Toshit P. Kumar", "phone": "8107733891"},
                    ],
                    ''
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
            const SizedBox(height: 8),
            Text(label, textAlign: TextAlign.center, style: const TextStyle(color: Colors.white, fontSize: 12)),
          ],
        ),
      ),
    ),
  );
}

class PresidentialCouncilScreen extends StatelessWidget {
  const PresidentialCouncilScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Presidential Council")),
      body: const Center(child: Text("Welcome to Presidential Council")),
    );
  }
}

Widget _buildGSecTile(String name, String post) {
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
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        post,
        style: const TextStyle(
          fontSize: 12,
          color: Color.fromARGB(133, 255, 255, 255),
        ),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: const Icon(Icons.phone, color: Colors.white),
            onPressed: () async {
              // final Uri url = Uri.parse('tel:${cordie['phone']}');
              // if (await canLaunchUrl(url)) {
              //   await launchUrl(url);
              // } else {
              //   throw 'Could not launch $url';
              // }
            },
          ),
          IconButton(
            icon: const Icon(Icons.email, color: Colors.white),
            onPressed: () async {
              // final Uri url = Uri.parse('mailto:${cordie['email']}');
              // if (await canLaunchUrl(url)) {
              //   await launchUrl(url);
              // } else {
              //   throw 'Could not launch $url';
              // }
            },
          ),
        ],
      ),
    ),
  );
}