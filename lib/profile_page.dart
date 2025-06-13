import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();

}

class _ProfilePageState extends State<ProfilePage>{



  @override
  Widget build(context){
    return Scaffold(
      body: Center(
        child: ProfileImage(),
      ),
    );
  }
}

class ProfileImage extends StatelessWidget{
  ProfileImage({super.key});

  @override
  Widget build(context) {
  final user = FirebaseAuth.instance.currentUser;
  final photoUrl = user?.photoURL ?? '';

    return CircleAvatar(
      radius: 100,
      backgroundImage: photoUrl.isNotEmpty
      ? NetworkImage(photoUrl)
          : AssetImage('assets/images/ccell_logo.png') as ImageProvider,
    );

  }
}