import 'package:flutter/material.dart';

class GetAppointment extends StatefulWidget {
  @override
  _GetAppointmentState createState() => _GetAppointmentState();
}

class _GetAppointmentState extends State<GetAppointment> {
  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Get An Appointment')),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            TextFormField(
              controller: textController,
              decoration: InputDecoration(
                labelText: 'Enter Full Name',
                hintText: 'eg. Manu Jain',
              ),
            ),
            Text(textController.text),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Enter City',
                hintText: 'eg. Rajnandgaon',
              ),
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Enter Symptoms',
                hintText: 'eg. Cough, Cold, etc.',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
