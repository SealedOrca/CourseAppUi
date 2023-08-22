import 'package:flutter/material.dart';
import 'package:learn_o/screens/shoopingcartpage.dart';
import 'package:learn_o/screens/wishlistpage.dart';

class CourseScreen1 extends StatelessWidget {
  const CourseScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite, color: Colors.black),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const WishlistScreen()),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.shopping_cart, color: Colors.black),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartScreen()),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 240,
              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage("assets/12.jpg"),
                  fit: BoxFit.cover,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 6.0,
                    spreadRadius: 1.0,
                    offset: const Offset(0, 3),
                  ),
                ],
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 8),
                  const Text(
                    "Figma UIUX Design Essentials",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const Text("Created by Daniel Walter"),
                  const Row(
                    children: [
                      Icon(Icons.star, color: Colors.yellow),
                      SizedBox(width: 4),
                      Text("5.0⭐⭐⭐⭐⭐ | ",
                          style: TextStyle(color: Colors.black)),
                      Icon(Icons.people,
                          color:
                              Color.fromARGB(255, 71, 78, 71)), // Enrolled icon
                      SizedBox(width: 4),
                      Text("340 Enrolled",
                          style: TextStyle(color: Colors.black)),
                    ],
                  ),
                  const Text(
                    "\$50.99",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CartScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 3, 231, 121),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 142, vertical: 12),
                    ),
                    child: const Text(
                      "Add to Cart",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "About This Course:",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    "This course is designed for beginners who want to learn UI/UX design from the ground up. You'll gain a solid understanding of fundamental concepts, from wireframing to interactive prototyping, and learn to build a complete mobile app.",
                  ),
                  const SizedBox(height: 2),
                  _buildSectionHeader("What You Will Learn:"),
                  _buildChecklist([
                    "Become a UX designer",
                    "You will be able to start earning money from your UIUX skills",
                    "Build & test a full website design",
                    "Work with fonts & colors",
                    "Test on mobile phones",
                    "93 lectures of well-structured, step by step content",
                    "Learn to design websites & mobile phone apps",
                    "Downloadable exercise files",
                  ]),
                  const SizedBox(height: 8),
                  _buildSectionHeader("This Course Includes:"),
                  _buildCourseIncludesList(),
                  const SizedBox(height: 8),
                  _buildSectionHeader("Requirements:"),
                  _buildBulletedList([
                    "You will need a copy of Adobe XD 2019 or above. A free trial can be downloaded from Adobe.",
                    "No previous design experience is needed.",
                    "No previous Adobe XD skills are needed.",
                  ]),
                  const SizedBox(height: 8),
                  _buildCurriculumList(),
                  const SizedBox(height: 8),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        title,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildChecklist(List<String> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: items
          .map((item) => ListTile(
                dense: true,
                contentPadding: EdgeInsets.zero,
                visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
                leading: const Icon(Icons.check),
                title: Text(item),
              ))
          .toList(),
    );
  }

  Widget _buildCourseIncludesList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildCourseIncludesItem(
            Icons.video_collection, "9.5 total hours on-demand video"),
        _buildCourseIncludesItem(Icons.folder, "Support Files"),
        _buildCourseIncludesItem(Icons.assignment, "17 Assignments"),
        _buildCourseIncludesItem(Icons.all_inclusive, "Full lifetime access"),
        _buildCourseIncludesItem(
            Icons.card_membership, "Access on mobile, desktop, and TV"),
        _buildCourseIncludesItem(Icons.school, "Certificate of Completion"),
      ],
    );
  }

  Widget _buildCourseIncludesItem(IconData icon, String item) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon,
              color: const Color.fromARGB(
                  255, 146, 146, 146)), // Light black color
          const SizedBox(width: 8),
          Flexible(
            child: Text(item),
          ),
        ],
      ),
    );
  }

  Widget _buildBulletedList(List<String> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: items
          .map((item) => Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.arrow_right),
                  const SizedBox(width: 8),
                  Expanded(child: Text(item)),
                ],
              ))
          .toList(),
    );
  }

  Widget _buildCurriculumList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Curriculum:",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        _buildCurriculumItem("•21 sections  •84 lectures  •9h 43m total"),
        ExpansionTile(
          title: _buildCurriculumItem(
              "Section 1- Getting started with drop down menu"),
          children: [
            _buildCurriculumItem("1:Getting started with your Adobe XD course"),
            _buildCurriculumItem("2:What Adobe XD is for?"),
            _buildCurriculumItem("3:How to install Adobe XD"),
          ],
        ),
        ExpansionTile(
          title: _buildCurriculumItem("Section 2- Wireframing Low Fidelity"),
          children: [
            _buildCurriculumItem("1:Introduction to wireframing"),
            _buildCurriculumItem("2:Choosing the right tools"),
            _buildCurriculumItem("3:Creating basic wireframes"),
            // Add more subsection items here
          ],
        ),
        ExpansionTile(
          title: _buildCurriculumItem("Section 3- Color, Font & Icons"),
          children: [
            _buildCurriculumItem("1:Understanding color theory"),
            _buildCurriculumItem("2:Choosing fonts for your design"),
            _buildCurriculumItem("3:Using icons effectively"),
            // Add more subsection items here
          ],
        ),
        ExpansionTile(
          title: _buildCurriculumItem("Section 4- Prototyping Level  - 01"),
          children: [
            _buildCurriculumItem("1:Introduction to interactive prototyping"),
            _buildCurriculumItem("2:Creating clickable prototypes"),
            _buildCurriculumItem("3:Adding animations to your prototypes"),
            // Add more subsection items here
          ],
        ),
        ExpansionTile(
          title: _buildCurriculumItem("Section 5- Animation"),
          children: [
            _buildCurriculumItem("1:Introduction to animation principles"),
            _buildCurriculumItem("2:Creating smooth transitions"),
            _buildCurriculumItem("3:Animating UI elements"),
            // Add more subsection items here
          ],
        ),
        // Add more curriculum sections as ExpansionTiles
      ],
    );
  }

  Widget _buildCurriculumItem(String item) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(width: 6),
          Flexible(
            child: Text(item),
          ),
        ],
      ),
    );
  }
}
