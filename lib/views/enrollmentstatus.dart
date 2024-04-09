import 'package:flutter/material.dart';

class EnrollmentStatusPage extends StatelessWidget {
  final String name;
  final String enrollmentId;
  final double outpatientBalance;
  final double inpatientBalance;
  final double dentalBalance;
  final double opticalBalance;
  final DateTime startDate;
  final DateTime expiryDate;
  @override
  EnrollmentStatusPage({
    required this.name,
    required this.enrollmentId,
    required this.outpatientBalance,
    required this.inpatientBalance,
    required this.dentalBalance,
    required this.opticalBalance,
    required this.startDate,
    required this.expiryDate,
  });
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Enrollment Status'),
      ),
      body: FutureBuilder<EnrollmentStatusPage>(
        future: fetchUserEnrollmentDetails(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            EnrollmentStatusPage enrollmentStatusPage = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Name: ${enrollmentStatusPage.name}'),
                  Text('Enrollment ID: ${enrollmentStatusPage.enrollmentId}'),
                  Text(
                      'Outpatient Balance: ${enrollmentStatusPage.outpatientBalance}'),
                  Text(
                      'Inpatient Balance: ${enrollmentStatusPage.inpatientBalance}'),
                  Text('Dental Balance: ${enrollmentStatusPage.dentalBalance}'),
                  Text(
                      'Optical Balance: ${enrollmentStatusPage.opticalBalance}'),
                  Text('Start Date: ${enrollmentStatusPage.startDate}'),
                  Text('Expiry Date: ${enrollmentStatusPage.expiryDate}'),
                  // Add other details as needed
                ],
              ),
            );
          }
        },
      ),
    );
  }

  Future<EnrollmentStatusPage> fetchUserEnrollmentDetails() async {
    // Simulating fetching data from the database
    await Future.delayed(Duration(seconds: 2));
    return EnrollmentStatusPage(
      name: 'John Doe',
      enrollmentId: '123456',
      outpatientBalance: 1000.0,
      inpatientBalance: 2000.0,
      dentalBalance: 500.0,
      opticalBalance: 300.0,
      startDate: DateTime(2022, 1, 1),
      expiryDate: DateTime(2022, 12, 31),
    );
  }
}
