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
                    "assets/images/cultural/aaveg/aaveg_logo.png",
                    "AAVEG, The Nukkad Mandali",
                    context,
                    "Aaveg is the Nukkad Natak (street play) club of our college, dedicated to creating social awareness through powerful performances. With a team of 20–25 members, we bring important societal issues to life through impactful street plays.We perform not only at various inter-college events but also in public with flashmobs at crowded places",
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
                    "assets/images/cultural/capriccio/capriccio_logo.jpg",
                    "Capriccio, The Music Club",
                    context,
                    "Step into a world where melodies speak, rhythms connect, and music becomes a way of life. At Capriccio, we’re a tight-knit crew of singers, instrumentalists, and producers who vibe, jam, and grow together. With every session, we create memories, share knowledge, and build bonds that last far beyond college. It’s more than music—it’s family!",
                    [],
                    [
                      {"name": "Atharva Chhaparwal", "phone": "9352129177"},
                      {"name": "Ayush Verma", "phone": "9654524461"},
                      {"name": "Shyamsundar Paramasivam", "phone": "8015610714"},
                    ],
                    ''
                  ),
                  squareCard(
                    "assets/images/cultural/eminence/eminence_logo.jpg",
                    "Eminence, The Fashion Club",
                    context,
                    "Eminence is a fashion-forward club where style meets passion. From choreographed ramp walks to fashion-themed events, we explore all aspects of fashion. Our club is a space for aspiring models, stylists, and fashion enthusiasts to grow and shine. We believe fashion is not just about clothes — it’s about attitude and identity.",
                    [],
                    [
                      {"name": "Gagan Gaur", "phone": "7689990636"},
                      {"name": "Manasvi Methi", "phone": "8852075880"},
                      {"name": "Shivam Agarwal", "phone": "9386292461"},
                    ],
                    ''
                  ),
                  squareCard(
                    "",
                    "Fundoo Club",
                    context,
                    "",
                    [],
                    [],
                    ''
                  ),
                  squareCard(
                    "assets/images/cultural/imagination/imagination_logo.jpeg",
                    "Imagination",
                    context,
                    "IMAGINATION is the creative photography and cinematography club of The LNM Institute of Information Technology. It is a vibrant community of passionate individuals who explore the world through lenses, pixels, and ideas — turning vision into impactful visuals.",
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
                    "assets/images/cultural/insignia/insignia_logo.jpg",
                    "Insignia, The Dance Club",
                    context,
                    "INSIGNIA, the official dance club of LNMIIT, is a powerhouse of passion, rhythm, and relentless dedication. We pour our heart and soul into every move, crafting performances that leave a mark. Winning doesn't matter—shining is.",
                    [],
                    [],
                    ''
                  ),
                  squareCard(
                    "assets/images/cultural/lc/lc_logo.jpg",
                    "Literary Committee",
                    context,
                    "Putting the CULT in culture, the Literary Committee is a mosh pit fueled by caffeine-riddled fanatics who walk on walls and drink up aquariums. An isle of those who romanticize Sisyphean suffering while thinking of nostalgia as the closest thing to a home. The Literary Committee does it all—with flair and a touch of melancholy.",
                    [],
                    [
                      {"name": "Atharv Shah", "phone": "9315394135"},
                      {"name": "Alakshendra Bhardwaj", "phone": "8299433225"},
                    ],
                    ''
                  ),
                  squareCard(
                    "assets/images/cultural/mediacell/media_logo.jpg",
                    "Media Cell",
                    context,
                    "Media Cell isn’t just a club—it’s a platform for expression. Rooted in the idea of “media” as a medium, it offers students a space to build confidence, stage presence, and spontaneous speaking skills through interactive events. From anchoring major college fests to hosting formats like Doulogue and Knockout Ads, it ensures every voice is heard. At its core, Media Cell turns communication into connection—and gives every voice its medium",
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
                    "assets/images/cultural/rendition/rendition_logo.png",
                    "Rendition, The Dramatics Club",
                    context,
                    "Rendition is the theatre club of LNMIIT, where stories come alive on stage. From expressive mime performances and powerful monoacts to engaging stage plays, the club celebrates the art of acting in all its forms. We believe in the magic of live performance and the ability of theatre to connect, inspire, and transform. Whether through silent gestures or commanding dialogues, Rendition gives voice to creativity and passion.",
                    [],
                    [
                      {"name": "Devansh Pareek", "phone": "7677333444"},
                      {"name": "Harshita Devnani", "phone": "9351023881"},
                      {"name": "Rahul Sharma", "phone": "9899007236"},
                    ],
                    ''
                  ),
                  squareCard(
                    "assets/images/cultural/sankalp/sankalp_logo.jpg",
                    "Sankalp Club",
                    context,
                    "",
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
                    "assets/images/cultural/vignette/vignette_logo.png",
                    "Vignette, The Art Club",
                    context,
                    "Vignette - the Art and Craft Club of LNMIIT, is the creative heart of the campus. It's vibrant artworks bring the campus to life, adding color, energy, and character to every corner. From sketching on sheets to painting walls and even faces, it’s a space where imagination feels at home. With a canvas, a piece of fabric, or just an idea, you're free to create, in your own way.",
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