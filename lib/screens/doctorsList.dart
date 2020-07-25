import 'package:flutter/material.dart';
import 'package:visitadoctor/cards/doctorCard.dart';

class DoctorsList extends StatefulWidget {
  @override
  _DoctorsListState createState() => _DoctorsListState();
}

class _DoctorsListState extends State<DoctorsList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // resizeToAvoidBottomPadding: false,
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          title: Text('Doctor\'s List'),
          actions: <Widget>[
            IconButton(icon: Icon(Icons.search), onPressed: () {})
          ],
        ),
        body: DoctorCard());
  }
}
