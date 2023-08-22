import 'package:flutter/material.dart';
import 'package:learn_o/screens/homepage.dart';
import 'package:learn_o/screens/mycourses.dart';
import 'package:learn_o/screens/settingscreens/aboutus.dart';
import 'package:learn_o/screens/settingscreens/paymentmethod.dart';
import 'package:learn_o/screens/settingscreens/profile.dart';
import 'package:learn_o/screens/settingscreens/share.dart';
import 'package:learn_o/sigin/siginpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SettingsPage(),
    );
  }
}

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const SizedBox(height: 24), // Move the page up a bit
              Stack(
                children: [
                  Positioned(
                    top: 0,
                    left: 0,
                    child: BackArrow(onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomePage()),
                      );
                    }),
                  ),
                  const CircleAvatarWithUser(),
                ],
              ),
              const SizedBox(height: 16),
              const Text(
                'Anderson Hall', // Update with user's email
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'anderson-hall@gmail.com', // Update with user's email
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 48),
              _buildSettingsItem(context, 'My Profile', Icons.person, () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MyProfile()),
                );
              }),
              _buildSettingsItem(context, 'Payment Method', Icons.payment, () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const PaymentScreen()),
                );
              }),
              _buildSettingsItem(context, 'My Courses', Icons.book, () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const MyCoursesPage()),
                );
              }),
              _buildSettingsItem(context, 'Share', Icons.share, () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CourseSharePage(
                      courseTitle: '',
                    ),
                  ),
                );
              }),
              _buildSettingsItem(context, 'About Us', Icons.info, () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AboutPage()),
                );
              }),
              _buildSettingsItem(context, 'Logout', Icons.logout, () {
                _buildSettingsItem(context, 'Logout', Icons.logout, () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => SignInScreen()),
                  );
                });
              }),
              const SizedBox(height: 64),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSettingsItem(
      BuildContext context, String title, IconData icon, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(icon),
                const SizedBox(width: 16),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            const Icon(Icons.arrow_forward_ios),
          ],
        ),
      ),
    );
  }
}

class BackArrow extends StatelessWidget {
  final VoidCallback onPressed;

  const BackArrow({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: onPressed,
    );
  }
}

class CircleAvatarWithUser extends StatelessWidget {
  const CircleAvatarWithUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        const CircleAvatar(
          radius: 64,
          backgroundColor: Colors.blue,
          backgroundImage:
              AssetImage('assets/1.jpeg'), // Update with user image
        ),
        Positioned(
          bottom: -32,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(4),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: const Text(
              'anderson-hall@gmail.com', // Update with user's email
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
          ),
        ),
        Positioned(
          top: 140, // Adjust the vertical position as needed
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
            // You can add content inside the container if needed
            // For example, an icon or text
            // child: Icon(Icons.edit, color: Colors.white, size: 40),
          ),
        ),
      ],
    );
  }
}
