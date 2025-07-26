import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_page/pdfviewer.dart';
import 'pages/impContacts.dart';
import 'pages/hods.dart';
import 'pages/hostelContacts.dart';
import 'pages/impLinks.dart';
import 'pages/curriculum.dart';

class LNMPage extends StatelessWidget {
  const LNMPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0E1A23),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(14.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'FACULTIES',
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              _buildCardGrid([
                _CardData('Important\nContacts', Icons.contact_phone, () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) => const ImportantContactsPage(),
                  ));
                }),
                _CardData('HODs', Icons.person, () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) => HODsPage(),
                  ));
                }),
                _CardData('Hostel\nContacts', Icons.home, () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) => const HostelPage(),
                  ));
                }),
              ]),
              SizedBox(height: 28.h),
              Text(
                'MISCELLANEOUS',
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 14.h),
              _buildCardGrid([
                _CardData('Campus Map', Icons.map, () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PDFViewerPage(
                        title: 'Campus Map',
                        pdfUrl:
                            'https://raw.githubusercontent.com/ccell2026/ccell/master/assets/pdfs/CampusMap.pdf',
                      ),
                    ),
                  );
                }),
                _CardData('Academic\nArea Map', Icons.school, () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PDFViewerPage(
                        title: 'Academic Area Map',
                        pdfUrl:
                            'https://raw.githubusercontent.com/ccell2026/ccell/master/assets/AcadsAreamap.pdf',
                      ),
                    ),
                  );
                }),
                _CardData('Curriculum', Icons.book, () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) => const CurriculumPage(),
                  ));
                }),
                _CardData('Important\nLinks', Icons.link, () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) => const LinksPage(),
                  ));
                }),
              ]),
              SizedBox(height: 28.h),
              Text(
                'DIRECTOR\'S MESSAGE',
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                ),
              ),
              const SizedBox(height: 16),
              _buildDirectorMessage(),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCardGrid(List<_CardData> cards) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2.57,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),
      itemCount: cards.length,
      itemBuilder: (context, index) {
        final card = cards[index];
        return GestureDetector(
          onTap: card.onTap,
          child: Container(
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xFF353F54), Color(0xFF222834)],
              ),
              border: Border.all(color: Colors.white.withOpacity(0.2), width: 2),
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
                BoxShadow(
                  color: Colors.white.withOpacity(0.05),
                  blurRadius: 2,
                  offset: const Offset(-1, -1),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  Icon(
                    card.icon,
                    size: 24,
                    color: Colors.white,
                  ),
                  const SizedBox(width: 8),
                  Flexible(
                    child: Text(
                      card.title.replaceAll('\n', ' '),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildDirectorMessage() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF2A3B47),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            'Welcome Message',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Welcome to The LNM Institute of Information Technology (LNMIIT), Jaipur!...',
            style: TextStyle(
              color: Color(0xFFB0B0B0),
              fontSize: 14,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}

class _CardData {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  _CardData(this.title, this.icon, this.onTap);
}

// PDF Viewer Page
