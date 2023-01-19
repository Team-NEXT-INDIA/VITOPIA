import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Components/mentions_card.dart';

class InformationPage extends StatelessWidget {
  InformationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScrollController _scrollController = new ScrollController();
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 0,
              title: FadeIn(
                child: Text(
                  "Honourable Mentions",
                  style: GoogleFonts.montserrat(
                    color: const Color(0xff202022),
                    fontSize: 21.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              centerTitle: true,
              automaticallyImplyLeading: false,
              elevation: 0,
              pinned: true,
              floating: false,
              stretch: true,
              surfaceTintColor: Color(0xffF9F9F9),
              backgroundColor: Colors.white,
            ),
            SliverFillRemaining(
              child: SingleChildScrollView(
                controller: _scrollController,
                // physics: const BouncingScrollPhysics(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //Core Comittee
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 05.h),
                            width: 20.h,
                            height: 02.h,
                            color: Colors.cyan,
                          ),
                          Text(
                            "VITAP",
                            style: GoogleFonts.montserrat(
                              color: const Color(0xff040507),
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 19.0),
                                child: MentionsCardBuild(
                                  name: 'Dr. G. Viswanathan',
                                  subtitle: 'Chancellor',
                                  image:
                                      'https://vitap.ac.in/wp-content/uploads/2020/12/Viswanthan-Sir.jpg',
                                ),
                              ),
                              MentionsCardBuild(
                                name: 'Dr. S. V. Kota Reddy',
                                subtitle: 'Vice Chancellor',
                                image:
                                    'https://vitap.ac.in/wp-content/uploads/2020/12/SV-Kota-Reddy-Sir.jpg',
                              ),
                              MentionsCardBuild(
                                name: 'Dr. Jagadish Chandra Mudiganti',
                                subtitle: 'Registrar',
                                image:
                                    'https://vitap.ac.in/wp-content/uploads/2022/10/Registrar-scaled.jpg',
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    //Core Comittee
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 05.h),
                            width: 20.h,
                            height: 02.h,
                            color: Colors.cyan,
                          ),
                          Text(
                            "Core Committee of VITOPIA© 2023",
                            style: GoogleFonts.montserrat(
                              color: const Color(0xff040507),
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 19.0),
                                child: MentionsCardBuild(
                                  name: 'Dr. Sudhakar Ilango',
                                  subtitle: 'Convenor',
                                  image:
                                      'https://vitap.ac.in/wp-content/uploads/2019/06/Dr.-SUDHAKAR-ILANGO-1.jpg',
                                ),
                              ),
                              MentionsCardBuild(
                                name: 'Dr. Monali Bordoloi',
                                subtitle: 'Co Convenor (SCOPE)',
                                image:
                                    'https://vitap.ac.in/wp-content/uploads/2021/07/Monali-Bordoloi.jpg',
                              ),
                              MentionsCardBuild(
                                name: 'Dr. Sayyed Faizan Ali ',
                                subtitle: 'Co Convenor (SENSE)',
                                image:
                                    'https://vitap.ac.in/wp-content/uploads/2022/10/Mr.faizan-ali.jpg',
                              ),
                              MentionsCardBuild(
                                name: 'Dr. Manikanta Ravindra Kumar V ',
                                subtitle: 'Co Convenor (SMEC)',
                                image:
                                    'https://vitap.ac.in/wp-content/uploads/2019/06/Dr.-V.-RAVINDRAKUMAR.jpg',
                              ),
                              MentionsCardBuild(
                                name: 'Prof. Samuel Johnson Israel',
                                subtitle: 'Co Convenor (VSB)',
                                image:
                                    'https://vitap.ac.in/wp-content/uploads/2019/06/Mr.-K.-SAMUEL-JOHNSON.jpg',
                              ),
                              MentionsCardBuild(
                                name: 'Dr. Aswathy R K',
                                subtitle: 'Co Convenor (SAS)',
                                image:
                                    'https://i.im.ge/2023/01/19/sNxu8X.IMG-3659.jpg',
                              ),
                              MentionsCardBuild(
                                name: 'Dr. Suresh Jagannadham',
                                subtitle: 'Co Convenor (VISH)',
                                image:
                                    'https://vitap.ac.in/wp-content/uploads/2022/02/Suresh-Jagannadham.jpg',
                              ),
                              MentionsCardBuild(
                                name: 'Prof. Kritika',
                                subtitle: 'Co Convenor (VSL)',
                                image:
                                    'https://cdn.vectorstock.com/i/preview-1x/33/63/person-gray-photo-placeholder-woman-vector-22863363.jpg',
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    //Student Welfare ->
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 05.h),
                            width: 20.h,
                            height: 02.h,
                            color: Colors.cyan,
                          ),
                          Text(
                            "Student Welfare",
                            style: GoogleFonts.montserrat(
                              color: const Color(0xff040507),
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 19.0),
                                child: MentionsCardBuild(
                                  name: 'Dr.Anupama Namburu',
                                  subtitle: ' Deputy Director',
                                  image:
                                      'https://vitap.ac.in/wp-content/uploads/2019/06/Dr.-ANUPAMA-NAMBURU.jpg',
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    //Sports Comittee ->
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 05.h),
                            width: 20.h,
                            height: 02.h,
                            color: Colors.cyan,
                          ),
                          Text(
                            "Sports",
                            style: GoogleFonts.montserrat(
                              color: const Color(0xff040507),
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 19.0),
                                child: MentionsCardBuild(
                                  name: 'Dr.Ramachandra Rao',
                                  subtitle: 'Physical education director',
                                  image:
                                      'https://st3.depositphotos.com/4111759/13425/v/600/depositphotos_134255710-stock-illustration-avatar-vector-male-profile-gray.jpg',
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
