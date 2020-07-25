import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:visitadoctor/data/historyDetails.dart';

class HistoryCard extends StatefulWidget {
  @override
  _HistoryCardState createState() => _HistoryCardState();
}

class _HistoryCardState extends State<HistoryCard> {
  List<HistoryDetail> _historyDetails = List<HistoryDetail>();

  Future<List<HistoryDetail>> fetchDoctorDetails() async {
    var url = 'https://kshitijsu.github.io/jsonfiles/histories.json';
    var response = await http.get(url);

    var historyDetails = List<HistoryDetail>();
    if (response.statusCode == 200) {
      var historyDetailsJson = json.decode(response.body);
      for (var historyDetailsJson in historyDetailsJson) {
        historyDetails.add(HistoryDetail.fromJson(historyDetailsJson));
      }
    }
    return historyDetails;
  }

  @override
  void initState() {
    fetchDoctorDetails().then((value) {
      setState(() {
        _historyDetails.addAll(value);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(2.0),
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Card(
              child: Padding(
            padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  _historyDetails[index].docname,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text(
                          'Date:',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: 5),
                        Text(_historyDetails[index].date),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          'Time:',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: 5),
                        Text(_historyDetails[index].time)
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    ButtonTheme(
                      height: 20,
                      child: RaisedButton(
                        onPressed: () {},
                        child: Text(
                          'View Report',
                          style: TextStyle(color: Colors.white),
                        ),
                        color: Colors.green,
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Text('Status:',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        SizedBox(
                          width: 5,
                        ),
                        Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.green)),
                            child: Padding(
                              padding: const EdgeInsets.all(1.0),
                              child: Text(
                                _historyDetails[index].status,
                                style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 12,
                                ),
                              ),
                            )),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ));
        },
        itemCount: _historyDetails.length,
      ),
    );
  }
}
