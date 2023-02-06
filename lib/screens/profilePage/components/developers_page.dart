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
            RoleTitle(
              title: 'Full Stack Developer',
            ),
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
                    subtitle: 'Full stack developer',
                    image: 'assets/developers/Sanyu.jpg'),
                DevCardBuild(
                    name: 'Samuel Philip ',
                    subtitle: 'Full stack developer',
                    image: 'assets/developers/Samuel.JPG'),
              ],
            ),
            RoleTitle(
              title: 'UI Designer',
            ),
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
                    name: 'Anish',
                    subtitle: 'UI Designer',
                    image: 'assets/developers/Anish.jpg'),
                DevCardBuild(
                    name: 'Hari',
                    subtitle: 'UI Designer',
                    image: 'assets/developers/Hari.jpg'),
                DevCardBuild(
                    name: 'Chakri',
                    subtitle: 'UI Designerr',
                    image: 'assets/developers/Chakri.heic'),
                DevCardBuild(
                    name: 'Serena',
                    subtitle: 'UI Designer',
                    image: 'assets/developers/Serena.JPG'),
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
