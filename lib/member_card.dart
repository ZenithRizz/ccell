import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'member.dart';

class MemberCard extends StatelessWidget {
  final Member member;

  const MemberCard({super.key, required this.member});

  void _launchPhone() async {
    final Uri uri = Uri(scheme: 'tel', path: member.phone);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  void _launchEmail() async {
    final Uri uri = Uri(scheme: 'mailto', path: member.email);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
   double screenHeight = MediaQuery.of(context).size.width;
    double cardWidth = screenWidth * 0.45; 
  double cardHeight = screenWidth * 0.45; 
    return Container(
      width: cardWidth,
      height: cardHeight,
      decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFF353F54),Color(0xFF222834),],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.white.withOpacity(0.2), width: 2)
        ),
      child: Column(
        children: [
          const SizedBox(height: 20),
          CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage(member.imagePath),
            backgroundColor: Colors.grey.shade300,
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              member.name,
              style: GoogleFonts.inter(color: Colors.white, fontSize: 17),
              textAlign: TextAlign.center,
              maxLines: 1,
            overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: _launchPhone,
                child: Icon(Icons.call, color: Colors.white,)
              ),
              const SizedBox(width: 16),
              GestureDetector(
                onTap: _launchEmail,
                child: Icon(Icons.mail, color: Colors.white,)
              ),
            ],
          ),
        ],
      ),
    );
  }
}
