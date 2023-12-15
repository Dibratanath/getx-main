import 'package:get/get.dart';
import 'package:task_manager/data/models/task_list_model.dart';
import 'package:task_manager/data/network_caller/network_caller.dart';
import 'package:task_manager/data/utility/urls.dart';

class CompletedTaskController extends GetxController{
  bool _getCompletedTaskInProgress = false;
  TaskListModel taskListModel = TaskListModel();
  bool get getCompletedTaskInProgress => _getCompletedTaskInProgress;

  Future<void> getCompletedTaskList() async {
    _getCompletedTaskInProgress = true;
    update();
    final response =
    await NetworkCaller().getRequest(Urls.getCompletedTasks);

    if (response.isSuccess) {
      taskListModel = TaskListModel.fromJson(response.jsonResponse);
    }
    _getCompletedTaskInProgress = false;
    update();
  }
}