// import 'dart:math';

// import 'package:flutter/material.dart';
// import 'package:learn_o/screens/utiltiy/heading_text.dart';
// import 'package:learn_o/sigin/siginpage.dart';
// import 'package:liquid_swipe/liquid_swipe.dart';
// import 'package:sizer/sizer.dart';

// class ItemData {
//   final Color color;
//   final String image;
//   final String text1;
//   final String text2;
//   final String text3;

//   ItemData(this.color, this.image, this.text1, this.text2, this.text3);
// }

// class OnBordingScreen extends StatefulWidget {
//   const OnBordingScreen({Key? key}) : super(key: key);

//   @override
//   _WithBuilder createState() => _WithBuilder();
// }

// class _WithBuilder extends State<OnBordingScreen> {
//   int page = 0;
//   late LiquidController liquidController;
//   late UpdateType updateType;
//   bool skipButtonClicked = false;

//   List<ItemData> data = [
//     ItemData(
//       Colors.white,
//       "assets/walk/1.png",
//       "Learning became \nEasy",
//       "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Amet ut nec vitae gravida ullamcorper .",
//       "Sahdeep",
//     ),
//     ItemData(
//       Colors.white,
//       "assets/walk/2.png",
//       "Learning became \nEasy",
//       "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Amet ut nec vitae gravida ullamcorper .",
//       "Sahdeep",
//     ),
//     ItemData(
//       Colors.white,
//       "assets/walk/3.png",
//       "Learning became \nEasy",
//       "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Amet ut nec vitae gravida ullamcorper .",
//       "Sahdeep",
//     ),
//   ];

//   @override
//   void initState() {
//     liquidController = LiquidController();
//     super.initState();
//   }

//   Widget _buildDot(int index) {
//     double selectedness = Curves.easeOut.transform(
//       max(
//         0.0,
//         1.0 - ((page) - index).abs(),
//       ),
//     );
//     double zoom = 1.5 + (1.2 - 1.0) * selectedness;
//     Color dotColor =
//         index == page ? Colors.black87.withOpacity(0.7) : Colors.transparent;
//     Color borderColor = index == page ? Colors.transparent : Colors.grey;

//     return SizedBox(
//       width: 20.0,
//       child: Center(
//         child: Container(
//           decoration: BoxDecoration(
//             color: dotColor,
//             borderRadius: BorderRadius.circular(2.5),
//           ),
//           child: Container(
//             width: 6.0 * zoom,
//             height: 6.0 * zoom,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(2),
//               border: Border.all(color: borderColor),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: <Widget>[
//           LiquidSwipe.builder(
//             itemCount: data.length,
//             itemBuilder: (context, index) {
//               return Container(
//                 width: double.infinity,
//                 color: index == page ? Colors.white : Colors.blue,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   mainAxisSize: MainAxisSize.max,
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: <Widget>[
//                     Row(
//                       children: [
//                         myText(
//                           text: '    LearnO.',
//                           color: Colors.black87.withOpacity(0.7),
//                           size: 22,
//                           fontweight: FontWeight.bold,
//                           fontWeight: FontWeight.normal,
//                         ),
//                         const Spacer(),
//                         if (!skipButtonClicked)
//                           Align(
//                             alignment: Alignment.bottomRight,
//                             child: Padding(
//                               padding: const EdgeInsets.all(25.0),
//                               child: TextButton(
//                                 onPressed: () {
//                                   setState(() {
//                                     skipButtonClicked = true;
//                                   });
//                                   Navigator.push(
//                                     context,
//                                     MaterialPageRoute(
//                                       builder: (context) => SignInScreen(),
//                                     ),
//                                   );
//                                 },
//                                 style: TextButton.styleFrom(
//                                   backgroundColor:
//                                       Colors.white.withOpacity(0.01),
//                                   foregroundColor: Colors.black,
//                                 ),
//                                 child: myText(
//                                   text: 'Skip',
//                                   color: Colors.black45,
//                                   fontWeight: FontWeight.normal,
//                                 ),
//                               ),
//                             ),
//                           ),
//                       ],
//                     ),
//                     Image.asset(
//                       data[index].image,
//                       height: 300,
//                       fit: BoxFit.contain,
//                     ),
//                     Padding(
//                       padding: EdgeInsets.only(left: 10.w),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: <Widget>[
//                           myText(
//                             text: data[index].text1,
//                             fontweight: FontWeight.bold,
//                             textAlignment: TextAlign.start,
//                             size: 23,
//                             fontWeight: FontWeight.normal,
//                           ),
//                           SizedBox(
//                             width: 300,
//                             height: 8.h,
//                             child: myText(
//                               text: data[index].text2,
//                               maxline: 4,
//                               color: Colors.grey,
//                               textAlignment: TextAlign.start,
//                               fontweight: FontWeight.normal,
//                               fontWeight: FontWeight.normal,
//                             ),
//                           ),
//                           Row(
//                             children: List<Widget>.generate(
//                               data.length,
//                               _buildDot,
//                             ),
//                           ),
//                           SizedBox(
//                             height: 10.h,
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               );
//             },
//             onPageChangeCallback: skipButtonClicked ? null : pageChangeCallback,
//             slideIconWidget: Container(
//               padding: const EdgeInsets.all(3),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(20),
//                 border: Border.all(color: Colors.white),
//               ),
//               child: const Icon(
//                 Icons.arrow_forward_ios_rounded,
//                 color: Colors.white,
//                 size: 20,
//               ),
//             ),
//             liquidController: liquidController,
//             fullTransitionValue: 880,
//             enableSideReveal: true,
//             preferDragFromRevealedArea: true,
//             enableLoop: true,
//             ignoreUserGestureWhileAnimating: true,
//           ),
//         ],
//       ),
//     );
//   }

