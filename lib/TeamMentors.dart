
import 'package:flutter/material.dart';
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
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
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
        ],
      ),
    );
  }
}


