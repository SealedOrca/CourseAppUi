import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

labelCustomField(
    {required String labelText, var controller, required int maxLines}) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
    child: Container(
      height: 8.h,
      width: double.maxFinite,
      padding: EdgeInsets.only(left: 8.w),
      alignment: Alignment.topLeft,
      decoration: const BoxDecoration(
        color: Color.fromRGBO(244, 244, 244, 1),
        // color: Colors.grey,
        border: Border(
          bottom: BorderSide(
            color: Colors.green,
            width: 1.5,
          ),
        ),
      ),
      child: TextFormField(
        controller: controller,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
        decoration: InputDecoration(
            // hintText: "Alex Carey",
            labelText: labelText,
            labelStyle: const TextStyle(color: Color.fromRGBO(79, 79, 81, 1)),
            border: InputBorder.none),
      ),
    ),
  );
}

paymentCustomField(
    {required String hintText,
    var controller,
    double? width,
    var keyboardType = TextInputType.number}) {
  return Container(
    width: width ?? double.maxFinite,
    decoration: BoxDecoration(
      color: const Color.fromRGBO(241, 241, 241, 1),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 1,
          blurRadius: 5,
          offset: const Offset(1, -2),
        ),
      ],
      borderRadius: BorderRadius.circular(8),
    ),
    child: TextField(
      keyboardType: keyboardType,
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: hintText,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
    ),
  );
}

customTextField({
  required String hintText,
  var controller,
  Icon? prefixIcon,
  String? prefixText,
  bool? prefixTrue = false,
  bool? suffix = false,
  bool isPass = false,
  TextInputType? keyBoardType = TextInputType.text,
  int? maxLine,
  String? validatorText,
  required bool hasSuffixIcon,
  required IconButton suffixIcon,
}) {
  return SizedBox(
    height: 7.h,
    child: TextFormField(
      controller: controller,
      obscureText: isPass,
      keyboardType: keyBoardType,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return validatorText;
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: prefixIcon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(
            color: Colors.transparent,
          ),
        ),
        hintStyle: const TextStyle(
          color: Colors.grey,
          fontWeight: FontWeight.w400,
        ),
        filled: true,
        fillColor: Colors.white,
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(color: Colors.transparent)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(color: Colors.transparent)),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(
            color: Colors.transparent,
          ),
        ),
      ),
    ),
  );
}

class MyTextField extends StatelessWidget {
  final hintText;
  final hintSize;
  MyTextField({required this.hintText, this.hintSize});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  readOnly: true,
                  decoration: InputDecoration(
                    hintText: hintText,
                    fillColor: Colors.white,
                    hintStyle: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.grey.withOpacity(0.9)),
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(30),
                          bottomLeft: Radius.circular(30)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.grey.withOpacity(0.9)),
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(30),
                          bottomLeft: Radius.circular(30)),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: Get.width * 0.53,
                child: TextFormField(
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.grey.withOpacity(0.9)),
                      borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(30),
                          bottomRight: Radius.circular(30)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.grey.withOpacity(0.9)),
                      borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(30),
                          bottomRight: Radius.circular(30)),
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
