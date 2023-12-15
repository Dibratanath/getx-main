import 'package:get/get.dart';
import 'package:task_manager/data/models/task_list_model.dart';
import 'package:task_manager/data/network_caller/network_caller.dart';
import 'package:task_manager/data/utility/urls.dart';



class ProgressTaskController extends GetxController{
  bool _getProgressTaskInProgress = false;
  TaskListModel taskListModel = TaskListModel();
  bool get getProgressTaskInProgress => _getProgressTaskInProgress;

  Future<void> getProgressTaskList() async {
    _getProgressTaskInProgress = true;
    update();
    final response =
    await NetworkCaller().getRequest(Urls.getProgressTasks);
    if (response.isSuccess) {
      taskListModel = TaskListModel.fromJson(response.jsonResponse);
    }
    _getProgressTaskInProgress = false;
    update();
  }
}
