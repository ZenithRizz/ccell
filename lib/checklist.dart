import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:ui'; // For BackdropFilter

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
        title: const Text('Onboarding Checklist'),
        backgroundColor: const Color(0xFF001219),
        foregroundColor: Colors.white,
      ),
      backgroundColor: const Color(0xFF001219),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 16.0),
              child: Text(
                'Click on each option for detailed instructions',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 17,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              child: ListView.separated(
                itemCount: steps.length,
                separatorBuilder: (_, __) => const SizedBox(height: 18),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => _navigateToStep(index),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0x21FFFFFF), // better than withOpacity(0.13)
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: _done[index] ? Colors.green : Colors.white.withAlpha(80),
                              width: 2,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: const Color(0xFF001219).withOpacity(0.08),
                                blurRadius: 12,
                                offset: const Offset(0, 6),
                              ),
                            ],
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
                              Transform.scale(
                                scale: 1.4, // Increase size here
                                child: Checkbox(
                                  value: _done[index],
                                  onChanged: (val) {
                                    _setDone(index, val ?? false);
                                  },
                                  activeColor: Colors.green,
                                  checkColor: Colors.white,
                                  side: const BorderSide(
                                    width: 2,
                                    color: Colors.white, // Outline color
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 8),
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
