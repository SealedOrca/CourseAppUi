import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_o/screens/courses.dart';
import 'package:learn_o/screens/homepage.dart';
import 'package:learn_o/screens/searchpage.dart';
import 'package:learn_o/screens/settingpage.dart';
import 'package:learn_o/screens/settingscreens/aboutus.dart';
import 'package:learn_o/screens/settingscreens/editprofiel.dart';
import 'package:learn_o/screens/settingscreens/profile.dart';
import 'package:learn_o/screens/settingscreens/share.dart';
import 'package:learn_o/screens/shoopingcartpage.dart';
import 'package:learn_o/screens/wishlistpage.dart';

import '../course2learn.dart';

class MyBottomBar extends StatefulWidget {
  const MyBottomBar({super.key});

  @override
  State<MyBottomBar> createState() => _MyBottomBarState();
}

class _MyBottomBarState extends State<MyBottomBar> {
  int currentIndex = 0;

  void onTap(int selectIndex) {
    setState(() {
      currentIndex = selectIndex;
    });
  }

  List pages = [
    const HomePage(),
    const CourseSearchPage(),
    const WishlistScreen(),
    const SettingsPage(),
    const CourseDetailsScreen(),
    const EditProfilePage(),
    const MyProfile(),
    const CourseDetailsScreen(),
    const CourseSearchPage(),
    CartScreen(),
    const CourseScreen1(),
    const PaymentScreen(),
    const WishlistScreen(),
    const AboutPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: SizedBox(
        width: Get.width,
        height: 80,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              bottom: -5,
              child: Container(
                width: Get.width,
                height: 80,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(0, 73, 43, 243),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 10,
                      spreadRadius: 2,
                    ),
                  ],
                ),
              ),
            ),
            CustomPaint(
              size: Size(Get.width, 80),
              painter: BNBCustomPainter(),
            ),
            Center(
              heightFactor: 0.5,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    onTap(4);
                  });
                },
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 28, 88, 242),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: const Icon(
                    Icons.play_circle,
                    color: Colors.white,
                    size: 42,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: Get.width,
              height: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.home,
                      size: 30,
                      color: currentIndex == 0 ? Colors.white : Colors.white,
                    ),
                    onPressed: () {
                      setState(() {
                        onTap(0);
                      });
                    },
                    splashColor: Colors.white,
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.search,
                      size: 30,
                      color: currentIndex == 1 ? Colors.white : Colors.white,
                    ),
                    onPressed: () {
                      setState(() {
                        onTap(1);
                      });
                    },
                    splashColor: Colors.white,
                  ),
                  Container(
                    width: Get.width * 0.20,
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.favorite,
                      size: 30,
                      color: currentIndex == 2 ? Colors.white : Colors.white,
                    ),
                    onPressed: () {
                      setState(() {
                        onTap(2);
                      });
                    },
                    splashColor: Colors.white,
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.person,
                      size: 30,
                      color: currentIndex == 3 ? Colors.white : Colors.white,
                    ),
                    onPressed: () {
                      setState(() {
                        onTap(3);
                      });
                    },
                    splashColor: Colors.white,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyCourses {}

class BNBCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = const Color.fromARGB(255, 41, 72, 245)
      ..style = PaintingStyle.fill;

    Path path = Path();
    path.moveTo(0, 20); // Start
    path.quadraticBezierTo(size.width * 0.20, 0, size.width * 0.35, 0);
    path.quadraticBezierTo(size.width * 0.40, 0, size.width * 0.40, 14);
    path.arcToPoint(Offset(size.width * 0.60, 5),
        radius: const Radius.circular(10.0), clockwise: false);
    path.quadraticBezierTo(size.width * 0.60, 0, size.width * 0.65, 0);
    path.quadraticBezierTo(size.width * 0.80, 0, size.width, 20);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, 20);
    canvas.drawShadow(path, Colors.black, 5, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
