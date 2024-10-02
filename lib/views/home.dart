import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/route_name.dart';
import '../controllers/home_controller.dart';
import '../controllers/register_controller.dart';
import '../models/checklist.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: HomeController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
            title: const Text("TODO APP"),
            actions: [
              IconButton(
                onPressed: () => Get.toNamed(RouteName.addChecklist),
                icon: const Icon(Icons.add)
              )
            ],
          ),
          body: _body(controller),
        );
      },
    );
  }

  Widget _body(HomeController controller) {
    List<Widget> results = [
      ListView.separated(
        itemCount: controller.checklist.length,
        separatorBuilder: (context, index) => const SizedBox(height: 12,),
        itemBuilder: (context, index) {
          Checklist checklist = controller.checklist[index];

          return Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey)
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      onPressed: () => controller.deleteOnPressed(checklist.id),
                      icon: const Icon(Icons.delete_forever_outlined)
                    ),
                  ],
                ),
                const SizedBox(height: 6,),
                Text("Name : ${checklist.name}"),
                Text("Status : ${checklist.checklistCompletionStatus}"),
                const SizedBox(height: 6,),
                Text("Items : ${checklist.name}"),
                if (checklist.items.isNotEmpty)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: checklist.items.map((item) {
                      return Container(
                        alignment: Alignment.topLeft,
                        width: double.infinity,
                        padding: const EdgeInsets.all(8),
                        margin: const EdgeInsets.only(bottom: 6),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.grey)
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Name : ${item.name}"),
                            Text("Status : ${item.itemCompletionStatus}"),
                          ],
                        ),
                      );
                    }).toList(),
                  )
              ],
            ),
          );
        },
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
