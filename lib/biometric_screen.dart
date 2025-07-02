import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'credential_collection.dart';

class BiometricScreen extends StatefulWidget {
  const BiometricScreen({super.key});

  @override
  State<BiometricScreen> createState() => _BiometricScreenState();
}

class _BiometricScreenState extends State<BiometricScreen> {
  bool isDone = false;

  @override
  void initState() {
    super.initState();
    _loadDoneStatus();
  }

  Future<void> _loadDoneStatus() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      isDone = prefs.getBool('biometric_done') ?? false;
    });
  }

  Future<void> _setDone(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('biometric_done', value);
    if (!mounted) return;
    setState(() {
      isDone = value;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(value ? 'Marked as done!' : 'Marked as not done!')),
    );
  }

  Future<void> _launchMapUrl(BuildContext context) async {
    const String query = 'Lab 3, LNM Institute, Jaipur';
    final String googleMapsUrl = 'https://www.google.com/maps/search/?api=1&query=$query';
    final Uri url = Uri.parse(googleMapsUrl);
    if (!await launchUrl(url)) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Could not open map for Lab 3.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    const String description = "Proceed to Lab 3 for biometric data entry.";

    return Scaffold(
      backgroundColor: const Color(0xFF001219),
      appBar: AppBar(
        title: const Text('Biometric Registration'),
        backgroundColor: const Color(0xFF001219),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 24),
            // Illustration
            Image.asset(
              'assets/biometric.png',
              height: 120,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) =>
                  const Icon(Icons.fingerprint, size: 100, color: Colors.white),
            ),
            const SizedBox(height: 32),
            // Description
            Text(
              description,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 20, color: Colors.white),
            ),
            const SizedBox(height: 40),
            // "Get Directions" Button for Lab 3
            ElevatedButton.icon(
              onPressed: () => _launchMapUrl(context),
              icon: const Icon(Icons.map, color: Colors.white),
              label: const Text(
                'Get Directions (Lab 3)',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
                backgroundColor: const Color(0xFF0077B6),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            const SizedBox(height: 24),
            // "Mark as Done/Not Done" Button
            ElevatedButton.icon(
              onPressed: () => _setDone(!isDone),
              icon: Icon(
                isDone ? Icons.cancel : Icons.check_circle,
                color: Colors.white,
              ),
              label: Text(
                isDone ? 'Mark as Not Done' : 'Mark as Done',
                style: const TextStyle(fontSize: 18, color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: isDone ? Colors.red : Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                padding: const EdgeInsets.symmetric(vertical: 14),
                minimumSize: const Size(double.infinity, 50),
              ),
            ),
            const SizedBox(height: 45), // Add space above the Next button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const CredentialCollectionScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  backgroundColor: const Color(0xFF48CAE4),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                child: const Text(
                  'Next',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}