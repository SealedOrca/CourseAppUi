import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:learn_o/screens/utiltiy/heading_text.dart';
import 'package:sizer/sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../components/custombutton.dart';
import '../../components/customtextfield.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  late final TextEditingController _fNameController =
      TextEditingController(text: 'Alex Marshall');
  late final TextEditingController _PhoneNumberController =
      TextEditingController(text: '+1 515 599 9655');
  late final TextEditingController _biographyController = TextEditingController(
      text:
          'Hello! I am a Software Engineer with 3+ years of experience in creating UI UX designs, prototypes and wireframes for my clients across the globe. I have also worked with the multinational organization in creating Mobile Apps and Web Apps design.');
  final TextEditingController _tagController = TextEditingController();

  String _selectedExperienceLevel = 'Beginner';
  List<String> skillTags = [];

  String _profileImagePath = '';

  @override
  void initState() {
    super.initState();
    _loadProfileImagePath();
  }

  Future<void> _loadProfileImagePath() async {
    final sp = await SharedPreferences.getInstance();
    setState(() {
      _profileImagePath = sp.getString('profileImagePath') ?? '';
    });
  }

  @override
  void dispose() {
    _tagController.dispose();
    super.dispose();
  }

  void _addTag() {
    final tagName = _tagController.text.trim();
    if (tagName.isNotEmpty) {
      setState(() {
        skillTags.add(tagName);
        _tagController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                backButton(),
                Center(
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      gradient: const LinearGradient(
                        colors: [
                          Color.fromRGBO(71, 103, 217, 1),
                          Color.fromRGBO(33, 195, 79, 1),
                        ],
                      ),
                    ),
                    child: Stack(
                      children: [
                        Center(
                          child: Container(
                            height: 95,
                            width: 95,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: Colors.white,
                              image: _profileImagePath.isNotEmpty
                                  ? DecorationImage(
                                      image: FileImage(File(_profileImagePath)),
                                      fit: BoxFit.cover,
                                    )
                                  : const DecorationImage(
                                      image: AssetImage('assets/1.jpeg'),
                                      fit: BoxFit.cover,
                                    ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 2.h),
                labelCustomField(
                    labelText: 'Name',
                    controller: _fNameController,
                    maxLines: 6),
                labelCustomField(
                    labelText: 'Phone Number',
                    controller: _PhoneNumberController,
                    maxLines: 1),
                labelCustomField(
                    labelText: 'Biography',
                    controller: _biographyController,
                    maxLines: 6), // Increase maxLines
                SizedBox(height: 2.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  child: myText(
                      text: 'Skill',
                      color: const Color.fromRGBO(79, 79, 81, 1),
                      fontweight: FontWeight.w400,
                      size: 12,
                      fontWeight: FontWeight.normal),
                ),
                SizedBox(height: 1.h),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
                  margin: EdgeInsets.symmetric(horizontal: 8.w),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: const Color.fromRGBO(217, 217, 217, 1)),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 5.h,
                        child: TextField(
                          controller: _tagController,
                          decoration: InputDecoration(
                            hintText: 'Add Skill',
                            hintStyle: const TextStyle(
                                fontSize: 14, fontWeight: FontWeight.normal),
                            filled: true,
                            fillColor: Colors.white,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(color: Colors.green),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(color: Colors.green),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(color: Colors.green),
                            ),
                          ),
                          style: const TextStyle(color: Colors.black),
                          onSubmitted: (value) {
                            _addTag();
                          },
                        ),
                      ),
                      SizedBox(height: 1.h),
                      Container(
                        height: 6.h,
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.green),
                        ),
                        child: InkWell(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text(
                                    'Experience Level',
                                  ),
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      ListTile(
                                        title: const Text('Beginner'),
                                        onTap: () {
                                          setState(() {
                                            _selectedExperienceLevel =
                                                'Beginner';
                                          });
                                          Navigator.pop(context);
                                        },
                                      ),
                                      ListTile(
                                        title: const Text('Intermediate'),
                                        onTap: () {
                                          setState(() {
                                            _selectedExperienceLevel =
                                                'Intermediate';
                                          });
                                          Navigator.pop(context);
                                        },
                                      ),
                                      ListTile(
                                        title: const Text('Advanced'),
                                        onTap: () {
                                          setState(() {
                                            _selectedExperienceLevel =
                                                'Advanced';
                                          });
                                          Navigator.pop(context);
                                        },
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Experience Level: $_selectedExperienceLevel',
                                style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal),
                              ),
                              const Icon(Icons.keyboard_arrow_down),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 2.h),
                Center(
                  child: Wrap(
                    spacing: 14,
                    runSpacing: 10,
                    children: List.generate(skillTags.length, (index) {
                      String tagName = skillTags[index];
                      return Container(
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(230, 230, 230, 1),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 18),
                        child: myText(
                            text: tagName,
                            size: 13,
                            fontweight: FontWeight.w400,
                            fontWeight: FontWeight.normal),
                      );
                    }),
                  ),
                ),
                SizedBox(height: 2.h),
                animatedButton(
                  isLoading: false,
                  text: 'Update',
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget backButton() {
    return IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  Future<PickedFile?> getImage(int type) async {
    // Placeholder method in case you want to add back image picking functionality
    return null;
  }
}

typedef Callback = void Function();

void main() {
  runApp(const MaterialApp(home: EditProfilePage()));
}
