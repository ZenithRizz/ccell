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
                    "assets/images/sports/basketball/basketball_logo.png",
                    "Basketball",
                    context,
                    "Our Basketball Club is a place for students who love the game. We practice regularly, play matches, and grow as a team. Whether you’re a beginner or experienced, everyone’s welcome to join.",
                    [
                      "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/pexels-souvenirpixels-414612.jpg",
                      "https://example.com/gallery2.jpg",
                    ],
                    [
                      {"name": "Cordie 1", "phone": "9979901008", "email": "panthmoradiya7@gmail.com"},
                      {"name": "Cordie 2"},
                      {"name": "Cordie 3"},
                    ],
                    'https://www.instagram.com/p_moradiya_07/'
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
                    "assets/images/sports/football/football_logo.jpg",
                    "Football",
                    context,
                    "Just a bunch of football fanatics who live for the game – whether it's sweating it out on the field or supporting their favourite clubs. LNMFC is all about teamwork, passion, and having a blast while playing the sport we love. Everyone’s welcome, from casual kickers to future pros!",
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
                    "assets/images/sports/kabaddi/kabaddi_logo.jpeg",
                    "Kabaddi",
                    context,
                    "Ready to bring the heat on the mat? LNMIIT Kabaddi is where passion meets power. With consistent podium finishes at Despo and Udghosh, we’re building legends — one tackle at a time. Join us and #LePanga! ",
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
                    "assets/images/sports/lawn_tennis/lawnt_logo.png",
                    "Lawn Tennis",
                    context,
                    "The Lawn Tennis Club welcomes everyone, whether you’re a complete beginner or an experienced player. We hold regular practice sessions, friendly matches, and competitive tournaments throughout the year. It’s a great space to improve your game, stay active, and be part of a supportive tennis community",
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
                      "https://example.com/gallery1.jpg",
                      "https://example.com/gallery2.jpg",
                    ],
                    [
                      {"name": "Cordie 1"},
                      {"name": "Cordie 2"},
                      {"name": "Cordie 3"},
                    ], ""
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