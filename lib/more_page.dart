import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:login_page/AboutCCellPage.dart';
import 'package:login_page/notifications_api/post_screen.dart';

import 'AboutCCellPage.dart';
import 'notifications_api/post_screen.dart';

class MorePage extends StatefulWidget {
  const MorePage({super.key});

  @override
  State<MorePage> createState() => _MorePageState();
}

class _MorePageState extends State<MorePage> {
  bool _isAuthorized = false;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    checkAuthorization();
  }

  Future<void> checkAuthorization() async {
    try {
      final userEmail = FirebaseAuth.instance.currentUser?.email;
      print("Checking auth for user: $userEmail");

      if (userEmail == null) {
        print("No user logged in.");
        setState(() {
          _isAuthorized = false;
          _isLoading = false;
        });
        return;
      }

      final response = await http.get(
        Uri.parse('https://ccell-notification-api.onrender.com/api/auth/approved-senders'),
      );
      print("API Status: ${response.statusCode}");
      print("API Response: ${response.body}");

      if (response.statusCode == 200) {
        final List<dynamic> approvedEmails = jsonDecode(response.body);
        print("Approved Emails: $approvedEmails");

        setState(() {
          _isAuthorized = approvedEmails.contains(userEmail);
          _isLoading = false;
        });
      } else {
        print("Non-200 response");
        setState(() {
          _isAuthorized = false;
          _isLoading = false;
        });
      }
    } catch (e) {
      print("Error while checking auth: $e");
      setState(() {
        _isAuthorized = false;
        _isLoading = false;
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return _isAuthorized
      ?Scaffold(
      backgroundColor: const Color(0xFF001219),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (_isLoading)
              const CircularProgressIndicator()
            else if (_isAuthorized)
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const NotificationInputScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                ),
                child: const Text(
                  "Post a Notification",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AboutCCellPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
              child: const Text(
                'About C-Cell Page',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    )
        :AboutCCellPage();
  }
}
