import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_o/screens/utiltiy/heading_text.dart';
import 'package:learn_o/sigin/siginpage.dart';
import 'package:sizer/sizer.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _fNameController = TextEditingController();
  final TextEditingController _lNameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();

  var formKey = GlobalKey<FormState>();
  bool _isPasswordHidden = true;

  void _togglePasswordVisibility() {
    setState(() {
      _isPasswordHidden = !_isPasswordHidden;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(28, 56, 139, 1), // Dark Light Blue
              Color.fromRGBO(28, 88, 242, 1),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10.h),
              Stack(
                children: [
                  Image.asset('assets/g1.png'),
                  Positioned(
                    top: 2.h,
                    left: 30.w,
                    child: Image.asset('assets/name.png'),
                  ),
                  Positioned(
                    top: 7.h,
                    left: 23.w,
                    child: Image.asset('assets/s1.png'),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 9.w, vertical: 2.h),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      customTextField(
                        hintText: 'Email',
                        controller: _emailController,
                        prefixIcon: const Icon(
                          Icons.email,
                          color: Colors.grey,
                        ),
                        validatorText: 'Please enter email',
                      ),
                      SizedBox(height: 2.h),
                      customTextField(
                        hintText: 'First Name',
                        controller: _fNameController,
                        prefixIcon: const Icon(
                          Icons.person,
                          color: Colors.grey,
                        ),
                        validatorText: 'Please enter your name',
                      ),
                      SizedBox(height: 2.h),
                      customTextField(
                        hintText: 'Last Name',
                        controller: _lNameController,
                        prefixIcon: const Icon(
                          Icons.person,
                          color: Colors.grey,
                        ),
                        validatorText: 'Please enter your last name',
                      ),
                      SizedBox(height: 2.h),
                      customTextField(
                        hintText: 'City',
                        controller: _cityController,
                        prefixIcon: const Icon(
                          Icons.location_city_rounded,
                          color: Colors.grey,
                        ),
                        validatorText: 'Please enter city',
                      ),
                      SizedBox(height: 2.h),
                      customTextField(
                        hintText: 'Address',
                        controller: _addressController,
                        prefixIcon: const Icon(
                          Icons.location_on,
                          color: Colors.grey,
                        ),
                        validatorText: 'Please enter your address',
                      ),
                      SizedBox(height: 2.h),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: "Password",
                          prefixIcon: const Icon(
                            Icons.lock,
                            color: Colors.grey,
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _isPasswordHidden
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.grey,
                            ),
                            onPressed: _togglePasswordVisibility,
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter password';
                          }
                          return null;
                        },
                        controller: _passwordController,
                        obscureText: _isPasswordHidden,
                      ),
                      SizedBox(height: 4.h),
                      animatedButton(
                        isLoading: false, // Replace with your loading state
                        text: 'Sign up',
                        borderRadius: true,
                        onTap: () async {
                          if (formKey.currentState!.validate()) {
                            FocusManager.instance.primaryFocus?.unfocus();
                            // Perform your signup logic here
                          }
                        },
                      ),
                      SizedBox(height: 2.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Already have an account? ',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 13,
                              color: Colors.white,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.offAll(SignInScreen());
                            },
                            child: const Text(
                              'Sign in',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget customTextField({
    required String hintText,
    required TextEditingController controller,
    required Icon prefixIcon,
    required String validatorText,
  }) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: prefixIcon,
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return validatorText;
        }
        return null;
      },
      controller: controller,
    );
  }

  Widget animatedButton({
    required bool isLoading,
    required String text,
    required bool borderRadius,
    required Future<Null> Function() onTap,
  }) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white, // Button color
        shape: borderRadius
            ? RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))
            : null,
        padding: const EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 130,
        ),
      ),
      child: isLoading
          ? const CircularProgressIndicator()
          : Text(
              text,
              style: const TextStyle(fontSize: 16),
            ),
    );
  }
}
