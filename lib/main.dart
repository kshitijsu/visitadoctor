import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:visitadoctor/modals/user.dart';
import 'package:visitadoctor/screens/account.dart';
import 'package:visitadoctor/screens/authenticate/authenticate.dart';
import 'package:visitadoctor/screens/bookAppointment.dart';
import 'package:visitadoctor/screens/homePage.dart';
import 'package:visitadoctor/screens/wrapper.dart';
import 'package:visitadoctor/services/auth.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          'account': (context) => Account(),
          'home': (context) => HomePage(),
          'book': (context) => BookAppointment(),
          'auth': (context) => Authenticate(),
        },
        home: Wrapper(),
        theme: ThemeData(
          // primarySwatch: Colors.teal,
          primarySwatch: Colors.green,
        ),
      ),
    );
  }
}
