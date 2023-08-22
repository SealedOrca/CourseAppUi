import 'package:flutter/material.dart';
import 'package:learn_o/screens/settingscreens/editprofiel.dart';
import 'package:learn_o/screens/utiltiy/heading_text.dart';
import 'package:sizer/sizer.dart';

import '../../components/custombutton.dart';

class MyProfile extends StatelessWidget {
  const MyProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              backButton(context),
              SizedBox(height: 2.h),
              Center(
                child: Container(
                  height: 85,
                  width: 85,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(200),
                    gradient: const LinearGradient(colors: [
                      Color.fromRGBO(71, 103, 217, 1),
                      Color.fromRGBO(33, 195, 79, 1),
                    ]),
                  ),
                  child: Center(
                    child: Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.white,
                        image: const DecorationImage(
                          image: AssetImage('assets/1.jpeg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 1.h),
              Center(
                child: customButton(
                  width: 80.w,
                  text: 'Edit',
                  function: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const EditProfilePage()),
                    );
                  },
                ),
              ),
              SizedBox(height: 5.h),
              Padding(
                padding: EdgeInsets.only(left: 7.w, right: 7.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    myText(
                      text: 'Name',
                      fontweight: FontWeight.w400,
                      size: 12,
                      fontWeight: FontWeight.normal,
                    ),
                    myText(
                      text: 'Alex Marshall', // Replace with your name
                      fontweight: FontWeight.w400,
                      size: 14, fontWeight: FontWeight.normal,
                    ),
                    SizedBox(height: 2.h),
                    myText(
                      text: 'Phone',
                      fontweight: FontWeight.w400,
                      size: 12,
                      fontWeight: FontWeight.normal,
                    ),
                    myText(
                      text: '+1 515 599 9655', // Replace with your email
                      fontweight: FontWeight.w400,
                      size: 14, fontWeight: FontWeight.normal,
                    ),
                    SizedBox(height: 2.h),
                    myText(
                      text: 'Biography',
                      fontweight: FontWeight.w400,
                      size: 12,
                      fontWeight: FontWeight.normal,
                    ),
                    myText(
                      text:
                          'Hello! I am a Software Engineer with 3+ years of experience in creating UI UX designs, prototypes and wireframes for my clients across the globe. I have also worked with the multinational organization in creating Mobile Apps and Web Apps design.', // Replace with your biography
                      maxline: 10,
                      textAlignment: TextAlign.start,
                      fontweight: FontWeight.w400,
                      size: 14, fontWeight: FontWeight.normal,
                    ),
                    SizedBox(height: 2.h),
                    myText(
                      text: 'Skill',
                      fontweight: FontWeight.w400,
                      size: 12,
                      fontWeight: FontWeight.normal,
                    ),
                    SizedBox(height: 1.h),
                    Center(
                      child: Wrap(
                        spacing: 14,
                        runSpacing: 10,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(230, 230, 230, 1),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            padding: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 18),
                            child: myText(
                              text: 'Flutter', // Replace with your skills
                              size: 13,
                              fontweight: FontWeight.w400,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(230, 230, 230, 1),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            padding: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 18),
                            child: myText(
                              text: 'UI/UX Design', // Replace with your skills
                              size: 13,
                              fontweight: FontWeight.w400,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          // Add more skills containers here
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

  Widget backButton(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }
}
