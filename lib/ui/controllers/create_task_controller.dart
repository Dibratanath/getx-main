// import 'package:get/get.dart';
// import 'package:task_manager/data/network_caller/network_caller.dart';
// import 'package:task_manager/data/network_caller/network_response.dart';
// import 'package:task_manager/data/utility/urls.dart';
// import 'package:task_manager/ui/controllers/auth_controller.dart';
//
// import 'new_task_controller.dart';
//
// class CreateTaskController extends GetxController{
//     bool _createTaskInProgress = false;
//     String _message = "";
//
//   Future<bool> createTask(String title, String description) async {
//       _createTaskInProgress = true;
//       update();
//       final NetworkResponse response =
//       await NetworkCaller().postRequest(Urls.createNewTask, body: {
//         "title": title,
//         "description": description,
//         "status": "New"
//       });
//       _createTaskInProgress = false;
//       update();
//       if (response.isSuccess) {
//         Get.find<AuthController>()_subjectTEController.clear();
//         _descriptionTEController.clear();
//         Get.find<NewTaskController>().getNewTaskList();
//         if (mounted) {
//           showSnackMessage(context, 'New task added!');
//         }
//       } else {
//         if (mounted) {
//           showSnackMessage(context, 'Create new task failed! Try again.', true);
//         }
//       }
//
//   }
// }