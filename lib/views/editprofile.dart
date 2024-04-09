import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:insurance/controllers/signupcontroller.dart';
import 'package:insurance/views/signup.dart';

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  String _name = firstNameController.text + ' ' + lastNameController.text;
  String _email = emailController.text;
  String _phoneNumber = phoneController.text;
  String _profileImage = '';

  void _saveChanges() {
    // Save changes to database or update local state
    print('Changes saved!');
  }

  @override
  Widget build(BuildContext context) {
    SignUpController signupController = Get.put(SignUpController());
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: _saveChanges,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Center(
              child: GestureDetector(
                onTap: () {
                  // Implement image selection logic here
                  print('Select Image');
                },
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: _profileImage.isNotEmpty
                      ? NetworkImage(_profileImage)
                      : null,
                  child: _profileImage.isEmpty
                      ? Icon(Icons.person, size: 50)
                      : null,
                ),
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              initialValue: _name,
              decoration: InputDecoration(labelText: 'Name'),
              onChanged: (value) => _name = value,
            ),
            SizedBox(height: 20),
            TextFormField(
              initialValue: _email,
              decoration: InputDecoration(labelText: 'Email'),
              onChanged: (value) => _email = value,
            ),
            SizedBox(height: 20),
            TextFormField(
              initialValue: _phoneNumber,
              decoration: InputDecoration(labelText: 'Phone Number'),
              onChanged: (value) => _phoneNumber = value,
            ),
          ],
        ),
      ),
    );
  }
}
