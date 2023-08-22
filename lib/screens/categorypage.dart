import 'package:flutter/material.dart';
import 'package:learn_o/screens/utiltiy/btmnavbae.dart';
import 'package:learn_o/screens/utiltiy/heading_text.dart';

import 'package:sizer/sizer.dart';

class CategoryScreen extends StatelessWidget {
  CategoryScreen({Key? key, required String category}) : super(key: key);

  List<String> textList = [
    'Development',
    'Business',
    'Finance & Accounting',
    'IT & Software',
    'Marketing',
    'Lifestyle',
    'Photography & Video',
    'Health & Fitness',
    'Music',
    'Teaching & Academics'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const MyBottomBar(),
              ),
            ); // Navigate back to the previous screen
          },
        ),
        title: const Text('Categories'),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.shopping_cart,
              color: Colors.green,
            ),
            onPressed: () {
              // Handle shopping cart action
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(textList.length, (index) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: 2.h, left: 1.5.w),
                    child: myText(
                      text: textList[index],
                      fontweight: FontWeight.w400,
                      fontWeight: FontWeight.w500,
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class myText extends StatelessWidget {
  const myText({
    Key? key,
    required this.text,
    this.size = 14,
    this.fontweight = FontWeight.normal,
    required FontWeight fontWeight,
  }) : super(key: key);

  final String text;
  final double size;
  final FontWeight fontweight;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size,
        fontWeight: fontweight,
      ),
    );
  }
}
