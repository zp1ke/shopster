import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInScreen extends StatelessWidget {
  static const path = '/sign-in';

  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('TODO sign-in screen'),
      ),
    );
  }

  static GetPage route() {
    return GetPage(
      name: path,
      page: () => SignInScreen(),
    );
  }
}
