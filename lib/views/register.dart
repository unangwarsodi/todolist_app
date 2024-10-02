import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/register_controller.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: RegisterController(),
      builder: (controller) {
        return Scaffold(
          body: _body(controller),
        );
      },
    );
  }

  Widget _body(RegisterController controller) {
    List<Widget> results = [
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Register",
            style: TextStyle(
              fontSize: 32
            ),
          ),
          const SizedBox(height: 16,),
          TextField(
            controller: controller.emailController,
            decoration: const InputDecoration(
                hintText: "Username"
            ),
          ),
          const SizedBox(height: 20,),
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
            child: const Text('REGISTER'),
          ),
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
