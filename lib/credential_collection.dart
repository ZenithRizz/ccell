import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'anti_ragging.dart';

class CredentialCollectionScreen extends StatefulWidget {
  const CredentialCollectionScreen({super.key});

  @override
  State<CredentialCollectionScreen> createState() => _CredentialCollectionScreenState();
}

class _CredentialCollectionScreenState extends State<CredentialCollectionScreen> {
  bool isDone = false;

  @override
  void initState() {
    super.initState();
    _loadDoneStatus();
  }

  Future<void> _loadDoneStatus() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      isDone = prefs.getBool('credential_collection_done') ?? false;
    });
  }

  Future<void> _setDone(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('credential_collection_done', value);
    if (!mounted) return;
    setState(() {
      isDone = value;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(value ? 'Marked as done!' : 'Marked as not done!')),
    );
  }

  Future<void> _launchMapUrl(BuildContext context) async {
    const String googleMapsUrl = 'https://www.google.com/maps/search/?api=1&query=IT%20Office,%20LNM%20Institute,%20Jaipur';
    final Uri url = Uri.parse(googleMapsUrl);
    if (!await launchUrl(url)) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Could not open map for IT Office.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    const String description = "Collect your LNMIIT email and app login from IT Office.";

    return Scaffold(
      backgroundColor: const Color(0xFF001219),
      appBar: AppBar(
        title: const Text('Credential Collection'),
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
              'assets/credential.png',
              height: 120,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) =>
                  const Icon(Icons.badge, size: 100, color: Colors.white),
            ),
            const SizedBox(height: 32),
            // Description
            Text(
              description,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 20, color: Colors.white),
            ),
            const SizedBox(height: 40),
            // "Get Directions" Button for IT Office
            ElevatedButton.icon(
              onPressed: () => _launchMapUrl(context),
              icon: const Icon(Icons.map, color: Colors.white),
              label: const Text(
                'Get Directions (IT Office)',
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
            const SizedBox(height: 45),
            // "Next" Button at the bottom
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const AntiRaggingScreen()),
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