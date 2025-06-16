import 'package:flutter/material.dart';

class AboutCCellPage extends StatelessWidget {
const AboutCCellPage({super.key});

@override
Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: Colors.deepPurple, // match your dark theme
    body: SingleChildScrollView(
      child: Column(
        children: [
          // Top Banner + Avatar
          Stack(
            clipBehavior: Clip.none,
            children: [
              // Banner
              Container(
                height: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/y24.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              // Circle Avatar
              Positioned(
                left: 16,
                bottom: -40,
                child: CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.grey.shade300,
                  child: Icon(Icons.person, size: 40),
                ),
              ),
            ],
          ),

          SizedBox(height: 50),

          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "The LNM Institute of Information Technology",
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          SizedBox(height: 10),

          // Description
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text("description", style: TextStyle(color: Colors.white)),
          ),

          SizedBox(height: 20),

          Coordinators(),
          SizedBox(height: 20),
          AssociateCoordi(),
        ],
      ),
    ),
  );
}
}

class Coordinators extends StatelessWidget {
  const Coordinators({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Coordinators Y-23",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10),
        Container(
          height: 220,
          width: double.infinity,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            children: [
              CoordiName(name: "Aditya Kansal"),
              SizedBox(width: 8),
              CoordiName(name: "Kunal Sharma"),
              SizedBox(width: 8),
              CoordiName(name: "Neha Raniwala"),
            ],
          ),
        ),
      ],
    );
  }
}

class AssociateCoordi extends StatelessWidget {
  const AssociateCoordi({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Associate Coordinators Y-23",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10),
        Container(
          height: 220,
          width: double.infinity,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            children: [
              CoordiName(name: "Atharv Shah"),
              SizedBox(width: 8),
              CoordiName(name: "Laxita Sharma"),
              SizedBox(width: 8),
              CoordiName(name: "Mudit Choudhary"),
              SizedBox(width:8),
              CoordiName(name: "Rahul Sharma"),
              SizedBox(width: 8),
              CoordiName(name: "Vibha Gupta"),
              SizedBox(width: 8),
              CoordiName(name: "Yash Raj"),
            ],
          ),
        ),
      ],
    );
  }
}

class CoordiName extends StatelessWidget {
  final String name;
  const CoordiName({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white70,
        borderRadius: BorderRadius.circular(18),
      ),
      width: 150,
      height: 200,
      child: Column(
        children: [
          SizedBox(height: 20),
          CircleAvatar(
            radius: 50,
            backgroundColor: Colors.grey.shade300,
            child: Icon(Icons.person, size: 60),
          ),
          SizedBox(height: 10),
          Text(name, style: TextStyle(color: Colors.black, fontSize: 16)),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                      () => {};
                },
                child: Image.asset('assets/images/phone_icon.png', width: 30),
              ),
              SizedBox(width: 16),
              GestureDetector(
                onTap: () {
                      () => {};
                },
                child: Image.asset('assets/images/gmail.png', width: 30),
              ),
            ],
          ),
        ],
      ),
    );
  }
}