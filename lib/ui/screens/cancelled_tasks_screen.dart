import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/ui/controllers/cancelled_task_controller.dart';
import 'package:task_manager/ui/widgets/profile_summary_card.dart';
import 'package:task_manager/ui/widgets/task_item_card.dart';

class CancelledTasksScreen extends StatefulWidget {
  const CancelledTasksScreen({super.key});

  @override
  State<CancelledTasksScreen> createState() => _CancelledTasksScreenState();
}

class _CancelledTasksScreenState extends State<CancelledTasksScreen> {
  final CancelledTaskController _cancelledTaskController = Get.find<CancelledTaskController>();

  @override
  void initState() {
    super.initState();
    _cancelledTaskController.getCancelledTaskList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GetBuilder<CancelledTaskController>(
          builder: (cancelledTaskController) {
            return Column(
              children: [
                const ProfileSummaryCard(),
                Expanded(
                  child: Visibility(
                    visible: _cancelledTaskController.getCancelledTaskInProgress == false,
                    replacement: const Center(child: CircularProgressIndicator()),
                    child: RefreshIndicator(
                      onRefresh: _cancelledTaskController.getCancelledTaskList,
                      child: ListView.builder(
                        itemCount: _cancelledTaskController.taskListModel.taskList?.length ?? 0,
                        itemBuilder: (context, index) {
                          return TaskItemCard(
                            task: _cancelledTaskController.taskListModel.taskList![index],
                            onStatusChange: () {
                              _cancelledTaskController.getCancelledTaskList();
                            },
                            showProgress: (inProgress) {
                              cancelledTaskController.getCancelledTaskInProgress == inProgress;
                            },
                          );
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
