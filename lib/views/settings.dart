import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:insurance/config/constants.dart';
import 'package:insurance/views/custombutton.dart';
import 'package:insurance/views/customtext.dart';

class SettingsPage extends StatelessWidget {
  final List<Map<String, dynamic>> settingsItems = [
    {
      'message': 'Transaction successful',
      'action': () => print('Transaction tapped')
    },
    {'message': 'New offers available', 'action': () => print('Offers tapped')},
    {
      'message': 'Your status has been updated',
      'action': () => print('Status update tapped')
    },
    // Add more notifications as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor.withOpacity(0.8),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: ListView.builder(
          itemCount: settingsItems.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: Icon(Icons.settings),
              title: customText(
                label: settingsItems[index]['message'],
                fontSize: 20,
                labelColor: Colors.black,
              ),
              trailing: Icon(Icons.chevron_right),
              onTap: () {
                print('Settings item tapped: ${settingsItems[index]}');
              },
            );
          },
        ),
      ),
    );
  }
}
