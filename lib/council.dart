import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class CouncilDetailScreen extends StatelessWidget {
  final String imageUrl;
  final List<String> galleryImages;
  final List<Map<String, String>> cordies;
  final String instaUrl;
  final String description;

  const CouncilDetailScreen({
    super.key,
    required this.imageUrl,
    required this.galleryImages,
    required this.cordies,
    required this.instaUrl,
    required this.description,
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
      backgroundColor: Color(0xFF001219),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              const SizedBox(height: 50),
              CircleAvatar(radius: 80, backgroundImage: AssetImage(imageUrl), backgroundColor: Colors.transparent,),
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Text(description, style: GoogleFonts.poppins(color: Colors.white, fontSize: 12), ),
              ),
              SizedBox(height: 20,),
              // Gallery Carousel
              GalleryCarousel(galleryImages: galleryImages),
          
              const SizedBox(height: 16),
              const Divider(color: Colors.white38),
          
              // Cordies List
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
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
                        style: GoogleFonts.poppins(color: Colors.white, fontWeight: FontWeight.bold),
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
              if (instaUrl.trim().isNotEmpty)
                ...[
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
                SizedBox(height: 30,)
              ],
              SizedBox(height: 50,)
            ]
          ),
        ),
      ),
    );
  }
}

class GalleryCarousel extends StatefulWidget {
  final List<String> galleryImages;

  const GalleryCarousel({super.key, required this.galleryImages});

  @override
  State<GalleryCarousel> createState() => _GalleryCarouselState();
}

class _GalleryCarouselState extends State<GalleryCarousel> {
  final PageController _pageController = PageController(viewportFraction: 1.0);
  int _currentIndex = 0;

  void _goToPrevious() {
    if (_currentIndex > 0) {
      _currentIndex--;
      _pageController.animateToPage(
        _currentIndex,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      setState(() {});
    }
  }

  void _goToNext() {
    if (_currentIndex < widget.galleryImages.length - 1) {
      _currentIndex++;
      _pageController.animateToPage(
        _currentIndex,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      decoration: BoxDecoration(
        color: const Color(0xFF1C2834),
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Arrows + gallery area
          Row(
            //mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // Left arrow button
              IconButton(
                icon: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: const LinearGradient(
                      colors: [Color(0xFF6A85F1), Color(0xFF7AC5FF)],
                    ),
                  ),
                  child: const Icon(Icons.arrow_left, color: Colors.white),
                ),
                onPressed: _goToPrevious,
              ),

              // Gallery image display
              Expanded(
                child: Container(
                  height: 210,
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    color: const Color(0xFF2B3948),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: widget.galleryImages.length,
                    itemBuilder: (context, index) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.network(
                          widget.galleryImages[index],
                          fit: BoxFit.cover,
                          loadingBuilder: (context, child, progress) {
                            if (progress == null) return child;
                            return const Center(child: CircularProgressIndicator(color: Colors.white,));
                          },
                          errorBuilder: (context, error, stackTrace) =>
                              const Center(child: Icon(Icons.broken_image, color: Colors.white)),
                        ),
                      );
                    },
                    onPageChanged: (index) {
                      setState(() {
                        _currentIndex = index;
                      });
                    },
                  ),
                ),
              ),

              // Right arrow button
              IconButton(
                icon: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: const LinearGradient(
                      colors: [Color(0xFF6A85F1), Color(0xFF7AC5FF)],
                    ),
                  ),
                  child: const Icon(Icons.arrow_right, color: Colors.white),
                ),
                onPressed: _goToNext,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
