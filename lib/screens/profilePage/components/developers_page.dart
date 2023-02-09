import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'dev_card.dart';

class DevelopersPage extends StatelessWidget {
  DevelopersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff000000),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xff000000),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
        ),
        title: Text(
          'DEVELOPERS',
          style: TextStyle(
              fontFamily: 'Monument Extended',
              color: Color(0xffffffff),
              fontSize: 23.sp),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            GridView(
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.all(10.0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: (1.h / 1.6.h),
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
              ),
              children: [
                DevCardBuild(
                  name: 'Sanyu Raj',
                  image: 'assets/developers/Sanyu.jpg',
                  instagramlink:
                      'https://instagram.com/sanyuraj04?igshid=YWJhMjlhZTc=',
                  linkedinlink:
                      'https://www.linkedin.com/in/sanyu-raj-3b5242259',
                ),
                DevCardBuild(
                  name: 'Samuel Philip ',
                  image: 'assets/developers/Samuel.JPG',
                  instagramlink: 'https://instagram.com/ig_samuelsam',
                  linkedinlink:
                      'https://www.linkedin.com/in/samuel-philip-322a0a231',
                ),
                DevCardBuild(
                  name: 'Satyanand',
                  image: 'assets/developers/Satyanand.png',
                  instagramlink:
                      'https://instagram.com/satyanandatluri?igshid=YWJhMjlhZTc=',
                  linkedinlink:
                      'https://www.linkedin.com/in/satyanand-atluri-434841259',
                ),
                DevCardBuild(
                  name: 'Anish',
                  image: 'assets/developers/Anish.jpg',
                  instagramlink: 'https://www.instagram.com/ani.__sh/',
                  linkedinlink:
                      'https://www.linkedin.com/in/anish-ganapathi-086049220/',
                ),
                DevCardBuild(
                  name: 'Hari',
                  image: 'assets/developers/Hari.jpg',
                  instagramlink:
                      'https://instagram.com/hari_hara_pidikiti?igshid=YmMyMTA2M2Y=',
                  linkedinlink:
                      'https://instagram.com/hari_hara_pidikiti?igshid=YmMyMTA2M2Y=',
                ),
                DevCardBuild(
                  name: 'Chakri',
                  image: 'assets/developers/Chakri.heic',
                  instagramlink:
                      'https://instagram.com/chakrinaidu___?igshid=YmMyMTA2M2Y=',
                  linkedinlink:
                      'https://www.linkedin.com/in/chakridhar-n-624792232/',
                ),
                DevCardBuild(
                  name: 'Serena',
                  image: 'assets/developers/Serena.JPG',
                  instagramlink:
                      'https://instagram.com/serenaaa.11?igshid=YmMyMTA2M2Y=',
                  linkedinlink: 'https://www.linkedin.com/in/serena-mendanha/',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class RoleTitle extends StatelessWidget {
  final String title;

  RoleTitle({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 10.h,
        ),
        Container(
          height: 4.h,
          width: 30.h,
          color: Color(0xff349FD4),
        ),
        Padding(
          padding: EdgeInsets.only(left: 10.h),
          child: Text(
            title,
            style: TextStyle(color: Color(0xffffffff)),
          ),
        )
      ],
    );
  }
}
