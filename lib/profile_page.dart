import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  File? _profileImagePicked;
  static const _imageKey = 'profile_image_path';

  // Student details
  String? roll;
  String? branch;
  String? batch;
  String? email;
  String? degree;

  // Branch shortcodes to full name
  final Map<String, String> branchName = {
    'ucs': 'Computer Science and Engineering',
    'ucc': 'Communication and Computer Engineering',
    'uec': 'Electronics and Communication Engineering',
    'ume': 'Mechanical Engineering',
    'dcs': 'Computer Science and Engineering',
    'dec': 'Electronics and Communication Engineering',
  };

  // Degree mapping
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

  // Extract user details from LNMIIT email pattern
  void extractUsername(String email) {
    final username = email.split('@').first;

    if (username.length >= 8) {
      roll = username;
      final code = username.substring(2, 5);
      branch = branchName[code];
      degree = degreeType[code];

      final year = int.tryParse(username.substring(0, 2));
      if (year != null) {
        batch = '20$year - 20${year + 4}';
      }
    }
  }

  // Load saved profile image from disk
  Future<void> _loadSavedImage() async {
    final prefs = await SharedPreferences.getInstance();
    final path = prefs.getString(_imageKey);
    if (path != null && File(path).existsSync()) {
      setState(() {
        _profileImagePicked = File(path);
      });
    }
  }

  // Image picker logic
  Future<void> _profilePicker() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      final imageFile = File(pickedFile.path);
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_imageKey, imageFile.path);

      setState(() {
        _profileImagePicked = imageFile;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 18, 25),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 65),
            // Title bar with back button
            Row(
              children: [
                const SizedBox(width: 10),
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.arrow_back),
                  style: IconButton.styleFrom(
                    backgroundColor: Colors.lightBlueAccent,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                ),
                const SizedBox(width: 40),
                Text(
                  'Profile Page',
                  style: GoogleFonts.lilitaOne(
                    fontSize: 40,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 60),

            // Profile Image Component
            ProfileImage(
              pickedImage: _profileImagePicked,
              onPressed: _profilePicker,
            ),
            const SizedBox(height: 60),

            // Information card
            Container(
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    Color.fromARGB(255, 82, 180, 243),
                    Color.fromARGB(255, 69, 107, 210),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Card(
                elevation: 4,
                color: Colors.transparent,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: DefaultTextStyle(
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Email: ${email ?? 'Not Available'}'),
                        const SizedBox(height: 5),
                        Text('Roll No: ${roll ?? 'Not Available'}'),
                        const SizedBox(height: 5),
                        Text('Branch: ${branch ?? 'Not Available'}'),
                        const SizedBox(height: 5),
                        Text('Degree: ${degree ?? 'Not Available'}'),
                        const SizedBox(height: 5),
                        Text('Batch: ${batch ?? 'Not Available'}'),
                      ],
                    ),
                  ),
                ),
              ),
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
    required this.onPressed,
  });

  final File? pickedImage;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    final photoUrl = user?.photoURL ?? '';

    ImageProvider imageProvider;
    if (pickedImage != null) {
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
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: Colors.blueGrey, width: 3),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
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
