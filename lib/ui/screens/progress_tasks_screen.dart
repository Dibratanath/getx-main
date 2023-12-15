import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/ui/controllers/progress_task_controller.dart';
import 'package:task_manager/ui/widgets/profile_summary_card.dart';
import 'package:task_manager/ui/widgets/task_item_card.dart';

class ProgressTasksScreen extends StatefulWidget {
  const ProgressTasksScreen({super.key});

  @override
  State<ProgressTasksScreen> createState() => _ProgressTasksScreenState();
}

class _ProgressTasksScreenState extends State<ProgressTasksScreen> {

  final ProgressTaskController _progressTaskController = Get.find<ProgressTaskController>();

  @override
  void initState() {
    super.initState();
    _progressTaskController.getProgressTaskList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: GetBuilder<ProgressTaskController>(
        builder: (progressTaskController) {
          return Column(
            children: [
              const ProfileSummaryCard(),
              Expanded(
                child: Visibility(
                  visible: _progressTaskController.getProgressTaskInProgress == false,
                  replacement: const Center(child: CircularProgressIndicator()),
                  child: RefreshIndicator(
                    onRefresh: _progressTaskController.getProgressTaskList,
                    child: ListView.builder(
                      itemCount: _progressTaskController.taskListModel.taskList?.length ?? 0,
                      itemBuilder: (context, index) {
                        return TaskItemCard(
                          task: _progressTaskController.taskListModel.taskList![index],
                          onStatusChange: () {
                            _progressTaskController.getProgressTaskList();
                          },
                          showProgress: (inProgress) {
                            _progressTaskController.getProgressTaskInProgress == inProgress;
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
    ));
  }
}
