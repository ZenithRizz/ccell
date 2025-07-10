import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:login_page/login_page.dart';
import 'dart:io' show File;
import 'package:flutter/foundation.dart' show kIsWeb, Uint8List;
import 'package:image_picker/image_picker.dart';




const double basePadding = 16;
const double userDetailFraction = .60;
const double offset = 0.04;
const double contentFraction = userDetailFraction - offset;

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  File? _profileImagePicked;
  static const String  _imageKey = 'profile_image_path';
  Uint8List? _webImageBytes;

  // Student details
  String? roll;
  String? branch;
  String? batch;
  String? email;
  String? degree;

  final Map<String, String> branchName = {
    'ucs': 'Computer Science and Engineering',
    'ucc': 'Communication and Computer Engineering',
    'uec': 'Electronics and Communication Engineering',
    'ume': 'Mechanical Engineering',
    'dcs': 'Computer Science and Engineering',
    'dec': 'Electronics and Communication Engineering',
  };

  final Map<String, String> degreeType = {
    'ucs': 'B.Tech',
    'ucc': 'B.Tech',
    'uec': 'B.Tech',
    'ume': 'B.Tech',
    'dcs': 'B.Tech - M.Tech (Dual)',
    'dec': 'B.Tech - M.Tech (Dual)',
  };

  @override
  void initState() {
    super.initState();
    _loadSavedImage();
    email = FirebaseAuth.instance.currentUser?.email;
    if (email != null) extractUsername(email!);
  }

  void extractUsername(String email) {
    final username = email.split('@').first;
    if (username.length >= 8) {
      roll = username;
      final code = username.substring(2, 5);
      branch = branchName[code];
      degree = degreeType[code];

      final year = int.tryParse(username.substring(0, 2));
      if (year != null) {

        if(branch == 'dec'||branch == 'dcs'){
          batch = '20$year - 20${year + 5}';
        } else {
          batch = '20$year - 20${year + 4}';
        }
      }
    }
  }

  Future<void> _loadSavedImage() async {
    final prefs = await SharedPreferences.getInstance();
    final saved = prefs.getString(_imageKey);

    if (saved != null) {
      if (kIsWeb) {
        _webImageBytes = base64Decode(saved);
        print("🌐 Loaded image for Web");
      } else if (File(saved).existsSync()) {
        _profileImagePicked = File(saved);
        print("📱 Loaded image from path: $saved");
      }
      setState(() {});
    }
  }



  Future<void> _profilePicker() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      final prefs = await SharedPreferences.getInstance();

      if (kIsWeb) {
        // On Web: store image as base64 or bytes (here using bytes in memory)
        final bytes = await pickedFile.readAsBytes();
        _webImageBytes = bytes;
        await prefs.setString(_imageKey, base64Encode(bytes));
        print("🌐 Web image picked");
      } else {
        // On Android/iOS
        final path = pickedFile.path;
        _profileImagePicked = File(path);
        await prefs.setString(_imageKey, path);
        print("📱 Mobile image picked: $path");
      }

      setState(() {}); // To update UI
    } else {
      print("❌ No image selected");
    }
  }


  Future<void> signOutUser() async {
    final GoogleSignIn googleSignIn = GoogleSignIn();

    try {
      // First sign out from Google
      await googleSignIn.signOut();

      // Then sign out from Firebase
      await FirebaseAuth.instance.signOut();

      print("User signed out successfully.");
    } catch (e) {
      print("Error signing out: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color(0xFF001219),
      body: SizedBox(
        width: double.infinity,
        child: Stack(
          children: [
            Container(
              height: height * userDetailFraction,
              decoration: const BoxDecoration(
                color: Colors.black,
                image: DecorationImage(
                  image: NetworkImage(
                      "https://raw.githubusercontent.com/Ronak99/majestic-ui-flutter/refs/heads/master/assets/background-pattern.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: basePadding),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Row(
                            children: [
                              IconButton(
                                onPressed: () => Navigator.pop(context),
                                icon: const Icon(Icons.arrow_back, color: Colors.white),
                                style: IconButton.styleFrom(
                                  backgroundColor: Colors.black45,
                                  shape: const CircleBorder(),
                                ),
                              ),
                              SizedBox(width: 10),
                              Text(
                                "Profile",
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                  fontSize: 24,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const Spacer(),
                      ProfileImage(
                        pickedImage: _profileImagePicked,
                        webImageBytes: _webImageBytes,
                        onPressed: _profilePicker,
                      ),
                      const SizedBox(height: 12),
                      Text(
                        FirebaseAuth.instance.currentUser?.displayName ?? 'Avatar',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                          fontSize: 24,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        email ?? 'Avatar',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          color: Colors.white70,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 4,),
                      Text(
                        branch?? 'Avatar',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          color: Colors.white70,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(
                        height: (height * offset)*3.5,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(
                  height: height * contentFraction,
                  width: MediaQuery.of(context).size.width,
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color(0xFF0F172A), // Dark slate (deep blue-gray)
                          Color(0xFF1E293B), // Slightly lighter slate
                          Color(0xFF334155), // Soft bluish-gray bottom // Coral/orange highlight
                        ],
                      ),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: Colors.white.withOpacity(0.2),
                        width: 2,
                      ),

                    ),
                    padding: const EdgeInsets.symmetric(
                      vertical: 24,
                      horizontal: 40,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'MY ACCOUNT',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w700,
                            fontSize: 25,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 24),
                        Text(
                          'Email: ${email ?? 'Not Available'}',
                          style: GoogleFonts.inter(
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        const SizedBox(height: 5),
                        Text(
                          'Roll No: ${roll ?? 'Not Available'}',
                          style: GoogleFonts.inter(
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        const SizedBox(height: 5),
                        Text(
                          'Branch: ${branch ?? 'Not Available'}',
                          style: GoogleFonts.inter(
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        const SizedBox(height: 5),
                        Text(
                          'Degree: ${degree ?? 'Not Available'}',
                          style: GoogleFonts.inter(
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        const SizedBox(height: 5),
                        Text(
                          'Batch: ${batch ?? 'Not Available'}',
                          style: GoogleFonts.inter(
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.left,
                        ),

                        const SizedBox(height: 30),
                        const Divider(
                          color: Colors.white24, // subtle line for dark background
                          thickness: 1.5,
                          indent: 20,
                          endIndent: 20,
                        ),
                        const SizedBox(height: 15),

                        ElevatedButton(onPressed: () async {
                          await signOutUser();
                          Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (_) => LoginPage()),
                          );
                        },
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
                            backgroundColor: const Color(0xFF2E3548), // matches gradient tone
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            elevation: 4,
                            shadowColor: Colors.black.withOpacity(0.3),
                          ),
                          child: Text(
                            'Sign-Out',
                            style: GoogleFonts.inter(
                              color: Colors.white,
                              fontSize: 16,
                              letterSpacing: 0.5,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


class ProfileImage extends StatelessWidget {
  const ProfileImage({
    super.key,
    required this.pickedImage,
    required this.webImageBytes,
    required this.onPressed,
  });

  final File? pickedImage;         // For Android/iOS
  final Uint8List? webImageBytes;  // For Web
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
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

    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(200),
            border: Border.all(color: Colors.blueGrey, width: 3),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(200),
            child: Image(
              image: imageProvider,
              width: 200,
              height: 200,
              fit: BoxFit.cover,
            ),
          ),
        ),
        IconButton(
          onPressed: onPressed,
          icon: const Icon(Icons.edit, color: Colors.white),
          tooltip: 'Edit Profile Image',
          style: IconButton.styleFrom(
            backgroundColor: Colors.black45,
            shape: const CircleBorder(),
          ),
        ),
      ],
    );
  }
}