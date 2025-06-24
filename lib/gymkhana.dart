import 'package:google_fonts/google_fonts.dart';
import 'package:login_page/cosha.dart';
import 'package:login_page/cultural.dart';
import 'package:login_page/sports.dart';
import 'package:login_page/technology.dart';
import 'package:flutter/material.dart';

class GymkhanaPage extends StatelessWidget {
  const GymkhanaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF001219),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'STUDENT GYMKHANA',
                textAlign:TextAlign.center,
                style: GoogleFonts.lilitaOne(
                  color: Color.fromRGBO(255, 255, 255, 1),
                  fontSize: 40,
                )
              ),
              const SizedBox(height: 40),
              Text(
                "Every college works on the efforts that its student masses put in it to make the college for the students, of the students, and by the students. The LNMIIT Students’ Gymkhana, under the Director of the Institute's patronage, acts as a communication service and facilitates decision-making in the greater interest of the students on The LNMIIT",
                style: GoogleFonts.poppins(color: Color.fromRGBO(255, 255, 255, 1))
              ),
              const SizedBox(height: 36),
              Container(
                height: 80,
                width: 380,
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Color.fromRGBO(53, 63, 84, 1), Color.fromRGBO(34, 40, 52, 1)],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white,
                      offset: Offset(-1, -1),
                      blurRadius: 1
                    ),
                    BoxShadow(
                      color: Colors.black.withOpacity(0.7),
                      blurRadius: 12,
                      offset: Offset(6, 6),
                    ),
                  ]
                ),
                child: Center(
                  child: Text(
                    'PRESIDENTIAL COUNCIL',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.lilitaOne(color: Color.fromRGBO(255, 255, 255, 1), fontSize: 24)
                  ),
                ),
              ),
              const SizedBox(height: 16),
              GridView.count(
                shrinkWrap: true,
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 0.85,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  squareCard(
                    "Cultural Council",
                    context,
                    const CulturalCouncil(),
                  ),
                  squareCard(
                    "Science & Technology Council",
                    context,
                    const TechnologyCouncil(),
                  ),
                  squareCard(
                    "Sports Council",
                    context,
                    const SportsCouncil(),
                  ),
                  squareCard(
                    "COSHA Committee",
                    context,
                    const COSHAScreen(),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              Text(
                'STUDENT FESTS',
                style: GoogleFonts.lilitaOne(
                  color: Color.fromRGBO(255, 255, 255, 1),
                  fontSize: 26
                )
              ),
              SizedBox(height: 20,),
              GridView.count(
                shrinkWrap: true,
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 0.85,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  squareCard(
                    "Desportivos",
                    context,
                    const StudentEventScreen(),
                  ),
                  squareCard(
                    "Plinth",
                    context,
                    const StudentEventScreen(),
                  ),
                  squareCard(
                    "Vivacity",
                    context,
                    const StudentEventScreen(),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              Text(
                'STUDENT EVENTS',
                style: GoogleFonts.lilitaOne(
                  color: Color.fromRGBO(255, 255, 255, 1),
                  fontSize: 26
                )
              ),
              const SizedBox(height: 16),
              GridView.count(
                shrinkWrap: true,
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 0.85,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  squareCard(
                    "TEDX LNMIIT",
                    context,
                    const StudentEventScreen(),
                  ),
                  squareCard(
                    "E-Summit",
                    context,
                    const StudentEventScreen(),
                  ),
                ],
              ),
              SizedBox(height: 64,)
            ],
          ),
        ),
      ),
    );
  }
}

// Square Card Widget
Widget squareCard(String label, BuildContext context, Widget targetScreen) {
  return Material(
    elevation: 6,
    borderRadius: BorderRadius.circular(16),
    child: InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => targetScreen),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(123, 127, 139, 1),
              //Color(0xFFC7C6C6).withOpacity(0.8),
              Colors.black,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            ),
          borderRadius: BorderRadius.circular(12),
        ),
        width: 100,
        height: 100,
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(radius: 24, backgroundColor: Colors.white),
            const SizedBox(height: 15),
            Text(label, textAlign: TextAlign.center, style: GoogleFonts.lilitaOne(color: Color.fromRGBO(255, 255, 255, 1), fontSize: 20, height: 1.1)),
          ],
        ),
      ),
    ),
  );
}

