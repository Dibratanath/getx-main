import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/ui/controllers/completed_task_controller.dart';
import 'package:task_manager/ui/widgets/profile_summary_card.dart';
import 'package:task_manager/ui/widgets/task_item_card.dart';

class CompletedTasksScreen extends StatefulWidget {
  const CompletedTasksScreen({super.key});

  @override
  State<CompletedTasksScreen> createState() => _CompletedTasksScreenState();
}

class _CompletedTasksScreenState extends State<CompletedTasksScreen> {
  final CompletedTaskController _completedTaskController = Get.find<CompletedTaskController>();

  @override
  void initState() {
    super.initState();
    _completedTaskController.getCompletedTaskList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GetBuilder<CompletedTaskController>(
          builder: (completedTaskController) {
            return Column(
              children: [
                const ProfileSummaryCard(),
                Expanded(
                  child: Visibility(
                    visible: _completedTaskController.getCompletedTaskInProgress == false,
                    replacement: const Center(
                      child: CircularProgressIndicator(),
                    ),
                    child: RefreshIndicator(
                      onRefresh: _completedTaskController.getCompletedTaskList,
                      child: ListView.builder(
                        itemCount: _completedTaskController.taskListModel.taskList?.length ?? 0,
                        itemBuilder: (context, index) {
                          return TaskItemCard(
                              task: _completedTaskController.taskListModel.taskList![index],
                              onStatusChange: () {
                                _completedTaskController.getCompletedTaskList();
                              },
                              showProgress: (inCompleted) {
                                _completedTaskController.getCompletedTaskInProgress == inCompleted;
                              });
                        },
                      ),
                    ),
                  ),
                ),
              ],
            );
          }
        ),
      ),
    );
  }
}
