import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:insurance/controllers/user_controller.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final userController = Get.find<UserController>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Profile"),
      ),
      body: SafeArea(
        minimum: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CircleAvatar(
              radius: 80,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.network(
                  "https://i.pinimg.com/564x/20/05/e2/2005e27a39fa5f6d97b2e0a95233b2be.jpg",
                ),
              ),
            ),
            const Spacer(),

            const SizedBox(height: 20),
            Text(
              "${userController.user.value?.firstname ?? 'James'} ${userController.user.value?.lastname ?? 'Sang'}",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const Spacer(),

            ListTile(
              title: Text(
                userController.user.value?.id ?? "12",
              ),
              leading: const Icon(Icons.person),
            ),
            const Divider(),

            const SizedBox(height: 20),
            ListTile(
              title: Text(
                userController.user.value?.email ?? "sang@example.com",
              ),
              leading: const Icon(Icons.mail),
            ),
            const Divider(),
            ListTile(
              title: Text(
                userController.user.value?.phonenumber ?? "072881818",
              ),
              leading: const Icon(Icons.phone),
            ),
            const Divider(),

            // ListTile(
            //   title: Text(
            //     userController.user.value?.email ?? "sang@example.com",
            //   ),
            //   leading: const Icon(Icons.mail),
            // ),
            // ListTile(
            //   title: Text(
            //     userController.user.value?.email ?? "sang@example.com",
            //   ),
            //   leading: const Icon(Icons.mail),
            // ),
          ],
        ),
      ),
    );
  }
}
