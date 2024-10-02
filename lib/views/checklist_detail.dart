import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/route_name.dart';
import '../controllers/checklist_detail_controller.dart';
import '../models/checklist.dart';
import '../models/item.dart';

class ChecklistDetailPage extends StatelessWidget {
  const ChecklistDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: ChecklistDetailController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
            title: const Text("Checklist Detail"),
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

  Widget _body(ChecklistDetailController controller) {
    List<Widget> results = [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Name : ${controller.checklist.name}"),
              Text("Status : ${controller.checklist.checklistCompletionStatus}"),
              const Text("Items :"),
              const SizedBox(height: 16,)
            ],
          ),
          Expanded(
            child: ListView.separated(
              itemCount: controller.itemsList.length,
              separatorBuilder: (context, index) => const SizedBox(height: 12,),
              itemBuilder: (context, index) {
                Item item = controller.itemsList[index];
            
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
                            onPressed: () => controller.deleteOnPressed(item.id),
                            icon: const Icon(Icons.delete_forever_outlined)
                          ),
                        ],
                      ),
                      const SizedBox(height: 6,),
                      Text("Name : ${item.name}"),
                      Text("Status : ${item.itemCompletionStatus}"),
                    ],
                  ),
                );
              },
            ),
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
