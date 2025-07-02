import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_page/gymkhana.dart';
import 'package:login_page/more_page.dart';
import 'package:url_launcher/url_launcher.dart';
import 'main.dart';

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
      body: Column(
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
    );
  }
}

class _ButtonHomeScreen extends StatelessWidget {
  const _ButtonHomeScreen({
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
    const GymkhanaPage(),
    const SimplePage(title: 'Notifications Page'),
    MorePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: _pages[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.sports),
            label: 'Gymkhana',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more_horiz),
            label: 'More',
          ),
        ],
      ),
    );
  }
}
