import 'package:flutter/material.dart';
import 'package:visitadoctor/cards/historyCard.dart';

class History extends StatefulWidget {
  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text('Appointment History'),
        // centerTitle: true,
      ),
      body: HistoryCard(),
      // body: Column(
      //   crossAxisAlignment: CrossAxisAlignment.stretch,
      //   children: <Widget>[
      //     Padding(
      //       padding: const EdgeInsets.all(8.0),
      //       child: Text(
      //         'Appointment History',
      //         style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      //       ),
      //     ),
      //     Card(
      //         child: Padding(
      //       padding: const EdgeInsets.all(10.0),
      //       child: Column(
      //         crossAxisAlignment: CrossAxisAlignment.start,
      //         children: <Widget>[
      //           Text(
      //             'Dr. ABC',
      //             style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
      //           ),
      //           Row(
      //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //             children: <Widget>[
      //               Row(
      //                 children: <Widget>[
      //                   Text(
      //                     'Date:',
      //                     style: TextStyle(fontWeight: FontWeight.bold),
      //                   ),
      //                   Text('03-03-2020'),
      //                 ],
      //               ),
      //               Row(
      //                 children: <Widget>[
      //                   Text(
      //                     'Time:',
      //                     style: TextStyle(fontWeight: FontWeight.bold),
      //                   ),
      //                   Text('09:00AM')
      //                 ],
      //               ),
      //               SizedBox(width: 10)
      //             ],
      //           ),
      //           Row(
      //             children: <Widget>[
      //               Text('Status:',
      //                   style: TextStyle(fontWeight: FontWeight.bold)),
      //               SizedBox(
      //                 width: 5,
      //               ),
      //               Padding(
      //                 padding: const EdgeInsets.all(2.0),
      //                 child: Container(
      //                     decoration: BoxDecoration(
      //                         border: Border.all(color: Colors.green)),
      //                     child: Padding(
      //                       padding: const EdgeInsets.all(2.0),
      //                       child: Text(
      //                         'Request Confirmed',
      //                         style: TextStyle(color: Colors.green),
      //                       ),
      //                     )),
      //               )
      //             ],
      //           ),
      //         ],
      //       ),
      //     )),
      //   ],
      // ),
    );
  }
}
