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


  String? roll;
  String? branch;
  String? batch;
  String? email;
  String? degree;

  Map<String, String> branchName = {
    'ucs': 'Computer Science and Engineering',
    'ucc': 'Communication and Computer Engineering',
    'uec': 'Electronics and Communication Engineering',
    'ume': 'Mechanical Engineering',
    'dcs': 'Computer Science and Engineering',
    'dec': 'Electronics and Communication Engineering',
    //'imai': 'Artificial Intelligence and Data Science'
};

  Map<String, String> degreeType = {
    'ucs': 'Bachelors of Technology',
    'ucc': 'Bachelors of Technology',
    'uec': 'Bachelors of Technology',
    'ume': 'Bachelors of Technology',
    'dcs': 'Bachelors of Technology - Masters of Technology Integrated Degree',
    'dec': 'Bachelors of Technology - Masters of Technology Integrated Degree',
    //'imai': 'Bachelors of Science - Masters of Science Integrated Degree',
  };

  //bsc msc degree display later

  @override
  void initState(){
    super.initState();
    _loadSavedImage();

    final email = FirebaseAuth.instance.currentUser?.email;
    if(email != null){
      extractUsername(email);
    }
  }

  void extractUsername (String email){

    final username = email.split('@').first;

    if(username.length >= 8){
      roll = username;
      branch = branchName[username.substring(2, 5)];
      degree = degreeType[username.substring(2, 5)];
      final start = username.substring(0, 2);
      batch = '20$start - 20${int.parse(start) + 4}';
    }
  }

  Future<void> _loadSavedImage() async {
    final prefs = await SharedPreferences.getInstance();
    final path = prefs.getString(_imageKey);
    if (path != null && File(path).existsSync()){
      setState(() {
        _profileImagePicked = File(path);
      });
    }
  }

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
      backgroundColor: Color.fromARGB(255, 0, 18, 25),
      body: Center(
        child: Column(
          //mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 65,
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
            },
                      icon: Icon(Icons.arrow_back),
                  ),
                  Text(
                    'Profile Page',
                    style: GoogleFonts.lilitaOne(
                      fontSize: 40,
                      color: Colors.white,
                    )
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 60,
            ),
            ProfileImage(
              pickedImage: _profileImagePicked,
              onPressed: _profilePicker,
            ),
            SizedBox(
              height: 60,
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(255, 53, 63, 68),
                      Color.fromARGB(255, 34, 40, 52),
                    ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                )
              ),
              child: Card(
                elevation: 4,
                color: Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(email ?? ''),
                      Text(roll ?? ''),
                      Text(branch ?? ''),
                      Text(degree ?? ''),
                      Text(batch ?? ''),
                    ],
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
            border: Border.all(
              color: Colors.blueGrey,
              width: 3,
            )
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
          icon: const Icon(Icons.edit),
          tooltip: 'Edit Profile Image',
        ),
      ],
    );
  }
}
