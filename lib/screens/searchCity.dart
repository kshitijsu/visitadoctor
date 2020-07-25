import 'package:flutter/material.dart';

class SearchCity extends StatefulWidget {
  @override
  _SearchCityState createState() => _SearchCityState();
}

class _SearchCityState extends State<SearchCity> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          title: Text('Select City Here'),
          actions: <Widget>[
            IconButton(icon: Icon(Icons.search), onPressed: () {})
          ],
        ),
        body: Container(
          margin: EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    hintText: 'Search Your City'),
              ),
              Column(
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      print('Single Tap');
                    },
                    child: Container(
                        margin: EdgeInsets.all(10),
                        child: Text(
                          'Rajnandgaon',
                          style: TextStyle(fontSize: 18),
                        )),
                  ),
                ],
              ),
              Divider(
                color: Colors.black,
              ),
            ],
          ),
        ));
  }
}
