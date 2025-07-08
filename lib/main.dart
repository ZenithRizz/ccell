import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:login_page/login_page.dart';
import 'package:login_page/more_page.dart';
import 'package:login_page/home_page.dart';
import 'package:login_page/notifications_screen.dart';
import 'package:login_page/profile_page.dart';
import 'package:login_page/welcome_screen.dart';
import 'package:login_page/hostel_registration.dart';
import 'package:login_page/loading_screen.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'gymkhana.dart';
import 'package:google_fonts/google_fonts.dart';
import 'lnm_page.dart';
import 'firebase_options.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        title: 'LNMIIT C-Cell App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          textTheme: GoogleFonts.interTextTheme(), // Set Inter as default
        ),
        routes: {
          '/profile': (context) => const ProfilePage(),
          '/home': (context) => const MyHomePage(),
          '/welcome': (context) => const WelcomeScreen(),
          '/hostel_registration': (context) => const HostelRegistrationScreen(),
          '/login': (context) => const LoginPage(),
        },
        home: const AuthLoadingScreen(),
      ),
    );
  }
}

// =====================
// AuthLoadingScreen
// =====================

class AuthLoadingScreen extends StatefulWidget {
  const AuthLoadingScreen({super.key});

  @override
  State<AuthLoadingScreen> createState() => _AuthLoadingScreenState();
}

class _AuthLoadingScreenState extends State<AuthLoadingScreen> {
  bool _navigated = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Navigator.of(context).push(
        PageRouteBuilder(
          opaque: false,
          pageBuilder: (_, _, _) => LoadingScreen(
            userName: FirebaseAuth.instance.currentUser?.displayName ?? 'User',
          ),
        ),
      );
      if (!_navigated) {
        _navigated = true;
        final user = FirebaseAuth.instance.currentUser;
        if (user != null) {
          Navigator.pushReplacementNamed(context, '/home');
        } else {
          Navigator.pushReplacementNamed(context, '/welcome');
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // Show a loading indicator while waiting for navigation
    return const Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}

// =====================
// 🧭 Navigation UI Starts
// =====================

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  static final List<Widget> _pages = <Widget>[
    HomePage(userName: FirebaseAuth.instance.currentUser!.displayName!),
    const GymkhanaPage(), 
    const NotificationsPage(),
    const LNMPage(),
    MorePage()
  ];

  void _onItemTapped(int index) {
    HapticFeedback.lightImpact();
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
        child: IndexedStack(
          index: _selectedIndex,
          children: _pages,
        ),
      ),
      bottomNavigationBar: SalomonBottomBar(
        margin: EdgeInsets.all(15.0),
        currentIndex: _selectedIndex,
        itemShape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(90)),
        onTap: _onItemTapped,
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey.shade600,
        duration: const Duration(milliseconds: 400),
        curve: Curves.linear,
        items: [
          SalomonBottomBarItem(
            icon: _buildGlowingIcon(Icons.home, _selectedIndex == 0),
            title: const Text("Home"),
            selectedColor: Colors.white,
            unselectedColor: Colors.grey.shade600,
          ),
          SalomonBottomBarItem(
            icon: _buildGlowingIcon(Icons.sports, _selectedIndex == 1),
            title: const Text("Gymkhana"),
            selectedColor: Colors.cyanAccent,
            unselectedColor: Colors.grey.shade600,
          ),
          SalomonBottomBarItem(
            icon: _buildGlowingIcon(Icons.notifications, _selectedIndex == 2),
            title: const Text("Notifications"),
            selectedColor: Colors.lightGreenAccent,
            unselectedColor: Colors.grey.shade600,
          ),
          SalomonBottomBarItem(
            icon: _buildGlowingIcon(Icons.account_balance, _selectedIndex == 3),
            title: const Text("LNMIIT"),
            selectedColor: Colors.redAccent,
            unselectedColor: Colors.grey.shade600,
          ),
          SalomonBottomBarItem(
            icon: _buildGlowingIcon(Icons.more_horiz, _selectedIndex == 4),
            title: const Text("More"),
            selectedColor: Colors.purpleAccent,
            unselectedColor: Colors.grey.shade600,
          ),
        ],
      ),
    );

  }
}

