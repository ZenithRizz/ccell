import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatelessWidget {
  final String userName;
  const HomePage({super.key, required this.userName});

  @override
  Widget build(BuildContext context) {
    return HomeDashboard(userName: userName);
  }
}

class HomeDashboard extends StatelessWidget {
  final String userName;

  HomeDashboard({super.key, required this.userName});

  final Map<String, Map<String, dynamic>> buttonData = {
    'Academic Calendar': {
      'image': 'academic_calender.png',
      'url':
      'https://lnmiit.ac.in/academics/academic-documents/#pdf-academic-calendar-2025/1/',
    },
    'Lost & Found': {
      'image': 'lost_found.png',
    },
    'Find the Location': {
      'image': 'find_location.png',
    },
    'Bus Timetable': {
      'image': 'bus_timetable.png',
      'url':
      'https://raw.githubusercontent.com/Counselling-Cell-LNMIIT/appResources/main/pdf/Bus_Time_Table.pdf',
    },
    'Mess Menu': {
      'image': 'mess_menu.png',
      'url':
      'https://raw.githubusercontent.com/Counselling-Cell-LNMIIT/appResources/main/pdf/Mess_Menu.pdf',
    },
    'Profile': {
      'image': 'profile.png',
      'route': 'profile',
    }
  };

  @override
  Widget build(context) {
    return Scaffold(
      backgroundColor: const Color(0xFF001219),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 70),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                Text(
                  'Hi $userName!',
                  style: GoogleFonts.poppins(
                    fontSize: 36,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.2,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 60),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              children: buttonData.entries.map((entry) {
                return FancyButton(
                  title: entry.key,
                  imageName: entry.value['image'],
                  url: entry.value['url'],
                  route: entry.value['route'],
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class FancyButton extends StatefulWidget {
  final String title;
  final String imageName;
  final String? route;
  final String? url;

  const FancyButton({
    super.key,
    required this.title,
    required this.imageName,
    this.route,
    this.url,
  });

  @override
  State<FancyButton> createState() => _FancyButtonState();
}

class _FancyButtonState extends State<FancyButton> {
  bool _isPressed = false;
  bool _isHovered = false;

  Future<void> _launchUrl(String urlString) async {
    final Uri uri = Uri.parse(urlString);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $uri');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTapDown: (_) => setState(() => _isPressed = true),
        onTapUp: (_) => setState(() => _isPressed = false),
        onTapCancel: () => setState(() => _isPressed = false),
        onTap: () async {
          HapticFeedback.lightImpact();
          if (widget.route != null && widget.route!.isNotEmpty) {
            Navigator.pushNamed(context, '/${widget.route}');
          } else if (widget.url != null && widget.url!.isNotEmpty) {
            await _launchUrl(widget.url!);
          }
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          curve: Curves.easeOut,
          transform: Matrix4.identity()..scale(_isPressed ? 0.97 : 1.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            gradient: _isHovered
                ? LinearGradient(
              colors: [
                Colors.blueAccent.withOpacity(0.3),
                Colors.purpleAccent.withOpacity(0.3)
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            )
                : null,
            boxShadow: _isHovered
                ? [
              BoxShadow(
                color: Colors.blueAccent.withOpacity(0.4),
                blurRadius: 20,
                spreadRadius: 1,
                offset: const Offset(0, 4),
              ),
            ]
                : [],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: Container(
                width: 166,
                height: 166,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(
                    color: Colors.white.withOpacity(0.2),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/${widget.imageName}',
                      width: 100,
                      height: 100,
                      fit: BoxFit.contain,
                    ),
                    const SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        widget.title.toUpperCase(),
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          shadows: [
                            const Shadow(
                              blurRadius: 6,
                              color: Colors.black38,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
