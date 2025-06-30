import 'package:flutter/material.dart';
import 'package:login_page/NewMember.dart';
import 'package:login_page/member_section.dart';

import 'member.dart';

class AboutCCellPage extends StatelessWidget {
  const AboutCCellPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Top Banner + Avatar
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 200,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/y24.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  left: 16,
                  bottom: -40,
                  child: CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('assets/images/ccell_logo.png'),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 50),

            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                "The LNM Institute of Information Technology",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 10),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "The Counseling Cell at LNMIIT fosters mental well-being and provides support through peer mentorship, professional guidance, and proactive outreach initiatives.",
                style: TextStyle(color: Colors.white),
              ),
            ),

            const SizedBox(height: 20),

            MemberSection(
              title: "Coordinators Y-23",
              members: [
                Member(
                  name: "Aditya Kansal",
                  imagePath: 'assets/images/aditya_kansal.webp',
                  email: '23ucc506@lnmiit.ac.in',
                  phone: '7037898300',
                ),
                Member(
                  name: "Kunal Sharma",
                  imagePath: 'assets/images/kunal_sharma.png',
                  email: '23uec563@lnmiit.ac.in',
                  phone: '9166405904',
                ),
                Member(
                  name: "Neha Raniwala",
                  imagePath: 'assets/images/neha_raniwala.jpg',
                  email: '23ucc577@lnmiit.ac.in',
                  phone: '8982919670',
                ),
              ],
            ),

            const SizedBox(height: 20),

            MemberSection(
              title: "Associate Coordinators Y-23",
              members: [
                Member(
                  name: "Atharv Shah",
                  imagePath: 'assets/images/atharv_shah.jpg',
                  email: '23ucc525@lnmiit.ac.in',
                  phone: ' 9315394135',
                ),
                Member(
                  name: "Lakshita Sharma",
                  imagePath: 'assets/images/lakshita.jpeg',
                  email: '23ume529@lnmiit.ac.in',
                  phone: '7877045043',
                ),
                Member(
                  name: "Mudit Choudhary",
                  imagePath: 'assets/images/mudit_img.jpg',
                  email: '23ucc623@lnmiit.ac.in',
                  phone: '9672467580',
                ),
                Member(
                  name: "Rahul Sharma",
                  imagePath: 'assets/images/rahul_sharma.jpg',
                  email: '23ucs686@lnmiit.ac.in',
                  phone: ' 9899007236',
                ),
                Member(
                  name: "Vibha Gupta",
                  imagePath: 'assets/images/vibha_gupta.jpg',
                  email: '23uec642@lnmiit.ac.in',
                  phone: '7976737262',
                ),
                Member(
                  name: "Yash Raj",
                  imagePath: 'assets/images/yash_raj.jpg',
                  email: '23ucc619@lnmiit.ac.in',
                  phone: '8291508341',
                ),
              ],
            ),

            const SizedBox(height: 20),

            NewSection(
              title: "App Developers",
              members: [
                NewMember(
                  name: "Nikhila S Hari",
                  imagePath: 'assets/images/nikhila.jpg',
                ),
                NewMember(
                  name: "Ishita Agarwal",
                  imagePath: 'assets/images/ishita.jpg',
                ),
                NewMember(
                  name: "Panth Moradia",
                  imagePath: 'assets/images/panth_moradiya.jpg',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class NewSection extends StatelessWidget {
  final String title;
  final List<NewMember> members;

  const NewSection({super.key, required this.title, required this.members});

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
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            height: 120,
            decoration: BoxDecoration(
              color: Colors.white70,
              borderRadius: BorderRadius.circular(18),
            ),
            child: Row(
              children: [
                const SizedBox(width: 20),
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/images/mudit_img.jpg'),
                ),
                const SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8.0,
                        vertical: 0,
                      ),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: Color(0xFFB388EB),
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: Text(
                          'Team Mentor',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        'Mudit Choudhary',
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Container(
            height: 120,
            decoration: BoxDecoration(
              color: Colors.white70,
              borderRadius: BorderRadius.circular(18),
            ),
            child: Row(
              children: [
                const SizedBox(width: 20),
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/images/yash_raj.jpg'),
                ),
                const SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8.0,
                        vertical: 0,
                      ),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: Color(0xFFB388EB),
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: Text(
                          'Team Mentor',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        'Yash Raj',
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ],
            ),
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
              return NewCard(member: members[index]);
            },
          ),
        ),
      ],
    );
  }
}

class NewCard extends StatelessWidget {
  final NewMember member;

  const NewCard({super.key, required this.member});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 200,
      decoration: BoxDecoration(
        color: Colors.white70,
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
