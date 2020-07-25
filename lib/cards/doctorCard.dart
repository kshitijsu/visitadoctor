import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:visitadoctor/data/doctorDetails.dart';

class DoctorCard extends StatefulWidget {
  @override
  _DoctorCardState createState() => _DoctorCardState();
}

class _DoctorCardState extends State<DoctorCard> {
  List<DoctorDetail> _doctorDetails = List<DoctorDetail>();

  Future<List<DoctorDetail>> fetchDoctorDetails() async {
    var url = 'https://kshitijsu.github.io/jsonfiles/docList.json';
    var response = await http.get(url);

    var doctorDetails = List<DoctorDetail>();
    if (response.statusCode == 200) {
      var docotorDetailsJson = json.decode(response.body);
      for (var doctorDetailsJson in docotorDetailsJson) {
        doctorDetails.add(DoctorDetail.fromJson(doctorDetailsJson));
      }
    }
    return doctorDetails;
  }

  @override
  void initState() {
    fetchDoctorDetails().then((value) {
      setState(() {
        _doctorDetails.addAll(value);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8.0),
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        _doctorDetails[index].name,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        _doctorDetails[index].status,
                        style: TextStyle(
                            color: Colors.green, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  SizedBox(height: 2),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        _doctorDetails[index].address,
                        style: TextStyle(
                            fontSize: 13, fontStyle: FontStyle.italic),
                      ),
                      Text(
                        '+91 ${_doctorDetails[index].phoneNo}',
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: <Widget>[
                      Image.asset(
                        './assets/images/doc.png',
                        height: 90,
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text('Serving Hours:',
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold)),
                                Text('Next Slot:',
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                    '${_doctorDetails[index].openingHour} & ${_doctorDetails[index].closingHour}',
                                    style: TextStyle(fontSize: 11)),
                                Text('01:40PM, Today',
                                    style: TextStyle(fontSize: 11)),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      'Specializations:',
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(_doctorDetails[index].speciality,
                                        style: TextStyle(fontSize: 11)),
                                  ],
                                ),
                                RaisedButton(
                                  child: Text(
                                    'Book',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  onPressed: () {
                                    Navigator.pushNamed(context, 'book');
                                  },
                                  color: Colors.green,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );

          // Card(
          //   // margin: EdgeInsets.all(8),
          //   child: Padding(
          //     padding: const EdgeInsets.all(10.0),
          //     child: Column(
          //       crossAxisAlignment: CrossAxisAlignment.start,
          //       children: <Widget>[
          //         Text(
          //           _doctorDetails[index].name,
          //           style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          //         ),
          //         Text(
          //           _doctorDetails[index].address,
          //         )
          //       ],
          //     ),
          //   ),
          // );
        },
        itemCount: _doctorDetails.length,
      ),
    );
  }
}
