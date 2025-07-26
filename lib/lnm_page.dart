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
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 4.w),
                    child: Container(
                      padding: EdgeInsets.all(10.h),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0xFF353F54), Color(0xFF222834)],
                        ),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Icon(
                        Icons.group,
                        color: Colors.white,
                        size: 32.r,
                      ),
                    ),
                  ),
                   SizedBox(width: 14.w),
                  Expanded(
                    child: Text(
                      'FACULTIES',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              _buildCardGrid([
                _CardData('Important\nContacts', Icons.contact_phone, () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ImportantContactsPage(),
                    ),
                  );
                }),
                _CardData('HODs', Icons.person, () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HODsPage()),
                  );
                }),
                _CardData('Hostel\nContacts', Icons.home, () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HostelPage()),
                  );
                }),
              ]),
              SizedBox(height: 28.h),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 4.w),
                    child: Container(
                      padding: EdgeInsets.all(10.h),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0xFF353F54), Color(0xFF222834)],
                        ),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Icon(
                        Icons.category,
                        color: Colors.white,
                        size: 32.r,
                      ),
                    ),
                  ),
                   SizedBox(width: 14.w),
                  Expanded(
                    child: Text(
                      'MISCELLANEOUS',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CurriculumPage(),
                    ),
                  );
                }),
                _CardData('Important\nLinks', Icons.link, () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LinksPage()),
                  );
                }),
              ]),
              SizedBox(height: 28.h),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 4.w),
                    child: Container(
                      padding: EdgeInsets.all(10.h),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0xFF353F54), Color(0xFF222834)],
                        ),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Icon(
                        Icons.message,
                        color: Colors.white,
                        size: 32.r,
                      ),
                    ),
                  ),
                   SizedBox(width: 14.w),
                  Expanded(
                    child: Text(
                      "DIRECTOR'S MESSAGE",
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
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
              border: Border.all(
                color: Colors.white.withOpacity(0.2),
                width: 2,
              ),
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
              padding: EdgeInsets.all(10.sp),
              child: Row(
                children: [
                  Icon(card.icon, size: 18.sp, color: Colors.white),
                  SizedBox(width: 6.w),
                  Flexible(
                    child: Text(
                      card.title.replaceAll('\n', ' '),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 13.sp,
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
      padding: EdgeInsets.all(15.sp),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF353F54), Color(0xFF222834)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        border: Border.all(color: Colors.white.withOpacity(0.2), width: 2),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Welcome to The LNM Institute of Information Technology (LNMIIT), Jaipur! The LNMIIT is an institution of higher learning focused in select areas of Computing, Communication, ICT, Electronics and carefully chosen traditional engineering and sciences with an innovative blend of interdisciplinary flavor and contemporary relevance.',
            style: GoogleFonts.inter(
              color: Color(0xFFB0B0B0),
              fontSize: 11.sp,
              height: 1.1.h,
            ),
          ),
          SizedBox(height: 14.h),
          Row(
            children: [
              Container(
                width: 60.w,
                height: 60.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: const Color(0xFF3A4B57),
                  image: const DecorationImage(
                    image: AssetImage(
                      'assets/pages/faces/rahul_banerjee_2.jpg',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Text(
                  'Prof. Rahul Banerjee',
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 14.h),
          Text(
            'The Institute, in spite of being young (founded in 2002, jointly by the Government of Rajasthan and the Lakshmi & Usha Mittal Foundation in the public-private partnership mode) is considered as one of the best institutions in its chosen areas of higher learning, both in the state and the country. In addition to having been accredited by the National Assessment & Accreditation Council (NAAC) as an "A" grade institution, the LNMIIT has been ranked fairly high by many different agencies in the recent past as may be noticed elsewhere on the official web-portal.',
            style: TextStyle(
              color: Color(0xFFB0B0B0),
              fontSize: 11.sp,
              height: 1.1.h,
            ),
          ),
          SizedBox(height: 14.h),
          Text(
            'The Institute takes pride in its eco-system that aims to groom incoming students into academically strong yet well-rounded personality based professionals who could adapt themselves to the challenges posed by the ever-changing world and working environments.',
            style: GoogleFonts.inter(
              color: Color(0xFFB0B0B0),
              fontSize: 11.sp,
              height: 1.1.h,
            ),
          ),
          SizedBox(height: 14.h),
          Text(
            'If you are an aspiring student, we welcome you to take a good look at our website and preferably consider visiting the campus for getting to know it even better by getting the first hand feel of its ambience and interacting with faculty and students so that you could take a well-informed decision. If you have already applied to the LNMIIT, have been offered an admission and accepted the offer, Congratulations and Welcome to this new home of yours for next few years!',
            style: GoogleFonts.inter(
              color: Color(0xFFB0B0B0),
              fontSize: 11.sp,
              height: 1.1.h,
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
