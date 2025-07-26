import 'dart:io';
import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_page/lnm_page.dart';
import 'package:login_page/profile_page.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:login_page/gymkhana.dart';
import 'package:login_page/notifications_screen.dart';

import 'main.dart';

class HomePage extends StatelessWidget {
  final String userName;
  const HomePage({super.key, required this.userName});

  @override
  Widget build(BuildContext context) {
    return HomeDashboard(userName: userName);
  }
}

class HomeDashboard extends StatefulWidget {
  final String userName;
  const HomeDashboard({super.key, required this.userName});

  @override
  State<HomeDashboard> createState() => _HomeDashboardState();
}

class _HomeDashboardState extends State<HomeDashboard>
    with TickerProviderStateMixin {
  late AnimationController _welcomeController;
  late AnimationController _statsController;
  late List<AnimationController> _buttonControllers;

  File? pickedImage;
  Uint8List? webImageBytes;



  final Map<String, Map<String, dynamic>> buttonData = {
    'Academic Calendar': {
      'image': 'academic_calender.png',
      'url': 'https://lnmiit.ac.in/academics/academic-documents/#pdf-academic-calendar-2025/1/',
      'icon': Icons.calendar_today,
      'description': 'View academic calendar and important dates',
    },
    'PYQs': {
      'image': 'lost_found.png',
      'icon': Icons.library_books_outlined,
      'description': 'Report lost items or find lost belongings',
    },
    'Find the Location': {
      'image': 'find_location.png',
      'icon': Icons.location_on,
      'description': 'Navigate around campus with interactive maps',
    },
    'Bus Timetable': {
      'image': 'bus_timetable.png',
      'url': 'https://raw.githubusercontent.com/Counselling-Cell-LNMIIT/appResources/main/pdf/Bus_Time_Table.pdf',
      'icon': Icons.directions_bus,
      'description': 'Check bus schedules and routes',
    },
    'Mess Menu': {
      'image': 'mess_menu.png',
      'url': 'https://raw.githubusercontent.com/Counselling-Cell-LNMIIT/appResources/main/pdf/Mess_Menu.pdf',
      'icon': Icons.restaurant,
      'description': 'View daily mess menu and timings',
    },
    'Profile': {
      'image': 'profile.png',
      'route': 'profile',
      'icon': Icons.person,
      'description': 'Manage your profile and settings',
    }
  };

  @override
  void initState() {
    super.initState();
    _welcomeController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _statsController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );
    _buttonControllers = List.generate(
      buttonData.length,
          (index) => AnimationController(
        duration: Duration(milliseconds: 500 + (index * 100)),
        vsync: this,
      ),
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _welcomeController.forward();
      Future.delayed(const Duration(milliseconds: 300), () {
        _statsController.forward();
        for (int i = 0; i < _buttonControllers.length; i++) {
          Future.delayed(Duration(milliseconds: i * 100), () {
            if (mounted) _buttonControllers[i].forward();
          });
        }
      });
    });
  }

  @override
  void dispose() {
    _welcomeController.dispose();
    _statsController.dispose();
    for (var controller in _buttonControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF001219),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildWelcomeSection(),
                const SizedBox(height: 32),
                _buildStatsGrid(),
                const SizedBox(height: 32),
                _buildServicesGrid(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildWelcomeSection() {

    final user = FirebaseAuth.instance.currentUser;
    final photoUrl = user?.photoURL ?? '';

    ImageProvider imageProvider;

    if (kIsWeb && webImageBytes != null) {
      imageProvider = MemoryImage(webImageBytes!);
    } else if (!kIsWeb && pickedImage != null) {
      imageProvider = FileImage(pickedImage!);
    } else if (photoUrl.isNotEmpty) {
      imageProvider = NetworkImage(photoUrl);
    } else {
      imageProvider = const AssetImage('assets/images/profile.png');
    }
    return AnimatedBuilder(
      animation: _welcomeController,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, 30 * (1 - _welcomeController.value)),
            child: Opacity(
              opacity: _welcomeController.value,
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                      Color(0xFF353F54),
                      Color(0xFF222834),
                      ]
                  ),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                    BoxShadow(
                    color: const Color(0xFF6366F1).withOpacity(0.2),
                blurRadius: 20,
                offset: const Offset(0, 8),
        )],
              ),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 10,
                          spreadRadius: 2,
                          offset: const Offset(0, 4),
                        ),
                      ],
                      border: Border.all(
                        color: Colors.white.withOpacity(0.3),
                        width: 1.5,
                      )

                    ),
                    padding: const EdgeInsets.all(3),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        "assets/images/ccell_logo_dark.png",
                        width: 80,
                        height: 80,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                   const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Welcome back,',
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          color: Colors.white.withOpacity(0.9),
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0.5
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        widget.userName,
                        style: GoogleFonts.poppins(
                          fontSize: 26,
                          fontWeight: FontWeight.w700,
                          letterSpacing: -0.3,
                          height: 1.2,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        'Your gateway to campus life',
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          color: Colors.white.withOpacity(0.8),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),

                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildStatsGrid() {
    final stats = [
    _StatData(
      title: 'Active Clubs',
      value: '25+',
      subtitle: 'Student organizations',
      icon: Icons.groups_rounded,
      color: const Color(0xFF3B82F6),
      onTap: () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MainNavigationWrapper(initialIndex: 1)),
      )),
      _StatData(
        title: 'Departments',
        value: '7',
        subtitle: 'Explore Academics',
        icon: Icons.school_rounded,
        color: const Color(0xFF10B981),
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MainNavigationWrapper(initialIndex: 3)),
        ),
      ),
      _StatData(
          title: 'New Notifications',
          value: '8',
          subtitle: 'Unread messages',
          icon: Icons.notifications_active_rounded,
          color: const Color(0xFFF59E0B),
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MainNavigationWrapper(initialIndex: 2)),
          )),
          _StatData(
            title: 'Quick Services',
            value: '6',
            subtitle: 'Available now',
            icon: Icons.apps_rounded,
            color: const Color(0xFF8B5CF6),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Quick services are available below!'),
                  backgroundColor: Color(0xFF8B5CF6),
                ),
              );
            },
          ),
  ];

      return AnimatedBuilder(
      animation: _statsController,
      builder: (context, child) {
    return Opacity(
    opacity: _statsController.value,
    child: Transform.translate(
    offset: Offset(0, 20 * (1 - _statsController.value)),
    child: GridView.builder(
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2,
    childAspectRatio: 0.9,
    crossAxisSpacing: 12,
    mainAxisSpacing: 12,
    ),
    itemCount: stats.length,
    itemBuilder: (context, index) {
    return _buildStatCard(stats[index]);
    },
    ),
    ),
    );
    },
    );
  }

  Widget _buildStatCard(_StatData stat) {
    return GestureDetector(
        onTap: () {
      HapticFeedback.lightImpact();
      stat.onTap();
    },
    child: Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
      color: Colors.white.withOpacity(0.05),
      borderRadius: BorderRadius.circular(16),
      border: Border.all(color: stat.color.withOpacity(0.2))),
      child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
    Container(
    padding: const EdgeInsets.all(10),
    decoration: BoxDecoration(
    color: stat.color.withOpacity(0.1),
    borderRadius: BorderRadius.circular(10),
    ),
    child: Icon(stat.icon, color: stat.color),
    ),
    // Container(
    // padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
    // decoration: BoxDecoration(
    // color: const Color(0xFF10B981).withOpacity(0.1),
    // borderRadius: BorderRadius.circular(12),
    // ),
    // child: Row(
    // mainAxisSize: MainAxisSize.min,
    // children: [
    // const Icon(Icons.trending_up_rounded, size: 12, color: Color(0xFF10B981)),
    // const SizedBox(width: 4),
    // Text(
    // '+3',
    // style: GoogleFonts.inter(
    // fontSize: 10,
    // fontWeight: FontWeight.w600,
    // color: const Color(0xFF10B981),
    // ),
    // ),
    // ],
    // ),
    // ),
    ],
    ),
    SizedBox(height: 25.h),
    Text(
    stat.value,
    style: GoogleFonts.poppins(
    fontSize: 24,
    fontWeight: FontWeight.w800,
    color: stat.color,
    ),
    ),
    const SizedBox(height: 4),
    Text(
    stat.title,
    style: GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: Colors.white,
    ),
    ),
    const SizedBox(height: 2),
    Text(
    stat.subtitle,
    style: GoogleFonts.inter(
    fontSize: 10,
    color: Colors.white.withOpacity(0.7),
    ),
    ),
    ],
    ),
    ),
    );
  }

  Widget _buildServicesGrid() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Quick Services',
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 16),
        GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          childAspectRatio: 1.0,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          children: buttonData.entries.map((entry) {
            final index = buttonData.keys.toList().indexOf(entry.key);
            return AnimatedBuilder(
              animation: _buttonControllers[index],
              builder: (context, child) {
                return Opacity(
                  opacity: _buttonControllers[index].value,
                  child: Transform.translate(
                    offset: Offset(0, 20 * (1 - _buttonControllers[index].value)),
                    child: FancyButton(
                      title: entry.key,
                      imageName: entry.value['image'],
                      url: entry.value['url'],
                      route: entry.value['route'],
                      icon: entry.value['icon'],
                      description: entry.value['description'],
                    ),
                  ),
                );
              },
            );
          }).toList(),
        ),
      ],
    );
  }
}

class FancyButton extends StatefulWidget {
  final String title;
  final String imageName;
  final String? route;
  final String? url;
  final IconData? icon;
  final String? description;

  const FancyButton({
    super.key,
    required this.title,
    required this.imageName,
    this.route,
    this.url,
    this.icon,
    this.description,
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
          duration: const Duration(milliseconds: 300),
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
            )
                : null,
            boxShadow: _isHovered
                ? [
              BoxShadow(
                color: Colors.blueAccent.withOpacity(0.4),
                blurRadius: 20,
                offset: const Offset(0, 4),
              )
            ]
                : [],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: Container(
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
                    widget.icon != null
                        ? Icon(widget.icon, size: 40, color: Colors.white)
                        : Image.asset(
                      'assets/images/${widget.imageName}',
                      width: 60,
                      height: 60,
                      fit: BoxFit.contain,
                    ),
                    const SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        widget.title.toUpperCase(),
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
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

class _StatData {
  final String title;
  final String value;
  final String subtitle;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  _StatData({
    required this.title,
    required this.value,
    required this.subtitle,
    required this.icon,
    required this.color,
    required this.onTap,
  });
}