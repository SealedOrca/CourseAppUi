import 'package:flutter/material.dart';
import 'package:learn_o/screens/utiltiy/btmnavbae.dart';
import 'package:share_plus/share_plus.dart';
import 'package:learn_o/screens/settingpage.dart';

class CourseSharePage extends StatelessWidget {
  final String courseTitle;

  const CourseSharePage({Key? key, required this.courseTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Share Course'),
        leading: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SettingsPage()),
            );
          },
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey[200],
            ),
            child: const Icon(Icons.arrow_back, size: 24, color: Colors.black),
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                Icons.share,
                size: 100,
                color: Colors.blue,
              ),
              const SizedBox(height: 20),
              Text(
                'Share "$courseTitle" with Friends',
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: () {
                  // Implement sharing functionality using 'share_plus' package
                  _shareCourse(courseTitle);
                },
                icon: const Icon(Icons.send),
                label: const Text('Share'),
              ),
            ],
          ),
        ),
      ),
      // Add the bottom navigation bar here
    );
  }

  void _shareCourse(String courseTitle) async {
    try {
      await Share.share(
        'Check out the course: $courseTitle', // Share text
      );
    } catch (e) {
      // Handle error
      print('Error sharing: $e');
    }
  }
}
