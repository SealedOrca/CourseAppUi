import 'package:get/get.dart';

class AuthController extends GetxController {
  RxBool passHide = true.obs;

  void togglePasswordVisibility() {
    passHide.value = !passHide.value;
  }

  Future<void> signUp(String email, String password) async {
    try {
      // Perform user registration logic here (e.g., using FirebaseAuth)
      // Replace this with your actual authentication code

      // Simulate a delay for demonstration purposes
      await Future.delayed(const Duration(seconds: 2));

      // After successful registration, you can navigate to another screen
      Get.offAllNamed('/home'); // Replace '/home' with your desired route
    } catch (error) {
      // Handle any registration errors here
      print('Error during registration: $error');
      Get.snackbar('Error', 'Registration failed. Please try again.');
    }
  }
}
