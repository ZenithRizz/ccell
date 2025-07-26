import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
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
import 'package:pwa_install/pwa_install.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'gymkhana.dart';
import 'package:google_fonts/google_fonts.dart';
import 'lnm_page.dart';
import 'firebase_options.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  if (kDebugMode) {
    print("Handling a background message: ${message.messageId}");
  }
}


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();

  const AndroidInitializationSettings initializationSettingsAndroid =
  AndroidInitializationSettings('@mipmap/ic_launcher');

  const InitializationSettings initializationSettings =
  InitializationSettings(android: initializationSettingsAndroid);

  await flutterLocalNotificationsPlugin.initialize(initializationSettings);

  const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'c-cell-notifs', // Must match the ID used in AndroidNotificationDetails
    'C-Cell', // User-visible name
    description: 'This channel is used for notifications from the C-Cell, LNMIIT.', // User-visible description
    importance: Importance.high,
  );

  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    RemoteNotification? notification = message.notification;

    if (notification != null) {
      if (kDebugMode) {
        print("🔥 Foreground push received!");
        print("Title: ${message.notification?.title}");
        print("Body: ${message.notification?.body}");
      }
      if (!kIsWeb) {
        flutterLocalNotificationsPlugin.show(
         notification.hashCode,
         notification.title,
         notification.body,
         NotificationDetails(
           android: AndroidNotificationDetails(
               'c-cell-notifs',
             'General',
             importance: Importance.high,
             priority: Priority.max,
             color: Color(0xFF143FA6),
             enableLights: true,
             enableVibration: true,
             largeIcon: FilePathAndroidBitmap('assets/images/ccell_logo.png'),
             visibility: NotificationVisibility.public,
           ),
         ),
       );}

    }
  });

  runApp(const MyApp());
}

// ... (keep all your existing imports and Firebase setup code)

class MainScaffold extends StatelessWidget {
  final Widget body;
  final int currentIndex;
  final Function(int) onItemTapped;

  const MainScaffold({
    required this.body,
    required this.currentIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 400),
        child: body,
      ),
      bottomNavigationBar: SalomonBottomBar(
        margin: const EdgeInsets.all(15.0),
        currentIndex: currentIndex,
        itemShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(90),
        ),
        onTap: onItemTapped,
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey.shade600,
        duration: const Duration(milliseconds: 400),
        curve: Curves.linear,
        items: [
          SalomonBottomBarItem(
            icon: _buildGlowingIcon(Icons.home, currentIndex == 0),
            title: const Text("Home"),
            selectedColor: Colors.white,
          ),
          SalomonBottomBarItem(
            icon: _buildGlowingIcon(Icons.sports, currentIndex == 1),
            title: const Text("Gymkhana"),
            selectedColor: Colors.cyanAccent,
          ),
          SalomonBottomBarItem(
            icon: _buildGlowingIcon(Icons.notifications, currentIndex == 2),
            title: const Text("Notifications"),
            selectedColor: Colors.lightGreenAccent,
          ),
          SalomonBottomBarItem(
            icon: _buildGlowingIcon(Icons.account_balance, currentIndex == 3),
            title: const Text("LNMIIT"),
            selectedColor: Colors.redAccent,
          ),
          SalomonBottomBarItem(
            icon: _buildGlowingIcon(Icons.more_horiz, currentIndex == 4),
            title: const Text("More"),
            selectedColor: Colors.purpleAccent,
          ),
        ],
      ),
    );
  }

  static Widget _buildGlowingIcon(IconData icon, bool isActive) {
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
          textTheme: GoogleFonts.interTextTheme(),
        ),
        routes: {
          '/profile': (context) => const ProfilePage(),
          '/home': (context) => const MainNavigationWrapper(),
          '/welcome': (context) => const WelcomeScreen(),
          '/hostel_registration': (context) => const HostelRegistrationScreen(),
          '/login': (context) => LoginPage(),
        },
        home: const AuthLoadingScreen(),
      ),
    );
  }
}

class MainNavigationWrapper extends StatefulWidget {
  final int initialIndex;

  const MainNavigationWrapper({
    super.key,
    this.initialIndex = 0,
  });

  @override
  State<MainNavigationWrapper> createState() => _MainNavigationWrapperState();
}

class _MainNavigationWrapperState extends State<MainNavigationWrapper> {
  late int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;  // Initialize with the passed index
  }

  final List<Widget> _pages = <Widget>[
    HomePage(userName: FirebaseAuth.instance.currentUser?.displayName ?? 'User'),
    const GymkhanaPage(),
    const NotificationsPage(),
    const LNMPage(),
    MorePage(),
  ];

  void _onItemTapped(int index) {
    HapticFeedback.lightImpact();
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      currentIndex: _selectedIndex,
      onItemTapped: _onItemTapped,
    );
  }
}

// ... (keep your existing AuthLoadingScreen and other classes)

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

