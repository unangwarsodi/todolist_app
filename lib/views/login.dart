import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: LoginController(),
      builder: (controller) {
        return Scaffold(
          body: _body(controller),
        );
      },
    );
  }

  Widget _body(LoginController controller) {
    List<Widget> results = [
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Login",
            style: TextStyle(
              fontSize: 32
            ),
          ),
          const SizedBox(height: 16,),
          TextField(
            controller: controller.usernameController,
            decoration: const InputDecoration(
              hintText: "Username"
            ),
          ),
          const SizedBox(height: 20,),
          TextField(
            controller: controller.passwordController,
            decoration: const InputDecoration(
              hintText: "Password"
            ),
          ),
          const SizedBox(height: 40,),
          ElevatedButton(
            style: TextButton.styleFrom(
              padding: EdgeInsets.zero,
              foregroundColor: Colors.white,
              backgroundColor: Colors.blue,
              shadowColor: Colors.transparent,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              minimumSize: const Size(double.infinity, 50)
            ),
            onPressed: controller.onPressed,
            child: const Text('LOGIN'),
          ),
          const SizedBox(height: 16,),
          GestureDetector(
            onTap: controller.onTapRegister,
            child: const Text(
              "Register",
              style: TextStyle(
                fontSize: 14,
                color: Colors.blue,
                decoration: TextDecoration.underline,
              ),
            ),
          )
        ],
      )
    ];

    if (controller.isLoading) {
      results.add(const Center(child: CircularProgressIndicator()));
    }

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Center(
        child: Stack(
          children: results,
        ),
      ),
    );
  }
}
