import 'package:flutter/material.dart';
import 'package:learn_o/screens/homepage.dart';
import 'package:video_player/video_player.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:chewie/chewie.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CourseDetailsScreen(),
    );
  }
}

class CourseDetailsScreen extends StatefulWidget {
  const CourseDetailsScreen({super.key});

  @override
  _CourseDetailsScreenState createState() => _CourseDetailsScreenState();
}

class _CourseDetailsScreenState extends State<CourseDetailsScreen> {
  final String videoUrl =
      'https://assets.mixkit.co/videos/preview/mixkit-spinning-around-the-earth-29351-large.mp4'; // Replace with your video URL
  late VideoPlayerController _controller;
  ChewieController? _chewieController; // Make it nullable

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(videoUrl)
      ..initialize().then((_) {
        _chewieController = ChewieController(
          videoPlayerController: _controller,
          autoPlay: false,
          looping: true,
          allowFullScreen: true,
          allowMuting: true,
          showControls: true,
          placeholder: const Center(child: CircularProgressIndicator()),
        );
        setState(() {}); // Refresh the state to update Chewie widget
      });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    _chewieController?.dispose(); // Dispose only if initialized
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => const BottomAppBar()),
            // );
          },
        ),
        title: const Text("Course Details"),
        actions: [
          CircularPercentIndicator(
            radius: 20.0,
            lineWidth: 6.0,
            percent: 0.02, // Adjust the percentage value
            center: const Text(
              "2/35",
              style:
                  TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
            ),
            backgroundColor: Colors.white,
            progressColor: Colors.green,
          ),
          const SizedBox(width: 16.0),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (_chewieController != null)
              AspectRatio(
                aspectRatio: 16 / 9, // Set your desired aspect ratio
                child: Chewie(controller: _chewieController!),
              ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Figma UIUX Design Essentials",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "By Daniel Walter",
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(height: 16),
                  DefaultTabController(
                    length: 2,
                    child: Column(
                      children: [
                        TabBar(
                          indicatorColor: Colors.green,
                          labelColor: Colors.black,
                          unselectedLabelColor: Colors.grey,
                          tabs: [
                            Tab(text: "Lectures"),
                            Tab(text: "More"),
                          ],
                        ),
                        SizedBox(height: 16),
                        SizedBox(
                          height: 400, // Adjust the height as needed
                          child: TabBarView(
                            children: [
                              LectureSectionWidget(),
                              MoreSectionWidget(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CourseDetailScreen extends StatelessWidget {
  const CourseDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LectureSectionWidget(),
          MoreSectionWidget(),
        ],
      ),
    );
  }
}

class DropdownSection extends StatefulWidget {
  final String title;
  final String subheading;
  final List<String> items;

  const DropdownSection({
    required this.title,
    required this.subheading,
    required this.items,
    Key? key,
  }) : super(key: key);

  @override
  _DropdownSectionState createState() => _DropdownSectionState();
}

class _DropdownSectionState extends State<DropdownSection> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              _expanded = !_expanded;
            });
          },
          child: Row(
            children: [
              Text(
                widget.title,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(width: 8),
              Icon(
                _expanded ? Icons.expand_less : Icons.expand_more,
                size: 20,
              ),
            ],
          ),
        ),
        if (_expanded)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),
              Text(
                widget.subheading,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 8),
              for (int i = 0; i < widget.items.length; i++)
                Padding(
                  padding:
                      const EdgeInsets.only(left: 24, right: 16, bottom: 8),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${i + 1}. ',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Expanded(
                        child: Text(
                          widget.items[i],
                          style: const TextStyle(fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                ),
              const SizedBox(height: 16),
            ],
          ),
      ],
    );
  }
}

class LectureSectionWidget extends StatelessWidget {
  const LectureSectionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitle("Lectures"),
        SizedBox(height: 16),
        DropdownSection(
          title: "Section 1- Getting started",
          subheading: "Lecture List",
          items: [
            "Getting started with your Adobe XD course",
            "What Adobe XD is for?",
            "How to install Adobe XD",
            "What Adobe XD is for?",
            "How to install Adobe XD",
            "How to install Adobe XD",
          ],
        ),
        DropdownSection(
          title: "Section 2- Wireframing Low Fidelity",
          subheading: "Lecture List",
          items: [
            "2.1. Introduction to wireframing",
            "2.2. Wireframing tools and techniques",
            "2.3. Creating low-fidelity wireframes",
            // Add more lectures
          ],
        ),
        DropdownSection(
          title: "Section 3- Color, Font & Icons",
          subheading: "Lecture List",
          items: [
            "3.1. Understanding color theory",
            "3.2. Choosing fonts for your design",
            "3.3. Incorporating icons into your UI",
            // Add more lectures
          ],
        ),
        DropdownSection(
          title: "Section 4- Prototyping Level - 01",
          subheading: "Lecture List",
          items: [
            "4.1. Introduction to interactive prototyping",
            "4.2. Creating clickable prototypes",
            "4.3. Testing and iterating your prototypes",
            // Add more lectures
          ],
        ),
        DropdownSection(
          title: "Section 5- Animation",
          subheading: "Lecture List",
          items: [
            "5.1. Introduction to animation in UI design",
            "5.2. Adding motion to your designs",
            "5.3. Creating engaging user interactions",
            // Add more lectures
          ],
        ),
      ],
    );
  }
}

class MoreSectionWidget extends StatelessWidget {
  const MoreSectionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitle("About this course"),
        SizedBox(height: 16),
        DropdownSection(
          title: "About this course",
          subheading: "Course Overview",
          items: [
            "This course is designed for beginners who want to learn UIUX from scratch.",
            "It covers fundamental concepts, including wireframing, interactive prototyping, and building full mobile apps.",
          ],
        ),
        DropdownSection(
          title: "What you will learn",
          subheading: "Course Details",
          items: [
            "Become a UX designer",
            "Earn money from your UIUX skills",
            "Build & test full website designs",
            "Work with fonts & colors",
            "Test on mobile phones",
            "93 well-structured lectures with step-by-step content",
            "Design websites & mobile apps",
            "Downloadable exercise files",
          ],
        ),
      ],
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle(this.title, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 8, left: 16),
      child: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      ),
    );
  }
}
