import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/add_checklist_controller.dart';

class AddChecklistPage extends StatelessWidget {
  const AddChecklistPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: AddChecklistController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
            title: const Text("Create Checklist"),
          ),
          body: _body(controller),
        );
      },
    );
  }

  Widget _body(AddChecklistController controller) {
    List<Widget> results = [
      Column(
        children: [
          TextField(
            controller: controller.nameController,
            decoration: const InputDecoration(
              hintText: "Name"
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
            child: const Text('CREATE'),
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
