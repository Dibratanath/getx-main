import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/ui/controllers/auth_controller.dart';
import 'package:task_manager/ui/screens/edit_profile_screen.dart';
import 'package:task_manager/ui/screens/login_screen.dart';

class ProfileSummaryCard extends StatelessWidget {
  const ProfileSummaryCard({
    super.key,
    this.enableOnTap = true,
  });

  final bool enableOnTap;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      builder: (authController) {
        String base64String = Get.find<AuthController>().user?.photo ?? "";
        if (base64String.startsWith('data:image')) {
          // Remove data URI prefix if present
          base64String =
              base64String.replaceFirst(RegExp(r'data:image/[^;]+;base64,'), '');
        }
        Uint8List imageBytes = const Base64Decoder().convert(base64String);

        return ListTile(
          onTap: () {
            if (enableOnTap) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const EditProfileScreen(),
                ),
              );
            }
          },
          leading: CircleAvatar(
            child: Get.find<AuthController>().user?.photo == null
                ? const Icon(Icons.person)
                : ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Image.memory(
                      imageBytes,
                      fit: BoxFit.cover,
                    ),
                  ),
          ),
          title: Text(
            fullName,
            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
          ),
          subtitle: Text(
            Get.find<AuthController>().user?.email ?? '',
            style: const TextStyle(color: Colors.white),
          ),
          trailing: IconButton(
            onPressed: () async {
              await Get.find<AuthController>().clearAuthData();
              Get.offAll(const LoginScreen());
            },
            icon: const Icon(Icons.logout),
          ),
          tileColor: Colors.green,
        );
      }
    );
  }

  String get fullName {
    return '${Get.find<AuthController>().user?.firstName ?? ''} ${Get.find<AuthController>().user?.lastName ?? ')'}';
  }
}
