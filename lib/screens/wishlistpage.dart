import 'package:flutter/material.dart';
import 'package:learn_o/screens/utiltiy/heading_text.dart';
import 'package:sizer/sizer.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
          child: Column(
            children: [
              Row(
                children: [
                  myText(
                      text: 'Wishlist',
                      size: 18,
                      fontWeight: FontWeight.normal),
                  const Spacer(),
                  const Icon(
                    Icons.shopping_cart,
                    color: Colors.green,
                    size: 28,
                  ),
                ],
              ),
              SizedBox(height: 2.h),
              // First Item
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Container(
                      height: 9.h,
                      width: 26.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                        image: const DecorationImage(
                          image: AssetImage('assets/12.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(width: 3.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          myText(
                              text: 'Figma UIUX design essentials',
                              size: 12.sp,
                              fontWeight: FontWeight.normal),
                          myText(
                              text: 'Daniel Walter',
                              size: 14,
                              fontWeight: FontWeight.normal),
                          Row(
                            children: [
                              myText(
                                text: '5.0',
                                color: const Color.fromRGBO(222, 146, 68, 1),
                                size: 9,
                                fontWeight: FontWeight.normal,
                              ),
                              Row(
                                children: List.generate(
                                  5,
                                  (index) => const Icon(Icons.star,
                                      color: Colors.orangeAccent, size: 15),
                                ),
                              ),
                              myText(
                                  text: ' (106,929)',
                                  size: 14,
                                  fontweight: FontWeight.w400,
                                  fontWeight: FontWeight.normal),
                            ],
                          ),
                          myText(
                              text: '\$ 59.00',
                              size: 12,
                              fontweight: FontWeight.w600,
                              fontWeight: FontWeight.normal),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 2.h),
              // Second Item (Add more items as needed)
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Container(
                      height: 9.h,
                      width: 26.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                        image: const DecorationImage(
                          image: AssetImage('assets/1234.jpeg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(width: 3.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          myText(
                              text:
                                  'Automate the Boring Stuff with Python Programming',
                              size: 12.sp,
                              fontWeight: FontWeight.normal),
                          myText(
                              text: 'David Travis',
                              size: 14,
                              fontWeight: FontWeight.normal),
                          Row(
                            children: [
                              myText(
                                text: '4.8',
                                color: const Color.fromRGBO(222, 146, 68, 1),
                                size: 9,
                                fontWeight: FontWeight.normal,
                              ),
                              Row(
                                children: List.generate(
                                  5,
                                  (index) => const Icon(Icons.star,
                                      color: Colors.orangeAccent, size: 15),
                                ),
                              ),
                              myText(
                                  text: ' (32,485)',
                                  size: 14,
                                  fontweight: FontWeight.w400,
                                  fontWeight: FontWeight.normal),
                            ],
                          ),
                          myText(
                              text: '\$ 79.00',
                              size: 12,
                              fontweight: FontWeight.w600,
                              fontWeight: FontWeight.normal),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
