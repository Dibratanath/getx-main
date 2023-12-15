import 'package:get/get.dart';
import 'package:task_manager/data/network_caller/network_caller.dart';
import 'package:task_manager/data/utility/urls.dart';

import '../../data/models/task_list_model.dart';

class CancelledTaskController extends GetxController{
  bool _getCancelledTaskInProgress = false;
  TaskListModel _taskListModel = TaskListModel();

  bool get getCancelledTaskInProgress => _getCancelledTaskInProgress;
  TaskListModel get taskListModel => _taskListModel;

  Future<void> getCancelledTaskList() async {
    _getCancelledTaskInProgress = true;
    update();
    final response =
    await NetworkCaller().getRequest(Urls.getCancelledTasks);
    if (response.isSuccess) {
      _taskListModel = TaskListModel.fromJson(response.jsonResponse);
    }
    _getCancelledTaskInProgress = false;
    update();
  }
}