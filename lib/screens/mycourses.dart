import 'package:flutter/material.dart';
import 'package:learn_o/screens/shoopingcartpage.dart';
import 'package:sizer/sizer.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class MyCoursesPage extends StatelessWidget {
  const MyCoursesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Courses'),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart, color: Colors.green),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CartScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'My Courses',
              style: TextStyle(fontSize: 18.sp),
            ),
            SizedBox(height: 1.h),
            const MyTabBar(),
            SizedBox(height: 2.h),
            const CourseItem(
              title: 'Figma UIUX design essentials',
              instructor: 'Daniel Walter',
              progress: 0.1,
            ),
            const CourseItem(
              title: 'Automate the Boring Stuff with Python Programming',
              instructor: 'Daniel Walter',
              progress: 0.28,
            ),
            const CourseItem(
              title: 'Get started with Figma: The Ultimate Guide to UX',
              instructor: 'Daniel Walter',
              progress: 0,
            ),
            // Add more CourseItems as needed
          ],
        ),
      ),
    );
  }
}

class MyTabBar extends StatelessWidget {
  const MyTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const BubbleTab(text: 'All'),
        SizedBox(width: 1.w),
        const BubbleTab(text: 'Completed'),
        SizedBox(width: 1.w),
        const BubbleTab(text: 'Ongoing'),
      ],
    );
  }
}

class BubbleTab extends StatelessWidget {
  final String text;

  const BubbleTab({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 0.8.h),
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}

class CourseItem extends StatelessWidget {
  final String title;
  final String instructor;
  final double progress;

  const CourseItem({
    super.key,
    required this.title,
    required this.instructor,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 2.h),
      padding: EdgeInsets.all(1.h),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            height: 8.h,
            width: 20.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: const DecorationImage(
                image: AssetImage('assets/12.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 2.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 12.sp),
                ),
                Text(
                  instructor,
                  style: TextStyle(fontSize: 14.sp),
                ),
                SizedBox(height: 1.h),
                LinearPercentIndicator(
                  width: 60.w,
                  lineHeight: 7.0,
                  percent: progress,
                  barRadius: const Radius.circular(10),
                  backgroundColor: Colors.grey.withOpacity(0.2),
                  progressColor: Colors.green,
                ),
                Text(
                  '${(progress * 100).toInt()}% completed',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
