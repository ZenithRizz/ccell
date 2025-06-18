import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class CouncilDetailScreen extends StatelessWidget {
  final String imageUrl;
  final List<String> galleryImages;
  final List<Map<String, String>> cordies;
  final String instaUrl;

  const CouncilDetailScreen({
    super.key,
    required this.imageUrl,
    required this.galleryImages,
    required this.cordies,
    required this.instaUrl,
  });

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


  Future<void> _launchInstagram() async {
  if (instaUrl.trim().isEmpty) {
    debugPrint('Instagram URL is empty.');
    return;
  }

  final Uri url = Uri.parse(instaUrl);

  if (await canLaunchUrl(url)) {
    await launchUrl(url, mode: LaunchMode.externalApplication);
  } else {
    debugPrint('Could not launch $url');
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 16),
            CircleAvatar(radius: 40, backgroundImage: NetworkImage(imageUrl)),
            const SizedBox(height: 8),
            // Gallery Carousel
            Container(
              height: 160,
              margin: const EdgeInsets.symmetric(horizontal: 16),
              child: PageView.builder(
                itemCount: galleryImages.length,
                controller: PageController(viewportFraction: 0.8),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.network(galleryImages[index], fit: BoxFit.cover),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 16),
            const Divider(color: Colors.white38),

            // Cordies List
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(12),
                itemCount: cordies.length,
                itemBuilder: (context, index) {
                  final cordie = cordies[index];
                  return Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    decoration: BoxDecoration(
                      color: const Color(0xFF1C2834),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                      title: Text(
                        cordie['name'] ?? '',
                        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      trailing: Wrap(
                        spacing: 12,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.call, color: Colors.greenAccent),
                            onPressed: () => _launchPhone(cordie['phone'] ?? ''),
                          ),
                          IconButton(
                            icon: const Icon(Icons.mail, color: Colors.lightBlueAccent),
                            onPressed: () => _launchEmail(cordie['email'] ?? ''),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Connect with us",
                style: GoogleFonts.poppins(
                  color: Color.fromRGBO(255, 255, 255, 1),
                  fontWeight: FontWeight.bold,
                  fontSize: 26
                ),
              ),
            ),
            GestureDetector(
              onTap: () async {
                try {
                  await _launchInstagram();
                } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Unable to open Instagram'))
                  );
                }
              },
              child: Image.asset('assets/images/Instagram.png'),
            ),
            SizedBox(height: 150,)
          ],
        ),
      ),
    );
  }
}