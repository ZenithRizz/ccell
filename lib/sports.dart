import 'package:google_fonts/google_fonts.dart';
import 'package:login_page/council.dart';
import 'package:flutter/material.dart';

import 'council.dart';

class SportsCouncil extends StatelessWidget {
  const SportsCouncil({super.key});

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
                'SPORTS COUNCIL',
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
                    "assets/images/sports/badminton/badminton_logo.jpeg",
                    "Badminton",
                    context,
                    "The Badminton Club is where ambition meets discipline — a court for those who play to win and train to dominate. Every match is a test, every session a step toward becoming unbeatable. It’s not just about playing; it’s about proving you’re better than yesterday.",
                    [
                      "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/sports/badminton/bad1.jpeg",
                      "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/sports/badminton/bad2.jpeg",
                      "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/sports/badminton/bad3.jpeg",
                      "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/sports/badminton/bad4.jpeg",
                      "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/sports/badminton/bad5.jpeg",
                    ],
                    [
                      {"name": "Abhas Chaudhary", "phone": "9411453707", "email": "23uec502@lnmiit.ac.in"},
                      {"name": "Raman Kumar Singh", "phone": "8591708702", "email": "23ucs689@lnmiit.ac.in"},
                      {"name": "Vanshika Garg", "phone": "7509004321", "email": "v23ume552@lnmiit.ac.in"},
                    ],
                    "https://www.instagram.com/badminton_lnmiit/"
                  ),
                  squareCard(
                    "assets/images/sports/basketball/basketball_logo.png",
                    "Basketball",
                    context,
                    "Our Basketball Club is a place for students who love the game. We practice regularly, play matches, and grow as a team. Whether you’re a beginner or experienced, everyone’s welcome to join.",
                    [
                      "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/sports/basketball/basket1.jpeg",
                      "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/sports/basketball/basket2.jpeg",
                      "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/sports/basketball/basket3.jpeg",
                      "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/sports/basketball/basket4.jpeg",
                    ],
                    [
                      {"name": "Deepanshu Sharma", "phone": "9509014105", "email": "23ucs561@lnmiit.ac.in"},
                      {"name": "Hiitesh Gour", "phone": "7878431617", "email": "23ucs590@lnmiit.ac.in"},
                      {"name": "Shreyansh Agarwal", "phone": "8005681982", "email": "23ucs709@lnmiit.ac.in"},
                      {"name": "Umang Jindal", "phone": "8619029605", "email": "23ucs727@lnmiit.ac.in"},
                    ],
                    'https://www.instagram.com/lnmiit_basketball/'
                  ),
                  squareCard(
                    "",
                    "Chess",
                    context,
                    "",
                    [
                      "https://example.com/gallery1.jpg",
                      "https://example.com/gallery2.jpg",
                    ],
                    [
                      {"name": "Cordie 1"},
                      {"name": "Cordie 2"},
                      {"name": "Cordie 3"},
                    ],
                    ""
                  ),
                  squareCard(
                    "assets/images/sports/cricket/cricket_logo.jpeg",
                    "Cricket",
                    context,
                    "At LNMIIT, cricket is more than just a game-its a shared passion that brings students across batches. The cricket culture here fosters not only teamwork and competitiveness but also creates a homely bond with seniors and its a place where memories are made beyond scorecard.",
                    [
                      "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/sports/cricket/cricket1.jpeg",
                      "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/sports/cricket/cricket2.jpeg",
                      "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/sports/cricket/cricket3.jpeg",
                      "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/sports/cricket/cricket4.jpeg",
                      "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/sports/cricket/cricket5.jpeg",
                      "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/sports/cricket/cricket6.jpeg",
                      "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/sports/cricket/cricket7.jpeg",
                      "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/sports/cricket/cricket8.jpeg",
                      "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/sports/cricket/cricket9.jpeg",
                    ],
                    [
                      {"name": "Akshat Tyagi", "phone": "7611879965", "email": "23uec510@lnmiit.ac.in"},
                      {"name": "Parth Pandey", "phone": "9023973958", "email": "23ucs662@lnmiit.ac.in"},
                      {"name": "Vijay Kumar Bijarnia", "phone": "6280833211", "email": "23ume554@lnmiit.ac.in"},
                    ],
                    "https://www.instagram.com/_cricket_lnmiit/"
                  ),
                  squareCard(
                    "assets/images/sports/football/football_logo.jpg",
                    "Football",
                    context,
                    "Just a bunch of football fanatics who live for the game – whether it's sweating it out on the field or supporting their favourite clubs. LNMFC is all about teamwork, passion, and having a blast while playing the sport we love. Everyone’s welcome, from casual kickers to future pros!",
                    [
                      "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/sports/football/foot1.jpg",
                      "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/sports/football/foot2.jpg",
                      "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/sports/football/foot3.jpg",
                      "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/sports/football/foot4.jpg",
                    ],
                    [
                      {"name": "Anurag Tomar", "phone": "9354892101", "email": "23ucs542@lnmiit.ac.in"},
                      {"name": "Kartikeya Swami", "phone": "6350619239", "email": "23ume527@lnmiit.ac.in"},
                      {"name": "Priyangshu Saha", "phone": "8597641998", "email": "23ucc587@lnmiit.ac.in"},
                    ],
                    "https://www.instagram.com/football.lnmiit/"
                  ),
                  squareCard(
                    "assets/images/sports/kabaddi/kabaddi_logo.jpeg",
                    "Kabaddi",
                    context,
                    "Ready to bring the heat on the mat? LNMIIT Kabaddi is where passion meets power. With consistent podium finishes at Despo and Udghosh, we’re building legends — one tackle at a time. Join us and #LePanga! ",
                    [
                      "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/sports/kabaddi/kabaddi1.jpeg",
                      "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/sports/kabaddi/kabaddi2.jpeg",
                      "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/sports/kabaddi/kabaddi3.jpeg",
                      "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/sports/kabaddi/kabaddi4.jpeg",
                      "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/sports/kabaddi/kabaddi5.jpeg",
                    ],
                    [
                      {"name": "Arpit Singh", "phone": "7988039741", "email": "23ucc519@lnmiit.ac.in"},
                      {"name": "Bhavesh Rode", "phone": "9307502610", "email": "23ucc531@lnmiit.ac.in"},
                      {"name": "Ishan Bansal", "phone": "6375492739", "email": "23uec553@lnmiit.ac.in"},
                      {"name": "Naveen Kumawat", "phone": "7569619441", "email": ""},
                    ],
                    "https://www.instagram.com/lnmiit_kabaddi/"
                  ),
                  squareCard(
                    "assets/images/sports/lawn_tennis/lawnt_logo.png",
                    "Lawn Tennis",
                    context,
                    "The Lawn Tennis Club welcomes everyone, whether you’re a complete beginner or an experienced player. We hold regular practice sessions, friendly matches, and competitive tournaments throughout the year. It’s a great space to improve your game, stay active, and be part of a supportive tennis community",
                    [
                      "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/sports/lawn_tennis/lawn3.jpeg",
                      "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/sports/lawn_tennis/lawn1.jpeg",
                      "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/sports/lawn_tennis/lawn2.jpeg",
                      "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/sports/lawn_tennis/lawn4.jpeg",
                    ],
                    [
                      {"name": "Aditya Vyas", "phone": "9079255992", "email": "23ucs519@lnmiit.ac.in"},
                      {"name": "Krishna Prabhav", "phone": "9550725780", "email": "23ucs640@lnmiit.ac.in"},
                    ],
                    ""
                  ),
                  squareCard(
                    "",
                    "Squash",
                    context,
                    "",
                    [
                      "https://example.com/gallery1.jpg",
                      "https://example.com/gallery2.jpg",
                    ],
                    [
                      {"name": "Cordie 1"},
                      {"name": "Cordie 2"},
                      {"name": "Cordie 3"},
                    ],
                    ""
                  ),
                  squareCard(
                    "assets/images/sports/table_tennis/tablet_logo.png",
                    "Table Tennis",
                    context,
                    "The Table Tennis Club is a passionate and competitive group dedicated to learning and improving the sport. With a history of securing top positions in past competitions, the club proudly includes state-level players who lead by example. Members train rigorously and regularly participate in friendly matches with other colleges to gain experience and build camaraderie.",
                    [
                      "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/sports/table_tennis/tablt1.jpg",
                      "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/sports/table_tennis/tablt3.jpg",
                      "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/sports/table_tennis/tablt4.jpg",
                      "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/sports/table_tennis/tablt5.jpg",
                      "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/sports/table_tennis/tablt6.jpg",
                      "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/sports/table_tennis/tablt7.jpg",
                    ],
                    [
                      {"name": "Charu Arora", "phone": "", "email": "23uec530@lnmiit.ac.in"},
                      {"name": "Pratham Kala", "phone": "6376665781", "email": "23ucs675@lnmiit.ac.in"},
                      {"name": "Soumya Jain", "phone": "7877318802", "email": "23ucs717@lnmiit.ac.in"},
                      {"name": "Urvi Salecha", "phone": "", "email": ""},
                    ], 
                    ""
                  ),
                  squareCard(
                    "",
                    "Volleyball",
                    context,
                    "",
                    [
                      "https://example.com/gallery1.jpg",
                      "https://example.com/gallery2.jpg",
                    ],
                    [
                      {"name": "Anisha Khandelwal"},
                      {"name": "Anvesh Gupta", "phone": "9045488096"},
                      {"name": "Priyanshi Kadian"},
                      {"name": "Saurav Rathi", "phone": "9821723636"},
                      {"name": "Vishesh Jain"},
                    ],
                    ""
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
            Text(label, textAlign: TextAlign.center, style: GoogleFonts.lilitaOne(color: Colors.white, fontSize: 22)),
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