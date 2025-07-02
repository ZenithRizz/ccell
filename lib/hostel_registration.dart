import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'document_verification.dart';

class HostelRegistrationScreen extends StatefulWidget {
  const HostelRegistrationScreen({super.key});

  static const String bhMapUrl = 'https://maps.app.goo.gl/aQo8kNWXrvVzqYZm9';
  static const String ghMapUrl = 'https://maps.app.goo.gl/N4vYVoZoXx1aJVZaA';
  static const String bhDescription = 'Go to Boys Hostel Office.';
  static const String ghDescription = 'Go to Girls Hostel Office.';

  @override
  State<HostelRegistrationScreen> createState() => _HostelRegistrationScreenState();
}

class _HostelRegistrationScreenState extends State<HostelRegistrationScreen> {
  bool isDone = false;

  @override
  void initState() {
    super.initState();
    _loadDoneStatus();
  }

  Future<void> _loadDoneStatus() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      isDone = prefs.getBool('hostel_registration_done') ?? false;
    });
  }

  Future<void> _setDone(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('hostel_registration_done', value);
    if (!mounted) return;
    setState(() {
      isDone = value;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(value ? 'Marked as done!' : 'Marked as not done!')),
    );
  }

  Future<void> _launchMapUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Could not open the map link.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double titleFontSize = screenWidth > 400 ? 22 : 19;
    final double descFontSize = screenWidth > 400 ? 18 : 16;
    final double buttonFontSize = screenWidth > 400 ? 16 : 15;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Hostel Registration'),
        backgroundColor: const Color(0xFF001219),
        foregroundColor: Colors.white,
      ),
      backgroundColor: const Color(0xFF001219),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Illustration
                    Image.asset(
                      'assets/hostel.png',
                      height: 120,
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) =>
                          const Icon(Icons.home, size: 100, color: Colors.white),
                    ),
                    const SizedBox(height: 24),
                    // Boys Hostel Directions
                    _DirectionCard(
                      title: "Boys Hostel (BH)",
                      description: HostelRegistrationScreen.bhDescription,
                      mapLabel: 'Get Directions (Boys Hostel)',
                      onMap: () => _launchMapUrl(HostelRegistrationScreen.bhMapUrl),
                      titleFontSize: titleFontSize,
                      descFontSize: descFontSize,
                      buttonFontSize: buttonFontSize,
                    ),
                    const SizedBox(height: 12),
                    // Girls Hostel Directions
                    _DirectionCard(
                      title: "Girls Hostel (GH)",
                      description: HostelRegistrationScreen.ghDescription,
                      mapLabel: 'Get Directions (Girls Hostel)',
                      onMap: () => _launchMapUrl(HostelRegistrationScreen.ghMapUrl),
                      titleFontSize: titleFontSize,
                      descFontSize: descFontSize,
                      buttonFontSize: buttonFontSize,
                    ),
                    const SizedBox(height: 18),
                    // Mark as Done/Not Done Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
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
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Next Button always visible at the bottom
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const DocumentVerificationScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 52),
                    backgroundColor: const Color(0xFF48CAE4),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  child: const Text(
                    'Next',
                    style: TextStyle(fontSize: 20, color: Colors.white),
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

class _DirectionCard extends StatelessWidget {
  final String title;
  final String description;
  final String mapLabel;
  final VoidCallback onMap;
  final double titleFontSize;
  final double descFontSize;
  final double buttonFontSize;

  const _DirectionCard({
    required this.title,
    required this.description,
    required this.mapLabel,
    required this.onMap,
    required this.titleFontSize,
    required this.descFontSize,
    required this.buttonFontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFF003049),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: titleFontSize,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              description,
              style: TextStyle(fontSize: descFontSize, color: Colors.white),
            ),
            const SizedBox(height: 14),
            ElevatedButton.icon(
              onPressed: onMap,
              icon: const Icon(Icons.map, color: Colors.white, size: 20),
              label: Text(
                mapLabel,
                style: TextStyle(fontSize: buttonFontSize, color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF0077B6),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                minimumSize: const Size(double.infinity, 44),
                padding: const EdgeInsets.symmetric(vertical: 10),
              ),
            ),
          ],
        ),
      ),
    );
  }
}