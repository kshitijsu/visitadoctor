import 'package:flutter/material.dart';
import 'package:visitadoctor/screens/account.dart';
import 'package:visitadoctor/screens/authenticate/register.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showLoginIn = true;
  void toggleView() {
    setState(() => showLoginIn = !showLoginIn);
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginIn) {
      return Account(toggleView: toggleView);
    } else {
      return Register(toggleView: toggleView);
    }
  }
}
