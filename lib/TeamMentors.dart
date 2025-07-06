
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_page/NewMember.dart';

class TeamMentors extends StatelessWidget {
  final String title;
  final List<NewMember> members;

  const TeamMentors({super.key, required this.title, required this.members});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
      
        SizedBox(height: 16),
        SizedBox(
          height: 180,
          width: double.infinity,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: members.length,
            separatorBuilder: (_, __) => const SizedBox(width: 8),
            itemBuilder: (context, index) {
              return MentorCard(member: members[index]);
            },
          ),
        ),
      ],
    );
  }
}

class MentorCard  extends StatelessWidget {
  final NewMember member;

  const MentorCard({super.key, required this.member});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
   double screenHeight = MediaQuery.of(context).size.width;
    double cardWidth = screenWidth * 0.45; 
  double cardHeight = screenWidth * 0.4; 
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
          Text(
            member.name,
           style: GoogleFonts.inter(color: Colors.white, fontSize: 17),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}


