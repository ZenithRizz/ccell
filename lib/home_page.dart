import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_page/gymkhana.dart';
import 'package:login_page/more_page.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:login_page/notifications_screen.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:fluid_background/fluid_background.dart';



class HomeDashboard extends StatelessWidget {
  HomeDashboard({super.key, required this.userName});

  final String userName;

  final Map<String, Map<String, dynamic>> buttonData = {
    'Academic Calendar': {
      'image': 'academic_calender.png',
      'url': 'https://lnmiit.ac.in/academics/academic-documents/#pdf-academic-calendar-2025/1/',
    },
    'Lost & Found': {
      'image': 'lost_found.png',
    },
    'Find the Location': {
      'image': 'find_location.png',
    },
    'Bus Timetable': {
      'image': 'bus_timetable.png',
      'url': 'https://raw.githubusercontent.com/Counselling-Cell-LNMIIT/appResources/main/pdf/Bus_Time_Table.pdf',
    },
    'Mess Menu': {
      'image': 'mess_menu.png',
      'url': 'https://raw.githubusercontent.com/Counselling-Cell-LNMIIT/appResources/main/pdf/Mess_Menu.pdf',
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
      body: FluidBackground(
        initialColors: InitialColors.custom([
          Color.fromRGBO(255, 255, 255, 0.15), // Soft white
          Color.fromRGBO(173, 216, 230, 0.10), // Light blue
          Color.fromRGBO(144, 238, 144, 0.08), // Pale green
          Color.fromRGBO(211, 211, 211, 0.12), // Light gray
        ],),
        initialPositions: InitialOffsets.predefined(),
        velocity: 40,
        bubblesSize: 400,
        sizeChangingRange: const [300, 600],
        allowColorChanging: true,
        bubbleMutationDuration: const Duration(seconds: 4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 70),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                'Hi $userName!',
                style: GoogleFonts.lilitaOne(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 60),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                padding: const EdgeInsets.symmetric(horizontal: 30),
                children: buttonData.entries.map((entry) {
                  return _ButtonHomeScreen(
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
      ),
    );
  }
}

class _ButtonHomeScreen extends StatelessWidget {
  const _ButtonHomeScreen({
    super.key,
    required this.title,
    required this.imageName,
    this.url,
    this.route,
  });

  final String title;
  final String imageName;
  final String? url;
  final String? route;

  @override
  Widget build(context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.white.withOpacity(0.4),
            const Color(0xFFC7C6C6).withOpacity(0.3),
            Colors.black.withOpacity(0.2),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: ElevatedButton(
        onPressed: () async {
          if (route != null && route!.isNotEmpty) {
            Navigator.pushNamed(context, '/$route');
          } else if (url != null && url!.isNotEmpty) {
            await _launchUrl(url!);
          }
        },
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(166, 166),
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/$imageName',
              width: 100,
              height: 100,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 8),
            Flexible(
              child: Text(
                title,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: GoogleFonts.lilitaOne(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _launchUrl(String urlString) async {
    final Uri uri = Uri.parse(urlString);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $uri');
    }
  }
}

  class HomePage extends StatefulWidget {
    final String userName;
    const HomePage({super.key, required this.userName});

    @override
    State<HomePage> createState() => _HomePageState();
  }

  class _HomePageState extends State<HomePage> {
    int _selectedIndex = 0;

    late final List<Widget> _pages = [
      HomeDashboard(userName: widget.userName),
      GymkhanaPage(),
      NotificationsPage(),
      MorePage(),
    ];

    void _onItemTapped(int index) {
      setState(() {
        _selectedIndex = index;
      });
    }
    Widget _buildGlowingIcon(IconData icon, bool isActive) {
      return Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: isActive
              ? [
            BoxShadow(
              color: Colors.white.withOpacity(0.3),
              blurRadius: 10,
              spreadRadius: 1,
            ),
          ]
              : [],
        ),
        child: Icon(
          icon,
          color: isActive ? Colors.white : Colors.grey.shade600,
        ),
      );
    }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        body: AnimatedSwitcher(
          duration: const Duration(milliseconds: 400),
          transitionBuilder: (child, animation) =>
              FadeTransition(opacity: animation, child: child),
          child: _pages[_selectedIndex],
        ),
        bottomNavigationBar: Container(
      decoration: BoxDecoration(
      color: Colors.black,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.6),
            blurRadius: 10,
            offset: Offset(0, -2),
          ),
        ],
      ),
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      child: SalomonBottomBar(
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
      backgroundColor: Colors.transparent,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.grey.shade600,
      duration: Duration(milliseconds: 400),
      items: [
      /// Home
      SalomonBottomBarItem(
      icon: _buildGlowingIcon(Icons.home, _selectedIndex == 0),
      title: Text("Home"),
      selectedColor: Colors.white,
      unselectedColor: Colors.grey.shade600,
      ),

      /// Gymkhana
      SalomonBottomBarItem(
      icon: _buildGlowingIcon(Icons.sports, _selectedIndex == 1),
      title: Text("Gymkhana"),
      selectedColor: Colors.white,
      unselectedColor: Colors.grey.shade600,
      ),

      /// Notifications
      SalomonBottomBarItem(
      icon: _buildGlowingIcon(Icons.notifications, _selectedIndex == 2),
      title: Text("Notifications"),
      selectedColor: Colors.white,
      unselectedColor: Colors.grey.shade600,
      ),

      /// More
      SalomonBottomBarItem(
      icon: _buildGlowingIcon(Icons.more_horiz, _selectedIndex == 3),
      title: Text("More"),
      selectedColor: Colors.white,
      unselectedColor: Colors.grey.shade600,
      ),
      ],
      ),
      ),

      );
    }
  }
