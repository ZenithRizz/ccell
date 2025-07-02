import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'hostel_registration.dart';
import 'document_verification.dart';
import 'implocations.dart';
import 'biometric_screen.dart';
import 'credential_collection.dart';
import 'anti_ragging.dart';
import 'login_page.dart'; // <-- Import LoginPage

class ChecklistScreen extends StatefulWidget {
  const ChecklistScreen({super.key});

  @override
  State<ChecklistScreen> createState() => _ChecklistScreenState();
}

class _ChecklistScreenState extends State<ChecklistScreen> {
  // Checklist steps
  final List<_ChecklistStep> steps = [
    _ChecklistStep(
      title: 'Hostel Registration',
      route: HostelRegistrationScreen(),
      keyName: 'hostel_registration_done',
    ),
    _ChecklistStep(
      title: 'Document Verification',
      route: DocumentVerificationScreen(),
      keyName: 'document_verification_done',
    ),
    _ChecklistStep(
      title: 'Biometric Registration',
      route: BiometricScreen(),
      keyName: 'biometric_done',
    ),
    _ChecklistStep(
      title: 'Credential Collection',
      route: CredentialCollectionScreen(),
      keyName: 'credential_collection_done',
    ),
    _ChecklistStep(
      title: 'Anti Ragging Declaration',
      route: AntiRaggingScreen(),
      keyName: 'anti_ragging_done',
    ),
  ];

  late List<bool> _done;

  @override
  void initState() {
    super.initState();
    _done = List.filled(steps.length, false);
    _loadChecklist();
  }

  Future<void> _loadChecklist() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      for (int i = 0; i < steps.length; i++) {
        _done[i] = prefs.getBool(steps[i].keyName) ?? false;
      }
    });
  }

  Future<void> _setDone(int index, bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(steps[index].keyName, value);
    setState(() {
      _done[index] = value;
    });
  }

  void _navigateToStep(int index) async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => steps[index].route),
    );
    _loadChecklist();
  }

  @override
  Widget build(BuildContext context) {
    final allDone = _done.every((element) => element);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Onboarding Checklist'),
        backgroundColor: const Color(0xFF001219),
        foregroundColor: Colors.white,
      ),
      backgroundColor: const Color(0xFF001219),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                itemCount: steps.length,
                separatorBuilder: (_, __) => const SizedBox(height: 18),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => _navigateToStep(index),
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFF003049),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: _done[index] ? Colors.green : Colors.transparent,
                          width: 2,
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              steps[index].title,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Checkbox(
                            value: _done[index],
                            onChanged: (val) {
                              _setDone(index, val ?? false);
                            },
                            activeColor: Colors.green,
                            checkColor: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 24),
            if (!allDone)
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const ImplocationsScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF48CAE4),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: const Text(
                    'Skip Student Onboarding',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
            if (allDone)
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const LoginPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: const Text(
                    'Login as Student',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _ChecklistStep {
  final String title;
  final Widget route;
  final String keyName;

  const _ChecklistStep({
    required this.title,
    required this.route,
    required this.keyName,
  });
}