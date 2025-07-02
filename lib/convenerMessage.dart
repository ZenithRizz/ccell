import 'package:flutter/material.dart';

class convenerMessageSection extends StatelessWidget {
  const convenerMessageSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
        children: [
          Text(
            "Convener's Message",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            color: Colors.white
            ),
          ),
          SizedBox(height: 16),
          Column(
            children: [
              Row(
                
                children: [
                  Expanded(child: Text(
                      "The LNMIIT Counselling and Guidance Cell is the bridge between students and the institute, helping them to settle into their new environment both emotionally and practically.", style: TextStyle(fontSize: 15, color: Colors.white),
                    ),),
                 
                  SizedBox(width: 16),
                  // Image and Name Column
                  Column(
                    children: [
                      ClipOval(
                        child: Image.asset(
                          'assets/images/usha_mam.jpg',
                          height: 100,
                          width: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Dr. Usha Kanoongo',
                        style: TextStyle(fontWeight: FontWeight.bold , color: Colors.white),
                      ),
                    ],
                   
                  ),
                  
                ],
              ),
              Text(
                  "From the moment the students step onto campus, the cell supports students through reporting and admission process, assists with document verification, and answers common doubts or concern faced by incoming batches.\nBeyond the administrative help, the cell organises the Orientation Programme to familiarize students with campus life, conducts interactive sessions and facilitates the Student-Faculty Mentorship Programme-creating a strong support system throughout the academic year.",
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
            ],
          ),
        ],
          ),
      ),
);
  }
}