//   pageChangeCallback(int lpage) {
//     setState(() {
//       page = lpage;
//     });
//   }
// }

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:learn_o/sigin/siginpage.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

class ItemData {
  final Color color;
  final String image;
  final String text1;
  final String text2;
  final String text3;

  ItemData(this.color, this.image, this.text1, this.text2, this.text3);
}

class OnBordingScreen extends StatefulWidget {
  const OnBordingScreen({Key? key}) : super(key: key);

  @override
  _WithBuilder createState() => _WithBuilder();
}

class _WithBuilder extends State<OnBordingScreen> {
  int page = 0;
  late LiquidController liquidController;
  bool skipButtonClicked = false;

  List<ItemData> data = [
    ItemData(
      Colors.white,
      "assets/walk/1.png",
      "Learning became \nEasy",
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Amet ut nec vitae gravida ullamcorper .",
      "Sahdeep",
    ),
    ItemData(
      Colors.white,
      "assets/walk/2.png",
      "Learning became \nEasy",
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Amet ut nec vitae gravida ullamcorper .",
      "Sahdeep",
    ),
    ItemData(
      Colors.white,
      "assets/walk/3.png",
      "Learning became \nEasy",
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Amet ut nec vitae gravida ullamcorper .",
      "Sahdeep",
    ),
  ];

  @override
  void initState() {
    liquidController = LiquidController();
    super.initState();
  }

  Widget _buildDot(int index) {
    double selectedness = Curves.easeOut.transform(
      max(
        0.0,
        1.0 - ((page) - index).abs(),
      ),
    );
    double zoom = 1.5 + (1.2 - 1.0) * selectedness;
    Color dotColor =
        index == page ? Colors.black87.withOpacity(0.7) : Colors.transparent;
    Color borderColor = index == page ? Colors.transparent : Colors.grey;

    return SizedBox(
      width: 20.0,
      child: Center(
        child: Container(
          decoration: BoxDecoration(
            color: dotColor,
            borderRadius: BorderRadius.circular(2.5),
          ),
          child: Container(
            width: 6.0 * zoom,
            height: 6.0 * zoom,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2),
              border: Border.all(color: borderColor),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          LiquidSwipe.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              return Container(
                width: double.infinity,
                color: index == page ? Colors.white : Colors.blue,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Row(
                      children: [
                        const Text(
                          '    LearnO.',
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Spacer(),
                        if (!skipButtonClicked)
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Padding(
                              padding: const EdgeInsets.all(25.0),
                              child: TextButton(
                                onPressed: () {
                                  setState(() {
                                    skipButtonClicked = true;
                                  });
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => SignInScreen(),
                                    ),
                                  );
                                },
                                style: TextButton.styleFrom(
                                  backgroundColor:
                                      Colors.white.withOpacity(0.01),
                                  foregroundColor: Colors.black,
                                ),
                                child: const Text(
                                  'Skip',
                                  style: TextStyle(
                                    color: Colors.black45,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                    Image.asset(
                      data[index].image,
                      height: 300,
                      fit: BoxFit.contain,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            data[index].text1,
                            textAlign: TextAlign.start,
                            style: const TextStyle(
                              fontSize: 23,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            width: 300,
                            height: 8.h,
                            child: Text(
                              data[index].text2,
                              maxLines: 4,
                              style: const TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          Row(
                            children: List<Widget>.generate(
                              data.length,
                              _buildDot,
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
            onPageChangeCallback: skipButtonClicked ? null : pageChangeCallback,
            slideIconWidget: Container(
              padding: const EdgeInsets.all(3),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.white),
              ),
              child: const Icon(
                Icons.arrow_forward_ios_rounded,
                color: Colors.white,
                size: 20,
              ),
            ),
            liquidController: liquidController,
            fullTransitionValue: 880,
            enableSideReveal: true,
            preferDragFromRevealedArea: true,
            enableLoop: true,
            ignoreUserGestureWhileAnimating: true,
          ),
        ],
      ),
    );
  }

  pageChangeCallback(int lpage) {
    setState(() {
      page = lpage;
    });
  }
}
