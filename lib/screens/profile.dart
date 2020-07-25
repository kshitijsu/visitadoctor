import 'package:flutter/material.dart';
import 'package:visitadoctor/services/auth.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text('Profile'),
        // centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  'Patient Details',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5),
                child: Column(
                  children: <Widget>[
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text('Rayn',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20)),
                            Row(
                              children: <Widget>[
                                Text(
                                  'Mobile: ',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text('+91 00000 00000')
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text('Saved Address',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15)),
                            SizedBox(height: 5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Icon(
                                      Icons.location_on,
                                      color: Colors.green,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          'Home',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text('102, A Block, X Residency,'),
                                        Text('Y Area, Z City'),
                                      ],
                                    ),
                                  ],
                                ),
                                Icon(Icons.edit),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text('Send Feedback',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15)),
                            Row(
                              children: <Widget>[
                                Icon(
                                  Icons.mail_outline,
                                  color: Colors.green,
                                ),
                                SizedBox(width: 2),
                                Text('Email us at info@doctorneed.com')
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              SizedBox(
                width: 5,
              ),
              Expanded(
                child: FlatButton(
                  color: Colors.green,
                  onPressed: () async {
                    await _auth.signOut();
                  },
                  child: Text(
                    'Logout',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.white),
                  ),
                ),
              ),
              SizedBox(
                width: 5,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
