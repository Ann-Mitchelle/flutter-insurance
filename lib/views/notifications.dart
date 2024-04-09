import 'package:flutter/material.dart';

class Notifications extends StatelessWidget {
  final List<Map<String, dynamic>> notifications = [
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
        title: Text('Notifications'),
      ),
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              title: Text(notifications[index]['message']),
              trailing: Icon(Icons.chevron_right), // Right angle bracket icon
              onTap: () {
                print('Notification tapped: ${notifications[index]}');
              },
            ),
          );
        },
      ),
    );
  }
}
