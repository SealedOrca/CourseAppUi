import 'package:flutter/material.dart';
import 'package:learn_o/screens/utiltiy/btmnavbae.dart';
import 'package:sizer/sizer.dart';

import '../components/custombutton.dart';
import 'forgot.dart';
import 'signup.dart';

class SignInScreen extends StatefulWidget {
  SignInScreen({Key? key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
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
        height: double.maxFinite,
        width: double.maxFinite,
        decoration: const BoxDecoration(
          color: Color.fromRGBO(28, 56, 139, 1), // Dark Light Blue
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 8.h),
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
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Email',
                          prefixIcon:
                              const Icon(Icons.email, color: Colors.grey),
                          filled: true,
                          fillColor: Colors.white, // White background color
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.circular(30.0), // Rounded corners
                            borderSide: BorderSide.none, // No borders
                          ),
                        ),
                        controller: _emailController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter email';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 3.h),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: "Password",
                          prefixIcon:
                              const Icon(Icons.lock, color: Colors.grey),
                          filled: true,
                          fillColor: Colors.white, // White background color
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.circular(30.0), // Rounded corners
                            borderSide: BorderSide.none, // No borders
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
                      SizedBox(height: 1.h),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ForgetScreen(),
                            ),
                          );
                        },
                        child: const Align(
                          alignment: Alignment.topRight,
                          child: Text(
                            'Forget Password ?  ',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.normal,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 2.h),
                      Center(
                        child: customButton(
                          width: 80.w,
                          borderRadius: true,
                          function: () async {
                            FocusManager.instance.primaryFocus?.unfocus();
                            if (_formKey.currentState!.validate()) {
                              // Perform your authentication logic here
                              // For example, you can call a method to handle login

                              // Navigate to HomeScreen
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const MyBottomBar(),
                                ),
                              );
                            }
                          },
                          text: 'Sign in',
                        ),
                      ),
                      SizedBox(height: 2.h),
                      const Row(
                        children: [
                          Expanded(
                            child: Divider(
                              color: Colors.grey,
                              height: 1,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12),
                            child: Text(
                              'sign up',
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 13,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Divider(
                              color: Colors.grey,
                              height: 1,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 2.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              // Handle Google login here
                            },
                            child: Image.asset(
                              'assets/g.png', // Replace with your Google logo image path
                              width: 30,
                              height: 30,
                            ),
                          ),
                          SizedBox(width: 10),
                          GestureDetector(
                            onTap: () {
                              // Handle Facebook login here
                            },
                            child: Image.asset(
                              'assets/f.png', // Replace with your Facebook logo image path
                              width: 30,
                              height: 30,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Not registered yet?   ',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 13,
                              color: Colors.white,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const SignUpScreen(),
                                ),
                              );
                            },
                            child: const Text(
                              'Create Account',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 13,
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
}

void main() {
  runApp(MaterialApp(
    home: SignInScreen(),
  ));
}
