import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
    final Uri uri = Uri(scheme: 'mailto', path: email);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  Future<void> _launchInstagram() async {
    if (instaUrl.trim().isEmpty) return;
    final Uri url = Uri.parse(instaUrl);
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0E1A23),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: 50.h),
            CircleAvatar(
              radius: 60.r,
              backgroundImage: AssetImage(imageUrl),
              backgroundColor: Colors.transparent,
            ),
            SizedBox(height: 15.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Text(
                description,
                style: GoogleFonts.inter(
                  color: Colors.white,
                  fontSize: 10.sp,
                ),
              ),
            ),
            SizedBox(height: 20.h),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.all(12.w),
              itemCount: cordies.length,
              itemBuilder: (context, index) {
                final cordie = cordies[index];
                return Container(
                  margin: EdgeInsets.only(bottom: 12.h),
                  decoration: BoxDecoration(
                    color: const Color(0xFF1C2834),
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: ListTile(
                    contentPadding: EdgeInsets.symmetric(horizontal: 16.w),
                    title: Text(
                      cordie['name'] ?? '',
                      style: GoogleFonts.inter(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 14.sp,
                      ),
                    ),
                    trailing: Wrap(
                      spacing: 12.w,
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
            Divider(color: Colors.white38, thickness: 1.h),
            SizedBox(height: 16.h),
            GalleryCarousel(galleryImages: galleryImages),
            SizedBox(height: 40.h),
            if (instaUrl.trim().isNotEmpty) ...[
              Padding(
                padding: EdgeInsets.all(8.w),
                child: Text(
                  "Connect with us",
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 26.sp,
                  ),
                ),
              ),
              GestureDetector(
                onTap: _launchInstagram,
                child: Image.asset(
                  'assets/images/Instagram.png',
                  width: 60.w,
                  height: 60.w,
                ),
              ),
            ],
            SizedBox(height: 30.h),
          ],
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
  final PageController _pageController = PageController();
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
          Container(
            width: 310.w,
            height: 180.h,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF353F54), Color(0xFF222834)],
              ),
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.r),
              child: Stack(
                children: [
                  PageView.builder(
                    controller: _pageController,
                    itemCount: widget.galleryImages.length,
                    itemBuilder: (context, index) => Stack(
                      fit: StackFit.expand,
                      children: [
                        Image.network(
                          widget.galleryImages[index],
                          fit: BoxFit.cover,
                          loadingBuilder: (context, child, progress) {
                            if (progress == null) return child;
                            return const Center(
                              child: CircularProgressIndicator(color: Colors.white),
                            );
                          },
                          errorBuilder: (context, error, stackTrace) =>
                              const Center(child: Icon(Icons.broken_image, color: Colors.white)),
                        ),
                        Container(color: Colors.black.withOpacity(0.35)),
                      ],
                    ),
                    onPageChanged: (index) {
                      setState(() {
                        _currentIndex = index;
                      });
                    },
                  ),
                  Positioned(
                    left: 16.w,
                    bottom: 6.h,
                    child: Text(
                      'Gallery',
                      style: GoogleFonts.poppins(
                        color: Colors.white.withOpacity(0.5),
                        fontSize: 26.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Arrows
          Positioned(
            left: -15.w,
            child: _arrowButton(Icons.keyboard_arrow_left_sharp, _goToPrevious),
          ),
          Positioned(
            right: -15.w,
            child: _arrowButton(Icons.keyboard_arrow_right_sharp, _goToNext),
          ),
        ],
      ),
    );
  }

  Widget _arrowButton(IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 33.h,
        width: 33.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF8E97FD), Color(0xFF48319D)],
          ),
        ),
        child: Icon(icon, color: Colors.white, size: 23.sp),
      ),
    );
  }
}
