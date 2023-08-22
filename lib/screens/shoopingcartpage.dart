import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CartScreen(),
    );
  }
}

class CartController extends GetxController {
  final cartItems = <CartItem>[].obs;

  void removeFromCart(CartItem item) {
    cartItems.remove(item);
    appToast(msg: 'Removed from the cart', color: Colors.red);
  }
}

class CartScreen extends StatelessWidget {
  final _cartController = Get.put(CartController());

  CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarCart(text: 'Cart'),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
          child: SingleChildScrollView(
            child: Obx(() {
              if (_cartController.cartItems.isEmpty) {
                return Center(child: myText(text: 'Cart is empty'));
              } else {
                return Column(
                  children: [
                    SizedBox(height: 2.h),
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: _cartController.cartItems.length,
                      itemBuilder: (BuildContext context, int index) {
                        final cartItem = _cartController.cartItems[index];
                        return Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: 9.h,
                                  width: 26.w,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    image: const DecorationImage(
                                      image:
                                          AssetImage('assets/images/pc1.jpg'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 3.w),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    myText(
                                      text: cartItem.name,
                                      size: 12.sp,
                                    ),
                                    myText(
                                      text: 'Daniel Walter',
                                      size: 14,
                                    ),
                                    Row(
                                      children: [
                                        myText(
                                          text: '5.0',
                                          color: const Color.fromRGBO(
                                              222, 146, 68, 1),
                                          size: 9,
                                        ),
                                        Row(
                                          children: List.generate(
                                            5,
                                            (index) => const Icon(
                                              Icons.star,
                                              color: Colors.orangeAccent,
                                              size: 15,
                                            ),
                                          ),
                                        ),
                                        myText(
                                          text: ' (106,929)',
                                          size: 14,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ],
                                    ),
                                    myText(
                                      text: '\$ ${cartItem.price}',
                                      size: 12,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ],
                                ),
                                const Spacer(),
                                GestureDetector(
                                  onTap: () {
                                    _cartController.removeFromCart(cartItem);
                                  },
                                  child: const Icon(Icons.delete),
                                ),
                              ],
                            ),
                            SizedBox(height: 1.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                myText(
                                  text: 'Add to wish list',
                                  size: 11,
                                  fontWeight: FontWeight.w400,
                                  color: const Color.fromRGBO(20, 81, 238, 1),
                                ),
                                SizedBox(width: 8.w),
                                myText(
                                  text: 'Remove',
                                  color: const Color.fromRGBO(20, 81, 238, 1),
                                  size: 11,
                                  fontWeight: FontWeight.w400,
                                ),
                              ],
                            ),
                            SizedBox(height: 2.h),
                          ],
                        );
                      },
                    ),
                    SizedBox(height: 2.h),
                    Center(
                      child: customButton(
                        width: 80.w,
                        function: () {
                          Get.to(const PaymentScreen());
                        },
                        text: 'Buy now',
                      ),
                    ),
                  ],
                );
              }
            }),
          ),
        ),
      ),
    );
  }
}

class CartItem {
  String name;
  double price;

  CartItem({required this.name, required this.price});
}

Widget customButton(
    {required double width,
    required Function() function,
    required String text}) {
  return ElevatedButton(
    onPressed: function,
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.green,
      minimumSize: Size(width, 40),
    ),
    child: Text(text),
  );
}

void appToast({required String msg, required MaterialColor color}) {
  // Implement your toast functionality here
}

PreferredSizeWidget appBarCart({required String text}) {
  return AppBar(
    title: Text(text),
  );
}

Widget myText({
  required String text,
  double size = 14,
  Color color = Colors.black,
  FontWeight fontWeight = FontWeight.normal,
}) {
  return Text(
    text,
    style: TextStyle(
      fontSize: size,
      color: color,
      fontWeight: fontWeight,
    ),
  );
}

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment'),
      ),
      body: const Center(
        child: Text('Payment Screen'),
      ),
    );
  }
}
