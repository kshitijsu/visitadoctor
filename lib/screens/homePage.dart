import 'package:flutter/material.dart';
import 'package:visitadoctor/screens/doctorsList.dart';
import 'package:visitadoctor/screens/history.dart';
import 'package:visitadoctor/screens/profile.dart';
import 'package:visitadoctor/screens/searchCity.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final List<Widget> _children = [
    DoctorsList(),
    SearchCity(),
    History(),
    Profile()
  ];

  void onTappedBar(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    const number = 5;
    return Scaffold(
      body: _children[_currentIndex],
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text('Patient Queue'),
                  content: Text('Your current waiting number is $number'),
                  actions: <Widget>[
                    FlatButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('OK'))
                  ],
                );
              });
        },
        icon: Icon(Icons.face),
        label: Text("$number"),
        backgroundColor: Colors.red,
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTappedBar,
        currentIndex: _currentIndex,
        // type: BottomNavigationBarType.fixed,
        unselectedFontSize: 10,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.local_hospital,
              color: Colors.green,
            ),
            title: Text(
              'DOCTORS',
              style: TextStyle(color: Colors.green),
            ),
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.location_on,
                color: Colors.green,
              ),
              title: Text(
                'CITY',
                style: TextStyle(color: Colors.green),
              )),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.schedule,
                color: Colors.green,
              ),
              title: Text(
                'HISTORY',
                style: TextStyle(color: Colors.green),
              )),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: Colors.green,
            ),
            title: Text(
              'PROFILE',
              style: TextStyle(color: Colors.green),
            ),
          ),
        ],
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
