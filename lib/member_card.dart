import 'package:flutter/material.dart';
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
    final Uri uri = Uri(
      scheme: 'mailto',
      path: member.email,
    );
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 200,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
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
          Text(
            member.name,
            style: const TextStyle(color: Colors.black, fontSize: 16),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: _launchPhone,
                child: Image.asset('assets/images/phone_icon.png', width: 30),
              ),
              const SizedBox(width: 16),
              GestureDetector(
                onTap: _launchEmail,
                child: Image.asset('assets/images/gmail.png', width: 30),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
