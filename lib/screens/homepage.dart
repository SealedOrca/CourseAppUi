import 'package:flutter/material.dart';
import 'package:learn_o/screens/categorypage.dart';
import 'package:learn_o/screens/courses.dart';
import 'package:learn_o/screens/searchpage.dart';
import 'package:learn_o/screens/shoopingcartpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Row(
                      children: [
                        Text(
                          'Learn0',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    IconButton(
                      icon: const Icon(Icons.shopping_cart),
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
                const SizedBox(height: 20),
                const Text(
                  "What's New to Learn?",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                const SearchBar(),
                const SizedBox(height: 20),
                CategorySection(),
                const SizedBox(height: 20),
                const Text(
                  'Some Recommendations for You',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                const CourseSection(title: 'Recommended'),
                const SizedBox(height: 20),
                const CourseSection(title: 'Popular Sources'),
                const SizedBox(height: 20),
                // CustomBottomNavBar(
                //   currentPage: 0,
                //   onIconPressed: (int value) {},
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const CourseSearchPage(),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: const Color.fromARGB(255, 85, 152, 207),
        ),
        child: TextField(
          decoration: InputDecoration(
            hintText: 'Search for courses...',
            border: InputBorder.none,
            suffixIcon: IconButton(
              icon: const Icon(Icons.filter_list),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const CourseSearchPage()),
                );
              },
            ),
            prefixIcon: const Icon(Icons.search),
          ),
        ),
      ),
    );
  }
}

class CategorySection extends StatefulWidget {
  final List<String> categories = [
    'Design',
    'Development',
    'Business',
    'Finance & Accounting',
    'IT & Software',
    'Marketing',
    'Lifestyle',
    'Photography & Video',
    'Health & Fitness',
    'Music',
    'Teaching & Academics',
  ];

  CategorySection({Key? key}) : super(key: key);

  @override
  _CategorySectionState createState() => _CategorySectionState();
}

class _CategorySectionState extends State<CategorySection> {
  bool showAllCategories = false;

  @override
  Widget build(BuildContext context) {
    List<String> displayedCategories = showAllCategories
        ? widget.categories
        : widget.categories.take(5).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Categories',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: displayedCategories
                .map((category) => GestureDetector(
                      onTap: () {
                        // Navigate to category page
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                CategoryScreen(category: category),
                          ),
                        );
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(200),
                          gradient: const LinearGradient(
                            colors: [
                              Color.fromRGBO(71, 103, 217, 1),
                              Color.fromRGBO(33, 195, 79, 1),
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                        ),
                        padding: const EdgeInsets.all(3), // Adjust the padding
                        margin: const EdgeInsets.only(right: 10),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white, // White background
                            borderRadius: BorderRadius.circular(30),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          child: Text(
                            category,
                            style: const TextStyle(
                              color: Colors.black, // Text color
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ))
                .toList(),
          ),
        ),
        if (!showAllCategories)
          TextButton(
            onPressed: () {
              setState(() {
                showAllCategories = true;
              });
            },
            child: const Text('See All'),
          ),
        if (showAllCategories)
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: widget.categories
                  .map((category) => GestureDetector(
                        onTap: () {
                          // Navigate to category page
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  CategoryScreen(category: category),
                            ),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(400),
                            gradient: const LinearGradient(
                              colors: [
                                Color.fromRGBO(71, 103, 217, 1),
                                Color.fromRGBO(33, 195, 79, 1),
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                          ),
                          padding:
                              const EdgeInsets.all(8), // Adjust the padding
                          margin: const EdgeInsets.only(right: 10),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white, // White background
                              borderRadius: BorderRadius.circular(30),
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 8,
                            ),
                            child: Text(
                              category,
                              style: const TextStyle(
                                color: Colors.black, // Text color
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ))
                  .toList(),
            ),
          ),
        if (showAllCategories)
          TextButton(
            onPressed: () {
              setState(() {
                showAllCategories = false;
              });
            },
            child: const Text('Collapse'),
          ),
      ],
    );
  }
}

class CourseSection extends StatelessWidget {
  final String title;

  const CourseSection({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              CourseTile(
                imagePath: 'assets/abd.png',
                title: 'Automate the Boring Stuff with Python Programming',
                author: 'AI Sweigart',
                stars: '4.6',
                userCount: '(106,929)',
                price: '\$99.98',
              ),
              CourseTile(
                imagePath: 'assets/abc.png',
                title: 'Get started with Figma: The Ultimate Guide to UX',
                author: 'David Travis',
                stars: '5.0',
                userCount: '(106,929)',
                price: '\$50.99',
              ),
              CourseTile(
                imagePath: 'assets/abc3.png',
                title: 'Automate the Boring Stuff with Python Programming',
                author: 'AI Sweigart',
                stars: '4.6',
                userCount: '(106,929)',
                price: '\$99.98',
              ),
              CourseTile(
                imagePath: 'assets/ab.png',
                title: 'Get started with Figma: The Ultimate Guide to UX',
                author: 'David Travis',
                stars: '5.0',
                userCount: '(106,929)',
                price: '\$50.99',
              ),
              // Add more course tiles
            ],
          ),
        ),
      ],
    );
  }
}

class CourseTile extends StatelessWidget {
  final String imagePath;
  final String title;
  final String author;
  final String stars;
  final String userCount;
  final String price;

  const CourseTile({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.author,
    required this.stars,
    required this.userCount,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const CourseScreen1()),
        );
      },
      child: Container(
        padding: EdgeInsets.only(
          bottom: 10,
          right: 10,
        ),
        margin: const EdgeInsets.only(right: 20),
        width: 230,
        // Adjust the width to maintain aspect ratio
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    child: Image.asset(
                      imagePath,
                      width: 230, // Adjust the width to maintain aspect ratio
                      height: 130,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 8), // Add some spacing
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(author),
                        const SizedBox(height: 4), // Add some spacing
                        Row(
                          children: [
                            const Icon(Icons.star,
                                color: Colors.yellow, size: 16),
                            const SizedBox(width: 4),
                            Text(
                              stars,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16, // Adjust the font size as needed
                              ),
                            ),
                            const SizedBox(width: 6),
                            Text(
                              userCount,
                              style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 16, // Adjust the font size as needed
                              ),
                            ),
                          ],
                        ),
                        Text(price),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                height: 10,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.white.withOpacity(0.1),
                      Colors.transparent,
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
