import 'package:flutter/material.dart';

class EnrollmentPage extends StatefulWidget {
  @override
  _EnrollmentPageState createState() => _EnrollmentPageState();
}

class _EnrollmentPageState extends State<EnrollmentPage> {
  String _coverageType = 'Personal';
  double _minAmount = 0.0;
  double _maxAmount = 0.0;

  void _submitForm() {
    // Calculate yearly amount based on the monthly range
    double yearlyAmount = (_minAmount + _maxAmount) * 12;
    print('Coverage Type: $_coverageType');
    print('Min Amount: $_minAmount');
    print('Max Amount: $_maxAmount');
    print('Yearly Amount: $yearlyAmount');
    // Implement submission logic here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Enrollment'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background_image.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              DropdownButtonFormField(
                value: _coverageType,
                items: ['Personal', 'Spouse', 'Child', 'Family']
                    .map((type) => DropdownMenuItem(
                          child: Text(type),
                          value: type,
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    _coverageType = value.toString();
                  });
                },
                decoration: InputDecoration(labelText: 'Coverage Type'),
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(labelText: 'Min Monthly Amount'),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    _minAmount = double.tryParse(value) ?? 0.0;
                  });
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(labelText: 'Max Monthly Amount'),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    _maxAmount = double.tryParse(value) ?? 0.0;
                  });
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitForm,
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
