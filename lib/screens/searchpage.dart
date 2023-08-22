import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(const CourseSearchApp());
}

class CourseSearchApp extends StatelessWidget {
  const CourseSearchApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Course Search App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CourseSearchPage(),
    );
  }
}

class CourseSearchPage extends StatefulWidget {
  const CourseSearchPage({Key? key}) : super(key: key);

  @override
  _CourseSearchPageState createState() => _CourseSearchPageState();
}

class _CourseSearchPageState extends State<CourseSearchPage> {
  final TextEditingController _searchController = TextEditingController();
  List<Course> _searchResults = [];
  String _selectedCategory = '';

  final List<String> categories = [
    'All',
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

  Future<void> _performSearch(String query) async {
    final response = await http.get(
        Uri.parse('https://mocki.io/v1/1d526690-7270-4ae9-9977-8c886ca83656'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      setState(() {
        _searchResults =
            data.map((courseJson) => Course.fromJson(courseJson)).toList();
      });
    } else {
      // Handle error
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Course Search App'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: TextField(
                      controller: _searchController,
                      decoration: InputDecoration(
                        hintText: 'Search for courses...',
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.all(12),
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.search),
                          onPressed: () {
                            _performSearch(_searchController.text);
                          },
                        ),
                      ),
                    ),
                  ),
                ),
                PopupMenuButton<String>(
                  icon: const Icon(Icons.filter_list),
                  onSelected: (category) {
                    setState(() {
                      _selectedCategory = category;
                    });
                  },
                  itemBuilder: (BuildContext context) {
                    return categories.map((String category) {
                      return PopupMenuItem<String>(
                        value: category,
                        child: Text(category),
                      );
                    }).toList();
                  },
                ),
              ],
            ),
          ),
          if (_selectedCategory.isNotEmpty)
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                'Selected Category: $_selectedCategory',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          Expanded(
            child: ListView.builder(
              itemCount: _searchResults.length,
              itemBuilder: (context, index) {
                return CourseCard(course: _searchResults[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class Course {
  final String title;
  final String instructor;
  final String category;

  Course(
      {required this.title, required this.instructor, required this.category});

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      title: json['title'],
      instructor: json['instructor'],
      category: json['category'],
    );
  }
}

class CourseCard extends StatelessWidget {
  final Course course;

  const CourseCard({Key? key, required this.course}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        title: Text(
          course.title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(course.instructor),
        trailing: Chip(
          label: Text(
            course.category,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.blue,
        ),
      ),
    );
  }
}
