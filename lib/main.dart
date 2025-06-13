import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:login_page/home_page.dart';
import 'package:login_page/login_page.dart';
import 'package:login_page/profile_page.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  MyApp({super.key});

  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LNMIIT C-Cell App',
      debugShowCheckedModeBanner: false,
      home: //LoginPage()
      // StreamBuilder<User?>(
      //     stream: _auth.authStateChanges(),
      //     builder: (context, snapshot){
      //      if(snapshot.connectionState == ConnectionState.waiting){
      //        return const Center (
      //          child: CircularProgressIndicator(),
      //        );
      //      } else if (snapshot.hasData) {
      //        final userName = snapshot.data?.displayName ?? 'User';
      //
      //        return HomePage(userName: userName);
      //      }
      //     else {
      //        return LoginPage();
      //      }
      // }
      //     ),
      ProfilePage(),
    );
  }
}

