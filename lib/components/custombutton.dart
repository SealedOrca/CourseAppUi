import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import 'package:sizer/sizer.dart';

Widget customButton(
    {required double width,
    double height = 45,
    double textSize = 16,
    required String text,
    bool? border = false,
    Callback? function,
    bool? borderRadius = false,
    // Color color=Colors.deepOrange,
    Color textColor = Colors.white}) {
  return Container(
    width: width,
    height: height,
    decoration: BoxDecoration(
      // color: color,
      gradient: const LinearGradient(colors: [
        Color.fromRGBO(68, 212, 109, 1),
        Color.fromRGBO(28, 172, 68, 1)
      ]),
      border: border == true
          ? Border.all(color: Colors.deepOrange, style: BorderStyle.solid)
          : null,
      borderRadius: borderRadius == false
          ? BorderRadius.circular(6)
          : BorderRadius.circular(30),
    ),
    child: ClipRRect(
      borderRadius: borderRadius == false
          ? BorderRadius.circular(6)
          : BorderRadius.circular(30),
      child: MaterialButton(
        onPressed: function,
        height: height,
        // color: color,
        child: Center(
            child: Text(
          text,
          style: TextStyle(
              color: textColor, fontSize: textSize, fontFamily: 'Poppins'),
        )),
      ),
    ),
  );
}

animatedButton(
    {required bool isLoading,
    required String text,
    var borderRadius = false,
    Callback? onTap}) {
  return AnimatedSwitcher(
    duration: const Duration(milliseconds: 300),
    child: isLoading
        ? const Center(
            child: CircularProgressIndicator(
              color: Colors.green,
            ),
          )
        : Center(
            child: customButton(
                width: 80.w,
                text: text,
                borderRadius: borderRadius,
                function: onTap),
          ),
    transitionBuilder: (child, animation) => ScaleTransition(
      scale: animation,
      child: child,
    ),
  );
}
