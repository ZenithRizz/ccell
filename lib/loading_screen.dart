import 'dart:async';
import 'package:flutter/material.dart';

import 'home_page.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key, required this.userName});

  final String userName;

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double _progress = 0.0;
  double _opacity = 1.0;

  @override
  void initState() {
    super.initState();
    _startLoading();
  }

  void _startLoading() {
    const duration = Duration(milliseconds: 50);
    int i = 0;

    Timer.periodic(duration, (Timer timer) {
      if (i > 100) {
        timer.cancel();
        setState(() {
          _opacity = 0.0;
        });

        Future.delayed(const Duration(milliseconds: 400), () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => HomePage(userName: widget.userName),
            ),
          );
        });
      } else {
        setState(() {
          _progress = i / 100;
        });
        i++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/images/loading_screen.png',
            fit: BoxFit.cover,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: AnimatedOpacity(
                opacity: _opacity,
                duration: const Duration(milliseconds: 400),
                child: LinearProgressIndicator(
                  value: _progress,
                  backgroundColor: Colors.white.withOpacity(0.3),
                  valueColor: const AlwaysStoppedAnimation<Color>(
                    Colors.lightBlueAccent,
                  ),
                  minHeight: 6,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