// Triangle Card Widget
Widget triangleCard({
  required Gradient color,
  required bool isInverted,
  required double size,
  required String label,
  required BuildContext context,
  required Widget targetScreen,
}) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => targetScreen),
      );
    },
    child: ClipPath(
      clipper: EquilateralTriangleClipper(
        inverted: isInverted,
        cornerRadius: 12,
      ),
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          gradient: color,
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(radius: 20, backgroundColor: Colors.white),
              const SizedBox(height: 8),
              Text(label, style: const TextStyle(color: Colors.white, fontSize: 12)),
            ],
          ),
        ),
      ),
    ),
  );
}

// Triangle Clipper
class EquilateralTriangleClipper extends CustomClipper<Path> {
  final bool inverted;
  final double cornerRadius;

  EquilateralTriangleClipper({this.inverted = false, this.cornerRadius = 12});

  @override
  Path getClip(Size size) {
    final Path path = Path();

    final double height = size.height;
    final double width = size.width;

    if (inverted) {
      path.moveTo(width / 2, height);
      path.lineTo(0, 0);
      path.lineTo(width, 0);
    } else {
      path.moveTo(width / 2, 0);
      path.lineTo(0, height);
      path.lineTo(width, height);
    }

    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

// Dummy Target Screens
class BlueFestScreen extends StatelessWidget {
  const BlueFestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Blue Fest")),
      body: const Center(child: Text("Welcome to Blue Fest")),
    );
  }
}

class GreyFestScreen extends StatelessWidget {
  const GreyFestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Grey Fest")),
      body: const Center(child: Text("Welcome to Grey Fest")),
    );
  }
}

class RedFestScreen extends StatelessWidget {
  const RedFestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Red Fest")),
      body: const Center(child: Text("Welcome to Red Fest")),
    );
  }
}

class PresidentialCouncilScreen extends StatelessWidget {
  const PresidentialCouncilScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Presidential Council")),
      body: const Center(child: Text("Welcome to Presidential Council")),
    );
  }
}

class StudentEventScreen extends StatelessWidget {
  const StudentEventScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Student Event")),
      body: const Center(child: Text("Welcome to Student Event")),
    );
  }
}

// Positioned(
//                       left: 40,
//                       top: 0,
//                       child: triangleCard(
//                         color: const LinearGradient(
//                           colors: [Color(0xFF6CD4F3), Color(0xFF0E90B8)],
//                           begin: Alignment.topCenter,
//                           end: Alignment.bottomCenter,
//                         ),
//                         isInverted: true,
//                         size: 120,
//                         label: 'name',
//                         context: context,
//                         targetScreen: const BlueFestScreen(),
//                       ),
//                     ),
//                     Positioned(
//                       right: 40,
//                       top: 0,
//                       child: triangleCard(
//                         color: const LinearGradient(
//                           colors: [Color(0xFFEDE6DB), Color(0xFFB7ADA3)],
//                           begin: Alignment.topCenter,
//                           end: Alignment.bottomCenter,
//                         ),
//                         isInverted: true,
//                         size: 120,
//                         label: 'name',
//                         context: context,
//                         targetScreen: const GreyFestScreen(),
//                       ),
//                     ),
//                     Positioned(
//                       bottom: 0,
//                       child: triangleCard(
//                         color: const LinearGradient(
//                           colors: [Color(0xFFD45A5A), Color(0xFF8A3E3E)],
//                           begin: Alignment.topCenter,
//                           end: Alignment.bottomCenter,
//                         ),
//                         isInverted: false,
//                         size: 120,
//                         label: 'name',
//                         context: context,
//                         targetScreen: const RedFestScreen(),
//                       ),
//                     ),