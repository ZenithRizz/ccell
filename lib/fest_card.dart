import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class StudentEventScreen extends StatelessWidget {

  final String imageUrl;
  final List<String> galleryImages;
  final List<Map<String, String>> festHeads;
  final String instaUrl;
  final String description;
  final String emailUrl;
  final String youtubeUrl;
  final String linkedinUrl;
  final String facebookUrl;
  final String xUrl;
  final String label;

  const StudentEventScreen({
    super.key,
    required this.imageUrl,
    required this.galleryImages,
    required this.festHeads,
    required this.instaUrl,
    required this.description,
    required this.emailUrl,
    required this.youtubeUrl,
    required this.linkedinUrl,
    required this.facebookUrl,
    required this.xUrl,
    required this.label,
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

  Future<void> _launchYouTube(String url) async {
  if (url.trim().isEmpty) {
    debugPrint('YouTube URL is empty.');
    return;
  }

  final Uri youtubeUri = Uri.parse(url);

  if (await canLaunchUrl(youtubeUri)) {
    await launchUrl(youtubeUri, mode: LaunchMode.externalApplication);
  } else {
    debugPrint('Could not launch $youtubeUri');
  }
}

  Future<void> _launchGmail(String gmailUrl) async {
  final Uri emailLaunchUri = Uri(
    scheme: 'mailto',
    path: gmailUrl, // replace with your email
  );

  if (await canLaunchUrl(emailLaunchUri)) {
    await launchUrl(emailLaunchUri);
  } else {
    throw 'Could not launch Gmail';
  }
}

  Future<void> _launchLinkedIn(String url) async {
  if (url.trim().isEmpty) {
    debugPrint('LinkedIn URL is empty.');
    return;
  }

  final Uri linkedinUri = Uri.parse(url);

  if (await canLaunchUrl(linkedinUri)) {
    await launchUrl(linkedinUri, mode: LaunchMode.externalApplication);
  } else {
    debugPrint('Could not launch $linkedinUri');
  }
}

Future<void> _launchFacebook(String url) async {
  if (url.trim().isEmpty) {
    debugPrint('Facebook URL is empty.');
    return;
  }

  final Uri fbUri = Uri.parse(url);

  if (await canLaunchUrl(fbUri)) {
    await launchUrl(fbUri, mode: LaunchMode.externalApplication);
  } else {
    debugPrint('Could not launch $fbUri');
  }
}

Future<void> _launchX(String url) async {
  if (url.trim().isEmpty) {
    debugPrint('X URL is empty.');
    return;
  }

  final Uri xUri = Uri.parse(url);

  if (await canLaunchUrl(xUri)) {
    await launchUrl(xUri, mode: LaunchMode.externalApplication);
  } else {
    debugPrint('Could not launch $xUri');
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0E1A23),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              const SizedBox(height: 50),
              CircleAvatar(radius: 80, backgroundImage: AssetImage(imageUrl), backgroundColor: Colors.transparent,),
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Text(description, style: GoogleFonts.inter(color: Colors.white, fontSize: 10), ),
              ),
              SizedBox(height: 20,),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.all(12),
                itemCount: festHeads.length,
                itemBuilder: (context, index) {
                  final cordie = festHeads[index];
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
                        style: GoogleFonts.inter(color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        label.trim().toLowerCase() == "tedx lnmiit" ? "Organiser" : "Fest Head",
                        style: GoogleFonts.inter(color: Color.fromARGB(255, 192, 190, 190), fontSize: 10),
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
              
              Divider(color: Colors.white38),
              SizedBox(height: 16,),
              GalleryCarousel(galleryImages: galleryImages),
              SizedBox(height: 50,),
    if (instaUrl.trim().isNotEmpty ||
    emailUrl.trim().isNotEmpty ||
    youtubeUrl.trim().isNotEmpty ||
    linkedinUrl.trim().isNotEmpty ||
    facebookUrl.trim().isNotEmpty ||
    xUrl.trim().isNotEmpty)
  ...[
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        "Connect with us",
        style: GoogleFonts.poppins(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 26,
        ),
      ),
    ),
    SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (instaUrl.trim().isNotEmpty)
            GestureDetector(
              onTap: () async {
                try {
                  await _launchInstagram();
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Unable to open Instagram')),
                  );
                }
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Image.asset(
                  'assets/images/Instagram.png',
                  width: 55,
                  height: 55,
                ),
              ),
            ),
      
          if (emailUrl.trim().isNotEmpty)
            GestureDetector(
              onTap: () async {
                try {
                  await _launchGmail(emailUrl);
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Unable to open Gmail')),
                  );
                }
              },
              child: Image.asset(
                'assets/images/gmail.png',
                width: 40,
                height: 40,
              ),
            ),
      
          if (youtubeUrl.trim().isNotEmpty)
            GestureDetector(
              onTap: () async {
                try {
                  await _launchYouTube(youtubeUrl);
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Unable to open YouTube')),
                  );
                }
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 10),
                child: Image.asset(
                  'assets/images/youtube_logo.png',
                  width: 45,
                  height: 45,
                ),
              ),
            ),
          if (linkedinUrl.trim().isNotEmpty)
        GestureDetector(
      onTap: () async {
        try {
          await _launchLinkedIn(linkedinUrl);
        } catch (e) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Unable to open LinkedIn')),
          );
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Image.asset(
          'assets/images/linkedin_logo.png', 
          width: 40,
          height: 40,
        ),
      ),
        ),
      
      if (facebookUrl.trim().isNotEmpty)
        GestureDetector(
      onTap: () async {
        try {
          await _launchFacebook(facebookUrl);
        } catch (e) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Unable to open Facebook')),
          );
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Image.asset(
          'assets/images/facebook.png', // 👈 Add this asset
          width: 40,
          height: 40,
        ),
      ),
        ),
      
      if (xUrl.trim().isNotEmpty)
        GestureDetector(
      onTap: () async {
        try {
          await _launchX(xUrl);
        } catch (e) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Unable to open X')),
          );
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Image.asset(
          'assets/images/x.png', 
          width: 45,
          height: 45,
          
        ),
      ),
        ),
      
        ],
      ),
    ),
    const SizedBox(height: 50),
  ],

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
    return Center(
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          // Card with image carousel
          Container(
            width: 370,
            height: 250,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(53, 63, 84, 1),
                  Color.fromRGBO(34, 40, 52, 1)
                ]
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Stack(
                children: [
                  // PageView
                  PageView.builder(
                    controller: _pageController,
                    itemCount: widget.galleryImages.length,
                    itemBuilder: (context, index) {
                      return Stack(
                        fit: StackFit.expand,
                        children: [
                          Image.network(
                            widget.galleryImages[index],
                            fit: BoxFit.cover,
                            loadingBuilder: (context, child, progress) {
                              if (progress == null) return child;
                              return const Center(
                                  child: CircularProgressIndicator(color: Colors.white));
                            },
                            errorBuilder: (context, error, stackTrace) =>
                                const Center(child: Icon(Icons.broken_image, color: Colors.white)),
                          ),
                          Container(
                            color: Colors.black.withOpacity(0.35),
                          ),
                        ],
                      );
                    },
                    onPageChanged: (index) {
                      setState(() {
                        _currentIndex = index;
                      });
                    },
                  ),

                  // Gallery label
                  Positioned(
                    left: 16,
                    bottom: 6,
                    child: Text(
                      'Gallery',
                      style: GoogleFonts.poppins(
                        color: Colors.white.withOpacity(0.6),
                        fontSize: 26,
                        fontWeight: FontWeight.bold
                      )
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Left Arrow - Overlapping
          Positioned(
            left: -20,
            child: GestureDetector(
              onTap: () => _goToPrevious(),
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color.fromRGBO(142, 151, 253, 1),
                      Color.fromRGBO(72, 49, 157, 1)
                    ]
                  )
                ),
                child: Icon(Icons.keyboard_arrow_left_sharp, color: Colors.white, size: 30,)
              )
            ),
          ),

          // Right Arrow - Overlapping
          Positioned(
            right: -20,
            child: GestureDetector(
              onTap: () => _goToNext(),
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color.fromRGBO(142, 151, 253, 1),
                      Color.fromRGBO(72, 49, 157, 1)
                    ]
                  )
                ),
                child: Icon(Icons.keyboard_arrow_right_sharp, color: Colors.white, size: 30,)
              )
            ),
          ),
        ],
      ),
    );
  }
}