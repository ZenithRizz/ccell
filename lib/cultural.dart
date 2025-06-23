import 'package:flutter/material.dart';
import 'package:login_page/council.dart';

class CulturalCouncil extends StatelessWidget {
  const CulturalCouncil({super.key});

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
                'CULTURAL COUNCIL',
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
                    [Colors.grey.shade300, Colors.blueAccent],
                    "AAVEG, The Nukkad Mandali",
                    context,
                    '',
                    [],
                    [
                      {"name": "Hitesh Shee", "phone": "9311546859"},
                      {"name": "Prachi Saxena", "phone": "8690497223"},
                      {"name": "Shaurya Agarwal", "phone": "7827347353"},
                      {"name": "Shravan Goyal", "phone": "9528133169"},
                    ],
                    ''
                  ),
                  squareCard(
                    [Colors.grey.shade300, Colors.blueAccent],
                    "Capriccio, The Music Club",
                    context,
                    '',
                    [],
                    [
                      {"name": "Atharva Chhaparwal", "phone": "9352129177"},
                      {"name": "Ayush Verma", "phone": "9654524461"},
                      {"name": "Shyamsundar Paramasivam", "phone": "8015610714"},
                    ],
                    ''
                  ),
                  squareCard(
                    [Colors.grey.shade300, Colors.blueAccent],
                    "Eminence, The Fashion Club",
                    context,
                    '',
                    [],
                    [
                      {"name": "Gagan Gaur", "phone": "7689990636"},
                      {"name": "Manasvi Methi", "phone": "8852075880"},
                      {"name": "Shivam Agarwal", "phone": "9386292461"},
                    ],
                    ''
                  ),
                  squareCard(
                    [Colors.grey.shade300, Colors.blueAccent],
                    "Fundoo Club",
                    context,
                    '',
                    [],
                    [],
                    ''
                  ),
                  squareCard(
                    [Colors.grey.shade300, Colors.blueAccent],
                    "Imagination",
                    context,
                    '',
                    [],
                    [
                      {"name": "Dhairya Chhabra", "phone": "9560149823"},
                      {"name": "Kartikeya Singh Gaur", "phone": "9026178103"},
                      {"name": "Kriti Jindal", "phone": "7973049747"},
                      {"name": "Prasoon Agrawal", "phone": "9413922975"},
                    ],
                    ''
                  ),
                  squareCard(
                    [Colors.grey.shade300, Colors.blueAccent],
                    "Insignia, The Dance Club",
                    context,
                    '',
                    [],
                    [],
                    ''
                  ),
                  squareCard(
                    [Colors.grey.shade300, Colors.blueAccent],
                    "Literary Committee",
                    context,
                    '',
                    [],
                    [
                      {"name": "Atharv Shah", "phone": "9315394135"},
                      {"name": "Alakshendra Bhardwaj", "phone": "8299433225"},
                    ],
                    ''
                  ),
                  squareCard(
                    [Colors.grey.shade300, Colors.blueAccent],
                    "Media Cell",
                    context,
                    '',
                    [],
                    [
                      {"name": "Abdul Hadi Siddiqui", "phone": "8107210700"},
                      {"name": "Anshika Agrawal", "phone": "8826256810"},
                      {"name": "Parv Khandelwal", "phone": "8306595368"},
                      {"name": "Vihaan Malik", "phone": "8445893879"},
                    ],
                    ''
                  ),
                  squareCard(
                    [Colors.grey.shade300, Colors.blueAccent],
                    "Rendition, The Dramatics Club",
                    context,
                    '',
                    [],
                    [
                      {"name": "Devansh Pareek", "phone": "7677333444"},
                      {"name": "Harshita Devnani", "phone": "9351023881"},
                      {"name": "Rahul Sharma", "phone": "9899007236"},
                    ],
                    ''
                  ),
                  squareCard(
                    [Colors.grey.shade300, Colors.blueAccent],
                    "Sankalp Club",
                    context,
                    'https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/pexels-souvenirpixels-414612.jpg',
                    [],
                    [
                      {"name": "Anshika Agarwal", "phone": "9462568459"},
                      {"name": "Garvit Jain", "phone": "9518824626"},
                      {"name": "Kushagra Garg", "phone": "9588519915"},
                      {"name": "Paramveer Singh", "phone": "8948000075"},
                      {"name": "Rithvik Bansal", "phone": "9510040865"},
                    ],
                    ""
                  ),
                  squareCard(
                    [Colors.grey.shade300, Colors.blueAccent],
                    "Vignette, The Art Club",
                    context,
                    '',
                    [],
                    [
                      {"name": "Tanay Singhvi", "phone": "6375954622"},
                      {"name": "Amritanshu Kumar Shandilya", "phone": "9461326773"},
                      {"name": "Manasvi Agrawal", "phone": "6367787902"},
                      {"name": "Titiksha Gupta", "phone": "9589433182"},
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
Widget squareCard(List<Color> gradientColors, String label, BuildContext context, String imageUrl, List<String> galleryImages, List<Map<String, String>> cordies, String instaUrl) {
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
                imageUrl: imageUrl,
                galleryImages: galleryImages,
                cordies: cordies,
                instaUrl: instaUrl,
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: gradientColors,
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
            const CircleAvatar(radius: 24, backgroundColor: Colors.white),
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