// lib/welcome_screen.dart
import 'package:flutter/material.dart';
import 'package:login_page/login_page.dart'; // Import the new LoginPage location
import 'package:login_page/checklist.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF001219), // Background color #001219
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
              // Placeholder for an illustration
              Image.asset(
                'assets/welcome_illustration.png', 
                errorBuilder: (context, error, stackTrace) =>
                    const Icon(Icons.school, size: 200, color: Colors.white),
                height: 200,
                width: 200,
              ),
              const SizedBox(height: 40),
              const Text(
                'Welcome to LNM Institute of Information Technology!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "Are you a existing student or a guest/new student ?",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white70,
                ),
              ),
              const SizedBox(height: 40),
              // Guest User Button (Starts onboarding flow)
              ElevatedButton(
                onPressed: () {
                  // Navigate to HostelRegistrationScreen for guest users/new students
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ChecklistScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50), // Full width button
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0), // Rounded corners
                  ),
                ),
                child: const Text(
                  'Guest User / New Student',
                  style: TextStyle(fontSize: 18, color: Color(0xFF001219)),
                ),
              ),
              const SizedBox(height: 20),
              // Student Login Button (Navigates to LoginPage)
              ElevatedButton(
                onPressed: () {
                  // Navigate to the LoginPage for existing students to sign in
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50), // Full width button
                  backgroundColor: const Color(0xFF48CAE4), // A contrasting color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0), // Rounded corners
                  ),
                ),
                child: const Text(
                  'Existing Student Login',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
    );
  }
}
